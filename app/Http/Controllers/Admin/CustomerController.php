<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;
use Stripe\Customer;

class CustomerController extends Controller
{

    public function edit($id){

       $customer  =  User::where('id', $id)->with(['addresses'])->first();

       
        return view('admin-views.customer.edit', compact('customer'));

    }

    public function update(Request $request, $id) {
        $request->validate([
            'f_name' => 'required|max:100',
            'l_name' => 'nullable|max:100',

            'email' => 'required|unique:users,email,'.$id,
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|unique:users,phone,'.$id,

        ]);

        $User = user::find($id);

        if ($request->has('image')) {
            $image_name = Helpers::update('profile/', $User->image, 'png', $request->file('image'));
        } else {
            $image_name = $User['image'];
        }

        $User->f_name = $request->f_name;
        $User->l_name = $request->l_name;
        $User->email = $request->email;
        $User->phone = $request->phone;
        $User->user_name = $request->user_name;
        $User->city = $request->city;
        $User->address = $request->address;
        $User->country = $request->country;
        $User->image = $image_name;
        $User->password = strlen($request->password)>1?bcrypt($request->password):$User['password'];
        $User->save();
        Toastr::success(trans('messages.customer'));
        return redirect('admin/customer/list');
    }

    public function deleteMulti(request $Request ){

        $ids =  $Request->selected;

        foreach ($ids as  $value) {
            User::find($value)->delete();
        }
        return response()->json(['sate' => 'Success'],200);


    }
    public function customer_list(Request $request)
    {
        $key = [];
        if($request->search)
        {
            $key = explode(' ', $request['search']);
        }
        $customers = User::
        when(count($key) > 0, function($query)use($key){
            foreach ($key as $value) {
                $query->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            };
        })
        ->orderBy('order_count','desc')->paginate(config('default_pagination'));
        return view('admin-views.customer.list', compact('customers'));
    }

    public function status(User $customer, Request $request)
    {
        $customer->status = $request->status;
        $customer->save();

        try
        {
            if($request->status == 0)
            {   $customer->tokens->each(function ($token, $key) {
                    $token->delete();
                });
                if(isset($customer->cm_firebase_token))
                {
                    $data = [
                        'title' => trans('messages.suspended'),
                        'description' => trans('messages.your_account_has_been_blocked'),
                        'order_id' => '',
                        'image' => '',
                        'type'=> 'block'
                    ];
                    Helpers::send_push_notif_to_device($customer->cm_firebase_token, $data);

                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'user_id'=>$customer->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }

            }

        }
        catch (\Exception $e) {
            Toastr::warning(trans('messages.push_notification_faild'));
        }

        Toastr::success(trans('messages.customer').trans('messages.status_updated'));
        return back();
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $customers=User::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            }
        })->orderBy('order_count','desc')->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.customer.partials._table',compact('customers'))->render()
        ]);
    }

    public function view($id)
    {
        $customer = User::find($id);
        if (isset($customer)) {
            $orders = Order::latest()->where(['user_id' => $id])->Notpos()->paginate(config('default_pagination'));
            return view('admin-views.customer.customer-view', compact('customer', 'orders'));
        }
        Toastr::error(trans('messages.customer_not_found'));
        return back();
    }
}

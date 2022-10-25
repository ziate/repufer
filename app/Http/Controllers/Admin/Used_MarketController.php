<?php

namespace App\Http\Controllers\Admin;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Used_Product;
use App\Models\User;
use App\Models\used_market_setting;
use App\Models\Translation;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;



class Used_MarketController extends Controller
{
    
     public function add(){
        return view ('admin-views.Used_Market.products.add');

    }
    public function store(Request $request){
        try {

            $usedProduct = new Used_Product();

            DB::beginTransaction();
            $usedProduct->name          = $request->name[array_search('en', $request->lang)];
            $usedProduct->description   = $request->description[array_search('en', $request->lang)];
            $usedProduct->phone         = $request->phone;
            $usedProduct->price         =  $request->price ;

            $usedProduct->address = $request->address;
            $usedProduct->image = Helpers::upload('product/', 'png', $request->file('image'));
            $usedProduct->save();

            $data = [];
            foreach($request->lang as $index=>$key)
            {
                if($request->name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Used_Product',
                        'translationable_id'    => $usedProduct->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
                if($request->name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Used_Product',
                        'translationable_id'    => $usedProduct->id,
                        'locale'                => $key,
                        'key'                   => 'description',
                        'value'                 => $request->name[$index],
                    ));
                }
            }

            if(count($data))
            {
                Translation::insert($data);
            }
            DB::commit();
            Toastr::success(trans('messages.product_added_successfully'));
            return back();
        } catch (\Exception $exception) {
            DB::rollBack();
            dd($exception->getMessage());
        }


    }
    
    public function customers(Request $request){
        
            $key = [];
        if($request->search)
        {
            $key = explode(' ', $request['search']);
        }
        $customers=User::where('used_product_count','>','0')
    //   $customers = User::
    //     when(count($key) > 0, function($query)use($key){
    //         foreach ($key as $value) {
    //             $query->orWhere('f_name', 'like', "%{$value}%")
    //                 ->orWhere('l_name', 'like', "%{$value}%")
    //                 ->orWhere('email', 'like', "%{$value}%")
    //                 ->orWhere('phone', 'like', "%{$value}%");
    //         };
    //     })
        ->orderBy('order_count','desc')->paginate(config('default_pagination'));
        return view('admin-views.Used_Market.customers.customers',compact('customers'));
    }

    public function products(Request $request){
           $key = [];
        if($request->search)
        {
            $key = explode(' ', $request['search']);
        }
        $Used_Product = Used_Product::
        when(count($key) > 0, function($query)use($key){
            foreach ($key as $value) {
                $query->orWhere('name', 'like', "%{$value}%")
                    ->orWhere('description', 'like', "%{$value}%")
                    ->orWhere('address', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            };
        })
        ->orderBy('id','desc')->paginate(config('default_pagination'));

        return view('admin-views.Used_Market.products.products',compact('Used_Product'));
    }

    public function Used_Market_Settings(){
        $used_market_setting=used_market_setting::first();
        return view('admin-views.Used_Market.Used_Market_Settings.Used_Market_Settings',compact('used_market_setting'));
    }
    
    public function delete(Request $request){
            $product = Used_Product::withoutGlobalScope('translate')->findOrFail($request->id);
        
        if( $product->image)
        {
            if (Storage::disk('public')->exists('product/' . $product['image'])) {
                Storage::disk('public')->delete('product/' . $product['image']);
            }
        }
        $product->translations()->delete();
        $product->delete();
        Toastr::success(trans('messages.product_deleted_successfully'));
        return back();
    }
      public function edit(Request $request){
            $product = Used_Product::withoutGlobalScope('translate')->findOrFail($request->id);
        
       return view('admin-views.Used_Market.products.edit',compact('product'));
    }
    
//          public function update(Request $request,$id){
//             //  dd($request);
//          $Used_Product = Used_Product::findOrFail($id);
         
//         //  if($request->has('price')){
//         //      $price=$request->price;
//         //  }else{
//         //      $price=$Used_Product->price;
//         //  }
         
//         //  $Used_Product->update([
//             //  'name'->$request->name,
//             //  'phone' -> $request->phone,
//             //  'price' -> $price,
//             //  'address' -> $request->address,
//             //  'image' -> $request->has('image') ? Helpers::update('products/', $Used_Product->image, 'png', $request->file('image')) : $Used_Product->image
             
//             //  ]);
//          $Used_Product->name = $request->name;
//          $Used_Product->description = $request->description;
//          $Used_Product->phone = $request->phone;
//          $Used_Product->price = $request->has('price') ?  $request->price : $Used_Product->price;

//          $Used_Product->address = $request->address;
//          $Used_Product->image = $request->has('image') ? Helpers::update('products/', $Used_Product->image, 'png', $request->file('image')) : $Used_Product->image;
//          $Used_Product->save();
        
//           Toastr::success(trans('messages.product_updated_successfully'));
//              return back();    
// }

  public function update(Request $request,$id){

        $userProduct = Used_Product::findOrFail($id);
        try {
            DB::beginTransaction();
            $userProduct->name          = $request->name[array_search('en', $request->lang)];
            $userProduct->description   = $request->description[array_search('en', $request->lang)];
            $userProduct->phone         = $request->phone;
            $userProduct->price         = $request->has('price') ? $request->price : $userProduct->price;

            $userProduct->address = $request->address;
            $userProduct->image = $request->has('image') ? Helpers::update('product/', $userProduct->image, 'png', $request->file('image')) : $userProduct->image;
            $userProduct->save();

            $data = [];
            foreach($request->lang as $index=>$key)
            {
                if($request->name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Used_Product',
                        'translationable_id'    => $userProduct->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
                if($request->name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Used_Product',
                        'translationable_id'    => $userProduct->id,
                        'locale'                => $key,
                        'key'                   => 'description',
                        'value'                 => $request->name[$index],
                    ));
                }
            }

            if(count($data))
            {
                Translation::where('translationable_id' , $userProduct->id)->update($data[0]);
            }
            DB::commit();
            Toastr::success(trans('messages.product_updated_successfully'));
            return back();
        } catch (\Exception $exception) {
            DB::rollBack();
            dd($exception->getMessage());
        }

    }


    public function UpdateSettings(Request $request){
        $order=used_market_setting::select('id')->orderBy('id','desc')->first();
        if (! $order){
            used_market_setting::create([
                'amount' => $request->amount,
                'expiryDate' => $request->expiryDate

            ]);
        }else{
            $order->Update([
                'amount' => $request->amount,
                'expiryDate' => $request->expiryDate

            ]);

        }

        Toastr::success(trans('messages.setting_added_successfully'));
        return back();

    }
}

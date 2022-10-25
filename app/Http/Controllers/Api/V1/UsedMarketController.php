<?php

namespace App\Http\Controllers\Api\v1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Used_Product;
use App\Models\used_market_setting;
use App\Models\Translation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Traits\ResponseTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class UsedMarketController extends Controller
{
    use ResponseTrait;
    public function index(){
        $Used_Products=Used_Product::select('id','name','description','phone','image','price','address')->get();
        // return response()->json($Used_Products, 200);
                return $this->returnData('success',$Used_Products,200);


    }

    public function store(Request $request){

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'address' =>'required'
            


        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);

        }
        $id=Auth::id();
        $count=User::select('used_product_count')->where('id',$id)->first();
        $amount=used_market_setting::select('amount')->first();
     
        $Used_Product = new Used_Product();
        $Used_Product->name = $request->name;
        $Used_Product->description = $request->description;
        $Used_Product->phone = $request->phone;
        $Used_Product->image =  Helpers::upload('products/', 'png', $request->file('image'));
        $Used_Product->price = $request->price;
        $Used_Product->address = $request->address;
        $c=$count-> used_product_count +1;
        if(  $count-> used_product_count<=$amount->amount){
            User::where('id',$id)->update(array('used_product_count'=> $c));
            $Used_Product->save();
              return response()->json(['message'=>trans('messages.product_added_successfully')], 200);
        }else{
            return response()->json(['errors'=>'you have exceed numberof products ']);
        }
        // $data = [];
        // foreach($request->lang as $index=>$key)
        // {
        //     if($request->name[$index] && $key != 'en')
        //     {
        //         array_push($data, Array(
        //             'translationable_type'  => 'App\Models\Used_Product',
        //             'translationable_id'    => $Used_Product->id,
        //             'locale'                => $key,
        //             'key'                   => 'name',
        //             'value'                 => $request->name[$index],
        //         ));
        //     }
        // }
        // if(count($data))
        // {
        //     Translation::insert($data);
        // }


      
                // return $this->returnSuccess('success',200);


    }


//  public function store(Request $request){
//     try{
//         $id=Auth::id();
//         $count=User::select('used_product_count')->where('id',$id)->first();
//         $amount=used_market_setting::select('amount')->first();
     
//         $validator = Validator::make($request->all(), [
//             'name' => 'required',

//         ]);
//         if ($validator->fails()) {
//             return response()->json(['errors' => Helpers::error_processor($validator)], 403);

//         }

//               $usedProduct = new Used_Product();

//             DB::beginTransaction();
//             $usedProduct->name          = $request->name;
//             $usedProduct->description   = $request->description;
//             $usedProduct->phone         = $request->phone;
//             $usedProduct->price         =  $request->price ;

//             $usedProduct->address = $request->address;
//             $usedProduct->image = Helpers::upload('product/', 'png', $request->file('image'));
//              if(  $count-> used_product_count<=$amount->amount){
//             // return $count-> used_product_count<=$amount->amount;
//             $usedProduct->save();
//         }else{
//             return response()->json(['errors'=>'you have exceed number of products ']);
//         }

//             $data = [];
//             foreach($request->lang as $index=>$key)
//             {
//                 if($request->name[$index] && $key != 'en')
//                 {
//                     array_push($data, Array(
//                         'translationable_type'  => 'App\Models\Used_Product',
//                         'translationable_id'    => $usedProduct->id,
//                         'locale'                => $key,
//                         'key'                   => 'name',
//                         'value'                 => $request->name[$index],
//                     ));
//                 }
//                 if($request->name[$index] && $key != 'en')
//                 {
//                     array_push($data, Array(
//                         'translationable_type'  => 'App\Models\Used_Product',
//                         'translationable_id'    => $usedProduct->id,
//                         'locale'                => $key,
//                         'key'                   => 'description',
//                         'value'                 => $request->name[$index],
//                     ));
//                 }
//             }

//             if(count($data))
//             {
//                 Translation::insert($data);
//             }
//                         DB::commit();


//                 return $this->returnSuccess('success',200);
//              } catch (\Exception $exception) {
//                   DB::rollBack();
//                   dd($exception->getMessage());
//                   }


    // }
    
    
    public function update(Request $request, int $id){
        
        $validator = Validator::make($request->all(), [
           
            'name' => 'required',
            'address' =>'required'

        ]);
          $Used_Product = Used_Product::find($id);
           if (empty($Used_Product)) {
            return response()->json(['message'=>trans('messages.product_not_found')],404);

        }
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);

        }
        $Used_Product->name = $request->name;
        $Used_Product->description = $request->description;
        $Used_Product->phone = $request->phone;
        // if($request->price){
        // $Used_Product->price = $request->price;}
         $Used_Product->price = $request->has('price') ?  $request->price : $Used_Product->price;

        $Used_Product->address = $request->address;
        $Used_Product->image = $request->has('image') ? Helpers::update('products/', $Used_Product->image, 'png', $request->file('image')) : $Used_Product->image;
        $Used_Product->save();

        // $data = [];
        // foreach($request->lang as $index=>$key)
        // {
        //     if($request->name[$index] && $key != 'en')
        //     {
        //         array_push($data, Array(
        //             'translationable_type'  => 'App\Models\Used_Product',
        //             'translationable_id'    => $Used_Products->id,
        //             'locale'                => $key,
        //             'key'                   => 'name',
        //             'value'                 => $request->name[$index],
        //         ));
        //     }
        // }

        // if(count($data))
        // {
        //     Translation::where('translationable_id' , $Used_Products->id)->update($data[0]);
        // }
        // return response()->json(['message'=>trans('messages.product_updated_successfully')], 200);
                return $this->returnSuccess('success',200);



    }
    
    
    public function delete(int $id){

        $Used_Product = Used_Product::find($id);
        
    
        if (empty($Used_Product)) {
            return response()->json(['message'=>trans('messages.product_not_found')],200);

        }
        if (Storage::disk('public')->exists('products/' . $Used_Product['img'])) {
            Storage::disk('public')->delete('products/' . $Used_Product['img']);
        }
        $Used_Product->delete();
         return $this->returnSuccess('success',200);

        // return response()->json(['message'=>trans('messages.product_deleted_successfully')], 200);

    }
}

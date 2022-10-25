<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\CategoryLogic;
use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Brands;
use App\Models\Category;
use App\Traits\ResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Food;
use App\Models\User;
use Session;

class CategoryController extends Controller
{
    
    use ResponseTrait;
    public function getBrands($shop_id,$cat_id)
    {
        $data = Food::where('restaurant_id',$shop_id)->where('category_id',$cat_id)->get();
        
        $idData=[];
        $arr=[];
        foreach($data as $da){
            if(!in_array($da['brand_id'] , $idData)){
                $dataBrand =  Brands::where('id',$da['brand_id'])->first();
                array_push($arr, $dataBrand);
                array_push($idData, $da['brand_id']);
            }
        }
        
        return response()->json([
            'status'    => true,
            'msg'       => 'brands',
            'data'      => $arr,
            'shop_id'   => $shop_id,
            'cat_id'   => $cat_id,
            'is_authorized' => true
        ], 200, ['Content-Type' => 'application/json;charset=UTF-8'],
            JSON_UNESCAPED_UNICODE);

        // return $this->returnData('brands', $data);
    }
    
    public function getProductsOfBrand($id, Request $request)
    {
        // dd($request['brand_id']);
        
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        

        $type = $request->query('type', 'all');

        $data = CategoryLogic::cat_products($id, $request['shop_id'], $request['brand_id'], $request['limit'], $request['offset'], $type);
        $data['products'] = Helpers::product_data_formatting($data['products'] , true, false, app()->getLocale());
        return response()->json($data, 200);
    
       
    }

    public function get_categories($shop_id)
    {
        
        try {
            $categories = Category::where(['position'=>0,'status'=>1])->orderBy('priority','desc')->get();

            return response()->json(['data'=>Helpers::category_data_formatting($categories, true),'shop_id'=>$shop_id], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_childes($id)
    {
        try {
            $categories = Category::where(['parent_id' => $id,'status'=>1])->orderBy('priority','desc')->get();
            return response()->json(Helpers::category_data_formatting($categories, true), 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_products($id, Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $zone_id= $request->header('zoneId');

        $type = $request->query('type', 'all');

        $data = CategoryLogic::products($id, $request['shop_id'], $request['brand_id'], $zone_id, $request['limit'], $request['offset'], $type);
        $data['products'] = Helpers::product_data_formatting($data['products'] , true, false, app()->getLocale());
        return response()->json($data, 200);
    }


    public function get_restaurants($id, Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $zone_id= $request->header('zoneId');

        $type = $request->query('type', 'all');

        $data = CategoryLogic::restaurants($id, $zone_id, $request['limit'], $request['offset'], $type);
        $data['restaurants'] = Helpers::restaurant_data_formatting($data['restaurants'] , true);
        return response()->json($data, 200);
    }



    public function get_all_products($id,Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $zone_id= $request->header('zoneId');

        try {
            return response()->json(Helpers::product_data_formatting(CategoryLogic::all_products($id, $zone_id), true, false, app()->getLocale()), 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}

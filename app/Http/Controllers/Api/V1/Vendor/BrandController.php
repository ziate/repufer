<?php

namespace App\Http\Controllers\Api\v1\vendor;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Brands;
use App\Models\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Traits\ResponseTrait;




class BrandController extends Controller
{ use ResponseTrait;
    public function index(){
        $brands=Brands::select('id','name','img')->get();
        // return response()->json($brands, 200);
        return $this->returnData('success',$brands,200);


    }

    public function store(Request $request){

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'image' => 'required'


        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);

        }

        $brand = new Brands();
        // $brand->name = $request->name[array_search('en', $request->lang)];
        $brand->name=$request->name;
        $brand->img = Helpers::upload('brands/', 'png', $request->file('image'));
        $brand->save();

        // $data = [];
        // foreach($request->lang as $index=>$key)
        // {
        //     if($request->name[$index] && $key != 'en')
        //     {
        //         array_push($data, Array(
        //             'translationable_type'  => 'App\Models\Brands',
        //             'translationable_id'    => $brand->id,
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

        return $this->returnSuccess('success',200);
        // return response()->json(['message'=>trans('messages.brand_added_successfully')], 200);

    }

    public function update(Request $request, int $id){
        // return $request->name;
        $validator = Validator::make($request->all(), [
            'name' => 'required',


        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);

        }
        
          $brands = Brands::find($id);
        
    
        if (empty($brands)) {
            return response()->json(['message'=>trans('messages.brand_not_found')],200);

        }
        $brands->name=$request->name;
        $brands->img = $request->has('image') ? Helpers::update('brands/', $brands->img, 'png', $request->file('image')) : $brands->img;
        $brands->save();

        // $data = [];
        // foreach($request->lang as $index=>$key)
        // {
        //     if($request->name[$index] && $key != 'en')
        //     {
        //         array_push($data, Array(
        //             'translationable_type'  => 'App\Models\Brands',
        //             'translationable_id'    => $brands->id,
        //             'locale'                => $key,
        //             'key'                   => 'name',
        //             'value'                 => $request->name[$index],
        //         ));
        //     }
        // }

        // if(count($data))
        // {
        //     Translation::where('translationable_id' , $brands->id)->update($data[0]);
        // }
        // return response()->json(['message'=>trans('messages.brand_updated_successfully')], 200);
                        return $this->returnSuccess('success',200);



    }
    public function delete(int $id){
        $brands = Brands::find($id);
        
    
        if (empty($brands)) {
            return response()->json(['message'=>trans('messages.brand_not_found')],200);

        }

        if (Storage::disk('public')->exists('brands/' . $brands['img'])) {
            Storage::disk('public')->delete('brands/' . $brands['img']);
        }
        $brands->delete();
        // return response()->json(['message'=>trans('messages.brand_deleted_successfully')], 200);
                        return $this->returnSuccess('success',200);


    }
}

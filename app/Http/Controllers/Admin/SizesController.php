<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AddOn;
use App\Models\Sizes;
use App\Models\Restaurant;
use App\Models\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\DB;
use App\Scopes\RestaurantScope;

class SizesController extends Controller
{
    
    
    public function SizesFront(){
        $sizes = Sizes::get(); 
        return view('admin-views.sizes.index',['sizes' =>$sizes]);
    }
    
    public function store(Request $request){
        // dd($request);
        $result = Sizes::create([
            'size' => $request->size,
        ]);
        
        if($result){
            Toastr::success('Created Successfully');
            return  redirect()->back();
        }else{
            Toastr::error('SomeError , Plase Try Agine');
            return redirect()->back();
        }
    }
    
    
    
    public function update($id,Request $request){
        // dd($request);
        $result = Sizes::where('id' , $id)->update([
            'size' => $request->size,
        ]);
        
        if($result){
            Toastr::success('Updated Successfully');
            return  redirect()->back();
        }else{
            Toastr::error('SomeError , Plase Try Agine');
            return redirect()->back();
        }
    }
    
    
    
    public function delete($id){
        $result = Sizes::find($id)->delete();
        if($result){
            Toastr::success('Deleted Successfully');
            return  redirect()->back();
        }else{
            Toastr::error('SomeError , Plase Try Agine');
            return redirect()->back();
        }
    }
    
}
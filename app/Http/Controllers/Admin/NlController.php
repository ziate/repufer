<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AddOn;
use App\Models\Nl;
use App\Models\Restaurant;
use App\Models\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\DB;
use App\Scopes\RestaurantScope;

class NlController extends Controller
{
    
    
    public function NlFront(){
        $nls = Nl::get(); 
        return view('admin-views.sizes.nl',['nls' =>$nls]);
    }
    
    public function store(Request $request){
        // dd($request);
        $result = Nl::create([
            'nl' => $request->nl,
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
        $result = Nl::where('id' , $id)->update([
            'nl' => $request->nl,
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
        $result = Nl::find($id)->delete();
        if($result){
            Toastr::success('Deleted Successfully');
            return  redirect()->back();
        }else{
            Toastr::error('SomeError , Plase Try Agine');
            return redirect()->back();
        }
    }
    
}
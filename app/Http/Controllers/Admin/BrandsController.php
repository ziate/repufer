<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\Brands;
use App\Models\Translation;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class BrandsController extends Controller
{

    function index()
    {
        $brands=Brands::latest()->paginate(config('default_pagination'));
        return view('admin-views.brands.index',compact('brands'));
    }


    function store(Request $request)
    {

        $request->validate([
            'name' => 'required|unique:categories|max:100',
        ], [
            'name.required' => trans('messages.Name is required!'),
        ]);

        $brand = new Brands();
        $brand->name = $request->name[array_search('en', $request->lang)];
        $brand->img = Helpers::upload('brands/', 'png', $request->file('image'));
        $brand->save();

        $data = [];
        foreach($request->lang as $index=>$key)
        {
            if($request->name[$index] && $key != 'en')
            {
                array_push($data, Array(
                    'translationable_type'  => 'App\Models\Brands',
                    'translationable_id'    => $brand->id,
                    'locale'                => $key,
                    'key'                   => 'name',
                    'value'                 => $request->name[$index],
                ));
            }
        }
        if(count($data))
        {
            Translation::insert($data);
        }

        Toastr::success(trans('messages.brand_added_successfully'));
        return back();
    }

    public function edit(Brands $brands)
    {
        $brands=Brands::withoutGlobalScope('translate')->findOrFail($brands->id);
        return view('admin-views.brands.edit', compact('brands'));
    }


    public function update(Request $request, Brands $brands)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:categories|max:100',
        ], [
            'name.required' => trans('messages.Name is required!'),
        ]);


        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }


        $brands->name = $request->name[array_search('en', $request->lang)];
        $brands->img = $request->has('image') ? Helpers::update('brands/', $brands->img, 'png', $request->file('image')) : $brands->img;
        $brands->save();

        $data = [];
        foreach($request->lang as $index=>$key)
        {
            if($request->name[$index] && $key != 'en')
            {
                array_push($data, Array(
                    'translationable_type'  => 'App\Models\Brands',
                    'translationable_id'    => $brands->id,
                    'locale'                => $key,
                    'key'                   => 'name',
                    'value'                 => $request->name[$index],
                ));
            }
        }

        if(count($data))
        {
            Translation::where('translationable_id' , $brands->id)->update($data[0]);
        }

        Toastr::success(trans('messages.brand_updated_successfully'));
        return back();
    }


    public function delete(Brands $brands)
    {
        if (Storage::disk('public')->exists('brands/' . $brands['img'])) {
            Storage::disk('public')->delete('brands/' . $brands['img']);
        }
        $brands->delete();
        Toastr::success(trans('messages.brand_deleted_successfully'));
        return back();
    }


    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $brands=Brands::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.brands.partials._table',compact('brands'))->render(),
            'count'=>$brands->count()
        ]);
    }








    public function bulk_import_index()
    {
        return view('admin-views.brands.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        try {
            $collections = (new FastExcel)->import($request->file('brands_file'));
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }

        $data = [];
        foreach ($collections as $collection) {
            if ($collection['name'] === "") {
                Toastr::error(trans('messages.please_fill_all_required_fields'));
                return back();
            }
            array_push($data, [
                'name' => $collection['name'],
                'img' => $collection['image'],
            ]);
        }
        DB::table('brands')->insert($data);
        Toastr::success(trans('messages.category_imported_successfully', ['count'=>count($data)]));
        return back();
    }

    public function bulk_export_index()
    {
        return view('admin-views.brands.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {

        $brands = Brands::get();
        return (new FastExcel($brands))->download('Brands.xlsx');
    }

}

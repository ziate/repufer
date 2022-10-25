<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Sub_Categories;
use App\Models\Category;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\CentralLogics\Helpers;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\DB;
use App\Models\Translation;

class Sub_CategoryController extends Controller
{
    function index()
    {
        $Sub_Categories= Category::where(['position'=>1])->latest()->paginate(config('default_pagination'));
        
        $Sub_Categories_Added = Sub_Categories::where(['position'=>0])->latest()->paginate(config('default_pagination'));
        
        return view('admin-views.Sub_Category.index',compact('Sub_Categories','Sub_Categories_Added'));
    }

    function sub_index()
    {
        $Sub_Categories =Sub_Categories::where('position',0)->paginate(config('default_pagination'));
    
        $Sub_Categories_Added = Sub_Categories::where(['position'=>1])->latest()->paginate(config('default_pagination'));
        
        return view('admin-views.Sub_Category.sub-index',compact('Sub_Categories','Sub_Categories_Added'));
    }

    

    function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories|unique:sub_categories|max:100',
        ], [
            'name.required' => trans('messages.Name is required!'),
        ]);

        $Sub_Category = new Sub_Categories();
        $Sub_Category->name = $request->name[array_search('en', $request->lang)];
        $Sub_Category->image = Helpers::upload('category/', 'png', $request->file('image'));
        $Sub_Category->parent_id = $request->parent_id == null ? 0 : $request->parent_id;
        $Sub_Category->position = $request->position;
        $Sub_Category->save();

        $data = [];
        foreach($request->lang as $index=>$key)
        {
            if($request->name[$index] && $key != 'en')
            {
                array_push($data, Array(
                    'translationable_type'  => 'App\Models\Category',
                    'translationable_id'    => $Sub_Category->id,
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

        Toastr::success(trans('messages.category_added_successfully'));
        return redirect()->back();
    }

    public function edit($id)
    {
        $Sub_Categories = Sub_Categories::withoutGlobalScope('translate')->findOrFail($id);
        return view('admin-views.Sub_Category.edit', compact('Sub_Categories'));
    }

    public function status(Request $request)
    {
        $Sub_Category = Sub_Categories::find($request->id);
        $Sub_Category->status = $request->status;
        $Sub_Category->save();
        Toastr::success(trans('messages.Sub_Category_status_updated'));
        return redirect()->back();
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100|unique:sub_categories,name,'.$id,
        ]);
        $Sub_Category = Sub_Categories::find($id);

        $Sub_Category->name = $request->name[array_search('en', $request->lang)];
        $Sub_Category->image = $request->has('image') ? Helpers::update('Sub_Category/', $Sub_Category->image, 'png', $request->file('image')) : $Sub_Category->image;
        $Sub_Category->save();
        foreach($request->lang as $index=>$key)
        {
            if($request->name[$index] && $key != 'en')
            {
                Translation::updateOrInsert(
                    ['translationable_type'  => 'App\Models\Sub_Category',
                        'translationable_id'    => $Sub_Category->id,
                        'locale'                => $key,
                        'key'                   => 'name'],
                    ['value'                 => $request->name[$index]]
                );
            }
        }
        Toastr::success(trans('messages.Sub_Category_updated_successfully'));
        return back();
    }

    public function delete(Request $request)
    {
        $Sub_Category = Sub_Categories::findOrFail($request->id);
        if ($Sub_Category->childes->count()==0){
            $Sub_Category->delete();
            Toastr::success('Sub_Category removed!');
        }else{
            Toastr::warning(trans('messages.remove_sub_categories_first'));
        }
        return back();
    }

    public function get_all(Request $request){
        $data = Sub_Categories::where('name', 'like', '%'.$request->q.'%')->limit(8)->get([DB::raw('id, CONCAT(name, " (", if(position = 0, "'.trans('messages.main').'", "'.trans('messages.sub').'"),")") as text')]);
        if(isset($request->all))
        {
            $data[]=(object)['id'=>'all', 'text'=>'All'];
        }
        return response()->json($data);
    }

    public function update_priority($Sub_Category_id, Request $request)
    {
        $priority = $request->priority??0;
        
        Sub_Categories::where('id',$Sub_Category_id)->update([
            'priority' => $priority
        ]);
        
        Toastr::success(trans('messages.Sub_Category_priority_updated successfully'));
        return back();

    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $Sub_Categories =Sub_Categories::
        when($request->Sub_Categories, function($query){
            return $query->where('position','1');
        })
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();

        if($request->Sub_Categories)
        {
            return response()->json([
                'view'=>view('admin-views.Sub_Category.partials._sub_Sub_Category_table',compact('Sub_Categories'))->render(),
                'count'=>$Sub_Categories->count()
            ]);
        }
        return response()->json([
            'view'=>view('admin-views.Sub_Category.partials._table',compact('Sub_Categories'))->render(),
            'count'=>$Sub_Categories->count()
        ]);
    }
    
    
    // public function bulk_import_index()
    // {
    //     return view('admin-views.Sub_Category.bulk-import');
    // }

    // public function bulk_import_data(Request $request)
    // {
    //     try {
    //         $collections = (new FastExcel)->import($request->file('products_file'));
    //     } catch (\Exception $exception) {
    //         Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
    //         return back();
    //     }

    //     $data = [];
    //     foreach ($collections as $collection) {
    //         if ($collection['name'] === "") {
    //             Toastr::error(trans('messages.please_fill_all_required_fields'));
    //             return back();
    //         }
    //         $parent_id = is_numeric($collection['parent_id'])?$collection['parent_id']:0;
    //         array_push($data, [
    //             'name' => $collection['name'],
    //             'image' => $collection['image'],
    //             'parent_id' => $parent_id,
    //             'position' => $collection['position'],
    //             'status' => empty($collection['status'])?1:$collection['status'],
    //             'created_at'=>now(),
    //             'updated_at'=>now()
    //         ]);
    //     }
    //     DB::table('categories')->insert($data);
    //     Toastr::success(trans('messages.Sub_Category_imported_successfully', ['count'=>count($data)]));
    //     return back();
    // }

    // public function bulk_export_index()
    // {
    //     return view('admin-views.Sub_Category.bulk-export');
    // }

    // public function bulk_export_data(Request $request)
    // {
    //     $request->validate([
    //         'type'=>'required',
    //         'start_id'=>'required_if:type,id_wise',
    //         'end_id'=>'required_if:type,id_wise',
    //         'from_date'=>'required_if:type,date_wise',
    //         'to_date'=>'required_if:type,date_wise'
    //     ]);
    //     $categories = Sub_Category::when($request['type']=='date_wise', function($query)use($request){
    //         $query->whereBetween('created_at', [$request['from_date'].' 00:00:00', $request['to_date'].' 23:59:59']);
    //     })
    //     ->when($request['type']=='id_wise', function($query)use($request){
    //         $query->whereBetween('id', [$request['start_id'], $request['end_id']]);
    //     })
    //     ->get();
    //     return (new FastExcel($categories))->download('Categories.xlsx');
    // }

    
    function sub_sub_index()
    {
        return view('admin-views.Sub_Category.index');
    }

    function sub_Sub_Category_index()
    {
        return view('admin-views.Sub_Category.index');
    }

    function sub_sub_Sub_Category_index()
    {
        return view('admin-views.Sub_Category.index');
    }
}

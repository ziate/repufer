<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Food;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Fixed_Products;
use App\Models\Restaurant;
use App\Models\Review;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use App\CentralLogics\Helpers;
use App\CentralLogics\ProductLogic;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\DB;
use App\Scopes\RestaurantScope;
use App\Models\Translation;
use App\Models\Brands;
use Box\Spout\Writer\Common\Creator\Style\StyleBuilder;

class Fixed_ProductsController extends Controller
{
    public function index()
    {
        $brands = Brands::all();
        $categories = Category::where(['position' => 0])->get();
        return view('admin-views.Fixed_Products.index', compact('categories' ,'brands'));
    }

    public function store(Request $request)
    {
        
        
        $validator = Validator::make($request->all(), [
            'name.0' => 'required',
            'name.*' => 'max:191',
            'category_id' => 'required',
            'image' => 'required',
            'discount' => 'numeric|min:0',
            'restaurant_id' => '',
            'description.*' => 'max:1000',
        ], [
            'description.*.max' => trans('messages.description_length_warning'),
            'name.0.required' => trans('messages.item_name_required'),
            'category_id.required' => trans('messages.category_required'),
        ]);

        // if ($request['discount_type'] == 'percent') {
        //     $dis = ($request['price'] / 100) * $request['discount'];
        // } else {
        //     $dis = $request['discount'];
        // }

        // if ($request['price'] <= $dis) {
        //     $validator->getMessageBag()->add('unit_price', trans('messages.discount_can_not_be_more_than_or_equal'));
        // }

        // if ($request['price'] <= $dis || $validator->fails()) {
        //     return response()->json(['errors' => Helpers::error_processor($validator)]);
        // }

        $Fixed_Products = new Fixed_Products;
        $Fixed_Products->name = $request->name[array_search('en', $request->lang)];

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }

        $Fixed_Products->category_ids = json_encode($category);
        $Fixed_Products->category_id = $request->sub_category_id?$request->sub_category_id:$request->category_id;
        $Fixed_Products->description =  $request->description[array_search('en', $request->lang)];

        $choice_options = [];

        $Fixed_Products->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        //combinations end
        $images=[];
        if(count($request->file('image')) > 0){
            foreach($request->file('image') as $img){
                array_push($images, Helpers::upload('product/', 'png', $img));
            }
        }

        $images = json_encode($images);

        //$Fixed_Products->variations = json_encode($variations);
        $Fixed_Products->image = $images;
        $Fixed_Products->attributes =  json_encode($request->subs);
        $Fixed_Products->restaurant_id = $request->restaurant_id;
        $Fixed_Products->veg = 0;
        $Fixed_Products->brand_id = $request->brand_id;
        
        $sizes = json_encode($request['sizes']);
        $Fixed_Products->sizes = $sizes;
        

        
        $Fixed_Products->save();

        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($request->name[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\Fixed_Products',
                    'translationable_id' => $Fixed_Products->id,
                    'locale' => $key,
                    'key' => 'name',
                    'value' => $request->name[$index],
                ));
            }
            if ($request->description[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\Fixed_Products',
                    'translationable_id' => $Fixed_Products->id,
                    'locale' => $key,
                    'key' => 'description',
                    'value' => $request->description[$index],
                ));
            }
        }
        Translation::insert($data);

        return response()->json([], 200);
    }

    public function view($id)
    {
        $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->where(['id' => $id])->first();
        $reviews=Review::where(['food_id'=>$id])->latest()->paginate(config('default_pagination'));
        return view('admin-views.Fixed_Products.view', compact('product','reviews'));
    }

    public function edit($id)
    {
        $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->withoutGlobalScope('translate')->findOrFail($id);
        if(!$product)
        {
            Toastr::error(trans('messages.Fixed_Products').' '.trans('messages.not_found'));
            return back();
        }
        $brands = Brands::all();
        $product_category = json_decode($product->category_ids);
        $categories = Category::where(['parent_id' => 0])->get();
        return view('admin-views.Fixed_Products.edit', compact('product', 'product_category', 'categories' ,'brands'));
    }

    public function status(Request $request)
    {
        $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->findOrFail($request->id);
        $product->status = $request->status;
        $product->save();
        Toastr::success(trans('messages.Fixed_Products_status_updated'));
        return back();
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name.0' => 'required',
            'name.*' => 'max:191',
            'category_id' => 'required',
            'restaurant_id' => '',
            'description.*' => 'max:1000',
        ], [
            'name.0.required' => trans('messages.item_name_required'),
            'category_id.required' => trans('messages.category_required'),
        ]);

        $p = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->find($id);

        $p->name = $request->name[array_search('en', $request->lang)];

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }

        $p->category_id = $request->sub_category_id?$request->sub_category_id:$request->category_id;
        $p->category_ids = json_encode($category);
        $p->description =  $request->description[array_search('en', $request->lang)];

        $choice_options = [];
        if ($request->has('choice')) {
            foreach ($request->choice_no as $key => $no) {
                $str = 'choice_options_' . $no;
                if ($request[$str][0] == null) {
                    $validator->getMessageBag()->add('name', trans('messages.attribute_choice_option_value_can_not_be_null'));
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
                $item['name'] = 'choice_' . $no;
                $item['title'] = $request->choice[$key];
                $item['options'] = explode(',', implode('|', preg_replace('/\s+/', ' ', $request[$str])));
                array_push($choice_options, $item);
            }
        }
        $p->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        //combinations end
        $images=[];

        if($request->file('image') != null and count($request->file('image')) > 0){
            foreach($request->file('image') as $img){
                array_push($images, Helpers::upload('product/', 'png', $img));
            }
        $images = json_encode($images);
        }



        $p->variations = json_encode($variations);
        $p->image = $request->has('image') ? $images : $p->image;



        $p->attributes = $request->has('attribute_id') ? json_encode($request->attribute_id) : json_encode([]);
        $p->restaurant_id = $request->restaurant_id;
        $p->veg = 0;
        $p->brand_id = $request->brand_id;
        


        
        // $nls = json_encode($request['nls']);
        // $p->nls = $nls;
        
        $p->save();

        foreach ($request->lang as $index => $key) {
            if ($request->name[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\Fixed_Products',
                        'translationable_id' => $p->id,
                        'locale' => $key,
                        'key' => 'name'],
                    ['value' => $request->name[$index]]
                );
            }
            if ($request->description[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\Fixed_Products',
                        'translationable_id' => $p->id,
                        'locale' => $key,
                        'key' => 'description'],
                    ['value' => $request->description[$index]]
                );
            }
        }

        return response()->json([], 200);
    }

    public function delete(Request $request)
    {
        $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->withoutGlobalScope('translate')->find($request->id);

        if($product->image)
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

    public function variant_combination(Request $request)
    {
        $options = [];
        $price = $request->price;
        $product_name = $request->name;

        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }

        $result = [[]];
        foreach ($options as $property => $property_values) {
            $tmp = [];
            foreach ($result as $result_item) {
                foreach ($property_values as $property_value) {
                    $tmp[] = array_merge($result_item, [$property => $property_value]);
                }
            }
            $result = $tmp;
        }
        $combinations = $result;
        return response()->json([
            'view' => view('admin-views.Fixed_Products.partials._variant-combinations', compact('combinations', 'price', 'product_name'))->render(),
        ]);
    }

    public function variant_price(Request $request)
    {
        if($request->item_type=='Fixed_Products')
        {
            $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->find($request->id);
        }
        else
        {
            $product = ItemCampaign::find($request->id);
        }
        // $product = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->find($request->id);
        $str = '';
        $quantity = 0;
        $price = 0;
        $addon_price = 0;

        foreach (json_decode($product->choice_options) as $key => $choice) {
            if ($str != null) {
                $str .= '-' . str_replace(' ', '', $request[$choice->name]);
            } else {
                $str .= str_replace(' ', '', $request[$choice->name]);
            }
        }

        if($request['addon_id'])
        {
            foreach($request['addon_id'] as $id)
            {
                $addon_price+= $request['addon-price'.$id]*$request['addon-quantity'.$id];
            }
        }

        if ($str != null) {
            $count = count(json_decode($product->variations));
            for ($i = 0; $i < $count; $i++) {
                if (json_decode($product->variations)[$i]->type == $str) {
                    $price = json_decode($product->variations)[$i]->price - Helpers::product_discount_calculate($product, json_decode($product->variations)[$i]->price,$product->restaurant);
                }
            }
        } else {
            $price = $product->price - Helpers::product_discount_calculate($product, $product->price,$product->restaurant);
        }

        return array('price' => Helpers::format_currency(($price * $request->quantity)+$addon_price));
    }
    public function get_categories(Request $request)
    {
        $cat = Category::where(['parent_id' => $request->parent_id])->get();
        $res = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        foreach ($cat as $row) {
            if ($row->id == $request->sub_category) {
                $res .= '<option value="' . $row->id . '" selected >' . $row->name . '</option>';
            } else {
                $res .= '<option value="' . $row->id . '">' . $row->name . '</option>';
            }
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function get_Fixed_Productss(Request $request)
    {
        $Fixed_Productss = Fixed_Products::withoutGlobalScope(RestaurantScope::class)->with('restaurant')->whereHas('restaurant', function($query)use($request){
            $query->where('zone_id', $request->zone_id);
        })->get();
        $res = '';
        if(count($Fixed_Productss)>0 && !$request->data)
        {
            $res = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        }

        foreach ($Fixed_Productss as $row) {
            $res .= '<option value="'.$row->id.'" ';
            if($request->data)
            {
                $res .= in_array($row->id, $request->data)?'selected ':'';
            }
            $res .= '>'.$row->name.' ('.$row->restaurant->name.')'. '</option>';
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function list(Request $request)
    {
        $restaurant_id = $request->query('restaurant_id', 'all');
        $category_id = $request->query('category_id', 'all');
        $type = $request->query('type', 'all');
        $Fixed_Productss = Fixed_Products::withoutGlobalScope(RestaurantScope::class)
        ->when(is_numeric($restaurant_id), function($query)use($restaurant_id){
            return $query->where('restaurant_id', $restaurant_id);
        })
        ->when(is_numeric($category_id), function($query)use($category_id){
            return $query->whereHas('category',function($q)use($category_id){
                return $q->whereId($category_id)->orWhere('parent_id', $category_id);
            });
        })
        ->type($type)
        ->latest()->paginate(config('default_pagination'));
        $restaurant =$restaurant_id !='all'? Restaurant::findOrFail($restaurant_id):null;
        $category =$category_id !='all'? Category::findOrFail($category_id):null;
        return view('admin-views.Fixed_Products.list', compact('Fixed_Productss','restaurant','category', 'type'));
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $Fixed_Productss=Fixed_Products::withoutGlobalScope(RestaurantScope::class)->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->where('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json(['count'=>count($Fixed_Productss),
            'view'=>view('admin-views.Fixed_Products.partials._table',compact('Fixed_Productss'))->render()
        ]);
    }

    public function review_list(Request $request)
    {
        $reviews = Review::with(['Fixed_Products','customer'])->latest()->paginate(config('default_pagination'));
        return view('admin-views.Fixed_Products.reviews-list', compact('reviews'));
    }

    public function reviews_status(Request $request)
    {
        $review = Review::find($request->id);
        $review->status = $request->status;
        $review->save();
        Toastr::success(trans('messages.review_visibility_updated'));
        return back();
    }

    public function bulk_import_index()
    {
        return view('admin-views.Fixed_Products.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }

        $data = [];
        $skip = ['youtube_video_url'];
        foreach ($collections as $collection) {

            try
            {
                DB::beginTransaction();
                if ($collection['name'] === "" || $collection['name'] === "description" ||  $collection['category_id'] === ""  ) {
                    Toastr::error(trans('messages.please_fill_all_required_fields'));
                    return back();
                }

                $data = [
                    'name'                      => $collection['name'],
                    'description'               => $collection['description'],
                    'category_id'               => $collection['category_id'] ,
                    'category_ids'               => $collection['category_ids'] ,
                    'image'                     => $collection['image'],
                    'brand_id'                  => $collection['brand_id'], 
                    'attributes'                => $collection['attributes'], 
                    'choice_options'            => json_encode([]),
                    'variations'                => json_encode([]),
                ];
                $food = Fixed_Products::create($data);
                $data_translation = [];
                $data_translation[] = array(
                    'translationable_type' => 'App\Models\Fixed_Products',
                    'translationable_id' => $food->id,
                    'locale' => 'ar',
                    'key' => 'name',
                    'value' => $collection['name'],
                );
                $data_translation[] = array(
                    'translationable_type' => 'App\Models\Fixed_Products',
                    'translationable_id' => $food->id,
                    'locale' => 'ar',
                    'key' => 'description',
                    'value' =>  $collection['description'],
                );
                Translation::insert($data_translation);
                DB::commit();
            }catch(\Exception $e){
                DB::rollBack();
                dd($e->getMessage());
                Toastr::error(trans('messages.failed_to_import_data'));
                return back();
            }
        }
        Toastr::success(trans('messages.product_imported_successfully', ['count'=>count($data)]));
        return back();
    }

    public function bulk_export_index()
    {
        return view('admin-views.Fixed_Products.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {
        $header_style = (new StyleBuilder())
        ->setShouldWrapText()
        ->setCellAlignment('center')
        ->setFontBold()
        ->build();



        $products = Fixed_Products::select('name','description','image','Category_id','category_ids','brand_id','attributes', 'brand_id')->get();
        //  $products = DB::table('fixed_products')
        //  ->join('categories', 'fixed_products.category_id', '=', 'Categories.id')
        //  ->select('fixed_products.name','description' , 'categories.name')
        //  ->get();
        
        return (new FastExcel($products))->headerStyle($header_style)->download('Fixed_Productss.xlsx');
    }
}

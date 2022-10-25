@extends('layouts.vendor.app')

@section('title',__('messages.add_new_food'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{asset('public/assets/admin/css/tags-input.min.css')}}" rel="stylesheet">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i> {{__('messages.add')}} {{__('messages.new')}} {{__('messages.food')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">اضافة منتج</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">اضافة منتج لطلب المراجعه</a>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="row gx-2 gx-lg-3">
                    <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                        <form action="javascript:" method="post" id="food_form"
                              enctype="multipart/form-data">
                            @csrf
                            @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                            @php($language = $language->value ?? null)
                            @php($default_lang = 'bn')

                            <input type="hidden" name="product_id" id="product_id"/>
                            <div class="card p-4" id="{{$default_lang}}-form">
                                <div class="form-group">
                                    <label class="input-label" for="exampleFormControlInput1">{{__('messages._select_product')}}</label>

                                    <select required  name="name[]"  class="form-control js-select2-custom" onchange="getDataProductFixed(this.value)" >
                                        <option value="">---{{__('messages.select')}}---</option>
                                        @foreach($Fixed_Products as $Fixed_Product)
                                            <option value="{{$Fixed_Product['name']}}">{{$Fixed_Product['name']}}</option>
                                        @endforeach
                                    </select>

                                </div>
                                <input type="hidden" name="lang[]" value="en">
                                <div class="form-group pt-4">
                                    <label class="input-label" for="exampleFormControlInput1">{{__('messages.short')}} {{__('messages.description')}}</label>
                                    <textarea readonly type="text" name="description[]" id="description" class="form-control ckeditor"></textarea>
                                </div>
                            </div>










                            <div class="row">
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.price')}}</label>
                                        <input type="number" min="0" step="0.01" value="1" name="price" id="price" class="form-control"
                                               placeholder="Ex : 100" required>
                                    </div>
                                </div>
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}}</label>
                                        <input readonly type="number" min="0" max="100000" value="0" name="discount" id="discounts" class="form-control"
                                               placeholder="Ex : 100" >
                                    </div>
                                </div>
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}} {{__('messages.type')}}</label>
                                        <input readonly name="discount_type" id="discount_types" class="form-control " readonly>
                                            
                                            <!--<option selected value="amount">{{__('messages.amount')}}</option>-->
                                        <!--</select>-->
                                    </div>
                                </div>
                                <div class="col-md-3 col-6">
                                    <input type="hidden" name="veg" value="0"  id="veg"/>
                                        <!--<div class="form-group">-->
                                        <!--    <label class="input-label" for="exampleFormControlInput1">{{__('messages.item_type')}}</label>-->
                                        <!--    <select name="veg" id="veg" class="form-control js-select2-custom">-->
                                        <!--        <option value="0">{{__('messages.non_veg')}}</option>-->
                                        <!--        <option value="1">{{__('messages.veg')}}</option>-->
                                        <!--    </select>-->
                                        <!--</div>-->
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.category')}}<span
                                                class="input-label-secondary">*</span></label>
                                        <input readonly name="category_id"  id="category_ids" class="form-control ">
                                            <!--@foreach($categories as $category)-->
                                            <!--    <option  value="{{$category['id']}}">{{$category['name']}}</option>-->
                                            <!--@endforeach-->
                                        <!--</select>-->
                                    </div>
                                </div>
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select disabled name="sub_category_id" id="sub-categories" onchange="getRequest('{{url('/')}}/vendor-panel/food/get-sub_categories?parent_id='+this.value,'sub_sub_category_id')"
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                        
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select disabled name="sub_sub_category_id" id="sub_sub_category_id" onchange="getRequest('{{url('/')}}/vendor-panel/food/get-sub_categories?parent_id='+this.value,'sub_sub_sub_category_id')"
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_sub_sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select disabled name="sub_sub_sub_category_id" id="sub_sub_sub_category_id" 
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                                
                                
                                
                                {{--<div class="col-md-4 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">Sub Sub Category<span
                                                class="input-label-secondary"></span></label>
                                        <select disabled="disabled" name="sub_sub_category_id" id="sub-sub-categories"
                                                class="form-control readonly">

                                        </select>
                                    </div>
                                </div>--}}
                                
                                
                                <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label class="input-label" for="exampleFormControlSelect1">{{__('messages.brand')}}<span
                                                    class="input-label-secondary"></span></label>
                                            <select name="brand_id" id="brand_id" class="form-control js-select2-custom" readonly>
                                                <option value="">---{{__('messages.select')}}---</option>
                                                @foreach($brands as $brand)
                                                    <option value="{{$brand['id']}}">{{$brand['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6" style="border: 1px solid #80808045; border-radius: 10px;padding-top: 10px;margin: 1px">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.attribute')}}<span
                                                class="input-label-secondary"></span></label>
                                        <select disabled="disabled" name="attribute_id[]" id="choice_attributes"
                                                class="form-control js-select2-custom"
                                                multiple="multiple">
                                            @foreach(\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                                <option value="{{$attribute['id']}}">{{$attribute['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-12 mt-2 mb-2">
                                    <div class="customer_choice_options" id="customer_choice_options">

                                    </div>
                                </div>
                                <div class="col-md-12 mt-2 mb-2">
                                    <div class="variant_combination" id="variant_combination">

                                    </div>
                                </div>
                            </div>

                            <div class="col-5 mt-2">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.addon')}}<span
                                                class="input-label-secondary"></span></label>
                                        <select disabled="disabled" name="addon_ids[]" id="addon_ids" class="form-control js-select2-custom" multiple="multiple">
                                            @foreach(\App\Models\AddOn::where('restaurant_id', \App\CentralLogics\Helpers::get_restaurant_id())->orderBy('name')->get() as $addon)
                                                <option value="{{$addon['id']}}">{{$addon['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <!--<div class="form-group">-->
                                    <!--    <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.starts')}}</label>-->
                                    <!--    <input type="time" value="10:00" name="available_time_starts" id="available_time_starts" class="form-control"-->
                                    <!--           placeholder="Ex : 10:30 am" >-->
                                    <!--</div>-->
                                </div>
                                <div class="col-6">
                                    <!--<div class="form-group">-->
                                    <!--    <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.ends')}}</label>-->
                                    <!--    <input type="time" value="22:00" name="available_time_ends" id="available_time_ends" class="form-control"  placeholder="5:45 pm"-->
                                    <!--           required>-->
                                    <!--</div>-->
                                </div>
                            </div>

                            <div class="col-6 mt-5 form-group">
                                <label>{{__('messages.food')}} {{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 1:1 )</small>
                                <div class="custom-file" id="custom_file">
                                    <input disabled="disabled" type="file" name="image[]" id="imageForm" multiple class="custom-file-input"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" >
                                    <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                </div>


                            </div>
                            <hr>
                            <div class="form-group col-12">
                                 <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                            </div>
                           
                        </form>
                    </div>
                    <!-- ------------------------>
                </div>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <div class="row gx-2 gx-lg-3">
                    <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                        <form action="javascript:" method="post" id="food_form2"
                              enctype="multipart/form-data">
                            @csrf
                            @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                            @php($language = $language->value ?? null)
                            @php($default_lang = 'bn')
                            @if($language)
                                @php($default_lang = json_decode($language)[0])
                                <ul class="nav nav-tabs mb-4">
                                    @foreach(json_decode($language) as $lang)
                                        <li class="nav-item">
                                            <a class="nav-link lang_link {{$lang == $default_lang? 'active':''}}" href="#" id="{{$lang}}-link">{{\App\CentralLogics\Helpers::get_language_name($lang).'('.strtoupper($lang).')'}}</a>
                                        </li>
                                    @endforeach
                                </ul>
                                <input type="hidden" value="0" name="status" />
                                @foreach(json_decode($language) as $lang)
                                    <div class="card p-4 {{$lang != $default_lang ? 'd-none':''}} lang_form" id="{{$lang}}-form">
                                        <div class="form-group">
                                            <label class="input-label" for="{{$lang}}_name">{{__('messages.name')}} ({{strtoupper($lang)}})</label>
                                            <input type="text" {{$lang == $default_lang? 'required':''}} name="name[]" id="{{$lang}}_name" class="form-control" placeholder="{{__('messages.new_food')}}" oninvalid="document.getElementById('en-link').click()">
                                        </div>
                                        <input type="hidden" name="lang[]" value="{{$lang}}">
                                        <div class="form-group pt-4">
                                            <label class="input-label" for="exampleFormControlInput1">{{__('messages.short')}} {{__('messages.description')}} ({{strtoupper($lang)}})</label>
                                            <textarea type="text" name="description[]" class="form-control ckeditor"></textarea>
                                        </div>
                                    </div>
                                @endforeach
                            @else

                            @endif

                            <div class="row">
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.price')}}</label>
                                        <input type="number" min="0" max="100000" step="0.01" value="1" name="price" class="form-control"
                                               placeholder="Ex : 100" required>
                                    </div>
                                </div>
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}}</label>
                                        <input type="number" min="0" max="100000" value="0" name="discount" class="form-control"
                                               placeholder="Ex : 100" >
                                    </div>
                                </div>
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.discount')}} {{__('messages.type')}}</label>
                                        <select name="discount_type" class="form-control js-select2-custom">
                                            <option value="percent">{{__('messages.percent')}}</option>
                                            <option value="amount">{{__('messages.amount')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <input name="veg" type="hidden" value="0" id="veg"/>
                                <!--<div class="col-md-3 col-6">-->
                                <!--    <div class="form-group">-->
                                <!--        <label class="input-label" for="exampleFormControlInput1">{{__('messages.item_type')}}</label>-->
                                <!--        <select name="veg" class="form-control js-select2-custom">-->
                                <!--            <option value="0">{{__('messages.non_veg')}}</option>-->
                                <!--            <option value="1">{{__('messages.veg')}}</option>-->
                                <!--        </select>-->
                                <!--    </div>-->
                                <!--</div>-->
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.category')}}<span
                                                class="input-label-secondary">*</span></label>
                                        <select name="category_id" class="form-control js-select2-custom"
                                                onchange="getRequest('{{url('/')}}/vendor-panel/food/get-categories?parent_id='+this.value,'rev-sub-categories')">
                                            <option value="">---{{__('messages.select')}}---</option>
                                            @foreach($categories as $category)
                                                <option value="{{$category['id']}}">{{$category['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select name="sub_category_id" id="rev-sub-categories" onchange="getRequest('{{url('/')}}/vendor-panel/food/get-sub_categories?parent_id='+this.value,'rev-sub_sub_category_id')"
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                        
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select name="sub_sub_category_id" id="rev-sub_sub_category_id" onchange="getRequest('{{url('/')}}/vendor-panel/food/get-sub_categories?parent_id='+this.value,'rev-sub_sub_sub_category_id')"
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.sub_sub_sub_category')}}<span
                                                class="input-label-secondary" title="{{__('messages.category_required_warning')}}"><img src="{{asset('/public/assets/admin/img/info-circle.svg')}}" alt="{{__('messages.category_required_warning')}}"></span></label>
                                        <select name="sub_sub_sub_category_id" id="rev-sub_sub_sub_category_id" 
                                                class="form-control js-select2-custom">
        
                                        </select>
                                    </div>
                                </div>
                                
                                
                                
                                
                                {{--<div class="col-md-4 col-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">Sub Sub Category<span
                                                class="input-label-secondary"></span></label>
                                        <select name="sub_sub_category_id" id="sub-sub-categories"
                                                class="form-control js-select2-custom">

                                        </select>
                                    </div>
                                </div>--}}
                            </div>

                            <div class="row" style="border: 1px solid #80808045; border-radius: 10px;padding-top: 10px;margin: 1px">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.attribute')}}<span
                                                class="input-label-secondary"></span></label>
                                        <select name="attribute_id[]" id="choice_attributes"
                                                class="form-control js-select2-custom"
                                                multiple="multiple">
                                            @foreach(\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                                <option value="{{$attribute['id']}}">{{$attribute['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-12 mt-2 mb-2">
                                    <div class="customer_choice_options" id="customer_choice_options">

                                    </div>
                                </div>
                                <div class="col-md-12 mt-2 mb-2">
                                    <div class="variant_combination" id="variant_combination">

                                    </div>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlSelect1">{{__('messages.addon')}}<span
                                                class="input-label-secondary"></span></label>
                                        <select name="addon_ids[]" class="form-control js-select2-custom" multiple="multiple">
                                            @foreach(\App\Models\AddOn::where('restaurant_id', \App\CentralLogics\Helpers::get_restaurant_id())->orderBy('name')->get() as $addon)
                                                <option value="{{$addon['id']}}">{{$addon['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <!--<div class="form-group">-->
                                    <!--    <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.starts')}}</label>-->
                                    <!--    <input type="time" name="available_time_starts" class="form-control"-->
                                    <!--           placeholder="Ex : 10:30 am" required>-->
                                    <!--</div>-->
                                </div>
                                <div class="col-6">
                                    <!--<div class="form-group">-->
                                    <!--    <label class="input-label" for="exampleFormControlInput1">{{__('messages.available')}} {{__('messages.time')}} {{__('messages.ends')}}</label>-->
                                    <!--    <input type="time" name="available_time_ends" class="form-control"  placeholder="5:45 pm"-->
                                    <!--           required>-->
                                    <!--</div>-->
                                </div>
                            </div>

                            <div class="form-group">
                                <label>{{__('messages.food')}} {{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 1:1 )</small>
                                <div class="custom-file">
                                    <input type="file" name="image[]" id="customFileEg1" multiple class="custom-file-input"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                </div>


                            </div>
                            <hr>
                            <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
          </div>
    </div>

@endsection

@push('script')

@endpush

@push('script_2')
    <script>
        function getRequest(route, id) {
            $.get({
                url: route,
                dataType: 'json',
                success: function (data) {
                    $('#' + id).empty().append(data.options);
                },
            });
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this);
            $('#image-viewer-section').show(1000)
        });
    </script>

    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>


    <script src="{{asset('public/assets/admin')}}/js/tags-input.min.js"></script>

    <script>
        $('#choice_attributes').on('change', function () {
            $('#customer_choice_options').html(null);
            $.each($("#choice_attributes option:selected"), function () {
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
        });

        function add_more_customer_choice_option(i, name) {
            let n = name;
            $('#customer_choice_options').append('<div class="row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="' + i + '"><input type="text" class="form-control" name="choice[]" value="' + n + '" placeholder="{{__('messages.choice_title')}}" readonly></div><div class="col-lg-9"><input type="text" class="form-control" name="choice_options_' + i + '[]" placeholder="{{__('messages.enter_choice_values')}}" data-role="tagsinput" onchange="combination_update()"></div></div>');
            $("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
        }

        function combination_update() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '{{route('vendor.food.variant-combination')}}',
                data: $('#food_form').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    $('#variant_combination').html(data.view);
                    if (data.length > 1) {
                        $('#quantity').hide();
                    } else {
                        $('#quantity').show();
                    }
                }
            });
        }

        function combination_update() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '{{route('vendor.food.variant-combination')}}',
                data: $('#food_form2').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    $('#variant_combination').html(data.view);
                    if (data.length > 1) {
                        $('#quantity').hide();
                    } else {
                        $('#quantity').show();
                    }
                }
            });
        }
    </script>


    <script>
        $('#food_form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('vendor.food.store')}}',
                data: $('#food_form').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('{{__('messages.product_added_successfully')}}', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '{{route('vendor.food.list')}}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
    <script>
        $('#food_form2').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('vendor.food.store')}}',
                data: $('#food_form2').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#loading').hide();
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('{{__('messages.product_added_successfully')}}', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '{{route('vendor.food.list')}}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
    <script>
        $(".lang_link").click(function(e){
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.split("-")[0];
            console.log(lang);
            $("#"+lang+"-form").removeClass('d-none');
            if(lang == '{{$default_lang}}')
            {
                $("#from_part_2").removeClass('d-none');
            }
            else
            {
                $("#from_part_2").addClass('d-none');
            }
        });



        function getDataProductFixed(datas){
            let arrData = '{{ $Fixed_Products }}';
            let result = arrData.includes(datas);

            if(result){
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.post({
                        url: `{{url('vendor-panel/food/getDataProductFixed${datas}')}}`,
                        data: datas,
                        cache: false,
                        contentType: false,
                        processData: false,

                        success: function (data) {
                            $('#loading').hide();
                            if (data.errors) {
                                for (var i = 0; i < data.errors.length; i++) {
                                    toastr.error(data.errors[i].message, {
                                        CloseButton: true,
                                        ProgressBar: true
                                    });
                                }
                            } else {
                                console.log(data.discount_type);
                                var imgData = JSON.parse(data.image);
                                // console.log(data.id);
                                var arrImg=[];
                                for(var i =0;i< imgData.length;i++){
                                    arrImg +=`<img src="http://repuffapp.com/storage/app/public/product/${imgData[i]}" width="100px" style="margin-bottom:20px" />`;
                                }
                                
                                document.getElementById("custom_file").innerHTML = arrImg;
                                
                                
                                document.getElementById("product_id").value = data.id;
                                document.getElementById("description").value = data.description;
                                document.getElementById("price").value = data.price;
                                document.getElementById("discounts").value = data.discount;
                                
                                document.getElementById("discount_types").value = data.discount_type;
                                
                                document.getElementById("category_ids").value = data.category_id;
                                document.getElementById("sub-categories").value = data.category_id;
                                document.getElementById("choice_attributes")[0].value = data.choice_attributes;
                                document.getElementById("addon_ids").value = data.add_ons;
                                document.getElementById("veg").value = data.veg;
                                document.getElementById("brand_id").innerHTML = '';
                                document.getElementById('brand_id').innerHTML += '<option value="' + data.brand_id +'">' + data.brands.name + '</option>'
                                // var img= data.image;
                                

                                // document.getElementById("available_time_ends").value = data.available_time_ends;


                            }
                        }
                    });

            }
        }





    </script>
@endpush



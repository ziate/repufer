@extends('layouts.admin.app')

@section('title','Brands')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i> {{__('messages.add')}} {{__('messages.brand')}} {{__('messages.new')}} </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                
                <form action="{{route('admin.brands.store')}}" method="post" id="brand_form" enctype="multipart/form-data">
                    @csrf

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
                        @foreach(json_decode($language) as $lang)
                            <div class=" p-4 {{$lang != $default_lang ? 'd-none':''}} lang_form" id="{{$lang}}-form">
                                <div class="form-group">
                                    <label class="input-label" for="{{$lang}}_name">{{__('messages.brandName_en')}} ({{strtoupper($lang)}})</label>
                                    <input type="text" name="name[]" id="{{$lang}}_name" class="form-control" placeholder="{{__('messages.brandName_en')}}" {{$lang == $default_lang? 'required':''}} oninvalid="document.getElementById('en-link').click()">
                                </div>
                                <input type="hidden" name="lang[]" value="{{$lang}}">
                                
                            </div>
                        @endforeach
                    @else
                    <div class="card p-4" id="{{$default_lang}}-form">
                        <div class="form-group">
                            <label class="input-label" for="exampleFormControlInput1">{{__('messages.brandName_ar')}} (EN)</label>
                            <input type="text" name="name[]" class="form-control" placeholder="{{__('messages.brandName_ar')}}" required>
                        </div>
                        <input type="hidden" name="lang[]" value="en">
                        
                    </div>
                    @endif

                    <div class="row">
                        
                        <div class="col-md-6 pt-4">
                            <div class="form-group">
                                <label>{{__('messages.brand')}} {{__('messages.image')}}</label>
                                <small style="color: red">* ( {{__('messages.ratio')}} 3:1 )</small>
                                <div class="custom-file">
                                    <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom:0%;">
                                <center>
                                    <img style="width: 80%;border: 1px solid; border-radius: 10px;" id="viewer"
                                        src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}" alt="campaign image"/>
                                </center>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                </form>
                    
                
            </div>

            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-header">
                        <h5>{{__('messages.brand')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$brands->count()}}</span></h5>
                        <form id="search-form">
                            @csrf
                            <!-- Search -->
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch" type="search" name="search" class="form-control" placeholder="{{__('messages.search_here')}}" aria-label="{{__('messages.search_here')}}">
                                <button type="submit" class="btn btn-light">{{__('messages.search')}}</button>
                            </div>
                            <!-- End Search -->
                        </form>
                    </div>
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                               class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table text-center"
                               data-hs-datatables-options='{
                                "order": [],
                                "orderCellsTop": true,
                                "search": "#datatableSearch",
                                "entries": "#datatableEntries",
                                "isResponsive": false,
                                "isShowPaging": false,
                                "paging": false,
                               }'>
                            <thead class="thead-light">
                                <tr>
                                    <th>{{__('messages.#')}}</th>
                                    <th>{{__('messages.image')}}</th>
                                    <th>{{__('messages.brandName')}}</th>
                                    <th>{{__('messages.action')}}</th>
                                </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($brands as $key=>$brand)
                                <tr>
                                    <td>{{$key+$brands->firstItem()}}</td>
                                    <td>
                                        <span class="media align-items-center">
                                            <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/brands')}}/{{$brand['img']}}" 
                                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$brand->name}} image">
                                            
                                        </span>
                                    
                                    </td>
                                    <td>
                                        <h5 class="text-hover-primary mb-0">{{Str::limit($brand['name'], 25, '...')}}</h5>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white" href="{{route('admin.brands.edit',[$brand['id']])}}"title="{{__('messages.edit')}} {{__('messages.brand')}}"><i class="tio-edit"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('brand-{{$brand['id']}}','Want to delete this brand ?')" title="{{__('messages.delete')}} {{__('messages.brand')}}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form action="{{route('admin.brands.delete',[$brand['id']])}}"
                                                    method="post" id="brand-{{$brand['id']}}">
                                                @csrf @method('delete')
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
                        <div class="page-area">
                            <table>
                                <tfoot>
                                    {!! $brands->links() !!}
                                </tfoot>
                            </table>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection

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
    });
</script>
<script>
    $(document).on('ready', function () {
        var zone_id = [];
        $('#zone').on('change', function(){
            if($(this).val())
            {
                zone_id = $(this).val();
            }
            else
            {
                zone_id = [];
            }
        });

        $('.js-data-example-ajax').select2({
            ajax: {
                url: '{{url('/')}}/admin/vendor/get-restaurants',
                data: function (params) {
                    return {
                        q: params.term, // search term
                        zone_ids: [zone_id],
                        page: params.page
                    };
                },
                processResults: function (data) {
                    return {
                    results: data
                    };
                },
                __port: function (params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'), {
                select: {
                    style: 'multi',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                    '<img class="mb-3" src="{{asset('public/assets/admin/svg/illustrations/sorry.svg')}}" alt="Image Description" style="width: 7rem;">' +
                    '<p class="mb-0">No data to show</p>' +
                    '</div>'
                }
            });

            $('#datatableSearch').on('mouseup', function (e) {
                var $input = $(this),
                    oldValue = $input.val();

                if (oldValue == "") return;

                setTimeout(function(){
                    var newValue = $input.val();

                    if (newValue == ""){
                    // Gotcha
                    datatable.search('').draw();
                    }
                }, 1);
            });

            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
        $('#item_wise').hide();
        function brand_type_change(order_type) {
           if(order_type=='item_wise')
            {
                $('#restaurant_wise').hide();
                $('#item_wise').show();
            }
            else if(order_type=='restaurant_wise')
            {
                $('#restaurant_wise').show();
                $('#item_wise').hide();
            }
            else{
                $('#item_wise').hide();
                $('#restaurant_wise').hide();
            }
        }

        $('#brand_form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.brands.store')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('brand uploaded successfully!', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.href = '{{route('admin.brands.add-new')}}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
    <script>
        $('#search-form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.brands.search')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('#itemCount').html(data.count);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
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
    })
</script>
@endpush

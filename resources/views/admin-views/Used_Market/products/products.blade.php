@extends('layouts.admin.app')

@section('title','Products List')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
                        <div class="row align-items-center mb-5 ">
                <div class="col-sm mb-4 mb-sm-0 d-flex justify-content-end">
                    <a href="{{route('admin.Used_Market.add')}}">
                    <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i>

                        Add New Product</h1>
                    </a>

                </div>
            </div>
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"> {{__('messages.food')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="foodCount">{{$Used_Product->total()}}</span></h1>
                </div>
                @if ($toggle_veg_non_veg)
                <!-- Veg/NonVeg filter -->
                <div class="col-sm-auto mb-1 mb-sm-0">
                    <select name="category_id" onchange="set_filter('{{url()->full()}}',this.value, 'type')" data-placeholder="{{__('messages.all')}}" class="form-control">
                        <option value="all" {{$type=='all'?'selected':''}}>{{__('messages.all')}}</option>
                        <option value="veg" {{$type=='veg'?'selected':''}}>{{__('messages.veg')}}</option>
                        <option value="non_veg" {{$type=='non_veg'?'selected':''}}>{{__('messages.non_veg')}}</option>
                    </select>
                </div>
                <!-- End Veg/NonVeg filter -->
                @endif
          
            </div>
            
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header p-1">
                        <div class="row justify-content-between align-items-center flex-grow-1">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <form id="search-form">
                                @csrf
                                    <!-- Search -->
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="tio-search"></i>
                                        </div>
                                        </div>
                                        <input id="datatableSearch" name="search" type="search" class="form-control" placeholder="{{__('messages.search_here')}}" aria-label="{{__('messages.search_here')}}">
                                        <button type="submit" class="btn btn-light">{{__('messages.search')}}</button>
                                    </div>
                                    <!-- End Search -->
                                </form>
                            </div>

                            <div class="col-auto">
                                <!-- Unfold -->
                           

                                <!-- Unfold -->
                                <div class="hs-unfold">
                                    <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;"
                                        data-hs-unfold-options='{
                                        "target": "#showHideDropdown",
                                        "type": "css-animation"
                                        }'>
                                        <i class="tio-table mr-1"></i> {{__('messages.columns')}} <span class="badge badge-soft-dark rounded-circle ml-1">7</span>
                                    </a>

                                    <div id="showHideDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card" style="width: 15rem;">
                                        <div class="card card-sm">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">#</span>
                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_index">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_index" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                <!-- End Checkbox Switch -->
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.name')}}</span>
                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_name">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_name" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.description')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_description">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_description" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.image')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_image">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_image" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                             <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.price')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_price">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_price" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.phone')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_phone">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_phone" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                               
                                                      <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.address')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_address">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_address" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{__('messages.action')}}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_action">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_action" checked>
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Unfold -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom" id="table-div">
                        <table id="datatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            data-hs-datatables-options='{
                                "columnDefs": [{
                                    "targets": [],
                                    "width": "5%",
                                    "orderable": false
                                }],
                                "order": [],
                                "info": {
                                "totalQty": "#datatableWithPaginationInfoTotalQty"
                                },

                                "entries": "#datatableEntries",
     
                                "isResponsive": false,
                                "isShowPaging": false,
                                "paging":false
                            }'>
                            <thead class="thead-light">
                            <tr>
                                <th>{{__('messages.#')}}</th>
                                <th style="width: 20%">{{__('messages.name')}}</th>
                                <th style="width: 20%">{{__('messages.description')}}</th>
                                <th style="width: 15%">{{__('messages.image')}}</th>
                                <th>{{__('messages.price')}}</th>
                                <th>{{__('messages.phone')}}</th>
                                  <th>{{__('messages.address')}}</th>
                                <th>{{__('messages.action')}}</th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($Used_Product as $key=>$product)
                                <tr>
                                    <td>{{$key+$Used_Product->firstItem()}}</td>
                                    <td>
                                    {{$product['name']}}
                                    </td>
                                    <td>
                                    {{Str::limit($product->description,20,'...')}}
                                    </td>
                                    <td>
                                        <a class="media align-items-center" href="{{route('admin.food.view',[$product['id']])}}">
                                            <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/product')}}/{{$product['image']}}" 
                                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$product->name}} image">
                                          
                                        </a>
                                    </td>
                                    <td>{{\App\CentralLogics\Helpers::format_currency($product['price'])}}</td>
                                    <td>
                                     {{$product['phone']}}
                                    </td>
                                     <td>
                                     {{$product['address']}}
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white"
                                            href="{{route('admin.Used_Market.edit',[$product['id']])}}" title="{{__('messages.edit')}} {{__('messages.food')}}"><i class="tio-edit"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white" href="javascript:"
                                            onclick="form_alert('food-{{$product['id']}}','{{__('messages.Want_to_delete_this_item')}}')" title="{{__('messages.delete')}} {{__('messages.food')}}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form action="{{route('admin.Used_Market.delete',[$product['id']])}}"
                                                method="post" id="food-{{$product['id']}}">
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
                                <tfoot class="border-top">
                                {!! $Used_Product->withQueryString()->links() !!}
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <!-- End Table -->
                </div>
                <!-- End Card -->
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
        var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
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

        $('#toggleColumn_index').change(function (e) {
          datatable.columns(0).visible(e.target.checked)
        })
        $('#toggleColumn_name').change(function (e) {
          datatable.columns(1).visible(e.target.checked)
        })

        $('#toggleColumn_description').change(function (e) {
          datatable.columns(2).visible(e.target.checked)
        })

        $('#toggleColumn_image').change(function (e) {
          datatable.columns(3).visible(e.target.checked)
        })
        $('#toggleColumn_price').change(function (e) {
          datatable.columns(4).visible(e.target.checked)
        })
        $('#toggleColumn_phone').change(function (e) {
          datatable.columns(5).visible(e.target.checked)
        })
        $('#toggleColumn_address').change(function (e) {
          datatable.columns(6).visible(e.target.checked)
        })
        $('#toggleColumn_action').change(function (e) {
          datatable.columns(7).visible(e.target.checked)
        })

            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });

        $('#restaurant').select2({
            ajax: {
                url: '{{url('/')}}/admin/vendor/get-restaurants',
                data: function (params) {
                    return {
                        q: params.term, // search term
                        all:true,
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

        $('#category').select2({
            ajax: {
                url: '{{route("admin.category.get-all")}}',
                data: function (params) {
                    return {
                        q: params.term, // search term
                        all:true,
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

        $('#search-form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.food.search')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('.page-area').hide();
                    $('#foodCount').html(data.count);
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
@endpush

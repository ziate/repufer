@extends('layouts.admin.app')

@section('title','All Events')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">

        <div class="row gx-2 gx-lg-3">

            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-header">
                        <h5>{{__('messages.Events')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$events->count()}}</span></h5>
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
                                <th>{{__('messages.title')}}</th>
                                <th>{{__('messages.action')}}</th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($events as $key=>$event)
                                <tr>
                                    <td>{{$key+1}}</td>

                                    <td>
                                        <h5 class="text-hover-primary mb-0">{{Str::limit($event['title'], 25, '...')}}</h5>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white" href="{{route('admin.events.attendance',[$event['id']])}}" title="{{__('messages.attendance')}}"><i class="tio-user"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white" href="{{route('admin.events.edit',[$event['id']])}}" title="{{__('messages.edit')}} {{__('messages.event')}}"><i class="tio-edit"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('event-{{$event['id']}}','Want to delete this event ?')" title="{{__('messages.delete')}} {{__('messages.event')}}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form action="{{route('admin.events.delete',[$event['id']])}}"
                                              method="post" id="event-{{$event['id']}}">
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
                                {!! $events->links() !!}
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
        $(document).on('ready', function () {

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
                url: '{{route('admin.events.search')}}',
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

@endpush

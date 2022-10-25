@extends('layouts.admin.app')

@section('title','Event Attendance')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">

        <div class="row gx-2 gx-lg-3">

            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-header">
                        <h5>Event Attendance</h5>

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
                                <th>{{__('messages.username')}}</th>
                                <th>{{__('messages.attendance')}}</th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($attendances as $key=>$attendance)
                                <tr>
                                    <td>{{$key+1}}</td>

                                    <td><h5 class="text-hover-primary mb-0">{{ $attendance->user->f_name . $attendance->user->l_name }}</h5></td>
                                    <td><h5 class="text-hover-primary mb-0">{{ $attendance->attendance() }}</h5></td>

                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
                        <div class="page-area">
                            <table>
                                <tfoot>
                                {!! $attendances->links() !!}
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

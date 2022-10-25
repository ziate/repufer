@extends('layouts.admin.app')

@section('title','Product Settings')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{asset('public/assets/admin/css/tags-input.min.css')}}" rel="stylesheet">
@endpush

@section('content')
    @php($opening_time='')
    @php($closing_time='')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i>  {{__('messages.settings')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        
        
         <form  method='post' action="{{route('admin.Used_Market.UpdateSettings')}}" id="setting">
                @csrf
        
        <div class="col-md-12 card">
                        <div class="form-group">
                            <label class="input-label" for="amount">Number Of Allowed Products<span class="input-label-secondary"></span></label>
                            <input class="form-control" type="number" min="1" step="1" name="amount" id="amount"  max="999999999999" value="{{$used_market_setting['amount' ]?? 0}}">
                        </div>
                           <div class="form-group">
                            <label class="input-label" for="amount">ُExpiration Date of each Product<span class="input-label-secondary"></span></label>
                            <input class="form-control" type="date"  name="expiryDate" value="{{$used_market_setting['expiryDate'] ?? ''}}" >
                        </div>
                    </div><hr>
                    <div class="row"> 
                      <div class="form-group p-4">
                    <input class="btn btn-primary" type="submit" value="{{__('messages.save')}}" >
                </div>
                </div>
    </div>
</form>
@endsection


    <script src="{{asset('public/assets/admin')}}/js/tags-input.min.js"></script>

    
<script>
    // $('#setting').on('submit', function (e) {
    //     e.preventDefault();
    //     var formData = new FormData(this);
    //     $.ajaxSetup({
    //         headers: {
    //             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    //         }
    //     });
    //     $.post({
    //         url: '{{route('admin.Used_Market.UpdateSettings')}}',
    //         data: formData,
    //         cache: false,
    //         contentType: false,
    //         processData: false,
    //         success: function (data) {
    //             if (data.errors) {
    //                 for (var i = 0; i < data.errors.length; i++) {
    //                     toastr.error(data.errors[i].message, {
    //                         CloseButton: true,
    //                         ProgressBar: true
    //                     });
    //                 }
    //             } else {
    //                 toastr.success('Used Market Settings Updated', {
    //                     CloseButton: true,
    //                     ProgressBar: true
    //                 });
    //                 setTimeout(function () {
    //                     location.href = '{{route('admin.Used_Market.UpdateSettings')}}';
    //                 }, 2000);
    //             }
    //         }
    //     });
    // });
</script>



@extends('layouts.admin.app')

@section('title',__('messages.Category Bulk Export'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{trans('messages.dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('admin.brands.add-new')}}">{{trans('messages.brand')}}</a>
                </li>
                <li class="breadcrumb-item text-capitalize">{{trans('messages.bulk_export')}} </li>
            </ol>
        </nav>


        <div class="card mt-2 rest-part">
            <div class="card-header">
                <h4>{{__('messages.export')}} {{__('messages.brand')}}</h4>
            </div>
            <div class="card-body">
                <form class="product-form" action="{{route('admin.brands.bulk-export')}}" method="POST"
                        enctype="multipart/form-data">
                    @csrf

                    <button class="btn btn-primary" type="submit">{{__('messages.submit')}}</button>
                </form>
            </div>
            <div class="card card-footer">
            </div>
        </div>
    </div>
@endsection

@push('script_2')
<script>
    $(document).on('ready', function (){
        $('.id_wise').hide();
        $('.date_wise').hide();
        $('#type').on('change', function()
        {
            $('.id_wise').hide();
            $('.date_wise').hide();
            $('.'+$(this).val()).show();
        })
    });
</script>
@endpush

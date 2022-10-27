@extends('layouts.admin.app')

@section('title',__('messages.Update Attribute'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i> {{__('messages.attribute')}} {{__('messages.update')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.attribute.update',[$attribute['id']])}}" method="post">
                    @csrf
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group lang_form">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}}</label>
                                <input type="text" name="name" class="form-control" placeholder="{{__('messages.new_attribute')}}" maxlength="191" value="{{ $attribute['name'] }}" required>
                            </div>
                        </div>
                    </div>  

                    @foreach ($sub_attr as $sub )
                    
                    <div class="row">
                      

                        <div class="col-3">{{$sub->Title}}  </div>
                        <div class="col-3">
                            
                        
                            <div class="form-check form-switch">
                                <input class="form-check-input"  onclick="ChangeState('{{$sub->Title}}',{{$attribute['id']}} ,{{$loop->index}})"

                                @if ($sub->state == 1)

                                    checked='checked'
                                    
                                @endif
                                
                                
                                type="checkbox" role="switch" id="flexSwitchCheckDefault">

                              </div>
                  
                        </div>

                      
                       
                                           
                                            
                            
                 
                    </div>
                    @endforeach
                    <button type="submit" class="btn btn-primary mt-5">{{__('messages.update')}}</button>
                </form>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection

@push('script_2')

@endpush



<script>




    function ChangeState(title,id,index){
        $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.attribute.update_sub_attribute')}}',
                data: {title,id,index},
                cache: false,
                processData: true,
                beforeSend: function () {
                    $('#loading').show();
                },

                complete: function () {
                    $('#loading').hide();
                },
            });
    }
</script>

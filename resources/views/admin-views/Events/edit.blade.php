@extends('layouts.admin.app')

@section('title','Edit Event')



@section('content')

<!-- Content -->
<div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header" style="border-bottom:0;padding-bottom:0;">
        <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title"><i class="tio-add-circle-outlined"></i> {{__('messages.edit')}} {{__('messages.Event')}}</h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="row gx-2 gx-lg-3">
        <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
            <form action="{{route('admin.events.update', $event->id)}}" method="post" enctype="multipart/form-data" class="js-validate">
                @csrf
                @method('PUT')

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                @if(session()->has('success'))
                    <div class="alert alert-success">{{ session()->get('success') }}</div>
                @elseif(session()->has('error'))
                    <div class="alert alert-danger">{{ session()->get('error') }}</div>
                @endif
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="title_en">{{__('messages.event_name_en')}} </label>
                            <input type="text" id="title_en" name="title_en" class="form-control" placeholder="{{__('messages.event_name_en')}}" value="{{$event->title}}" required>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="title_ar">{{__('messages.event_name_ar')}} </label>
                            <input type="text" name="title_ar" class="form-control" placeholder="{{__('messages.event_name_ar')}}" value="{{$event->translations[0]->value}}" required>
                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="description_en">{{__('messages.event_description_en')}} </label>
                            <textarea type="text" id="description_en" name="description_en" class="form-control"  required>{{$event->description}}</textarea>
                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="description_ar">{{__('messages.event_description_ar')}} </label>
                            <textarea type="text" id="description_ar" name="description_ar" class="form-control"  required>{{$event->translations[1]->value}}</textarea>
                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="date">{{__('messages.time')}}</label>
                            <input type="date" name="date" class="form-control" id="date" value="{{ $event->date }}" required>
                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="address">{{__('messages.address')}} </label>
                            <input type="text" id="address" name="address" class="form-control" placeholder="{{__('messages.address')}}" value="{{$event->address}}" required>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="start_date">{{__('messages.starts')}}</label>
                            <input type="time" value="{{$event->start_date}}"
                                   name="start_date" class="form-control" id="start_date"
                                   placeholder="Ex : 10:30 am" required>
                        </div>
                    </div>

                    <div class="col-md-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="end_date">{{__('messages.ends')}}</label>
                            <input type="time" value="{{$event->end_date}}"
                                   name="end_date" class="form-control" id="end_date" placeholder="5:45 pm"
                                   required>
                        </div>
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
            </form>
        </div>
    </div>
</div>
<!-- End Content -->

@endsection



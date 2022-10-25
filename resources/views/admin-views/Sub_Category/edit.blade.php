@extends('layouts.admin.app')

@section('title',__('messages.Update category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i>{{$Sub_Categories->position?__('messages.sub').' ':''}}{{__('messages.sub_category')}} {{__('messages.update')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.Sub_Categories.update',[$Sub_Categories['id']])}}" method="post" enctype="multipart/form-data">
                    @csrf
                    @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = 'en')
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
                            <?php
                                if(count($Sub_Categories['translations'])){
                                    $translate = [];
                                    foreach($Sub_Categories['translations'] as $t)
                                    {
                                        if($t->locale == $lang && $t->key=="name"){
                                            $translate[$lang]['name'] = $t->value;
                                        }
                                    }
                                }
                            ?>
                            <div class="form-group {{$lang != $default_lang ? 'd-none':''}} lang_form" id="{{$lang}}-form">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}} ({{strtoupper($lang)}})</label>
                                <input type="text" name="name[]" class="form-control" placeholder="{{__('messages.new_category')}}" maxlength="191" value="{{$lang==$default_lang?$Sub_Categories['name']:($translate[$lang]['name']??'')}}" {{$lang == $default_lang? 'required':''}} oninvalid="document.getElementById('en-link').click()">
                            </div>
                            <input type="hidden" name="lang[]" value="{{$lang}}">
                        @endforeach
                    @else
                        <div class="form-group">
                            <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}}</label>
                            <input type="text" name="name" class="form-control" placeholder="{{__('messages.new_category')}}" value="{{old('name')}}" required maxlength="191">
                        </div>
                        <input type="hidden" name="lang[]" value="{{$lang}}">
                    @endif
                    
                    <button type="submit" class="btn btn-primary">{{__('messages.update')}}</button>
                </form>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection

@push('script_2')
    <script>
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
                $(".from_part_2").removeClass('d-none');
            }
            else
            {
                $(".from_part_2").addClass('d-none');
            }
        });
    </script>
@endpush

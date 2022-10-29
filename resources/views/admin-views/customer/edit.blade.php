@extends('layouts.admin.app')

@section('title','Update customer')

@push('css_or_js')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .iti{
            width:100%;
        }
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i> {{__('messages.update')}} {{__('messages.customer')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.customer.update',[$customer['id']])}}" method="post"
                      enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.first')}} {{__('messages.name')}}</label>
                                <input type="text" value="{{$customer['f_name']}}" name="f_name"
                                       class="form-control" placeholder="{{__('messages.first_name')}}"
                                       required>
                            </div>
                        </div>
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.last')}} {{__('messages.name')}}</label>
                                <input type="text" value="{{$customer['l_name']}}" name="l_name"
                                       class="form-control" placeholder="{{__('messages.last_name')}}"
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6  col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.email')}}</label>
                                <input type="email" value="{{$customer['email']}}" name="email" class="form-control"
                                       placeholder="Ex : ex@example.com"
                                       required>
                            </div>
                        </div>
                        <div class="col-sm-6  col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.user name')}}</label>
                                <input type="text" value="{{$customer['user_name']}}" name="user_name" class="form-control"
                                       placeholder=""
                                       required>
                            </div>
                        </div>
                    </div>


                    <small class="nav-subtitle text-secondary border-bottom">{{__('messages.login')}} {{__('messages.info')}}</small>
                    <br>
                    <div class="row">
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.phone')}}</label>
                                <input type="text" id="phone" name="phone" value="{{$customer['phone']}}" class="form-control"
                                        placeholder="Ex : 017********"
                                        required>
                            </div>
                        </div>
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.password')}}</label>
                                <input type="text" name="password" class="form-control" placeholder="Ex : password">
                            </div>
                        </div>
                    </div>

                    <small class="nav-subtitle text-secondary border-bottom mb-5">Address info</small>

                    <div class="row">
                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.address')}}</label>
                                <input type="text" value="{{$customer['address']}}" name="address"
                                       class="form-control" placeholder="{{__('messages.address')}}"
                                       required>
                            </div>
                        </div>
                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.city')}}</label>
                                <input type="text" value="{{$customer['city']}}" name="city"
                                       class="form-control" placeholder="{{__('messages.city')}}"
                                       required>
                            </div>
                        </div>
                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.country')}}</label>
                                <input type="text" value="{{$customer['city']}}" name="country"
                                       class="form-control" placeholder="{{__('messages.country')}}"
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>{{__('messages.customer')}} {{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 1:1 )</small>
                        <div class="custom-file col-sm-4">
                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                        </div>
                     
                        <center class="pt-4">
                            <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                 src="{{asset('storage/app/public/product/' . $customer['image'])}}" alt="customer image"/>
                        </center>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">{{__('messages.update')}}</button>
                </form>
            </div>
        </div>
    </div>

@endsection

@push('script_2')
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput.min.js" integrity="sha512-QMUqEPmhXq1f3DnAVdXvu40C8nbTgxvBGvNruP6RFacy3zWKbNTmx7rdQVVM2gkd2auCWhlPYtcW2tHwzso4SA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js" integrity="sha512-hkmipUFWbNGcKnR0nayU95TV/6YhJ7J9YUAkx4WLoIgrVr7w1NYz28YkdNFMtPyPeX1FrQzbfs3gl+y94uZpSw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.min.js" integrity="sha512-lv6g7RcY/5b9GMtFgw1qpTrznYu1U4Fm2z5PfDTG1puaaA+6F+aunX+GlMotukUFkxhDrvli/AgjAu128n2sXw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <link rel="shortcut icon" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/img/flags.png" type="image/x-icon">
    <link rel="shortcut icon" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/img/flags@2x.png" type="image/x-icon">
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

        @php($country=\App\Models\BusinessSetting::where('key','country')->first())
        var phone = $("#phone").intlTelInput({
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/8.4.6/js/utils.js",
            nationalMode: true,
            autoHideDialCode: true,
            autoPlaceholder: "ON",
            dropdownContainer: document.body,
            formatOnDisplay: true,
            hiddenInput: "phone",
            initialCountry: "{{$country?$country->value:auto}}",
            placeholderNumberType: "MOBILE",
            separateDialCode: true
        });
    </script>

    <script src="{{asset('public/assets/admin/js/spartan-multi-image-picker.js')}}"></script>
    <script type="text/javascript">
        $(function () {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: '120px',
                groupClassName: 'col-2',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/admin/img/400x400/img2.jpg')}}',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('Please only input png or jpg type file', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('File size too big', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
@endpush

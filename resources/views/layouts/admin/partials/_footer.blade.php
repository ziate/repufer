<div class="footer">
    <div class="row justify-content-between align-items-center">
        <div class="col">
            <p class="font-size-sm mb-0">
                &copy; {{\App\Models\BusinessSetting::where(['key'=>'business_name'])->first()->value}}. <span
                    class="d-none d-sm-inline-block">{{\App\Models\BusinessSetting::where(['key'=>'footer_text'])->first()->value}}</span>
            </p>
        </div>
        <div class="col-auto">
            <div class="d-flex justify-content-end">
                <!-- List Dot -->
                <ul class="list-inline list-separator">
                    <li class="list-inline-item">
                        <a class="list-separator-link" href="{{route('admin.business-settings.business-setup')}}">{{__('messages.business')}} {{__('messages.setup')}}</a>
                    </li>

                    <li class="list-inline-item">
                        <a class="list-separator-link" href="{{route('admin.settings')}}">{{__('messages.profile')}}</a>
                    </li>

                    <li class="list-inline-item">
                        <!-- Keyboard Shortcuts Toggle -->
                        <div class="hs-unfold">
                            <a class="js-hs-unfold-invoker btn btn-icon btn-ghost-secondary rounded-circle"
                               href="{{route('admin.dashboard')}}">
                                <i class="tio-home-outlined"></i>
                            </a>
                        </div>
                        <!-- End Keyboard Shortcuts Toggle -->
                    </li>
                </ul>
                <!-- End List Dot -->
            </div>
        </div>
    </div>
</div>


<style>
    ::-webkit-scrollbar {
    width: 13px!important;
}
::-webkit-scrollbar-thumb {
    background: #ff2e63;
    /* border-radius: 5px; */
}
::-webkit-scrollbar-thumb {
    background-color: #ff2e63;
    border-radius: 10px;
    border: 3px solid #ff2e6300;
}
::-webkit-scrollbar-track {
    box-shadow: inset 0 0 1px transparent;
}

.navbar .nav-link:hover{
    color: #08D9D6
}

.navbar .active > .nav-link, .navbar .nav-link.active, .navbar .nav-link.show, .navbar .show > .nav-link {
    color: #08D9D6;
}

.table .thead-light th{
    color: #ffffff;
    background-color: #54436b;
}

.hs-unfold a.btn{
    border: 1px solid #54436b!important;
    color: #54436b!important;
}


</style>
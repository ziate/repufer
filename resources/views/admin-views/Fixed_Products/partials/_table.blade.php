@foreach($Fixed_Productss as $key=>$Fixed_Products)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <a class="media align-items-center" href="{{route('admin.Fixed_Products.view',[$Fixed_Products['id']])}}">
                <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/product')}}/{{$Fixed_Products['image']}}"
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$Fixed_Products->name}} image">
                <div class="media-body">
                    <h5 class="text-hover-primary mb-0">{{Str::limit($Fixed_Products['name'],20,'...')}}</h5>
                </div>
            </a>
        </td>
        <td>
        {{Str::limit($Fixed_Products->category,20,'...')}}
        </td>
        <td>
        {{Str::limit($Fixed_Products->restaurant->name,20,'...')}}
        </td>
        <td>{{\App\CentralLogics\Helpers::format_currency($Fixed_Products['price'])}}</td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$Fixed_Products->id}}">
                <input type="checkbox" onclick="location.href='{{route('admin.Fixed_Products.status',[$Fixed_Products['id'],$Fixed_Products->status?0:1])}}'"class="toggle-switch-input" id="stocksCheckbox{{$Fixed_Products->id}}" {{$Fixed_Products->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.Fixed_Products.edit',[$Fixed_Products['id']])}}" title="{{__('messages.edit')}} {{__('messages.Fixed_Products')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:"
                onclick="form_alert('Fixed_Products-{{$Fixed_Products['id']}}','Want to delete this item ?')" title="{{__('messages.delete')}} {{__('messages.Fixed_Products')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.Fixed_Products.delete',[$Fixed_Products['id']])}}"
                    method="post" id="Fixed_Products-{{$Fixed_Products['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach

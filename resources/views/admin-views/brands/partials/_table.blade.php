@foreach($brands as $key=>$brand)
    <tr>
        <td>{{$brand->id}}</td>
        <td>
            <span class="media align-items-center">
                <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/brands')}}/{{$brand['img']}}" 
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$brand->name}} image">
                
            </span>
        
        </td>
        <td>
            <h5 class="text-hover-primary mb-0">{{Str::limit($brand['name'], 25, '...')}}</h5>
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{route('admin.brands.edit',[$brand['id']])}}"title="{{__('messages.edit')}} {{__('messages.brand')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('brand-{{$brand['id']}}','Want to delete this brand ?')" title="{{__('messages.delete')}} {{__('messages.brand')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.brands.delete',[$brand['id']])}}"
                        method="post" id="brand-{{$brand['id']}}">
                    @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach
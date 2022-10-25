@foreach($events as $key=>$event)
    <tr>
        <td>{{$key+1}}</td>

        <td>
            <h5 class="text-hover-primary mb-0">{{Str::limit($event['title'], 25, '...')}}</h5>
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{route('admin.events.edit',[$event['id']])}}" title="{{__('messages.edit')}} {{__('messages.event')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('event-{{$event['id']}}','Want to delete this event ?')" title="{{__('messages.delete')}} {{__('messages.event')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.events.delete',[$event['id']])}}"
                  method="post" id="event-{{$event['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach

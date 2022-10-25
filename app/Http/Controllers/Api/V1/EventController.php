<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\EventResource;
use App\Models\Event;
use App\Models\EventAttendance;
use App\Traits\ResponseTrait;
use Illuminate\Http\Request;


class EventController extends Controller
{
    use ResponseTrait;
    public function index(): \Illuminate\Http\JsonResponse
    {
        $events = Event::get();
        return $this->returnData('events', EventResource::collection($events));
    }

    public function attend(int $id, Request $request) {
        
        $attendance = EventAttendance::where('event_id', $id)->where('user_id', $request->user()->id)->first();
        
        if($attendance == null) {
            EventAttendance::create([
                'event_id'  => $id,
                'user_id'   => $request->user()->id,
                'attend'    => $request->attend
            ]);
        } else {
            $attendance->update(['attend' => $request->attend]);
        }
        return $this->returnSuccess('تم ارسال الرد بنجاح');
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\EventAttendance;
use App\Models\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
{
    public function index(){
        $events = Event::paginate(12);
        return view('admin-views.events.index', compact('events'));
    }

    public function create(){
        return view('admin-views.events.create');
    }
    public function store(Request $request) {
        $request->validate([
            'title_en'          => 'required',
            'title_ar'          => 'required',
            'description_en'    => 'required',
            'description_ar'    => 'required',
            'date'              => 'required',
            'address'           => 'required',
            'start_date'        => 'required',
            'end_date'          => 'required',
        ]);
        try {
            DB::beginTransaction();
            $event = Event::create([
                'title'             => $request->title_en,
                'description'       => $request->description_en,
                'date'              => $request->date,
                'address'           => $request->address,
                'start_date'        => $request->start_date,
                'end_date'          => $request->end_date,
            ]);
            Translation::create([
                'translationable_type'  => 'App\Models\Event',
                'translationable_id'    => $event->id,
                'locale'                => 'ar',
                'key'                   => 'title',
                'value'                 => $request->title_ar
            ]);

            Translation::create([
                'translationable_type'  => 'App\Models\Event',
                'translationable_id'    => $event->id,
                'locale'                => 'ar',
                'key'                   => 'description',
                'value'                 => $request->description_ar
            ]);
            DB::commit();
            Toastr::success(trans('messages.event_added_successfully'));
            return redirect()->route('admin.events.index');
        } catch (\Exception $exception) {
            DB::rollBack();
            return redirect()->back()->with('error', __('messages.500_warning_message'));
        }
    }

    public function edit(int $id) {
        $event = Event::findOrFail($id);
        return view('admin-views.events.edit', compact('event'));
    }

    public function update(int $id, Request $request) {
        $event = Event::findOrFail($id);
        $request->validate([
            'title_en'          => 'required',
            'title_ar'          => 'required',
            'description_en'    => 'required',
            'description_ar'    => 'required',
            'date'              => 'required',
            'address'           => 'required',
            'start_date'        => 'required',
            'end_date'          => 'required',
        ]);
        try {
            DB::beginTransaction();
            $event->update([
                'title'             => $request->title_en,
                'description'       => $request->description_en,
                'date'              => $request->date,
                'address'           => $request->address,
                'start_date'        => $request->start_date,
                'end_date'          => $request->end_date,
            ]);
            Translation::where('translationable_id' , $event->id)->where('key', 'title')->update(['value' => $request->title_ar]);
            Translation::where('translationable_id' , $event->id)->where('key', 'description')->update(['value' => $request->description_ar]);
            Toastr::success(trans('messages.event_updated_successfully'));
            return redirect()->route('admin.events.index');
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            return redirect()->back()->with('error', __('messages.500_warning_message'));
        }
    }

    public function delete(int $id)
    {
        $event = Event::findOrFail($id);
        $event->delete();
        Toastr::success(trans('messages.event_deleted_successfully'));
        return back();
    }


    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $events=Event::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('title', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.brands.partials._table',compact('events'))->render(),
            'count'=>$events->count()
        ]);
    }

    public function attendance(int $id) {
        $attendances = EventAttendance::with('event', 'user')->where('event_id', $id)->paginate(12);
        return view('admin-views.events.attendance', compact('attendances'));
    }

}

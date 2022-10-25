<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function all_Events(){

        return view('admin-views.Events.all_Events');
    }

    public function add_Events(){

        return view('admin-views.Events.add_Events');
    }

    public function settings_Events(){

        return view('admin-views.Events.settings_Events');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }

    public function attendance(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(EventAttendance::class, 'event_id');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class Brands extends Model
{
    use HasFactory;

    protected $casts = [
        'id' => 'integer'
    ];

    public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }


    protected static function booted()
    {
        static::addGlobalScope('translate', function (Builder $builder) {
            $builder->with(['translations' => function ($query) {
                return $query->where('locale', app()->getLocale());
            }]);
        });
    }
}

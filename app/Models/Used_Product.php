<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Used_Product extends Model
{
    use HasFactory;
    protected $table='used_products';
     protected $fillable = [
        'name','description', 'price', 'phone','image','address'
    ];
      public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }
}

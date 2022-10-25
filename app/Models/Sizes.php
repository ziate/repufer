<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sizes extends Model
{
    use HasFactory;
    public $table = 'sizes';
    public $fillable =['size' , 'created_at' , 'updated_at'];
}
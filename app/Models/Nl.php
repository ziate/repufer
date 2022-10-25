<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Nl extends Model
{
    use HasFactory;
    public $table = 'nls';
    public $fillable =['nl' ,  'created_at' , 'updated_at'];
}
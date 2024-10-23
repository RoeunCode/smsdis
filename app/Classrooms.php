<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classrooms extends Model
{
    protected $table = 'classroom';
    protected $fillable = ['name','deleted','campus_id'];
}

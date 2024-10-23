<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    protected $table = 'attendance';
    protected $fillable = ['student_id','class_id','status','date','created_by','updated_by','deleted'];
}

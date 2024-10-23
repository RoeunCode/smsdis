<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Studentclass extends Model
{
    protected $table = 'student_class';
    protected $fillable = ['student_id','class_id','id'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teacherclass extends Model
{
    protected $table = 'teacher_class';
    protected $fillable = ['teacher_id','class_id'];
}

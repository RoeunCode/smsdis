<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Scorecc extends Model
{
    protected $table = 'score_cc';
    protected $fillable = ['student_id','month_id','avg_m','class_id','eng','b','c','e','g','h','k','m','p','ph','deleted'];
}

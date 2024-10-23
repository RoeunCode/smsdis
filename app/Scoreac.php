<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Scoreac extends Model
{
    protected $table = 'score_ac';
    protected $fillable = ['student_id','class_id','quarter','s','ss','pc','eng','la','d_a','m','me','r_c','pe','deleted'];
}

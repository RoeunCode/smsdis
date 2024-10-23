<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ScoreFLA extends Model
{
    protected $table = 'score_fla';
    protected $fillable = ['student_id','class_id','month_id','r','s','l','w','g','v','h','cp','deleted'];
}

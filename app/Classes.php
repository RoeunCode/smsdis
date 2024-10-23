<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classes extends Model
{
    protected $table = 'class';
    protected $fillable = ['academic_year_id','classroom_id','curriculum_id','campus_id','grade_id','study_time','deleted'];
}

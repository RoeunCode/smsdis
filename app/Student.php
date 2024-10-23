<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $table = 'student';
    protected $fillable = [
        'student_id','kh_name','en_name','sex','dob','nat',
        'pob_v','pob_c','pob_d','pob_p','cur_v','cur_c','cur_d',
        'cur_p','old_grade','old_school','old_year','old_id',
        'old_en_school','old_en_grade','deleted','photo','campus_id','id'
    ];
}

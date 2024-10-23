<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Parents extends Model
{
    protected $table = 'parent';
    protected $fillable = [
        'student_id','kh_name','en_name','dob','nat','alive','job','phone','email','facebook',
        'pob_v','pob_c','pob_d','pob_p','relation'
    ];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $table = 'teacher';
    protected $fillable = ['kh_name','en_name','sex','dob','nat','pro','phone','email','facebook','deleted','campus_id'];
}

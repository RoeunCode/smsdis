<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Violation extends Model
{
    protected $table = 'violations';
    protected $fillable = ['student_id','description','date'];
}

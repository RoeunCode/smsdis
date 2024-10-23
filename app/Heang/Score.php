<?php

namespace App\Heang;

use Illuminate\Database\Eloquent\Model;

class Score extends Model
{
    protected $table = "score_online";
    protected $fillable = [
        "student_id",
    	"class_id",
    	"month_id",
    	"exam",
    	"homework",
    	"attendance",
    	"quiz",
    	"subject_id"
    	
    ];
    protected $primaryKey = "id"; 
}

<?php

namespace App\Heang;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $table = "student";
    protected $fillable = [
        "student_id",
    	"kh_name",
    	"en_name",
    	"sex",
    	"dob",
    	"phone_student",
    	"national",
    	"village_pob",
    	"commue_pob",
    	"district_pob",
    	"province_pob",
    	"village_current",
    	"commue_current",
    	"district_current",
    	"province_current",
    	"old_grade",
    	"old_school",
    	"old_en_grade",
    	"farther_name",
    	"mother_name",
    	"farther_job",
    	"mother_job",
    	"national_far",
    	"national_mother",
    	"phone_farther",
    	"address_farther",
    	"address_mother",
        "campus_id"
    ];
    protected $primaryKey = "id";
}

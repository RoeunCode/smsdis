<?php

namespace App\Heang;

use Illuminate\Database\Eloquent\Model;

class ApiFeedback extends Model
{
    protected $table = "api_feedback";
    protected $fillable = [
        "name",
    	"number_phone",
    	"description"
    ];
    protected $primaryKey = "id";
}

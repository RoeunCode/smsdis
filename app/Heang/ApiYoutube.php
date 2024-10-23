<?php

namespace App\Heang;

use Illuminate\Database\Eloquent\Model;

class ApiYoutube extends Model
{
    protected $table = "api_youtube";
    protected $fillable = [
        "type_class",
    	"subject_id",
    	"title",
    	"url"
    	
    ];
    protected $primaryKey = "id"; 
}

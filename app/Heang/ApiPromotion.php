<?php

namespace App\Heang;

use Illuminate\Database\Eloquent\Model;

class ApiPromotion extends Model
{
    protected $table = "api_promotion";
    protected $fillable = [
        "id_cat",
    	"title",
    	"description",
    	"image",
    	"post_date",
    	"status"
    	
    ];
    protected $primaryKey = "id";
}

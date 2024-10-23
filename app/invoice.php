<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class invoice extends Model
{
    //
    protected $table='invoice';
    protected $fillable=[
      "id","invoice_number","invoice_text","status","created_at","updated_aat",'cam_id'
    ];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class payment extends Model
{
    //
    protected $table='payment';
    protected $fillable=[
       "id","student_id","payment_date","due_date","payment_method","invoice_des","status","deposit","created_at","updated_at",'year_academic'
    ];
}

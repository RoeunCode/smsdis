<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class payment_detail extends Model
{
    protected $table='payment_detail';
    protected $fillable=[
      'id','id_invoice','id_payment','id_invoice_type','id_pro_service','id_payterm',
        'campus_id','user_id_pay','description','qty','ori_price','discount'
        ,'total_amount','lose_paid','Volidty_of_payment','expired_date','school_year','remark',
        'status','created_at','updated_at'
    ];
}

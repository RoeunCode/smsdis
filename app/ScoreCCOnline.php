<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ScoreCCOnline extends Model
{
    protected $fillable=[
        'id','student_id','grade','class_id','month_id','math','khmer','physical','chemistry','avg_m',
        'biology','history','created_at','updated_at','polroth','teasekdey','writting','sport','polakam','phum','kehak','phandey','english'
    ];
    protected $table='score_cc_online';
}

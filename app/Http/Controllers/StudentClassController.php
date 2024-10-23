<?php

namespace App\Http\Controllers;

use App\Studentclass;
use Illuminate\Http\Request;

class StudentClassController extends Controller
{
    public function addst(Request $r)
    {
//        foreach ($r->data as $d){
//            studentclass::create(['student_id'=>$d['student_id'],'class_id'=>$d['class_id']]);
//        }
        for($i=0;$i<count($r->data);$i++){

          $insert=[
              'student_id'=>$r->data[$i],
              'class_id'=>$r->txtclass
          ];
          Studentclass::insert($insert);

        }
        return 1;
    }

    public function delst($id)
    {
        Studentclass::where('id',$id)->delete();
        return redirect()->back();
    }
}

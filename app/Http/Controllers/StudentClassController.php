<?php

namespace App\Http\Controllers;

use App\Studentclass;
use Illuminate\Http\Request;
use DB;
class StudentClassController extends Controller
{
    public function addst(Request $r)
    {
//        foreach ($r->data as $d){
//            studentclass::create(['student_id'=>$d['student_id'],'class_id'=>$d['class_id']]);
//        }
        $select = DB::table('student_class')->where('class_id',$r->txtclass)->get();
        $count_student = $select->count();
        if($count_student== 0 )
        {
            $sort =1;

        }else{
            $sort =$count_student+1;

        }


        for($i=0;$i<count($r->data);$i++){

          $insert=[
              'student_id'=>$r->data[$i],
              'class_id'=>$r->txtclass,
              'sort'=>$sort++
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

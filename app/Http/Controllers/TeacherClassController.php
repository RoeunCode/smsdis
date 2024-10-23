<?php

namespace App\Http\Controllers;

use App\Teacherclass;
use Illuminate\Http\Request;

class TeacherClassController extends Controller
{
    public function addtc(Request $r)
    {
        foreach ($r->data as $d){
            Teacherclass::create(['teacher_id'=>$d['teacher_id'],'class_id'=>$d['class_id']]);
        }
        return 1;
    }

    public function deltc($id)
    {
        Teacherclass::destroy($id);
        return redirect()->back();
    }
}

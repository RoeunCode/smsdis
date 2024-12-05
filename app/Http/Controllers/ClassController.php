<?php

namespace App\Http\Controllers;

use App\Campus;
use App\Classes;
use App\Grade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grade = Grade::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->where('cur_id',Auth::user()->cur_id)->get();
        $cmp = Campus::where('deleted',0)->get();
        $cur = DB::table('curriculum')->where(['deleted'=>0])->get();
        $class = DB::table('classroom')->where('deleted','=',0)->where('campus_id',Auth::user()->camp_id)->get();
        $year = DB::table('academic_year')->where('deleted','=',0)->get();
        if(Auth::user()->role == 1){
            $data = DB::table('v_class')->where(['deleted'=>0,'cur_id'=>Auth::user()->cur_id,'campus_id'=>Auth::user()->camp_id])->orderby('id','DESC')->get();
        }else{
            $data = DB::table('v_class')->where(['deleted'=>0,'cur_id'=>Auth::user()->cur_id,'campus_id'=>Auth::user()->camp_id])->orderby('id','DESC')->get();
        }
        return view('class.class')->with(['data'=>$data,'gr'=>$grade,'cmp'=>$cmp,'cur'=>$cur,'cl'=>$class,'yr'=>$year]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Classes::create($request->all());
        return 1;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = DB::table('v_class')->find($id);
        $odata = Classes::findOrFail($id);
        $stc = DB::table('v_student_class')->where(['class_id'=>$id,'deleted'=>0])->orderBy('kh_name')->get();
        $ttc = DB::table('v_teacher_class')->where(['class_id'=>$id,'deleted'=>0])->get();
        $class = DB::table('classroom')->where('deleted','=',0)->where('campus_id',Auth::user()->camp_id)->get();
        $grade = Grade::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->get();
        $cmp = Campus::where('deleted',0)->get();
        $cur = DB::table('curriculum')->where(['deleted'=>0])->get();
        $year = DB::table('academic_year')->where('deleted','=',0)->get();
        $ast = DB::table('student')->whereRaw('id NOT IN (SELECT student_id FROM student_class WHERE class_id = '.$id.') AND deleted = 0 AND campus_id='.Auth::user()->camp_id)->get();
        $atc = DB::table('teacher')->whereRaw('id NOT IN (SELECT teacher_id FROM teacher_class WHERE class_id = '.$id.') AND deleted = 0 AND campus_id='.Auth::user()->camp_id )->get();
        return view('class.class_detail')->with(['d'=>$data,'od'=>$odata,'cl'=>$class,'gr'=>$grade,'yr'=>$year,'stc'=>$stc,'ttc'=>$ttc,'ast'=>$ast,'atc'=>$atc,'cmp'=>$cmp,'cur'=>$cur]);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function ajup(Request $r)
    {
        Classes::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }

    public function delete($id)
    {
        classes::updateOrCreate(['id'=>$id],['deleted'=>1]);
        return redirect()->route('class.index');
    }
    public function cdl()
    {
        $data = DB::table('v_class')->where('deleted','=',1)->get();
        return view('class.class_deleted')->with('data',$data);
    }
    public function restore($id)
    {
        classes::updateOrCreate(['id'=>$id],['deleted'=>0]);
        return redirect()->back();
    }
}

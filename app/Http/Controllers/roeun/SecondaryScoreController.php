<?php

namespace App\Http\Controllers\roeun;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class SecondaryScoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $academic = DB::table('academic_year')->orderby('name','DESC')->get();
        $month = DB::table('month')->get();
        return view('scoreiconic.secondary_score')->with('academic',$academic)
        ->with('month',$month);
    }

    public function getclasssecondary(Request $request)
    {

        $class = DB::table('class_view')
                ->where('ac_id',$request->id_ac)
                ->where('cur_id',1)
                ->where('deleted',0)
                ->whereBetween('grade',[6,9])
                // ->whereRaw('CAST(`grade` AS SIGNED) BETWEEN ? AND ?', [1, 6])
                ->orderby('academic_year','DESC')
                ->get();

        return response()->json(
            [
                "class"=>$class,

            ]
        ) ;

    }

    public function showstudentsecondary(Request $request){


        $check_score = DB::table('score_secondary_cc')
        ->where('class_id',$request->class_id)
        ->where('month_id',$request->month_id)
        ->count();


        if($check_score == 0 )
        {



            $student_class = DB::table('v_student_class')
            ->where('class_id',$request->class_id)
            ->get();
            return response()->json(
            [
                "student_class"=>$student_class,
                "status"=>1
            ]
            ) ;
            }else{

            $seachStudent = DB::table('score_secondary_cc')
                            ->join('student','score_secondary_cc.student_id' ,'=','student.id')
                            ->where('class_id',$request->class_id)
                            ->where('month_id',$request->month_id)
            ->select(DB::raw('score_secondary_cc.*,student.kh_name'))
            ->get();

            $seachStudent2 = DB::table('student_class')
            ->join('student','student_class.student_id' ,'=','student.id')
            ->join('class','student_class.class_id','=','class.id')
            ->where('class.id',$request->class_id)
            // ->where('score_secondary_cc.month_id',$request->month_id)
            ->whereRaw('student_class.student_id NOT IN (SELECT student_id from score_secondary_cc where student_class.class_id='.$request->class_id.' and
            score_secondary_cc.month_id = '.$request->month_id.' )')
            ->select(DB::raw('null as art, null as chemistry,'.$request->class_id.' as class_id, null as essay,null as
            grammar , null as healthy,null as history, null as homework, null as id, null as listent, null as math,
            '.$request->month_id.' as month_id, null as moralty , null as pe, null as physical,null as speaking,student.id as student_id,null as word ,null as writing,
            student.kh_name'))
            ->get()->toArray();

            if(count($seachStudent2) > 0 )
            {
            $item= array();
            foreach($seachStudent as $obj)
            {
                $array1[] = (array) $obj;
            }
            // dd($array1);
            $new_data = array_merge($array1,$seachStudent2);
            //   dd($new_data);
            return response()->json(
                [
                    "student_class"=>$new_data,
                    "status"=>2
                ]
            ) ;
            }else{



            return response()->json(
                [
                    "student_class"=>$seachStudent,
                    "status"=>3
                ]
            ) ;


            }




            }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
}

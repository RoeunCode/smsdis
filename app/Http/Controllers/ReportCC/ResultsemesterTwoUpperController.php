<?php

namespace App\Http\Controllers\ReportCC;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class ResultsemesterTwoUpperController extends Controller
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
        return view('reportcc.semestertwoupper')->with('academic',$academic)
        ->with('month',$month);
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
    public function result_report_uppersemestertwo(Request $request)
    {

        $data_month_4 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=4"));
        $data_month_5 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=5"));
        $data_month_6 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=6"));
        $data_month_7 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=7"));

        $store_score_4=[];
        $store_score_5=[];
        $store_score_6=[];
        $store_score_7=[];

        foreach(json_decode(json_encode($data_month_4),true) as $student)
        {
            $khmer = $student['khmer'];
            $morality = $student['morality'];
            $history = $student['history'];
            $geography = $student['geography'];
            $math = $student['math'];
            $physical = $student['physical'];
            $chemistry = $student['chemistry'];
            $biology = $student['biology'];
            $earth_science = $student['earth_science'];
            $english = $student['english'];
            $pe = $student['pe'];
            $computer = $student['computer'];
            if($pe == "0.0.1")
            {
                $pe = 0;
            }else{
                $pe = $student['pe'];
            }
            if($computer == "0.0.1")
            {
                $computer = 0;
            }else{
                $computer = $student['computer'];
            }

            $result_4= ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];

            array_push($store_score_4,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_4,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        };

        foreach(json_decode(json_encode($data_month_5),true) as $student)
        {
            $khmer = $student['khmer'];
            $morality = $student['morality'];
            $history = $student['history'];
            $geography = $student['geography'];
            $math = $student['math'];
            $physical = $student['physical'];
            $chemistry = $student['chemistry'];
            $biology = $student['biology'];
            $earth_science = $student['earth_science'];
            $english = $student['english'];
            $pe = $student['pe'];
            $computer = $student['computer'];
            if($pe == "0.0.1")
            {
                $pe = 0;
            }else{
                $pe = $student['pe'];
            }
            if($computer == "0.0.1")
            {
                $computer = 0;
            }else{
                $computer = $student['computer'];
            }

            $result_5 = ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_5,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_5,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        }

        foreach(json_decode(json_encode($data_month_6),true) as $student)
        {
            $khmer = $student['khmer'];
            $morality = $student['morality'];
            $history = $student['history'];
            $geography = $student['geography'];
            $math = $student['math'];
            $physical = $student['physical'];
            $chemistry = $student['chemistry'];
            $biology = $student['biology'];
            $earth_science = $student['earth_science'];
            $english = $student['english'];
            $pe = $student['pe'];
            $computer = $student['computer'];
            if($pe == "0.0.1")
            {
                $pe = 0;
            }else{
                $pe = $student['pe'];
            }
            if($computer == "0.0.1")
            {
                $computer = 0;
            }else{
                $computer = $student['computer'];
            }

            $result_6 = ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_6,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_6,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        }
        foreach(json_decode(json_encode($data_month_7),true) as $student)
        {
            $khmer = $student['khmer'];
            $morality = $student['morality'];
            $history = $student['history'];
            $geography = $student['geography'];
            $math = $student['math'];
            $physical = $student['physical'];
            $chemistry = $student['chemistry'];
            $biology = $student['biology'];
            $earth_science = $student['earth_science'];
            $english = $student['english'];
            $pe = $student['pe'];
            $computer = $student['computer'];
            if($pe == "0.0.1")
            {
                $pe = 0;
            }else{
                $pe = $student['pe'];
            }
            if($computer == "0.0.1")
            {
                $computer = 0;
            }else{
                $computer = $student['computer'];
            }

            $result_7= ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_7,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>0,"sex"=>$student['sex'],"avg_score_semsterone"=>$result_7]);


        }
        $merge_arr  = array_merge($store_score_4,$store_score_5,$store_score_6,$store_score_7);
        $cv = json_decode(json_encode($merge_arr),true);
        $result = [];
        foreach($cv as $student){
            $avg = $student['avg_month'];
            $avg_score_semester = $student['avg_score_semsterone'];

            $id= $student['id'];
            if(isset($result[$id]))
            {
                $result[$id]['avg_month']+= $avg ;
                $result[$id]['avg_score_semsterone'] = $avg_score_semester ;
            }else{
                $total_avg =$student['avg_month'];
                $result[$id]=[
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "avg_month"=>$total_avg ,
                     "avg_score_semsterone"=>$student['avg_score_semsterone']
                ];
            }


        }
       $result = array_values($result);

        if($data_month_4 && $data_month_5 && $data_month_6 && $data_month_7)
        {

            return response()->json([
                "status"=>0,
                "data"=>$result,
                "message"=>"Succesfully"
            ]);
        } else{

            return response()->json([
                "status"=>1,
                "message"=>"UnSuccesfully"
            ]);
        }
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

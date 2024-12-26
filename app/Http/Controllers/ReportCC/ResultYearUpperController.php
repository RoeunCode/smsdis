<?php

namespace App\Http\Controllers\ReportCC;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class ResultYearUpperController extends Controller
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
        return view('reportcc.report_year_upper')->with('academic',$academic)
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
    public function resultyearupper(Request $request){
        if($request->grade == 12)
        {

            $data_month_12 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=11"));
            $data_month_1 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=12"));
            $data_month_2 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=1"));
            $data_month_3 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=2"));

            $data_month_4 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=3"));
            $data_month_5 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=4"));
            $data_month_6 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=5"));
            $data_month_7 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=6"));


        }else{


            $data_month_12 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=11"));
            $data_month_1 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=12"));
            $data_month_2 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=1"));
            $data_month_3 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=2"));

            $data_month_4 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=5"));
            $data_month_5 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=6"));
            $data_month_6 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=7"));
            $data_month_7 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=8"));


        }


        // old

        // $data_month_12 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=12"));
        // $data_month_1 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=1"));
        // $data_month_2 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=2"));
        // $data_month_3 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=3"));

        // $data_month_4 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=4"));
        // $data_month_5 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=5"));
        // $data_month_6 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=6"));
        // $data_month_7 = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=7"));



        $store_score_12=[];
        $store_score_1=[];
        $store_score_2=[];
        $store_score_3=[];

        $store_score_4=[];
        $store_score_5=[];
        $store_score_6=[];
        $store_score_7=[];

        foreach(json_decode(json_encode($data_month_12),true) as $student)
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

            $result_12 = ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];

            array_push($store_score_12,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_12,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        };

        foreach(json_decode(json_encode($data_month_1),true) as $student)
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

            $result_1 = ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_1,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_1,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        }

        foreach(json_decode(json_encode($data_month_2),true) as $student)
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

            $result_2 = ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_2,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>$result_2,"sex"=>$student['sex'],"avg_score_semsterone"=>0]);


        }
        foreach(json_decode(json_encode($data_month_3),true) as $student)
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

            $result_3= ($khmer+$morality+$history+$geography+$math+$physical+$chemistry+$biology+$earth_science+$english+$pe+$computer)/$student['avg_m'];
            array_push($store_score_3,[ "id"=>$student['id'], "kh_name" =>$student['kh_name'],
            "avg_month" =>0,"avg_score_semsterone"=>$result_3]);


        }
        $merge_arr  = array_merge($store_score_12,$store_score_1,$store_score_2,$store_score_3);
        $cv = json_decode(json_encode($merge_arr),true);
        $result_semester_1 = [];
        foreach($cv as $student){
            $avg = $student['avg_month'];
            $avg_score_semester = $student['avg_score_semsterone'];

            $id= $student['id'];
            if(isset($result_semester_1[$id]))
            {
                $result_semester_1[$id]['avg_month']+= $avg;
                $result_semester_1[$id]['avg_score_semsterone'] = $avg_score_semester ;
            }else{
                $total_avg =$student['avg_month'];
                $result_semester_1[$id]=[
                     "id"=>$id,
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "avg_month"=>$total_avg  ,
                     "avg_score_semsterone"=>$student['avg_score_semsterone'],

                ];
            }


        }
        $result_semester_1 = array_values($result_semester_1);
        $result_semester_1 = json_decode(json_encode($result_semester_1),true);
        $data_semester_1 =[];
        foreach($result_semester_1 as $student){
            array_push(
                $data_semester_1,["id"=>$student["id"], "sex"=>$student['sex'],"kh_name"=>$student['kh_name'],"total_semester_one"=>($student['avg_month']/3)+$student['avg_score_semsterone'],"total_semester_two"=>0]
            );
        }

        $data_semester_1 =array_values($data_semester_1);
       //  dd($data_semester_1);
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

            array_push($store_score_4,[ "id"=>$student['id'],"sex"=>$student['sex'],"kh_name" =>$student['kh_name'],
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
        $result_semester_2 = [];
        foreach($cv as $student){
            $avg = $student['avg_month'];
            $avg_score_semester = $student['avg_score_semsterone'];

            $id= $student['id'];
            if(isset($result_semester_2[$id]))
            {
                $result_semester_2[$id]['avg_month']+= $avg ;
                $result_semester_2[$id]['avg_score_semsterone'] = $avg_score_semester ;
            }else{
                $total_avg =$student['avg_month'];
                $result_semester_2[$id]=[
                    "id"=>$id,
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "avg_month"=>$total_avg ,
                     "avg_score_semsterone"=>$student['avg_score_semsterone']
                ];
            }


        }

        $result_semester_2 = array_values($result_semester_2);
        $result_semester_2 = json_decode(json_encode($result_semester_2),true);
        $data_semester_2=[];

        foreach($result_semester_2 as $student){
            array_push(
                $data_semester_2,["id"=>$student["id"],"sex"=>$student['sex'],"kh_name"=>$student['kh_name'],"total_semester_two"=>($student['avg_month']/3)+$student['avg_score_semsterone'],"total_semester_one"=>0]
            );
        }
        $data_semester_2 = array_values($data_semester_2);
        $result_year = array_merge($data_semester_1,$data_semester_2);
        $total_year= json_decode(json_encode($result_year),true);
        $result_year_last= [];

        foreach($total_year as $student){

                $id= $student['id'];
                if(isset($result_year_last[$id]))
                {

                    $result_year_last[$id]['total_semester_two'] += $student['total_semester_two'];
                    $result_year_last[$id]['total_semester_one'] += $student['total_semester_one'] ;

                }else{

                    $result_year_last[$id]=[
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_semester_two"=>$student['total_semester_two'] ,
                        "total_semester_one"=>$student['total_semester_one']
                    ];
                }


        }
        $result_year_last = array_values($result_year_last);
        if($data_month_1 && $data_month_12 && $data_month_2 && $data_month_3 &&$data_month_4 && $data_month_5 && $data_month_6 && $data_month_7)
        {

            return response()->json([
                "status"=>0,
                "data"=>$result_year_last,
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

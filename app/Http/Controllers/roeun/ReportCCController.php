<?php

namespace App\Http\Controllers\roeun;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class ReportCCController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $global_rank1;
    public $global_rank2;
    public function index()
    {
        //
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


    public function viewprimary($class_id,$month_id,$type)
    {
        header('Access-Control-Allow-Origin: *');
        $check_class = DB::table('class_view')->where('id',$class_id)->first();
        $avg_mutil=0;
        if (str_contains($check_class->grade, '1') || str_contains($check_class->grade, '2')) {
            $avg_mutil = 13;
        }else   if (str_contains($check_class->grade, '3') || str_contains($check_class->grade, '4')) {
            $avg_mutil = 15;
        }else{
            $avg_mutil = 17;
        }
        if($type == "month")
        {

            $data = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and  month_id=".$month_id." "));
            $new_data  = [];
            foreach(json_decode(json_encode($data),true) as $student)
            {
                array_push(
                    $new_data,
                    [
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score" =>$student['total_score'],
                        "avg"=>number_format($student['total_score']/$avg_mutil,2),
                        "grade"=>number_format($student['total_score']/$avg_mutil,2),
                        "type"=>"Month"

                    ]

                );

            };
            $new_data = array_values($new_data);
            usort($new_data, function ($a, $b) {
                return $b['avg'] <=> $a['avg'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($new_data as $index => &$student) {

                if ($index > 0 && $student['avg'] === $new_data[$index - 1]['avg']) {
                    $student['rank'] = $new_data[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $show_data_to_user=[];
            foreach(json_decode(json_encode($new_data),true) as $student)
            {

                // if($student['id'] == $student_id)
                // {
                    array_push(
                        $show_data_to_user,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "listent"=>$student['listent'],
                            "speaking"=>$student['speaking'],
                            "writing"=>$student['writing'],
                            "reading"=>$student['reading'],
                            "essay"=>$student['essay'],
                            "grammar" =>$student['grammar'],
                            "math" =>$student['math'],
                            "chemistry" =>$student['chemistry'],
                            "physical" =>$student['physical'],
                            "history" =>$student['history'],
                            "morality" =>$student['morality'],
                            "art" =>$student['art'],
                            "word" =>$student['word'],
                            "pe" =>$student['pe'],
                            "homework" =>$student['homework'],
                            "healthy" =>$student['healthy'],
                            "steam" =>$student['steam'],
                            "total_score" =>number_format($student['total_score'],2),
                            "avg"=>number_format($student['avg'],2),
                            "grade"=>$this->getGradePrimary(number_format($student['avg'],2)),
                            "rank" =>$student['rank'],
                            "type"=>"Month"

                        ]

                    );

                // }

            }
            if(count($new_data) !=0)
            {

                return response()->json([
                    "status"=>0,
                    "data"=>$show_data_to_user,
                    "message"=>"Succesfully Month"
                ]);
            } else{

                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }



        }else if($type == "semseter1")
        {
            $all_result_semester_1 = $this->getSemesterOnePrimary($class_id,$month_id,$avg_mutil);

            if( $all_result_semester_1 == 0 )
            {
                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);

            }else{

                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_1,
                    "message"=>"Succesfully Semester 1"
                ]);

            }


        }else if($type == "semseter2")

        {

            $all_result_semester_2 = $this->getSemesterTwoPrimary($class_id,$month_id,$avg_mutil);

            if( $all_result_semester_2 == 0 )
            {
                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);

            }else{

                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_2,
                    "message"=>"Succesfully Semester 2"
                ]);

            }

        }else{
            $semsester1= $this->getSemesterOnePrimary($class_id,$month_id,$avg_mutil);
            $semsester2= $this->getSemesterTwoPrimary($class_id,$month_id,$avg_mutil);
            $store_rank1="";
            $store_rank2="";
            $result_year = array_merge($semsester1,$semsester2);
            $result_year = json_decode(json_encode($result_year),true);
            $total_year = [];
            foreach($result_year as $student){

                    $id= $student['student_id'];
                    if(isset($total_year[$id]))
                    {

                        $total_year[$id]['total_avg_year_muti'] += $student['total_avg_year_muti'];
                        $total_year[$id]['total_avg_year_muti_2'] += $student['total_avg_year_muti_2'] ;

                    }else{

                        $total_year[$id]=[
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                            "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],

                        ];
                    }


             }
             $total_year = array_values($total_year);
             $show_result_year = [];
             foreach(json_decode(json_encode($total_year),true) as $student)
             {
                $total_sum = ($student['total_avg_year_muti'] + $student['total_avg_year_muti_2'] )/ 2;
                array_push(
                    $show_result_year,
                    [
                        "student_id"=>$student['student_id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                        "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                        "total_sum_semester" =>$total_sum,
                        // "rankSemsester"=>$student['rankSemsester']

                    ]

                );

             }
             $show_result_year = array_values($show_result_year);
             usort($show_result_year, function ($a, $b) {
                 return $b['total_sum_semester'] <=> $a['total_sum_semester'];
             });

             // Step 2: Assign ranks based on total scores
             $rank = 1;
             foreach ($show_result_year as $index => &$student) {

                 if ($index > 0 && $student['total_sum_semester'] === $show_result_year[$index - 1]['total_sum_semester']) {
                     $student['rank'] = $show_result_year[$index - 1]['rank']; // Same rank as previous student
                 } else {
                     $student['rank'] = $rank;
                 }
                 $rank++;
             }
             $all_data_year=[];
             foreach(json_decode(json_encode($show_result_year),true) as $student)
             {
                //    if($student['student_id'] == $student_id)
                //    {
                        array_push(
                            $all_data_year,
                            [
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                                "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                                "total_sum_semester_mutil" =>$student['total_sum_semester'],
                                "rankYear"=>$student['rank'],
                                "rankSemester1"=>$this->global_rank1,
                                "rankSemester2"=>$this->global_rank2,
                                "type"=>"All"
                            ]

                        );

                //    }

             }
           $all_data_year = array_values($all_data_year);
            return response()->json([
                "status"=>0,
                "data"=>$all_data_year,
                "message"=>"Succesfully for Year Result"
             ]);


        }



    }


    public function getSemesterOnePrimary($class_id,$month_id,$mutil_avg)
    {

        $data_month_11 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=11"));
        $data_month_12 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=12"));
        $data_month_1 = DB::select(DB::raw("SELECT *  FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=1"));
        $data_month_2 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=2"));

        $store_score_11=[];
        $store_score_12=[];
        $store_score_1=[];
        $store_score_2=[];

        foreach(json_decode(json_encode($data_month_11),true) as $student)
        {
                array_push(
                    $store_score_11,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_score']/$mutil_avg,
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_12),true) as $student)
        {
                array_push(
                    $store_score_12,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_score']/$mutil_avg,
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_1),true) as $student)
        {
                array_push(
                    $store_score_1,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_score']/$mutil_avg,
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_2),true) as $student)
        {
                array_push(
                    $store_score_2,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_score']/$mutil_avg,
                        "type"=>"Month"
                    ]

                );

        };
        $merge_arr_sem1= array_merge($store_score_11,$store_score_12,$store_score_1,$store_score_2);
        $cv_data_sems1 = json_decode(json_encode($merge_arr_sem1),true);
        $result_4_month_sem1 = [];

        foreach($cv_data_sems1 as $student){

            $avg = $student['total_avg'] ;
            $id= $student['student_id'];
            if(isset($result_4_month_sem1[$id]))
            {
                 $total_avg+=$avg ;
                 $result_4_month_sem1[$id]['total_avg']+= $student['total_avg'] / 3  ;
                 $result_4_month_sem1[$id]['total_semester_month'] = $student['total_semester_month'];
                 $result_4_month_sem1[$id]['listent'] = $student['listent'];
                 $result_4_month_sem1[$id]['speaking'] = $student['speaking'];
                 $result_4_month_sem1[$id]['writing'] = $student['writing'];
                 $result_4_month_sem1[$id]['reading'] = $student['reading'];
                 $result_4_month_sem1[$id]['essay'] = $student['essay'];
                 $result_4_month_sem1[$id]['grammar'] = $student['grammar'];
                 $result_4_month_sem1[$id]['math'] = $student['math'];
                 $result_4_month_sem1[$id]['chemistry'] = $student['chemistry'];
                 $result_4_month_sem1[$id]['physical'] = $student['physical'];
                 $result_4_month_sem1[$id]['history'] = $student['history'];
                 $result_4_month_sem1[$id]['morality'] = $student['morality'];
                 $result_4_month_sem1[$id]['art'] = $student['art'];
                 $result_4_month_sem1[$id]['word'] = $student['word'];
                 $result_4_month_sem1[$id]['pe'] = $student['pe'];
                 $result_4_month_sem1[$id]['homework'] = $student['homework'];
                 $result_4_month_sem1[$id]['healthy'] = $student['healthy'];
                 $result_4_month_sem1[$id]['steam'] = $student['steam'];

            }else{
                $total_avg =$student['total_avg'] / 3  ;
                $total_score = $student['total_score'];
                $result_4_month_sem1[$id]=[
                     "student_id"=>$student['student_id'],
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "total_avg"=>$total_avg,
                     "total_semester_month"=>$student['total_semester_month'],
                     "listent"=>$student['listent'],
                     "speaking"=>$student['speaking'],
                     "writing"=>$student['writing'],
                     "reading"=>$student['reading'],
                     "essay"=>$student['essay'],
                     "grammar"=>$student['grammar'],
                     "math"=>$student['math'],
                     "chemistry"=>$student['chemistry'],
                     "physical"=>$student['physical'],
                     "history"=>$student['history'],
                     "morality"=>$student['morality'],
                     "word"=>$student['word'],
                     "pe"=>$student['pe'],
                     "homework"=>$student['homework'],
                     "healthy"=>$student['healthy'],
                     "steam"=>$student['steam'],



                ];
            }

        }

        $last_new = [];
        foreach(json_decode(json_encode($result_4_month_sem1),true) as $student)
        {
            $total_score = $student['total_avg']+$student['total_semester_month'];
            array_push(
                $last_new,
                [
                    "student_id"=>$student['student_id'],
                    "kh_name"=>$student['kh_name'],
                    "sex"=>$student['sex'],
                    "listent"=>$student['listent'],
                    "speaking"=>$student['speaking'],
                    "writing"=>$student['writing'],
                    "reading"=>$student['reading'],
                    "essay"=>$student['essay'],
                    "grammar"=>$student['grammar'],
                    "math"=>$student['math'],
                    "chemistry"=>$student['chemistry'],
                    "physical"=>$student['physical'],
                    "history"=>$student['history'],
                    "morality"=>$student['morality'],
                    "word"=>$student['word'],
                    "pe"=>$student['pe'],
                    "homework"=>$student['homework'],
                    "healthy"=>$student['healthy'],
                    "steam"=>$student['steam'],
                    "total_avg_3_month"=>$student['total_avg'],
                    "total_semester_month"=>$student['total_semester_month'],
                    "total_avg_year"=>$total_score,
                    "total_avg_year_muti"=>$total_score / 2,
                ]
             );

        }
               // Step 1: Sort the students by total score in descending order
               $last_new = array_values($last_new);
               usort($last_new, function ($a, $b) {
                   return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
               });

               // Step 2: Assign ranks based on total scores
               $rank = 1;
               foreach ($last_new as $index => &$student) {

                   if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                       $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                   } else {
                       $student['rank'] = $rank;
                   }
                   $rank++;
               }
               $all_result_semester_1=[];
               foreach(json_decode(json_encode($last_new),true) as $student)
               {


                       $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                           array_push(
                               $all_result_semester_1,
                               [
                                   "student_id"=>$student['student_id'],
                                   "kh_name"=>$student['kh_name'],
                                   "sex"=>$student['sex'],
                                   "listent"=>$student['listent'],
                                   "speaking"=>$student['speaking'],
                                   "writing"=>$student['writing'],
                                   "reading"=>$student['reading'],
                                   "essay"=>$student['essay'],
                                   "grammar"=>$student['grammar'],
                                   "math"=>$student['math'],
                                   "chemistry"=>$student['chemistry'],
                                   "physical"=>$student['physical'],
                                   "history"=>$student['history'],
                                   "morality"=>$student['morality'],
                                   "word"=>$student['word'],
                                   "pe"=>$student['pe'],
                                   "homework"=>$student['homework'],
                                   "healthy"=>$student['healthy'],
                                   "steam"=>$student['steam'],
                                   "total_avg_3_month"=>$student['total_avg_3_month'],
                                   "total_semester_month"=>$student['total_semester_month'],
                                   "total_avg_year"=>$total_score,
                                   "total_avg_year_muti"=>$total_score / 2,
                                   "rank"=>$student['rank'],
                                   "total_avg_year_muti_2"=>0,
                                   "type"=>"Semester1"
                               ]
                       );


               }

               $all_result_semester_1 = array_values($all_result_semester_1);
            //  dd($data_month_11);
               if($data_month_11 && $data_month_12 && $data_month_1 && $data_month_2)
               {

                   return $all_result_semester_1;
               } else{

                 return 0;
               }



    }


    public function getSemesterTwoPrimary($class_id,$month_id,$mutil_avg)
    {


        $data_month_11 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
        $data_month_12 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));
        $data_month_1 = DB::select(DB::raw("SELECT *  FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=7"));
        $data_month_2 = DB::select(DB::raw("SELECT * FROM score_primary_cc INNER JOIN student ON score_primary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=8"));

        $store_score_11=[];
        $store_score_12=[];
        $store_score_1=[];
        $store_score_2=[];

        foreach(json_decode(json_encode($data_month_11),true) as $student)
        {
                array_push(
                    $store_score_11,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_12),true) as $student)
        {
                array_push(
                    $store_score_12,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_1),true) as $student)
        {
                array_push(
                    $store_score_1,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]

                );

        };
        foreach(json_decode(json_encode($data_month_2),true) as $student)
        {
                array_push(
                    $store_score_2,
                    [
                        "student_id"=>$student['id'],
                        "id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "listent"=>$student['listent'],
                        "speaking"=>$student['speaking'],
                        "writing"=>$student['writing'],
                        "reading"=>$student['reading'],
                        "essay"=>$student['essay'],
                        "grammar" =>$student['grammar'],
                        "math" =>$student['math'],
                        "chemistry" =>$student['chemistry'],
                        "physical" =>$student['physical'],
                        "history" =>$student['history'],
                        "morality" =>$student['morality'],
                        "art" =>$student['art'],
                        "word" =>$student['word'],
                        "pe" =>$student['pe'],
                        "homework" =>$student['homework'],
                        "healthy" =>$student['healthy'],
                        "steam" =>$student['steam'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "type"=>"Month"
                    ]

                );

        };
        $merge_arr_sem1= array_merge($store_score_11,$store_score_12,$store_score_1,$store_score_2);
        $cv_data_sems1 = json_decode(json_encode($merge_arr_sem1),true);
        $result_4_month_sem1 = [];

        foreach($cv_data_sems1 as $student){

            $avg = $student['total_avg'] ;
            $id= $student['student_id'];
            if(isset($result_4_month_sem1[$id]))
            {
                 $total_avg+=$avg ;
                 $result_4_month_sem1[$id]['total_avg']+= $student['total_avg'] / 3  ;
                 $result_4_month_sem1[$id]['total_semester_month'] = $student['total_semester_month'];
                 $result_4_month_sem1[$id]['listent'] = $student['listent'];
                 $result_4_month_sem1[$id]['speaking'] = $student['speaking'];
                 $result_4_month_sem1[$id]['writing'] = $student['writing'];
                 $result_4_month_sem1[$id]['reading'] = $student['reading'];
                 $result_4_month_sem1[$id]['essay'] = $student['essay'];
                 $result_4_month_sem1[$id]['grammar'] = $student['grammar'];
                 $result_4_month_sem1[$id]['math'] = $student['math'];
                 $result_4_month_sem1[$id]['chemistry'] = $student['chemistry'];
                 $result_4_month_sem1[$id]['physical'] = $student['physical'];
                 $result_4_month_sem1[$id]['history'] = $student['history'];
                 $result_4_month_sem1[$id]['morality'] = $student['morality'];
                 $result_4_month_sem1[$id]['art'] = $student['art'];
                 $result_4_month_sem1[$id]['word'] = $student['word'];
                 $result_4_month_sem1[$id]['pe'] = $student['pe'];
                 $result_4_month_sem1[$id]['homework'] = $student['homework'];
                 $result_4_month_sem1[$id]['healthy'] = $student['healthy'];
                 $result_4_month_sem1[$id]['steam'] = $student['steam'];

            }else{
                $total_avg =$student['total_avg'] / 3  ;
                $total_score = $student['total_score'];
                $result_4_month_sem1[$id]=[
                     "student_id"=>$student['student_id'],
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "total_avg"=>$total_avg,
                     "total_semester_month"=>$student['total_semester_month'],
                     "listent"=>$student['listent'],
                     "speaking"=>$student['speaking'],
                     "writing"=>$student['writing'],
                     "reading"=>$student['reading'],
                     "essay"=>$student['essay'],
                     "grammar"=>$student['grammar'],
                     "math"=>$student['math'],
                     "chemistry"=>$student['chemistry'],
                     "physical"=>$student['physical'],
                     "history"=>$student['history'],
                     "morality"=>$student['morality'],
                     "word"=>$student['word'],
                     "pe"=>$student['pe'],
                     "homework"=>$student['homework'],
                     "healthy"=>$student['healthy'],
                     "steam"=>$student['steam'],



                ];
            }

        }

        $last_new = [];
        foreach(json_decode(json_encode($result_4_month_sem1),true) as $student)
        {
            $total_score = $student['total_avg']+$student['total_semester_month'];
            array_push(
                $last_new,
                [
                    "student_id"=>$student['student_id'],
                    "kh_name"=>$student['kh_name'],
                    "sex"=>$student['sex'],
                    "listent"=>$student['listent'],
                    "speaking"=>$student['speaking'],
                    "writing"=>$student['writing'],
                    "reading"=>$student['reading'],
                    "essay"=>$student['essay'],
                    "grammar"=>$student['grammar'],
                    "math"=>$student['math'],
                    "chemistry"=>$student['chemistry'],
                    "physical"=>$student['physical'],
                    "history"=>$student['history'],
                    "morality"=>$student['morality'],
                    "word"=>$student['word'],
                    "pe"=>$student['pe'],
                    "homework"=>$student['homework'],
                    "healthy"=>$student['healthy'],
                    "steam"=>$student['steam'],
                    "total_avg_3_month"=>$student['total_avg'],
                    "total_semester_month"=>$student['total_semester_month'],
                    "total_avg_year"=>$total_score,
                    "total_avg_year_muti"=>$total_score / 2,
                ]
             );

        }
               // Step 1: Sort the students by total score in descending order
               $last_new = array_values($last_new);
               usort($last_new, function ($a, $b) {
                   return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
               });

               // Step 2: Assign ranks based on total scores
               $rank = 1;
               foreach ($last_new as $index => &$student) {

                   if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                       $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                   } else {
                       $student['rank'] = $rank;
                   }
                   $rank++;
               }
               $all_result_semester_1=[];
               foreach(json_decode(json_encode($last_new),true) as $student)
               {


                       $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                           array_push(
                               $all_result_semester_1,
                               [
                                   "student_id"=>$student['student_id'],
                                   "kh_name"=>$student['kh_name'],
                                   "sex"=>$student['sex'],
                                   "listent"=>$student['listent'],
                                   "speaking"=>$student['speaking'],
                                   "writing"=>$student['writing'],
                                   "reading"=>$student['reading'],
                                   "essay"=>$student['essay'],
                                   "grammar"=>$student['grammar'],
                                   "math"=>$student['math'],
                                   "chemistry"=>$student['chemistry'],
                                   "physical"=>$student['physical'],
                                   "history"=>$student['history'],
                                   "morality"=>$student['morality'],
                                   "word"=>$student['word'],
                                   "pe"=>$student['pe'],
                                   "homework"=>$student['homework'],
                                   "healthy"=>$student['healthy'],
                                   "steam"=>$student['steam'],
                                   "total_avg_3_month"=>$student['total_avg_3_month'],
                                   "total_semester_month"=>$student['total_semester_month'],
                                   "total_avg_year"=>$total_score,
                                   "total_avg_year_muti_2"=>$total_score / 2,
                                   "total_avg_year_muti"=>0,
                                   "rank"=>$student['rank'],
                                   "type"=>"Semester2"
                               ]
                       );

               }

               $all_result_semester_1 = array_values($all_result_semester_1);

               if($data_month_11 && $data_month_12 && $data_month_1 && $data_month_2)
               {

                   return $all_result_semester_1;
               } else{

                 return 0;
               }



    }



    public function viewscoresecondary($class_id,$month_id,$type)
    {
        header('Access-Control-Allow-Origin: *');
        if($type == 'month')
        {
            // $data = DB::select(DB::raw("SELECT *, DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as the_rank ,student.kh_name,student.sex FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and  month_id=".$month_id." and score_secondary_cc. =".$student_id.""));

            $data = DB::select(DB::raw("SELECT *  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and  month_id=".$month_id." "));
            $new_data  = [];
            foreach(json_decode(json_encode($data),true) as $student)
            {

                // if($student['id'] == $student_id)
                // {
                    array_push(
                            $new_data,
                            [
                                "id"=>$student['id'],
                                "kh_name"=>$student['kh_name'],
                                "en_name"=>$student['en_name'],
                                "sex"=>$student['sex'],
                                "class_id"=>$student['class_id'],
                                "avg_m"=>$student['avg_m'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_score"=>$student["total_score"],
                                "avg"=>number_format($student['total_avg'],2),
                                // "rank"=>$student['ranking'],
                                "grade"=>$this->getGrade(number_format($student['total_avg'],2)),
                                "type"=>"Month"
                            ]
                    );

                // }


            }
            $new_data = array_values($new_data);
            usort($new_data, function ($a, $b) {
                return $b['avg'] <=> $a['avg'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($new_data as $index => &$student) {

                if ($index > 0 && $student['avg'] === $new_data[$index - 1]['avg']) {
                    $student['rank'] = $new_data[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $show_data_to_user=[];
            foreach(json_decode(json_encode($new_data),true) as $student)
            {

                // if($student['id'] == $student_id)
                // {
                    array_push(
                            $show_data_to_user,
                            [
                                "id"=>$student['id'],
                                "kh_name"=>$student['kh_name'],
                                "en_name"=>$student['en_name'],
                                "sex"=>$student['sex'],
                                "class_id"=>$student['class_id'],
                                "avg_m"=>$student['avg_m'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_score"=>$student["total_score"],
                                "avg"=>number_format($student['avg'],2),
                                "rank"=>$student['rank'],
                                "grade"=>$this->getGrade(number_format($student['avg'],2)),
                                "type"=>"Month"
                            ]
                    );

                // }


            }

            if(count($new_data) !=0)
            {

                return response()->json([
                    "status"=>0,
                    "data"=>$show_data_to_user,
                    "message"=>"Succesfully"
                ]);
            } else{

                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }


        }elseif($type == "semester1")
        {

            $month_11 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=11"));
            $month_12= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=12"));
            $month_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=1"));
            $month_2 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=2"));

            $new_data11=[];
            $new_data12=[];
            $new_data1=[];
            $new_data2=[];
            foreach(json_decode(json_encode($month_11),true) as $student)
            {

                array_push($new_data11,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($month_12),true) as $student)
            {

                array_push($new_data12,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_1),true) as $student)
            {

                array_push($new_data1,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_2),true) as $student)
            {

                array_push($new_data2,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "writing"=>$student['writing'],
                        "essay"=>$student['essay'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "geology"=>$student['geology'],
                        "house_education"=>$student['house_education'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                    ]
                );

            }

            $merge_arr  = array_merge($new_data11,$new_data12,$new_data1,$new_data2);
            $cv_data = json_decode(json_encode($merge_arr),true);
            $result_3_month = [];
            foreach($cv_data as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_3_month[$id]))
                {
                     $total_avg+=$avg ;
                     $result_3_month[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_3_month[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_3_month[$id]['writing'] = $student['writing'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['khmer'] = $student['khmer'];
                     $result_3_month[$id]['morality'] = $student['morality'];
                     $result_3_month[$id]['history'] = $student['history'];
                     $result_3_month[$id]['geography'] = $student['geography'];
                     $result_3_month[$id]['math'] = $student['math'];
                     $result_3_month[$id]['physical'] = $student['physical'];
                     $result_3_month[$id]['chemistry'] = $student['chemistry'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['biology'] = $student['biology'];
                     $result_3_month[$id]['geology'] = $student['geology'];
                     $result_3_month[$id]['house_education'] = $student['house_education'];
                     $result_3_month[$id]['english'] = $student['english'];
                     $result_3_month[$id]['pe'] = $student['pe'];
                     $result_3_month[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_3_month[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "writing"=>$student['writing'],
                         "essay"=>$student['essay'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "geology"=>$student['geology'],
                         "house_education"=>$student['house_education'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }

            $result_3_month = array_values($result_3_month);
            $last_new = [];
            foreach(json_decode(json_encode($result_3_month),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "writing"=>$student['writing'],
                            "essay"=>$student['essay'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "geology"=>$student['geology'],
                            "house_education"=>$student['house_education'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

            // Step 1: Sort the students by total score in descending order
            $last_new = array_values($last_new);
            usort($last_new, function ($a, $b) {
                return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($last_new as $index => &$student) {

                if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                    $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $all_result_semester_1=[];
            foreach(json_decode(json_encode($last_new),true) as $student)
            {

                // if($student['student_id'] == $student_id)
                // {
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_1,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month"=>$student['total_avg_3_month'],
                                "total_semester_month"=>$student['total_semester_month'],
                                "total_avg_year"=>$total_score,
                                "total_avg_year_muti"=>$total_score / 2,
                                "rank"=>$student['rank'],
                                "grade"=>$this->getGrade(number_format($total_score / 2,2)),
                                "type"=>"Semester1"
                            ]
                    );
                // }

            }

            $all_result_semester_1 = array_values($all_result_semester_1);
            if($month_1 && $month_11 && $month_12 && $month_2)
            {
                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_1,
                    "message"=>"Succesfully"
                ]);

            }else{
                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }



        }elseif($type == "semester2")
        {


            $check_class = DB::table('class_view')->where('id',$class_id)->first();

            if(str_contains($check_class->grade,"9"))
            {

                $month_11 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=3"));
                $month_12= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=4"));
                $month_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $month_2 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));



            }else{


                $month_11 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $month_12= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));
                $month_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=7"));
                $month_2 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=8"));


            }
            $new_data11=[];
            $new_data12=[];
            $new_data1=[];
            $new_data2=[];

            foreach(json_decode(json_encode($month_11),true) as $student)
            {

                array_push($new_data11,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($month_12),true) as $student)
            {

                array_push($new_data12,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_1),true) as $student)
            {

                array_push($new_data1,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_2),true) as $student)
            {

                array_push($new_data2,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "writing"=>$student['writing'],
                        "essay"=>$student['essay'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "geology"=>$student['geology'],
                        "house_education"=>$student['house_education'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                    ]
                );

            }

            $merge_arr  = array_merge($new_data11,$new_data12,$new_data1,$new_data2);
            $cv_data = json_decode(json_encode($merge_arr),true);
            $result_3_month = [];
            foreach($cv_data as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_3_month[$id]))
                {
                     $total_avg+=$avg ;
                     $result_3_month[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_3_month[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_3_month[$id]['writing'] = $student['writing'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['khmer'] = $student['khmer'];
                     $result_3_month[$id]['morality'] = $student['morality'];
                     $result_3_month[$id]['history'] = $student['history'];
                     $result_3_month[$id]['geography'] = $student['geography'];
                     $result_3_month[$id]['math'] = $student['math'];
                     $result_3_month[$id]['physical'] = $student['physical'];
                     $result_3_month[$id]['chemistry'] = $student['chemistry'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['biology'] = $student['biology'];
                     $result_3_month[$id]['geology'] = $student['geology'];
                     $result_3_month[$id]['house_education'] = $student['house_education'];
                     $result_3_month[$id]['english'] = $student['english'];
                     $result_3_month[$id]['pe'] = $student['pe'];
                     $result_3_month[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_3_month[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "writing"=>$student['writing'],
                         "essay"=>$student['essay'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "geology"=>$student['geology'],
                         "house_education"=>$student['house_education'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }

            $result_3_month = array_values($result_3_month);
            $last_new = [];
            foreach(json_decode(json_encode($result_3_month),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],

                            "writing"=>$student['writing'],
                            "essay"=>$student['essay'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "geology"=>$student['geology'],
                            "house_education"=>$student['house_education'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

            // Step 1: Sort the students by total score in descending order
            $last_new = array_values($last_new);
            usort($last_new, function ($a, $b) {
                return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($last_new as $index => &$student) {

                if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                    $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $all_result_semester_1=[];
            foreach(json_decode(json_encode($last_new),true) as $student)
            {

                // if($student['student_id'] == $student_id)
                // {
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_1,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month"=>$student['total_avg_3_month'],
                                "total_semester_month"=>$student['total_semester_month'],
                                "total_avg_year"=>$total_score,
                                "total_avg_year_muti"=>$total_score / 2,
                                "rank"=>$student['rank'],
                                "grade"=>$this->getGrade(number_format($total_score / 2,2)),
                                "type"=>"Semester2"
                            ]
                    );
                // }

            }

            $all_result_semester_1 = array_values($all_result_semester_1);
            if($month_1 && $month_11 && $month_12 && $month_2)
            {
                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_1,
                    "message"=>"Succesfully"
                ]);

            }else{
                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }




        }else{
            $check_class = DB::table('class_view')->where('id',$class_id)->first();
            $month_11 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=11"));
            $month_12= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=12"));
            $month_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=1"));
            $month_2 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=2"));

            $new_data11=[];
            $new_data12=[];
            $new_data1=[];
            $new_data2=[];
            foreach(json_decode(json_encode($month_11),true) as $student)
            {

                array_push($new_data11,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($month_12),true) as $student)
            {

                array_push($new_data12,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_1),true) as $student)
            {

                array_push($new_data1,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0
                    ]
                );

            }
            foreach(json_decode(json_encode($month_2),true) as $student)
            {

                array_push($new_data2,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "writing"=>$student['writing'],
                        "essay"=>$student['essay'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "geology"=>$student['geology'],
                        "house_education"=>$student['house_education'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                    ]
                );

            }

            $merge_arr  = array_merge($new_data11,$new_data12,$new_data1,$new_data2);
            $cv_data = json_decode(json_encode($merge_arr),true);
            $result_3_month = [];
            foreach($cv_data as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_3_month[$id]))
                {
                     $total_avg+=$avg ;
                     $result_3_month[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_3_month[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_3_month[$id]['writing'] = $student['writing'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['khmer'] = $student['khmer'];
                     $result_3_month[$id]['morality'] = $student['morality'];
                     $result_3_month[$id]['history'] = $student['history'];
                     $result_3_month[$id]['geography'] = $student['geography'];
                     $result_3_month[$id]['math'] = $student['math'];
                     $result_3_month[$id]['physical'] = $student['physical'];
                     $result_3_month[$id]['chemistry'] = $student['chemistry'];
                     $result_3_month[$id]['essay'] = $student['essay'];
                     $result_3_month[$id]['biology'] = $student['biology'];
                     $result_3_month[$id]['geology'] = $student['geology'];
                     $result_3_month[$id]['house_education'] = $student['house_education'];
                     $result_3_month[$id]['english'] = $student['english'];
                     $result_3_month[$id]['pe'] = $student['pe'];
                     $result_3_month[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_3_month[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "writing"=>$student['writing'],
                         "essay"=>$student['essay'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "geology"=>$student['geology'],
                         "house_education"=>$student['house_education'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }

            $result_3_month = array_values($result_3_month);
            $last_new = [];
            foreach(json_decode(json_encode($result_3_month),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],

                            "writing"=>$student['writing'],
                            "essay"=>$student['essay'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "geology"=>$student['geology'],
                            "house_education"=>$student['house_education'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

            // Step 1: Sort the students by total score in descending order
            $last_new = array_values($last_new);
            usort($last_new, function ($a, $b) {
                return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($last_new as $index => &$student) {

                if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                    $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $all_result_semester_1=[];
            $store_rank1="";
            foreach(json_decode(json_encode($last_new),true) as $student)
            {


                // if($student['student_id'] == $student_id)
                // {

                //     $store_rank1= $student['rank'];
                // }

                // if($student['student_id'] == $student_id)
                // {
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_1,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month"=>$student['total_avg_3_month'],
                                "total_semester_month"=>$student['total_semester_month'],
                                "total_avg_year"=>$total_score,
                                "total_avg_year_muti"=>$total_score / 2,
                                "rankSemester1"=>$student['rank'],
                                "total_avg_year_muti_2"=>0
                            ]
                    );
                // }

            }

            $all_result_semester_1 = array_values($all_result_semester_1);


            if(str_contains($check_class->grade,"9"))
            {

                $semeter_2_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=3"));
                $semeter_2_2= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=4"));
                $semeter_2_3 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $semeter_2_4 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));



            }else{


                $semeter_2_1 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking   FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $semeter_2_2= DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking     FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));
                $semeter_2_3 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking  FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=7"));
                $semeter_2_4 = DB::select(DB::raw("SELECT *,DENSE_RANK() OVER (ORDER BY total_avg + 0 DESC) as ranking FROM score_secondary_cc INNER JOIN student ON score_secondary_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=8"));


            }
            $new_data_2_1=[];
            $new_data_2_2=[];
            $new_data_2_3=[];
            $new_data_2_4=[];

            foreach(json_decode(json_encode($semeter_2_1),true) as $student)
            {

                array_push($new_data_2_1,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($semeter_2_2),true) as $student)
            {

                array_push($new_data_2_2,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($semeter_2_3),true) as $student)
            {

                array_push($new_data_2_3,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "writing"=>0,
                        "essay"=>0,
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "geology"=>0,
                        "house_education"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0

                    ]
                );

            }
            foreach(json_decode(json_encode($semeter_2_4),true) as $student)
            {

                array_push($new_data_2_4,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "writing"=>$student['writing'],
                        "essay"=>$student['essay'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "geology"=>$student['geology'],
                        "house_education"=>$student['house_education'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                    ]
                );

            }

            $merge_arr_2  = array_merge($new_data_2_1,$new_data_2_2,$new_data_2_3,$new_data_2_4);
            $cv_data_2 = json_decode(json_encode($merge_arr_2),true);
            $result_2_month = [];
            foreach($cv_data_2 as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_2_month[$id]))
                {
                     $total_avg+=$avg ;
                     $result_2_month[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_2_month[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_2_month[$id]['writing'] = $student['writing'];
                     $result_2_month[$id]['essay'] = $student['essay'];
                     $result_2_month[$id]['khmer'] = $student['khmer'];
                     $result_2_month[$id]['morality'] = $student['morality'];
                     $result_2_month[$id]['history'] = $student['history'];
                     $result_2_month[$id]['geography'] = $student['geography'];
                     $result_2_month[$id]['math'] = $student['math'];
                     $result_2_month[$id]['physical'] = $student['physical'];
                     $result_2_month[$id]['chemistry'] = $student['chemistry'];
                     $result_2_month[$id]['essay'] = $student['essay'];
                     $result_2_month[$id]['biology'] = $student['biology'];
                     $result_2_month[$id]['geology'] = $student['geology'];
                     $result_2_month[$id]['house_education'] = $student['house_education'];
                     $result_2_month[$id]['english'] = $student['english'];
                     $result_2_month[$id]['pe'] = $student['pe'];
                     $result_2_month[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_2_month[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "writing"=>$student['writing'],
                         "essay"=>$student['essay'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "geology"=>$student['geology'],
                         "house_education"=>$student['house_education'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }

            $result_2_month = array_values($result_2_month);
            $last_new_2 = [];
            foreach(json_decode(json_encode($result_2_month),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new_2,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],

                            "writing"=>$student['writing'],
                            "essay"=>$student['essay'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "geology"=>$student['geology'],
                            "house_education"=>$student['house_education'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

            // Step 1: Sort the students by total score in descending order
            $last_new_2 = array_values($last_new_2);
            usort($last_new_2, function ($a, $b) {
                return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($last_new_2 as $index => &$student) {

                if ($index > 0 && $student['total_avg_year_muti'] === $last_new_2[$index - 1]['total_avg_year_muti']) {
                    $student['rank'] = $last_new_2[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $all_result_semester_2=[];
            $store_rank2="";
            foreach(json_decode(json_encode($last_new_2),true) as $student)
            {

                // if($student['student_id'] == $student_id)
                // {

                //     $store_rank2=$student['rank'];
                // }
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_2,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "writing"=>$student['writing'],
                                "essay"=>$student['essay'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "geology"=>$student['geology'],
                                "house_education"=>$student['house_education'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month_2"=>$student['total_avg_3_month'],
                                "total_semester_2_month"=>$student['total_semester_month'],
                                "total_avg_year_2"=>$total_score,
                                "total_avg_year_muti_2"=>$total_score / 2,
                                "rankSemester2"=>$student['rank'],
                                "total_avg_year_muti"=>0
                            ]
                    );
                // }

            }

            $all_result_semester_2 = array_values($all_result_semester_2);
            $result_year = array_merge($all_result_semester_1,$all_result_semester_2);
            $result_year = json_decode(json_encode($result_year),true);
            $total_year = [];
            // print_r($result_year);
            foreach($result_year as $student){

                    $id= $student['student_id'];
                    if(isset($total_year[$id]))
                    {

                        $total_year[$id]['total_avg_year_muti'] += $student['total_avg_year_muti'];
                        $total_year[$id]['total_avg_year_muti_2'] += $student['total_avg_year_muti_2'] ;

                    }else{

                        $total_year[$id]=[
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                            "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],

                        ];
                    }


             }
             $total_year = array_values($total_year);
             $show_result_year = [];
             foreach(json_decode(json_encode($total_year),true) as $student)
             {
                $total_sum = ($student['total_avg_year_muti'] + $student['total_avg_year_muti_2'] )/ 2;
                array_push(
                    $show_result_year,
                    [
                        "student_id"=>$student['student_id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                        "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                        "total_sum_semester" =>$total_sum,
                        // "rankSemsester"=>$student['rankSemsester']

                    ]

                );

             }
             $show_result_year = array_values($show_result_year);
             usort($show_result_year, function ($a, $b) {
                 return $b['total_sum_semester'] <=> $a['total_sum_semester'];
             });

             // Step 2: Assign ranks based on total scores
             $rank = 1;
             foreach ($show_result_year as $index => &$student) {

                 if ($index > 0 && $student['total_sum_semester'] === $show_result_year[$index - 1]['total_sum_semester']) {
                     $student['rank'] = $show_result_year[$index - 1]['rank']; // Same rank as previous student
                 } else {
                     $student['rank'] = $rank;
                 }
                 $rank++;
             }
             $all_data_year=[];
             foreach(json_decode(json_encode($show_result_year),true) as $student)
             {
                //    if($student['student_id'] == $student_id)
                //    {
                        array_push(
                            $all_data_year,
                            [
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                                "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                                "total_sum_semester_mutil" =>$student['total_sum_semester'],
                                "rankYear"=>$student['rank'],
                                "rankSemester1"=>$store_rank1,
                                "rankSemester2"=>$store_rank2,
                                // "rankSemsester" =>$student['rankSemsester'],
                                "type"=>"All"
                            ]

                        );

                //    }

             }
           $all_data_year = array_values($all_data_year);
            return response()->json([
                "status"=>0,
                "data"=>$all_data_year,
                "message"=>"Succesfully"
             ]);


        }

    }

    public function viewscoreuppersecondary($class_id,$month_id,$type)
    {
        header('Access-Control-Allow-Origin: *');
        if($type == "month")
        {

            $data = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and  month_id=".$month_id." "));
            $new_data  = [];

            foreach(json_decode(json_encode($data),true) as $student)
            {



                    array_push(
                        $new_data ,
                        [
                            "id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_score"=>$student["total_score"],
                            "avg"=>$student['total_avg'],
                            // "rank"=>$student['ranking'],
                            "grade"=>$this->getGrade(number_format($student['total_avg'],2)),
                            "type"=>"Month"
                        ]
                     );



            }
            $new_data = array_values($new_data);

            usort($new_data, function ($a, $b) {
                return $b['avg'] <=> $a['avg'];
            });

            // Step 2: Assign ranks based on total scores
            $rank = 1;
            foreach ($new_data as $index => &$student) {

                if ($index > 0 && $student['avg'] === $new_data[$index - 1]['avg']) {
                    $student['rank'] = $new_data[$index - 1]['rank']; // Same rank as previous student
                } else {
                    $student['rank'] = $rank;
                }
                $rank++;
            }
            $show_data_to_user=[];
            foreach(json_decode(json_encode($new_data),true) as $student)
            {

                // if($student['id'] == $student_id)
                // {

                    array_push(
                        $show_data_to_user ,
                        [
                            "id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_score"=>$student["total_score"],
                            "avg"=>$student['avg'],
                            "rank"=>$student['rank'],
                            "grade"=>$this->getGrade(number_format($student['avg'],2)),
                            "type"=>"Month"
                        ]
                     );

                // }

            }
            $show_data_to_user = array_values($show_data_to_user);
            if(count($new_data) !=0)
            {

                return response()->json([
                    "status"=>0,
                    "data"=>$show_data_to_user,
                    "message"=>"Succesfully"
                ]);
            } else{

                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }



        }else if($type == "semester1")
        {

            $data_month_11 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=11"));
            $data_month_12 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=12"));
            $data_month_1 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=1"));
            $data_month_2 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=2"));

            $store_score_11=[];
            $store_score_12=[];
            $store_score_1=[];
            $store_score_2=[];

            foreach(json_decode(json_encode($data_month_11),true) as $student)
            {



                    array_push(
                        $store_score_11 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }

            foreach(json_decode(json_encode($data_month_12),true) as $student)
            {



                    array_push(
                        $store_score_12 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }

            foreach(json_decode(json_encode($data_month_1),true) as $student)
            {



                    array_push(
                        $store_score_1 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }

            foreach(json_decode(json_encode($data_month_2),true) as $student)
            {



                    array_push(
                        $store_score_2 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_score"=>$student['total_score'],
                            "total_avg"=>0,
                            "total_semester_month"=>$student['total_avg'],
                            "type"=>"Month"
                        ]
                     );

            }

            $merge_arr_sem1= array_merge($store_score_11,$store_score_12,$store_score_1,$store_score_2);
            $cv_data_sems1 = json_decode(json_encode($merge_arr_sem1),true);
            $result_4_month_sem1 = [];
            foreach($cv_data_sems1 as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_4_month_sem1[$id]))
                {
                     $total_avg+=$avg ;
                     $result_4_month_sem1[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_4_month_sem1[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_4_month_sem1[$id]['khmer'] = $student['khmer'];
                     $result_4_month_sem1[$id]['morality'] = $student['morality'];
                     $result_4_month_sem1[$id]['history'] = $student['history'];
                     $result_4_month_sem1[$id]['geography'] = $student['geography'];
                     $result_4_month_sem1[$id]['math'] = $student['math'];
                     $result_4_month_sem1[$id]['physical'] = $student['physical'];
                     $result_4_month_sem1[$id]['chemistry'] = $student['chemistry'];
                     $result_4_month_sem1[$id]['biology'] = $student['biology'];
                     $result_4_month_sem1[$id]['earth_science'] = $student['earth_science'];
                     $result_4_month_sem1[$id]['english'] = $student['english'];
                     $result_4_month_sem1[$id]['pe'] = $student['pe'];
                     $result_4_month_sem1[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_4_month_sem1[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "earth_science"=>$student['earth_science'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }
            // print_r($store_score_11);
            // print_r($store_score_12);
            // print_r($store_score_1);
            // print_r($store_score_2);
            $last_new = [];
            foreach(json_decode(json_encode($result_4_month_sem1),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

               // Step 1: Sort the students by total score in descending order
            $last_new = array_values($last_new);
               usort($last_new, function ($a, $b) {
                   return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
               });

               // Step 2: Assign ranks based on total scores
               $rank = 1;
               foreach ($last_new as $index => &$student) {

                   if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                       $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
                   } else {
                       $student['rank'] = $rank;
                   }
                   $rank++;
               }
            $all_result_semester_1=[];
            foreach(json_decode(json_encode($last_new),true) as $student)
            {

                // if($student['student_id'] == $student_id)
                // {
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_1,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "earth_science"=>$student['earth_science'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month"=>$student['total_avg_3_month'],
                                "total_semester_month"=>$student['total_semester_month'],
                                "total_avg_year"=>$total_score,
                                "total_avg_year_muti"=>$total_score / 2,
                                "rank"=>$student['rank'],
                                "grade"=>$this->getGrade(number_format($total_score / 2,2)),
                                "type"=>"Semester1"
                            ]
                    );
                // }

            }

            $all_result_semester_1 = array_values($all_result_semester_1);
            if($data_month_11 && $data_month_12 && $data_month_1 && $data_month_2)
            {

                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_1,
                    "message"=>"Succesfully"
                ]);
            } else{

                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }



        } elseif($type == "semester2")
        {

            $check_class = DB::table('class_view')->where('id',$class_id)->first();

            if(str_contains($check_class->grade,"12"))
            {

                $data_month_3 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=3"));
                $data_month_4 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=4"));
                $data_month_5 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $data_month_6 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));


            }else{

                $data_month_3 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
                $data_month_4 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));
                $data_month_5 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=7"));
                $data_month_6 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=8"));


            }
            $store_score_3=[];
            $store_score_4=[];
            $store_score_5=[];
            $store_score_6=[];
            foreach(json_decode(json_encode($data_month_3),true) as $student)
            {



                    array_push(
                        $store_score_3 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }

            foreach(json_decode(json_encode($data_month_4),true) as $student)
            {



                    array_push(
                        $store_score_4 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }

            foreach(json_decode(json_encode($data_month_5),true) as $student)
            {



                    array_push(
                        $store_score_5 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>0,
                            "morality"=>0,
                            "history"=>0,
                            "geography"=>0,
                            "math"=>0,
                            "physical"=>0,
                            "chemistry"=>0,
                            "biology"=>0,
                            "earth_science"=>0,
                            "english"=>0,
                            "pe"=>0,
                            "computer"=>0,
                            "total_score"=>$student['total_score'],
                            "total_avg"=>$student['total_avg'],
                            "total_semester_month"=>0,
                            "type"=>"Month"
                        ]
                     );

            }


            foreach(json_decode(json_encode($data_month_6),true) as $student)
            {



                    array_push(
                        $store_score_6 ,
                        [
                            "student_id"=>$student['id'],
                            "kh_name"=>$student['kh_name'],
                            "en_name"=>$student['en_name'],
                            "sex"=>$student['sex'],
                            "class_id"=>$student['class_id'],
                            "avg_m"=>$student['avg_m'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_score"=>$student['total_score'],
                            "total_avg"=>0,
                            "total_semester_month"=>$student['total_avg'],
                            "type"=>"Month"
                        ]
                     );

            }

            $merge_arr_sem2= array_merge($store_score_3,$store_score_4,$store_score_5,$store_score_6);
            $cv_data_sems2 = json_decode(json_encode($merge_arr_sem2),true);
            $result_4_month_sem2 = [];
            foreach($cv_data_sems2 as $student){

                $avg = $student['total_avg'] ;
                $id= $student['student_id'];
                if(isset($result_4_month_sem2[$id]))
                {
                     $total_avg+=$avg ;
                     $result_4_month_sem2[$id]['total_avg']+= $student['total_avg'] / 3  ;
                     $result_4_month_sem2[$id]['total_semester_month'] = $student['total_semester_month'];
                     $result_4_month_sem2[$id]['khmer'] = $student['khmer'];
                     $result_4_month_sem2[$id]['morality'] = $student['morality'];
                     $result_4_month_sem2[$id]['history'] = $student['history'];
                     $result_4_month_sem2[$id]['geography'] = $student['geography'];
                     $result_4_month_sem2[$id]['math'] = $student['math'];
                     $result_4_month_sem2[$id]['physical'] = $student['physical'];
                     $result_4_month_sem2[$id]['chemistry'] = $student['chemistry'];
                     $result_4_month_sem2[$id]['biology'] = $student['biology'];
                     $result_4_month_sem2[$id]['earth_science'] = $student['earth_science'];
                     $result_4_month_sem2[$id]['english'] = $student['english'];
                     $result_4_month_sem2[$id]['pe'] = $student['pe'];
                     $result_4_month_sem2[$id]['computer'] = $student['computer'];



                }else{
                    $total_avg =$student['total_avg'] / 3  ;
                    $total_score = $student['total_score'];
                    $result_4_month_sem2[$id]=[
                         "student_id"=>$student['student_id'],
                         "kh_name"=>$student['kh_name'],
                         "sex"=>$student['sex'],
                         "total_avg"=>$total_avg,
                         "total_semester_month"=>$student['total_semester_month'],
                         "khmer"=>$student['khmer'],
                         "morality"=>$student['morality'],
                         "history"=>$student['history'],
                         "geography"=>$student['geography'],
                         "math"=>$student['math'],
                         "physical"=>$student['physical'],
                         "chemistry"=>$student['chemistry'],
                         "biology"=>$student['biology'],
                         "earth_science"=>$student['earth_science'],
                         "english"=>$student['english'],
                         "pe"=>$student['pe'],
                         "computer"=>$student['computer'],



                    ];
                }


            }

            $last_new_2 = [];
            foreach(json_decode(json_encode($result_4_month_sem2),true) as $student)
            {
                $total_score = $student['total_avg']+$student['total_semester_month'];
                    array_push(
                        $last_new_2,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                        ]
                );

            }

               // Step 1: Sort the students by total score in descending order
            $last_new_2 = array_values($last_new_2);
               usort($last_new_2, function ($a, $b) {
                   return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
               });

               // Step 2: Assign ranks based on total scores
               $rank = 1;
               foreach ($last_new_2 as $index => &$student) {

                   if ($index > 0 && $student['total_avg_year_muti'] === $last_new_2[$index - 1]['total_avg_year_muti']) {
                       $student['rank'] = $last_new_2[$index - 1]['rank']; // Same rank as previous student
                   } else {
                       $student['rank'] = $rank;
                   }
                   $rank++;
               }
            $all_result_semester_2=[];
            foreach(json_decode(json_encode($last_new_2),true) as $student)
            {

                // if($student['student_id'] == $student_id)
                // {
                    $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                        array_push(
                            $all_result_semester_2,
                            [
                                "student_id"=>$student['student_id'],
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "khmer"=>$student['khmer'],
                                "morality"=>$student['morality'],
                                "history"=>$student['history'],
                                "geography"=>$student['geography'],
                                "math"=>$student['math'],
                                "physical"=>$student['physical'],
                                "chemistry"=>$student['chemistry'],
                                "biology"=>$student['biology'],
                                "earth_science"=>$student['earth_science'],
                                "english"=>$student['english'],
                                "pe"=>$student['pe'],
                                "computer"=>$student['computer'],
                                "total_avg_3_month"=>$student['total_avg_3_month'],
                                "total_semester_month"=>$student['total_semester_month'],
                                "total_avg_year"=>$total_score,
                                "total_avg_year_muti"=>$total_score / 2,
                                "rank"=>$student['rank'],
                                "grade"=>$this->getGrade(number_format($total_score / 2,2)),
                                "type"=>"Semester2"
                            ]
                    );
                // }

            }

            $all_result_semester_2 = array_values($all_result_semester_2);
            if($data_month_3 && $data_month_4 && $data_month_5 && $data_month_6)
            {

                return response()->json([
                    "status"=>0,
                    "data"=>$all_result_semester_2,
                    "message"=>"Succesfully"
                ]);
            } else{

                return response()->json([
                    "status"=>1,
                    "message"=>"UnSuccesfully"
                ]);
            }




        }else{


            $semsester1= $this->getSemesterOne($class_id,$month_id);
            $semsester2= $this->getSemesterTwo($class_id,$month_id);
            $store_rank1="";
            $store_rank2="";
            $result_year = array_merge($semsester1,$semsester2);
            $result_year = json_decode(json_encode($result_year),true);
            $total_year = [];
            // print_r($result_year);
            foreach($result_year as $student){

                    $id= $student['student_id'];
                    if(isset($total_year[$id]))
                    {

                        $total_year[$id]['total_avg_year_muti'] += $student['total_avg_year_muti'];
                        $total_year[$id]['total_avg_year_muti_2'] += $student['total_avg_year_muti_2'] ;

                    }else{

                        $total_year[$id]=[
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                            "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],

                        ];
                    }


             }
             $total_year = array_values($total_year);
             $show_result_year = [];
             foreach(json_decode(json_encode($total_year),true) as $student)
             {
                $total_sum = ($student['total_avg_year_muti'] + $student['total_avg_year_muti_2'] )/ 2;
                array_push(
                    $show_result_year,
                    [
                        "student_id"=>$student['student_id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                        "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                        "total_sum_semester" =>$total_sum,
                        // "rankSemsester"=>$student['rankSemsester']

                    ]

                );

             }
             $show_result_year = array_values($show_result_year);
             usort($show_result_year, function ($a, $b) {
                 return $b['total_sum_semester'] <=> $a['total_sum_semester'];
             });

             // Step 2: Assign ranks based on total scores
             $rank = 1;
             foreach ($show_result_year as $index => &$student) {

                 if ($index > 0 && $student['total_sum_semester'] === $show_result_year[$index - 1]['total_sum_semester']) {
                     $student['rank'] = $show_result_year[$index - 1]['rank']; // Same rank as previous student
                 } else {
                     $student['rank'] = $rank;
                 }
                 $rank++;
             }
             $all_data_year=[];
             foreach(json_decode(json_encode($show_result_year),true) as $student)
             {
                //    if($student['student_id'] == $student_id)
                //    {
                        array_push(
                            $all_data_year,
                            [
                                "kh_name"=>$student['kh_name'],
                                "sex"=>$student['sex'],
                                "total_avg_year_muti"=>$student['total_avg_year_muti'] ,
                                "total_avg_year_muti_2"=>$student['total_avg_year_muti_2'],
                                "total_sum_semester_mutil" =>$student['total_sum_semester'],
                                "rankYear"=>$student['rank'],
                                "rankSemester1"=>$this->global_rank1,
                                "rankSemester2"=>$this->global_rank2,
                                "type"=>"All"
                            ]

                        );

                //    }

             }
           $all_data_year = array_values($all_data_year);
            return response()->json([
                "status"=>0,
                "data"=>$all_data_year,
                "message"=>"Succesfully"
             ]);


        }
    }




    public function getSemesterOne($class_id,$month_id)
    {
        $data_month_11 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=11"));
        $data_month_12 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=12"));
        $data_month_1 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=1"));
        $data_month_2 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=2"));

        $store_score_11=[];
        $store_score_12=[];
        $store_score_1=[];
        $store_score_2=[];

        foreach(json_decode(json_encode($data_month_11),true) as $student)
        {



                array_push(
                    $store_score_11 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }

        foreach(json_decode(json_encode($data_month_12),true) as $student)
        {



                array_push(
                    $store_score_12 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }

        foreach(json_decode(json_encode($data_month_1),true) as $student)
        {



                array_push(
                    $store_score_1 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }

        foreach(json_decode(json_encode($data_month_2),true) as $student)
        {



                array_push(
                    $store_score_2 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "earth_science"=>$student['earth_science'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "type"=>"Month"
                    ]
                 );

        }

        $merge_arr_sem1= array_merge($store_score_11,$store_score_12,$store_score_1,$store_score_2);
        $cv_data_sems1 = json_decode(json_encode($merge_arr_sem1),true);
        $result_4_month_sem1 = [];
        foreach($cv_data_sems1 as $student){

            $avg = $student['total_avg'] ;
            $id= $student['student_id'];
            if(isset($result_4_month_sem1[$id]))
            {
                 $total_avg+=$avg ;
                 $result_4_month_sem1[$id]['total_avg']+= $student['total_avg'] / 3  ;
                 $result_4_month_sem1[$id]['total_semester_month'] = $student['total_semester_month'];
                 $result_4_month_sem1[$id]['khmer'] = $student['khmer'];
                 $result_4_month_sem1[$id]['morality'] = $student['morality'];
                 $result_4_month_sem1[$id]['history'] = $student['history'];
                 $result_4_month_sem1[$id]['geography'] = $student['geography'];
                 $result_4_month_sem1[$id]['math'] = $student['math'];
                 $result_4_month_sem1[$id]['physical'] = $student['physical'];
                 $result_4_month_sem1[$id]['chemistry'] = $student['chemistry'];
                 $result_4_month_sem1[$id]['biology'] = $student['biology'];
                 $result_4_month_sem1[$id]['earth_science'] = $student['earth_science'];
                 $result_4_month_sem1[$id]['english'] = $student['english'];
                 $result_4_month_sem1[$id]['pe'] = $student['pe'];
                 $result_4_month_sem1[$id]['computer'] = $student['computer'];



            }else{
                $total_avg =$student['total_avg'] / 3  ;
                $total_score = $student['total_score'];
                $result_4_month_sem1[$id]=[
                     "student_id"=>$student['student_id'],
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "total_avg"=>$total_avg,
                     "total_semester_month"=>$student['total_semester_month'],
                     "khmer"=>$student['khmer'],
                     "morality"=>$student['morality'],
                     "history"=>$student['history'],
                     "geography"=>$student['geography'],
                     "math"=>$student['math'],
                     "physical"=>$student['physical'],
                     "chemistry"=>$student['chemistry'],
                     "biology"=>$student['biology'],
                     "earth_science"=>$student['earth_science'],
                     "english"=>$student['english'],
                     "pe"=>$student['pe'],
                     "computer"=>$student['computer'],



                ];
            }


        }
        $last_new = [];
        foreach(json_decode(json_encode($result_4_month_sem1),true) as $student)
        {
            $total_score = $student['total_avg']+$student['total_semester_month'];
                array_push(
                    $last_new,
                    [
                        "student_id"=>$student['student_id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "earth_science"=>$student['earth_science'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                        "total_avg_3_month"=>$student['total_avg'],
                        "total_semester_month"=>$student['total_semester_month'],
                        "total_avg_year"=>$total_score,

                        "total_avg_year_muti"=>$total_score / 2,
                    ]
            );

        }

           // Step 1: Sort the students by total score in descending order
        $last_new = array_values($last_new);
           usort($last_new, function ($a, $b) {
               return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
           });

           // Step 2: Assign ranks based on total scores
           $rank = 1;
           foreach ($last_new as $index => &$student) {

               if ($index > 0 && $student['total_avg_year_muti'] === $last_new[$index - 1]['total_avg_year_muti']) {
                   $student['rank'] = $last_new[$index - 1]['rank']; // Same rank as previous student
               } else {
                   $student['rank'] = $rank;
               }
               $rank++;
           }
        $all_result_semester_1=[];
        foreach(json_decode(json_encode($last_new),true) as $student)
        {

            // if($student['student_id'] == $student_id)
            // {
                // if($student['student_id'] == $student_id)
                // {

                //     $this->global_rank1= $student['rank'];
                // }
                $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                    array_push(
                        $all_result_semester_1,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg_3_month'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti"=>$total_score / 2,
                            "rank"=>$student['rank'],
                            "total_avg_year_muti_2"=>0,
                            "type"=>"Semester1"
                        ]
                );
            // }

        }

        $all_result_semester_1 = array_values($all_result_semester_1);

        if($data_month_11 && $data_month_12 && $data_month_1 && $data_month_2)
        {

            return $all_result_semester_1;
        } else{

            return 0;
        }

    }
    public function getSemesterTwo($class_id,$month_id)
    {
        $check_class = DB::table('class_view')->where('id',$class_id)->first();

        if(str_contains($check_class->grade,"12"))
        {

            $data_month_3 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=3"));
            $data_month_4 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=4"));
            $data_month_5 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
            $data_month_6 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));


        }else{

            $data_month_3 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=5"));
            $data_month_4 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=6"));
            $data_month_5 = DB::select(DB::raw("SELECT *  FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=7"));
            $data_month_6 = DB::select(DB::raw("SELECT * FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$class_id."  and month_id=8"));


        }
        $store_score_3=[];
        $store_score_4=[];
        $store_score_5=[];
        $store_score_6=[];
        foreach(json_decode(json_encode($data_month_3),true) as $student)
        {



                array_push(
                    $store_score_3 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }

        foreach(json_decode(json_encode($data_month_4),true) as $student)
        {



                array_push(
                    $store_score_4 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }

        foreach(json_decode(json_encode($data_month_5),true) as $student)
        {



                array_push(
                    $store_score_5 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>0,
                        "morality"=>0,
                        "history"=>0,
                        "geography"=>0,
                        "math"=>0,
                        "physical"=>0,
                        "chemistry"=>0,
                        "biology"=>0,
                        "earth_science"=>0,
                        "english"=>0,
                        "pe"=>0,
                        "computer"=>0,
                        "total_score"=>$student['total_score'],
                        "total_avg"=>$student['total_avg'],
                        "total_semester_month"=>0,
                        "type"=>"Month"
                    ]
                 );

        }


        foreach(json_decode(json_encode($data_month_6),true) as $student)
        {



                array_push(
                    $store_score_6 ,
                    [
                        "student_id"=>$student['id'],
                        "kh_name"=>$student['kh_name'],
                        "en_name"=>$student['en_name'],
                        "sex"=>$student['sex'],
                        "class_id"=>$student['class_id'],
                        "avg_m"=>$student['avg_m'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "earth_science"=>$student['earth_science'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                        "total_score"=>$student['total_score'],
                        "total_avg"=>0,
                        "total_semester_month"=>$student['total_avg'],
                        "type"=>"Month"
                    ]
                 );

        }

        $merge_arr_sem2= array_merge($store_score_3,$store_score_4,$store_score_5,$store_score_6);
        $cv_data_sems2 = json_decode(json_encode($merge_arr_sem2),true);
        $result_4_month_sem2 = [];
        foreach($cv_data_sems2 as $student){

            $avg = $student['total_avg'] ;
            $id= $student['student_id'];
            if(isset($result_4_month_sem2[$id]))
            {
                 $total_avg+=$avg ;
                 $result_4_month_sem2[$id]['total_avg']+= $student['total_avg'] / 3  ;
                 $result_4_month_sem2[$id]['total_semester_month'] = $student['total_semester_month'];
                 $result_4_month_sem2[$id]['khmer'] = $student['khmer'];
                 $result_4_month_sem2[$id]['morality'] = $student['morality'];
                 $result_4_month_sem2[$id]['history'] = $student['history'];
                 $result_4_month_sem2[$id]['geography'] = $student['geography'];
                 $result_4_month_sem2[$id]['math'] = $student['math'];
                 $result_4_month_sem2[$id]['physical'] = $student['physical'];
                 $result_4_month_sem2[$id]['chemistry'] = $student['chemistry'];
                 $result_4_month_sem2[$id]['biology'] = $student['biology'];
                 $result_4_month_sem2[$id]['earth_science'] = $student['earth_science'];
                 $result_4_month_sem2[$id]['english'] = $student['english'];
                 $result_4_month_sem2[$id]['pe'] = $student['pe'];
                 $result_4_month_sem2[$id]['computer'] = $student['computer'];



            }else{
                $total_avg =$student['total_avg'] / 3  ;
                $total_score = $student['total_score'];
                $result_4_month_sem2[$id]=[
                     "student_id"=>$student['student_id'],
                     "kh_name"=>$student['kh_name'],
                     "sex"=>$student['sex'],
                     "total_avg"=>$total_avg,
                     "total_semester_month"=>$student['total_semester_month'],
                     "khmer"=>$student['khmer'],
                     "morality"=>$student['morality'],
                     "history"=>$student['history'],
                     "geography"=>$student['geography'],
                     "math"=>$student['math'],
                     "physical"=>$student['physical'],
                     "chemistry"=>$student['chemistry'],
                     "biology"=>$student['biology'],
                     "earth_science"=>$student['earth_science'],
                     "english"=>$student['english'],
                     "pe"=>$student['pe'],
                     "computer"=>$student['computer'],



                ];
            }


        }

        $last_new_2 = [];
        foreach(json_decode(json_encode($result_4_month_sem2),true) as $student)
        {
            $total_score = $student['total_avg']+$student['total_semester_month'];
                array_push(
                    $last_new_2,
                    [
                        "student_id"=>$student['student_id'],
                        "kh_name"=>$student['kh_name'],
                        "sex"=>$student['sex'],
                        "khmer"=>$student['khmer'],
                        "morality"=>$student['morality'],
                        "history"=>$student['history'],
                        "geography"=>$student['geography'],
                        "math"=>$student['math'],
                        "physical"=>$student['physical'],
                        "chemistry"=>$student['chemistry'],
                        "biology"=>$student['biology'],
                        "earth_science"=>$student['earth_science'],
                        "english"=>$student['english'],
                        "pe"=>$student['pe'],
                        "computer"=>$student['computer'],
                        "total_avg_3_month"=>$student['total_avg'],
                        "total_semester_month"=>$student['total_semester_month'],
                        "total_avg_year"=>$total_score,
                        "total_avg_year_muti"=>$total_score / 2,
                    ]
            );

        }

           // Step 1: Sort the students by total score in descending order
        $last_new_2 = array_values($last_new_2);
           usort($last_new_2, function ($a, $b) {
               return $b['total_avg_year_muti'] <=> $a['total_avg_year_muti'];
           });

           // Step 2: Assign ranks based on total scores
           $rank = 1;
           foreach ($last_new_2 as $index => &$student) {

               if ($index > 0 && $student['total_avg_year_muti'] === $last_new_2[$index - 1]['total_avg_year_muti']) {
                   $student['rank'] = $last_new_2[$index - 1]['rank']; // Same rank as previous student
               } else {
                   $student['rank'] = $rank;
               }
               $rank++;
           }
        $all_result_semester_2=[];
        foreach(json_decode(json_encode($last_new_2),true) as $student)
        {

            // if($student['student_id'] == $student_id)
            // {

            //     $this->global_rank2= $student['rank'];
            // }
            // if($student['student_id'] == $student_id)
            // {
                $total_score = $student['total_avg_3_month']+$student['total_semester_month'];
                    array_push(
                        $all_result_semester_2,
                        [
                            "student_id"=>$student['student_id'],
                            "kh_name"=>$student['kh_name'],
                            "sex"=>$student['sex'],
                            "khmer"=>$student['khmer'],
                            "morality"=>$student['morality'],
                            "history"=>$student['history'],
                            "geography"=>$student['geography'],
                            "math"=>$student['math'],
                            "physical"=>$student['physical'],
                            "chemistry"=>$student['chemistry'],
                            "biology"=>$student['biology'],
                            "earth_science"=>$student['earth_science'],
                            "english"=>$student['english'],
                            "pe"=>$student['pe'],
                            "computer"=>$student['computer'],
                            "total_avg_3_month"=>$student['total_avg_3_month'],
                            "total_semester_month"=>$student['total_semester_month'],
                            "total_avg_year"=>$total_score,
                            "total_avg_year_muti_2"=>$total_score / 2,
                            "total_avg_year_muti"=>0,
                            "rank"=>$student['rank'],
                            "type"=>"Semester2"
                        ]
                );
            // }

        }

        $all_result_semester_2 = array_values($all_result_semester_2);
        if($data_month_3 && $data_month_4 && $data_month_5 && $data_month_6)
        {

            return $all_result_semester_2;
        } else{

            return 0;
        }
    }

    public function getGradePrimary($avg)
    {
        $grade = "";

        if($avg >= 8.00 || $avg >=10.00 )
        {
            $grade = "ល្អ";
        }elseif($avg >= 6.40 || $avg >=7.99)
        {

            $grade = "ល្អបង្គួរ";

        }elseif($avg >= 5.00 || $avg >=6.49)
        {

            $grade = "មធ្យម";
        }else{
            $grade = "ធ្លាក់";
        }

        return $grade;



    }
    public function getGrade($avg)
    {
        $grade = "";

        if($avg >= 48.00 || $avg >=50.00 )
        {
            $grade = "ល្អប្រសើរ";
        }elseif($avg >= 45.99 || $avg >=47.99)
        {

            $grade = "ល្អណាស់";

        }elseif($avg >= 40.00 || $avg >=44.99)
        {

            $grade = "ល្អ";

        }elseif($avg >= 32.50 || $avg >=39.99)
        {

            $grade = "ល្អបង្គួរ";

        }
        elseif($avg >= 25.00 || $avg >=32.49)
        {

            $grade = "មធ្យម";

        }else{
            $grade = "គ្មានចំ.ថ្នាក់";
        }

        return $grade;



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

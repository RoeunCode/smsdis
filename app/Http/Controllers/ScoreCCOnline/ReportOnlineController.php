<?php

namespace App\Http\Controllers\ScoreCCOnline;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\ScoreCCOnline;
use Illuminate\Support\Facades\Storage;
use phpDocumentor\Reflection\Type;
use PhpParser\Node\Stmt\Echo_;

class ReportOnlineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grade=DB::table('v_class')->get();
        $month=DB::table('month')->get();
        return view('report_cc_online.score_report_cc_all')->with('grade',$grade)->with('month',$month);
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

    private function Ranking($avg){
        if($avg < 25){
            $mention = "ខ្សោយ";
        }elseif($avg >= 25 && $avg < 32.50){
            $mention = "មធ្យម";
        }elseif($avg >= 32.50 && $avg < 40){
            $mention = "ល្អ បង្គួរ";
        }elseif($avg >= 40){
            $mention = "ល្អ";
        }else{
            $mention = "មិនមានចំណាត់ថ្នាក់";
        }
        return $mention;
    }
    public function select_json(Request $request)
    {
        $grade=DB::table('v_class')->where('grade','like','%'.$request->grade.'%')->get();
        return json_encode($grade);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Get Request from AJAx
       if($request->level==9){
           if($request->month==3){
               //month 3 == Semester 1
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=9 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_grade9\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade9' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                   <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
//                   $mtc sprinf //បង្គត់ឡើង
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>  
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }

               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else if($request->month==7){
               //Month 7 == Semester 7
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=9 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_grade9\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade9' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>  
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];


           }else if($request->month==13){
               //Month 13=Final year
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>9])->get();
               $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>9])->get();
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
               $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               //Semester 1
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($ss1 as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               //End Semester 1
               //Semester 2
               $arrms2 = [];
               foreach ($m4 as $m){
                   array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m5 as $ms){
                   $arrms2[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m6 as $mt){
                   $arrms2[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms2);$i++){
                   $arrms2[$i]['avg'] /= 3;
               }
               $arrts2 = [];
               foreach($ss2 as $sm){
                   array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn2 = [];
               for($i=0;$i<sizeof($arrts2);$i++){
                   array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn2);$i++){
                   $arrfn2[$i]['avg'] /= 2;
               }
               //End Semester 2
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_9_final\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_9_final' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($ss2 as $s){
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc1 = $af['avg'];
                       }
                   }
                   foreach($arrfn2 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc2 = $af['avg'];
                       }
                   }
                   $fnttl = ($fnc1+$fnc2)/2;
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else{
               //Else other month ger report
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>9])
                 ->get();
               $rt ="
                
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
                   foreach($ss1 as $s){

                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                         <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s->avg)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }

       }elseif ($request->level==12){
           if($request->month==3){
               //month 3 == Semester 1
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id  ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=12 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                   <button onclick='printtag(\"tbl_grade9\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table  class='table table-bordered table-condensed  animated slideInDown fast tbl_semester_11'>
                                <thead>
                                <tr>
                             	  <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                  <th style='text-align: center'>រូបវិទ្យា</th>
                                  <th style='text-align: center'>គីមី</th>
                                  <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                  <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>    
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
		            	<td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else if($request->month==7){
               //Month 7 == Semester 7
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=12 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_grade9\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table class='table table-bordered table-condensed  animated slideInDown fast tbl_semester_11'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-emphasis: ;t-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                  <th style='text-align: center'>រូបវិទ្យា</th>
                                  <th style='text-align: center'>គីមី</th>
                                  <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                  <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th>
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }

                   foreach($arrfn1 as $af) {
                       if ($af['id'] == $s->student_id) {
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    
			         <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }else if($request->month==13){
               //Month 13=Final year
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>12])->get();
               $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>12])->get();
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
               $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               //Semester 1
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($ss1 as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               //End Semester 1
               //Semester 2
               $arrms2 = [];
               foreach ($m4 as $m){
                   array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m5 as $ms){
                   $arrms2[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m6 as $mt){
                   $arrms2[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms2);$i++){
                   $arrms2[$i]['avg'] /= 3;
               }
               $arrts2 = [];
               foreach($ss2 as $sm){
                   array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn2 = [];
               for($i=0;$i<sizeof($arrts2);$i++){
                   array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn2);$i++){
                   $arrfn2[$i]['avg'] /= 2;
               }
               //End Semester 2
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_9_final\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_9_final' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($ss2 as $s){
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc1 = $af['avg'];
                       }
                   }
                   foreach($arrfn2 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc2 = $af['avg'];
                       }
                   }
                   $fnttl = ($fnc1+$fnc2)/2;
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else{
               //Else other month ger report
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>12])->get();
               $rt ="
                <table  class='table table-bordered table-condensed  animated slideInDown fast tbl_11'>
                                <thead>
                                <tr>
                               	     <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th>
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach($ss1 as $s){

                   $rt .= "
                    <tr>
                     
			        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                         <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s->avg)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }
       }else if($request->level==7){
           if($request->month==3){
               //month 3 == Semester 1
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id  ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=7 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_grade_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else if($request->month==7){
               //Month 7 == Semester 2
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id  ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=7 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_grade_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                              <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                               <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                          <td style='text-align: center'>{$s->kh_name}</td>
                     <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];


           }else if($request->month==13){
               //Month 13=Final year
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>7])->get();
               $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>7])->get();
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
               $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               //Semester 1
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($ss1 as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               //End Semester 1
               //Semester 2
               $arrms2 = [];
               foreach ($m4 as $m){
                   array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m5 as $ms){
                   $arrms2[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m6 as $mt){
                   $arrms2[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms2);$i++){
                   $arrms2[$i]['avg'] /= 3;
               }
               $arrts2 = [];
               foreach($ss2 as $sm){
                   array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn2 = [];
               for($i=0;$i<sizeof($arrts2);$i++){
                   array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn2);$i++){
                   $arrfn2[$i]['avg'] /= 2;
               }
               //End Semester 2
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_final_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($ss2 as $s){
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc1 = $af['avg'];
                       }
                   }
                   foreach($arrfn2 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc2 = $af['avg'];
                       }
                   }
                   $fnttl = ($fnc1+$fnc2)/2;
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else{
               //Else other month ger report
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>7])->get();
               $rt ="
               
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                 <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                 <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach($ss1 as $s){

                   $rt .= "
                    <tr>
                      <td style='text-align: center'>{$s->kh_name}</td>
                       <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                         <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s->avg)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }

       }else if($request->level==8){
               if($request->month==3){
                   //month 3 == Semester 1
                   $sql=DB::select('select *,student.kh_name,score_cc_online.student_id  ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=8 and month_id="'.$request->month.'"
                   ');
                   $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
                   $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
                   $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
                   $arrms1 = [];
                   foreach ($m1 as $m){
                       array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
                   }
                   $i=0;
                   foreach ($m2 as $ms){
                       $arrms1[$i]['avg'] += $ms->avg;
                       $i++;
                   }
                   $i=0;
                   foreach ($m3 as $mt){
                       $arrms1[$i]['avg'] += $mt->avg;
                       $i++;
                   }
                   for($i=0;$i<sizeof($arrms1);$i++){
                       $arrms1[$i]['avg'] /= 3;
                   }
                   $arrts1 = [];
                   foreach($sql as $sm){
                       array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
                   }
                   $arrfn1 = [];
                   for($i=0;$i<sizeof($arrts1);$i++){
                       array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
                   }
                   for($i=0;$i<sizeof($arrfn1);$i++){
                       $arrfn1[$i]['avg'] /= 2;
                   }
                   $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
                   foreach ($sql as $s){
                       foreach($arrms1 as $am){
                           if($am['id'] == $s->student_id){
                               $mtc = $am['avg'];
                           }

                       }
                       foreach($arrfn1 as $af){
                           if($af['id'] == $s->student_id){
                               $fnc = $af['avg'];
                           }
                       }
                       $rt .= "
                    <tr>
                        
 		                <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td><td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
                   }
                   $rt .= "</tbody></table>";
                   return ['output'=>$rt];

               }else if($request->month==7){
                   //Month 7 == Semester 7
                   $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=8 and month_id="'.$request->month.'"
                ');
                   $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
                   $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
                   $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
                   $arrms1 = [];
                   foreach ($m1 as $m){
                       array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
                   }
                   $i=0;
                   foreach ($m2 as $ms){
                       $arrms1[$i]['avg'] += $ms->avg;
                       $i++;
                   }
                   $i=0;
                   foreach ($m3 as $mt){
                       $arrms1[$i]['avg'] += $mt->avg;
                       $i++;
                   }
                   for($i=0;$i<sizeof($arrms1);$i++){
                       $arrms1[$i]['avg'] /= 3;
                   }
                   $arrts1 = [];
                   foreach($sql as $sm){
                       array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
                   }
                   $arrfn1 = [];
                   for($i=0;$i<sizeof($arrts1);$i++){
                       array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
                   }
                   for($i=0;$i<sizeof($arrfn1);$i++){
                       $arrfn1[$i]['avg'] /= 2;
                   }
                   $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
                   foreach ($sql as $s){
                       foreach($arrms1 as $am){
                           if($am['id'] == $s->student_id){
                               $mtc = $am['avg'];
                           }
                       }
                       foreach($arrfn1 as $af){
                           if($af['id'] == $s->student_id){
                               $fnc = $af['avg'];
                           }
                       }
                       $rt .= "
                    <tr>
                       
 		             <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
                   }
                   $rt .= "</tbody></table>";
                   return ['output'=>$rt];

               }else if($request->month==13){
                   //Month 13=Final year
                   $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>8])->get();
                   $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>8])->get();
                   $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
                   $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
                   $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
                   $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
                   $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
                   $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
                   $arrms1 = [];
                   //Semester 1
                   foreach ($m1 as $m){
                       array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
                   }
                   $i=0;
                   foreach ($m2 as $ms){
                       $arrms1[$i]['avg'] += $ms->avg;
                       $i++;
                   }
                   $i=0;
                   foreach ($m3 as $mt){
                       $arrms1[$i]['avg'] += $mt->avg;
                       $i++;
                   }
                   for($i=0;$i<sizeof($arrms1);$i++){
                       $arrms1[$i]['avg'] /= 3;
                   }
                   $arrts1 = [];
                   foreach($ss1 as $sm){
                       array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
                   }
                   $arrfn1 = [];
                   for($i=0;$i<sizeof($arrts1);$i++){
                       array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
                   }
                   for($i=0;$i<sizeof($arrfn1);$i++){
                       $arrfn1[$i]['avg'] /= 2;
                   }
                   //End Semester 1
                   //Semester 2
                   $arrms2 = [];
                   foreach ($m4 as $m){
                       array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
                   }
                   $i=0;
                   foreach ($m5 as $ms){
                       $arrms2[$i]['avg'] += $ms->avg;
                       $i++;
                   }
                   $i=0;
                   foreach ($m6 as $mt){
                       $arrms2[$i]['avg'] += $mt->avg;
                       $i++;
                   }
                   for($i=0;$i<sizeof($arrms2);$i++){
                       $arrms2[$i]['avg'] /= 3;
                   }
                   $arrts2 = [];
                   foreach($ss2 as $sm){
                       array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
                   }
                   $arrfn2 = [];
                   for($i=0;$i<sizeof($arrts2);$i++){
                       array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
                   }
                   for($i=0;$i<sizeof($arrfn2);$i++){
                       $arrfn2[$i]['avg'] /= 2;
                   }
                   //End Semester 2
                   $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_final_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
                   foreach ($ss2 as $s){
                       foreach($arrfn1 as $af){
                           if($af['id'] == $s->student_id){
                               $fnc1 = $af['avg'];
                           }
                       }
                       foreach($arrfn2 as $af){
                           if($af['id'] == $s->student_id){
                               $fnc2 = $af['avg'];
                           }
                       }
                       $fnttl = ($fnc1+$fnc2)/2;
                       $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
                   }
                   $rt .= "</tbody></table>";
                   return ['output'=>$rt];

               }else{
                   //Else other month ger report
                   $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>8])->get();
                   $rt ="
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>        
			               	      <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>តែងសេចក្ដី</th>
                                  <th style='text-align: center'>សរសេរតាមអាន</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                  <th style='text-align: center'>រូបវិទ្យា</th>
                                  <th style='text-align: center'>គីមី</th>
                                  <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                  <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th>
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
                   foreach($ss1 as $s){

                       $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->teasekdey}</td>
                        <td style='text-align: center'>{$s->writting}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s  ->avg)."</td>
                    </tr>
                ";
                   }
                   $rt .= "</tbody></table>";
                   return ['output'=>$rt];
               }

       }else if($request->level==10){
           if($request->month==3){
               //month 3 == Semester 1
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=10 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_grade_all_11' class='table table-bordered table-condensed  animated slideInDown fast tbl_11'>
                                <thead>
                                <tr>
                               
				                 <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>            
 		                <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }else if($request->month==7){
               //Month 7 == Semester 7
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=10 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='exp_11' class='table table-bordered table-condensed  animated slideInDown fast tbl_11'>
                                <thead>
                                <tr>
                                 <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }else if($request->month==13){
               //Month 13=Final year
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>10])->get();
               $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>10])->get();
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
               $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               //Semester 1
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($ss1 as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               //End Semester 1
               //Semester 2
               $arrms2 = [];
               foreach ($m4 as $m){
                   array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m5 as $ms){
                   $arrms2[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m6 as $mt){
                   $arrms2[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms2);$i++){
                   $arrms2[$i]['avg'] /= 3;
               }
               $arrts2 = [];
               foreach($ss2 as $sm){
                   array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn2 = [];
               for($i=0;$i<sizeof($arrts2);$i++){
                   array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn2);$i++){
                   $arrfn2[$i]['avg'] /= 2;
               }
               //End Semester 2
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_final_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($ss2 as $s){
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc1 = $af['avg'];
                       }
                   }
                   foreach($arrfn2 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc2 = $af['avg'];
                       }
                   }
                   $fnttl = ($fnc1+$fnc2)/2;
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else{
               //Else other month ger report
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>10])->get();
               $rt ="
                <table id='exp_11' class='table table-bordered table-condensed  animated slideInDown fast tbl_11'>
                                <thead>
                                <tr>
                                 <th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th> 
                                  <th style='text-align: center'>ពលកម្ម</th> 
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach($ss1 as $s){

                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s->avg)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }

       }else if($request->level==11){
           if($request->month==3){
               //month 3 == Semester 1
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=11 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table  class='table table-bordered table-condensed  animated slideInDown fast tbl_semester_11'>
                                <thead>
                                <tr>
                                	<th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th>              
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else if($request->month==7){
               //Month 7 == Semester 7
               $sql=DB::select('select *,student.kh_name,score_cc_online.student_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=11 and month_id="'.$request->month.'"
                ');
               $m1 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($sql as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table  class='table table-bordered table-condensed  animated slideInDown fast tbl_semester_11'>
                                <thead>
                                <tr>
                               	<th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th>              
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($sql as $s){
                   foreach($arrms1 as $am){
                       if($am['id'] == $s->student_id){
                           $mtc = $am['avg'];
                       }
                   }
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc = $af['avg'];
                       }
                   }
                   $rt .= "
                    <tr>
                        
	                    <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnc)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];


           }else if($request->month==13){
               //Month 13=Final year
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $request->grade,'grade'=>11])->get();
               $ss2 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $request->grade,'grade'=>11])->get();
               $m1 = ScoreCCOnline::where(['month_id' => 12, 'class_id' => $request->grade])->get();
               $m2 = ScoreCCOnline::where(['month_id' => 1, 'class_id' => $request->grade])->get();
               $m3 = ScoreCCOnline::where(['month_id' => 2, 'class_id' => $request->cid])->get();
               $m4 = ScoreCCOnline::where(['month_id' => 4, 'class_id' => $request->grade])->get();
               $m5 = ScoreCCOnline::where(['month_id' => 5, 'class_id' => $request->grade])->get();
               $m6 = ScoreCCOnline::where(['month_id' => 6, 'class_id' => $request->grade])->get();
               $arrms1 = [];
               //Semester 1
               foreach ($m1 as $m){
                   array_push($arrms1,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m2 as $ms){
                   $arrms1[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m3 as $mt){
                   $arrms1[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms1);$i++){
                   $arrms1[$i]['avg'] /= 3;
               }
               $arrts1 = [];
               foreach($ss1 as $sm){
                   array_push($arrts1,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn1 = [];
               for($i=0;$i<sizeof($arrts1);$i++){
                   array_push($arrfn1,['id'=>$arrts1[$i]['id'],'avg'=>$arrms1[$i]['avg']+$arrts1[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn1);$i++){
                   $arrfn1[$i]['avg'] /= 2;
               }
               //End Semester 1
               //Semester 2
               $arrms2 = [];
               foreach ($m4 as $m){
                   array_push($arrms2,['id'=>$m->student_id,'avg'=>$m->avg]);
               }
               $i=0;
               foreach ($m5 as $ms){
                   $arrms2[$i]['avg'] += $ms->avg;
                   $i++;
               }
               $i=0;
               foreach ($m6 as $mt){
                   $arrms2[$i]['avg'] += $mt->avg;
                   $i++;
               }
               for($i=0;$i<sizeof($arrms2);$i++){
                   $arrms2[$i]['avg'] /= 3;
               }
               $arrts2 = [];
               foreach($ss2 as $sm){
                   array_push($arrts2,['id'=>$sm->student_id,'avg'=>$sm->avg]);
               }
               $arrfn2 = [];
               for($i=0;$i<sizeof($arrts2);$i++){
                   array_push($arrfn2,['id'=>$arrts2[$i]['id'],'avg'=>$arrms2[$i]['avg']+$arrts2[$i]['avg']]);
               }
               for($i=0;$i<sizeof($arrfn2);$i++){
                   $arrfn2[$i]['avg'] /= 2;
               }
               //End Semester 2
               $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"tbl_final_all\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='tbl_final_all' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី១</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាសទី២</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆ្នាំ</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach ($ss2 as $s){
                   foreach($arrfn1 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc1 = $af['avg'];
                       }
                   }
                   foreach($arrfn2 as $af){
                       if($af['id'] == $s->student_id){
                           $fnc2 = $af['avg'];
                       }
                   }
                   $fnttl = ($fnc1+$fnc2)/2;
                   $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc1)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc2)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnttl)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->Ranking($fnttl)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];

           }else{
               //Else other month ger report
               $ss1 = DB::table('score_cc_online')->selectRaw('*,student.kh_name as kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc_online.student_id','=','student.id')->where(['month_id' => $request->month, 'class_id' => $request->grade,'grade'=>11])->get();
               $rt ="
                <table  class='table table-bordered table-condensed  animated slideInDown fast tbl_11'>
                                <thead>
                                <tr>
                              	<th style='text-align: center'>គោត្តនាមនិងនាម</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                   <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវិត្តិវិទ្យា</th> 
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គណិតវិទ្យា</th>
                                 <th style='text-align: center'>រូបវិទ្យា</th>
                                 <th style='text-align: center'>គីមី</th>
                                 <th style='text-align: center'>ជីវវិទ្យា</th> 
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                                 <th style='text-align: center'>ភាសាបរទេស</th> 
                                  <th style='text-align: center'>គេហវិទ្យា</th> 
                                  <th style='text-align: center'>អប់រំកាយ</th>
                                  <th style='text-align: center'>ពលកម្ម</th>              
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th> 
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
               foreach($ss1 as $s){

                   $rt .= "
                    <tr>
                      
	                   <td style='text-align: center'>{$s->kh_name}</td>
                        <td style='text-align: center'>{$s->khmer}</td>
                        <td style='text-align: center'>{$s->polroth}</td>
                        <td style='text-align: center'>{$s->history}</td>
                        <td style='text-align: center'>{$s->phum}</td>
                        <td style='text-align: center'>{$s->math}</td>
                        <td style='text-align: center'>{$s->physical}</td>
                        <td style='text-align: center'>{$s->chemistry}</td>
                        <td style='text-align: center'>{$s->biology}</td>
                        <td style='text-align: center'>{$s->phandey}</td>
                        <td style='text-align: center'>{$s->english}</td>
                        <td style='text-align: center'>{$s->kehak}</td>
                        <td style='text-align: center'>{$s->sport}</td>
                        <td style='text-align: center'>{$s->polakam}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->total)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                         <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>".$this->Ranking($s->avg)."</td>
                    </tr>
                ";
               }
               $rt .= "</tbody></table>";
               return ['output'=>$rt];
           }

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

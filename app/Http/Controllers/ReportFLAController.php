<?php

namespace App\Http\Controllers;

use App\ScoreFLA;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportFLAController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cl = DB::table('v_search_class_en')->where(['deleted'=>0,'cur_id'=>3])->get();
        $mo = DB::table('month_fla')->get();
        return view('report.reportfla')->with(['cl'=>$cl,'mo'=>$mo]);
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

    private function rankfla($total)
    {
        if (($total >= 0) && ($total <= 100)) {
            if ($total < 50) {
                $mention = "F";
            } elseif ($total == 50) {
                $mention = "E";
            } elseif (($total > 50) && ($total < 63)) {
                $mention = "D-";
            } elseif (($total >= 63) && ($total < 67)) {
                $mention = "D";
            } elseif (($total >= 67) && ($total < 70)) {
                $mention = "D+";
            } elseif (($total >= 70) && ($total < 73)) {
                $mention = "C-";
            } elseif (($total >= 73) && ($total < 77)) {
                $mention = "C";
            } elseif (($total >= 77) && ($total < 80)) {
                $mention = "C+";
            } elseif (($total >= 80) && ($total < 83)) {
                $mention = "B-";
            } elseif (($total >= 83) && ($total < 87)) {
                $mention = "B";
            } elseif (($total >= 87) && ($total < 90)) {
                $mention = "B+";
            } elseif (($total >= 90) && ($total < 93)) {
                $mention = "A-";
            } elseif (($total >= 93) && ($total < 97)) {
                $mention = "A";
            } elseif (($total >= 97) && ($total <= 100)) {
                $mention = "A+";
            }
            return $mention;
        }
    }

    public function ajreport(Request $r)
    {
        if($r->mid == 13){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 11])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>9,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>10,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>11,'deleted'=>0])->get();
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <td>Mention</td>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                foreach($arrt as $at){
                    if($at['id'] == $s->sid){
                        $savg = $at['avg'];
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 14){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 2])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>12,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>1,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>2,'deleted'=>0])->get();
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                if(empty($arrm1[$i]['avg'])){
                    $m1s = 60;
                }else{
                    $m1s = $arrm1[$i]['avg'];
                }
                if(empty($arrm2[$i]['avg'])){
                    $m2s = 60;
                }else{
                    $m2s = $arrm2[$i]['avg'];
                }
                array_push($arrt,['id'=>$arrm3[$i]['id'],'avg'=>($m1s+$m2s+$arrm3[$i]['avg'])/3]);
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                foreach($arrt as $at){
                    if($at['id'] == $s->sid){
                        $savg = $at['avg'];
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 15){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 5])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>3,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>4,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>5,'deleted'=>0])->get();
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                foreach($arrt as $at){
                    if($at['id'] == $s->sid){
                        $savg = $at['avg'];
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 16){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 8])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>6,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>7,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>8,'deleted'=>0])->get();
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                foreach($arrt as $at){
                    if($at['id'] == $s->sid){
                        $savg = $at['avg'];
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 17){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 2])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>9,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>10,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>11,'deleted'=>0])->get();
            $m4 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>12,'deleted'=>0])->get();
            $m5 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>1,'deleted'=>0])->get();
            $m6 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>2,'deleted'=>0])->get();
            //Semester 1
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt1 = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt1,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            //End Semester 1
            // Semester 2
            $arrm4 = [];
            foreach ($m4 as $m){
                array_push($arrm4,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm5 = [];
            foreach ($m5 as $m){
                array_push($arrm5,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm6 = [];
            foreach ($m6 as $m){
                array_push($arrm6,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt2 = [];
            for($i=0;$i<sizeof($arrm6);$i++){
                array_push($arrt2,['id'=>$arrm6[$i]['id'],'avg'=>($arrm4[$i]['avg']+$arrm5[$i]['avg']+$arrm6[$i]['avg'])/3]);
            }
            // End Semester 2
            $arrs1 = [];
            for($i=0;$i<sizeof($arrt2);$i++){
                if(empty($arrt1[$i]['avg'])){
                    array_push($arrs1,['id'=>$arrt2[$i]['id'],'avg'=>($arrt2[$i]['avg']+60)/2]);
                }else{
                    array_push($arrs1,['id'=>$arrt2[$i]['id'],'avg'=>($arrt2[$i]['avg']+$arrt1[$i]['avg'])/2]);
                }
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                foreach($arrs1 as $at){
                    if($at['id'] == $s->sid){
                        $savg = $at['avg'];
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 18){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 2])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>3,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>4,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>5,'deleted'=>0])->get();
            $m4 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>6,'deleted'=>0])->get();
            $m5 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>7,'deleted'=>0])->get();
            $m6 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>8,'deleted'=>0])->get();
            //Semester 3
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt1 = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt1,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            //End Semester 3
            // Semester 4
            $arrm4 = [];
            foreach ($m4 as $m){
                array_push($arrm4,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm5 = [];
            foreach ($m5 as $m){
                array_push($arrm5,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm6 = [];
            foreach ($m6 as $m){
                array_push($arrm6,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt2 = [];
            for($i=0;$i<sizeof($arrm6);$i++){
                array_push($arrt2,['id'=>$arrm6[$i]['id'],'avg'=>($arrm4[$i]['avg']+$arrm5[$i]['avg']+$arrm6[$i]['avg'])/3]);
            }
            // End Semester 4
            $arrs1 = [];
            for($i=0;$i<sizeof($arrt2);$i++){
                if(empty($arrt1[$i]['avg'])){
                    array_push($arrs1,['id'=>$arrt2[$i]['id'],'avg'=>($arrt2[$i]['avg']+60)/2]);
                }else{
                    array_push($arrs1,['id'=>$arrt2[$i]['id'],'avg'=>($arrt2[$i]['avg']+$arrt1[$i]['avg'])/2]);
                }
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Total Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                if(empty($arrs1)){
                    $savg = 0;
                }else{
                    foreach($arrs1 as $at){
                        if($at['id'] == $s->sid){
                            $savg = $at['avg'];
                        }
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 19){
            $tbd = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => 2])->get();
            $m1 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>9,'deleted'=>0])->get();
            $m2 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>10,'deleted'=>0])->get();
            $m3 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>11,'deleted'=>0])->get();
            $m4 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>12,'deleted'=>0])->get();
            $m5 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>1,'deleted'=>0])->get();
            $m6 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>2,'deleted'=>0])->get();
            $m7 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>3,'deleted'=>0])->get();
            $m8 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>4,'deleted'=>0])->get();
            $m9 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>5,'deleted'=>0])->get();
            $m10 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>6,'deleted'=>0])->get();
            $m11 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>7,'deleted'=>0])->get();
            $m12 = ScoreFLA::where(['class_id'=>$r->cid,'month_id'=>8,'deleted'=>0])->get();
            //Semester 1
            $arrm1 = [];
            foreach ($m1 as $m){
                array_push($arrm1,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm2 = [];
            foreach ($m2 as $m){
                array_push($arrm2,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm3 = [];
            foreach ($m3 as $m){
                array_push($arrm3,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt1 = [];
            for($i=0;$i<sizeof($arrm3);$i++){
                array_push($arrt1,['id'=>$arrm3[$i]['id'],'avg'=>($arrm1[$i]['avg']+$arrm2[$i]['avg']+$arrm3[$i]['avg'])/3]);
            }
            //End Semester 1
            // Semester 2
            $arrm4 = [];
            foreach ($m4 as $m){
                array_push($arrm4,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm5 = [];
            foreach ($m5 as $m){
                array_push($arrm5,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm6 = [];
            foreach ($m6 as $m){
                array_push($arrm6,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt2 = [];
            for($i=0;$i<sizeof($arrm6);$i++){
                array_push($arrt2,['id'=>$arrm6[$i]['id'],'avg'=>($arrm4[$i]['avg']+$arrm5[$i]['avg']+$arrm6[$i]['avg'])/3]);
            }
            // End Semester 2
            //Semester 3
            $arrm7 = [];
            foreach ($m7 as $m){
                array_push($arrm7,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm8 = [];
            foreach ($m8 as $m){
                array_push($arrm8,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm9 = [];
            foreach ($m9 as $m){
                array_push($arrm9,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt3 = [];
            for($i=0;$i<sizeof($arrm9);$i++){
                array_push($arrt3,['id'=>$arrm9[$i]['id'],'avg'=>($arrm7[$i]['avg']+$arrm8[$i]['avg']+$arrm9[$i]['avg'])/3]);
            }
            //End Semester 3
            // Semester 4
            $arrm10 = [];
            foreach ($m10 as $m){
                array_push($arrm10,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm11 = [];
            foreach ($m11 as $m){
                array_push($arrm11,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrm12 = [];
            foreach ($m12 as $m){
                array_push($arrm12,['id'=>$m->student_id,'avg'=>$m->total]);
            }
            $arrt4 = [];
            for($i=0;$i<sizeof($arrm12);$i++){
                array_push($arrt4,['id'=>$arrm12[$i]['id'],'avg'=>($arrm10[$i]['avg']+$arrm11[$i]['avg']+$arrm12[$i]['avg'])/3]);
            }
            // End Semester 4
            $arrf = [];
            for($i=0;$i<sizeof($arrt4);$i++){
                if(empty($arrt1[$i]['avg'])){
                    $t1 = 60;
                }else{
                    $t1 = $arrt1[$i]['avg'];
                }
                if(empty($arrt2[$i]['avg'])){
                    $t2 = 60;
                }else{
                    $t2 = $arrt2[$i]['avg'];
                }
                if(empty($arrt3[$i]['avg'])){
                    $t3 = 60;
                }else{
                    $t3 = $arrt3[$i]['avg'];
                }
                array_push($arrf,['id'=>$arrt4[$i]['id'],'avg'=>($t1+$t2+$t3+$arrt4[$i]['avg']/4)]);
            }
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Final Score</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($tbd as $s){
                if(empty($arrf)){
                    $savg = 0;
                }else{
                    foreach($arrf as $at){
                        if($at['id'] == $s->sid){
                            $savg = $at['avg'];
                        }
                    }
                }
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>".sprintf('%0.2f',$savg)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>{$this->rankfla($savg)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }else{
            $msc = DB::table('score_fla')->selectRaw('*,student.en_name, rank() over(ORDER BY total desc) as rank')->join('student','score_fla.student_id','=','student.id')->where(['class_id' => $r->cid, 'month_id' => $r->mid])->get();
            $rt ="
                <table id='exps' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Reading</th>
                                  <th>Speaking</th>
                                  <th>Listening</th>
                                  <th>Writing</th>
                                  <th>Grammar</th>
                                  <th>Vocabulary</th>
                                  <th>Homework</th>
                                  <th>Class Participation</th>
                                  <th>Total</th>
                                  <th>Rank</th>
                                  <th>Mention</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($msc as $s){
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$s->en_name}</td>
                        <td style='text-align: center'>{$s->r}</td>
                        <td style='text-align: center'>{$s->s}</td>
                        <td style='text-align: center'>{$s->l}</td>
                        <td style='text-align: center'>{$s->w}</td>
                        <td style='text-align: center'>{$s->g}</td>
                        <td style='text-align: center'>{$s->v}</td>
                        <td style='text-align: center'>{$s->h}</td>
                        <td style='text-align: center'>{$s->cp}</td>
                        <td style='text-align: center'>{$s->total}</td>
                        <td style='text-align: center'>{$s->rank}</td>
                        <td style='text-align: center'>{$this->rankfla($s->total)}</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }
    }
}

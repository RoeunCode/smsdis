<?php

namespace App\Http\Controllers;

use App\Scoreac;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ReportACController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 2,'campus_id'=>Auth::user()->camp_id])->get();
        $mo = DB::table('quarter')->get();
        return view('report.reportac')->with(['cl' => $cl, 'mo' => $mo]);
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    private function gradeac($avg)
    {
        switch ($avg) {
            case(($avg > 0) && ($avg < 60)):
                $m = "F";
                break;
            case(($avg >= 60) && ($avg < 70)):
                $m = "E";
                break;
            case(($avg >= 70) && ($avg < 80)):
                $m = "D";
                break;
            case(($avg >= 80) && ($avg < 86)):
                $m = "C";
                break;
            case(($avg >= 86) && ($avg < 90)):
                $m = "B";
                break;
            case(($avg >= 90) && ($avg < 96)):
                $m = "A";
                break;
            case(($avg >= 96) && ($avg <= 100)):
                $m = "A+";
                break;
            default:
                $m = "Invalid";
        }
        return $m;
    }

    private function  ifn($num)
    {
        if($num == null){
            $r = "<i class='fas fa-ban'></i>";
        }else{
            $r = $num;
        }
        return $r;
    }
    public function ajreport(Request $r)
    {
        if ($r->mid == 5) {
            $q1 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 1, 'deleted' => 0])->get();
            $q2 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 2, 'deleted' => 0])->get();
            if (count($q2) >0) {
                $arrq1 = [];
                foreach ($q2 as $qt) {
                    $s = $qt->s;
                    $ss = $qt->ss;
                    $pc = $qt->pc;
                    $eng = $qt->eng;
                    $la = $qt->la;
                    $d_a = $qt->d_a;
                    $m = $qt->m;
                    $me = $qt->me;
                    $r_c = $qt->r_c;
                    $pe = $qt->pe;
                    $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
                    if(count(array_filter($arrcnt))>0){
                        $mult = count(array_filter($arrcnt));
                    }
                }
                foreach ($q1 as $q) {
                    $quater1 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if(count(array_filter($quater1))>0){
                        $mults = count(array_filter($quater1));
                    }
                    array_push($arrq1, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mults
                    ]);
                }
                $arrq2 = [];
                foreach ($q2 as $q) {
                    array_push($arrq2, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mult
                    ]);
                }

                $arrs1 = [];
                $avg=0;
                for ($i = 0; $i < sizeof($arrq2); $i++) {
                    if ($arrq1[$i]['total']==0 || $arrq2[$i]['total']==0) {
                        $avg = 60;
                        if($arrq1[$i]['total']==0){
                            $avg=(60 + $arrq2[$i]['total'])/2;
                        }else if($arrq2[$i]['total']==0){
                            $avg=(60 + $arrq1[$i]['total'])/2;
                        }
                    }else{
                        $avg = ($arrq1[$i]['total'] + $arrq2[$i]['total'])/2;
                    }

//                    else {
//                        $avg = ($arrq1[$i]['total'] + $arrq2[$i]['total'])/2;
//                    }
                    array_push($arrs1, [
                        'id' => $arrq2[$i]['id'],
                        's' => ($arrq1[$i]['s'] + $arrq2[$i]['s']) / 2,
                        'ss' => ($arrq1[$i]['ss'] + $arrq2[$i]['ss']) / 2,
                        'pc' => ($arrq1[$i]['pc'] + $arrq2[$i]['pc']) / 2,
                        'eng' => ($arrq1[$i]['eng'] + $arrq2[$i]['eng']) / 2,
                        'la' => ($arrq1[$i]['la'] + $arrq2[$i]['la']) / 2,
                        'd_a' => ($arrq1[$i]['d_a'] + $arrq2[$i]['d_a']) / 2,
                        'm' => ($arrq1[$i]['m'] + $arrq2[$i]['m']) / 2,
                        'me' => ($arrq1[$i]['me'] + $arrq2[$i]['me']) / 2,
                        'r_c' => ($arrq1[$i]['r_c'] + $arrq2[$i]['r_c']) / 2,
                        'pe' => ($arrq1[$i]['pe'] + $arrq2[$i]['pe']) / 2,
                        'avg' => $avg
                        ]
                    );
                }

                $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 2])->get();
                $rt = "
<button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button>
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Science</th>
                                  <th>Social Science</th>
                                  <th>Computer</th>
                                  <th>Engineering</th>
                                  <th>Language Arts</th>
                                  <th>Arts/Digital Arts</th>
                                  <th>Mathematics</th>
                                  <th>Moral Education</th>
                                  <th>Robotics & Coding</th>
                                  <th>Physical Education</th>
                                  <th>Average</th>
                                  <th>Grade</th>
                                  <th>Rank</th>
                                </tr>
                                </thead>
                                <tbody>";
                foreach ($tbd as $t) {
                    foreach ($arrs1 as $ar) {
                        if ($t->sid == $ar['id']) {
                            $s = $ar['s'];
                            $ss = $ar['ss'];
                            $pc = $ar['pc'];
                            $eng = $ar['eng'];
                            $la = $ar['la'];
                            $d_a = $ar['d_a'];
                            $m = $ar['m'];
                            $me = $ar['me'];
                            $r_c = $ar['r_c'];
                            $pe = $ar['pe'];
                            $avg = $ar['avg'];
                        }
                    }
                    $rt .= "
                    <tr>
                        <td style='text-align: center'>{$t->en_name}</td>
                        <td style='text-align: center'>{$s}</td>
                        <td style='text-align: center'>{$ss}</td>
                        <td style='text-align: center'>{$pc}</td>
                        <td style='text-align: center'>{$eng}</td>
                        <td style='text-align: center'>{$la}</td>
                        <td style='text-align: center'>{$d_a}</td>
                        <td style='text-align: center'>{$m}</td>
                        <td style='text-align: center'>{$me}</td>
                        <td style='text-align: center'>{$r_c}</td>
                        <td style='text-align: center'>{$pe}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$avg)."</td>
                        <td style='text-align: center'>{$this->gradeac($avg)}</td>
                        <td style='text-align: center'></td>
                    </tr>
                ";
                }
                $rt .= "</tbody></table>";
                return ['rt' => $rt];
            } else {
                return ['rt' => "<h3 style='text-align: center'>No Data To Calculate !</h3>"];
            }
        } elseif ($r->mid == 6) {
            $q3 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 3, 'deleted' => 0])->get();
            $q4 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 4, 'deleted' => 0])->get();
            if (count($q4) > 0) {
                $arrq3 = [];
                foreach ($q4 as $qt) {
                    $s = $qt->s;
                    $ss = $qt->ss;
                    $pc = $qt->pc;
                    $eng = $qt->eng;
                    $la = $qt->la;
                    $d_a = $qt->d_a;
                    $m = $qt->m;
                    $me = $qt->me;
                    $r_c = $qt->r_c;
                    $pe = $qt->pe;
                    $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
                    if(count(array_filter($arrcnt))>0){
                        $mult4 = count(array_filter($arrcnt));
                    }
                }
//                $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
//                $mult = count(array_filter($arrcnt));
                foreach ($q3 as $q) {
                    $quater3 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if(count(array_filter($quater3))>0){
                        $mults3 = count(array_filter($quater3));
                    }
                    array_push($arrq3, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mults3
                    ]);
                }
                $arrq4 = [];
                foreach ($q4 as $q) {
                    array_push($arrq4, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mult4
                    ]);
                }
                $arrs2 = [];
                $avg=0;
                for ($i = 0; $i < sizeof($arrq4); $i++) {
                    if ($arrq3[$i]['total']==0 || $arrq4[$i]['total']==0) {
                        $avg = 60;
                        if($arrq3[$i]['total']==0){
                            $avg=(60 + $arrq4[$i]['total'])/2;
                        }else if($arrq4[$i]['total']==0){
                            $avg=(60 + $arrq3[$i]['total'])/2;
                        }
                    }else{
                        $avg = ($arrq3[$i]['total'] + $arrq4[$i]['total'])/2;
                    }
                    array_push($arrs2, [
                        'id' => $arrq4[$i]['id'],
                        's' => ($arrq3[$i]['s'] + $arrq4[$i]['s']) / 2,
                        'ss' => ($arrq3[$i]['ss'] + $arrq4[$i]['ss']) / 2,
                        'pc' => ($arrq3[$i]['pc'] + $arrq4[$i]['pc']) / 2,
                        'eng' => ($arrq3[$i]['eng'] + $arrq4[$i]['eng']) / 2,
                        'la' => ($arrq3[$i]['la'] + $arrq4[$i]['la']) / 2,
                        'd_a' => ($arrq3[$i]['d_a'] + $arrq4[$i]['d_a']) / 2,
                        'm' => ($arrq3[$i]['m'] + $arrq4[$i]['m']) / 2,
                        'me' => ($arrq3[$i]['me'] + $arrq4[$i]['me']) / 2,
                        'r_c' => ($arrq3[$i]['r_c'] + $arrq4[$i]['r_c']) / 2,
                        'pe' => ($arrq3[$i]['pe'] + $arrq4[$i]['pe']) / 2,
                        'avg' => $avg
                        ]
                    );
                }
                $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 4])->get();
                $rt = "
<button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button>
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Science</th>
                                  <th>Social Science</th>
                                  <th>Computer</th>
                                  <th>Engineering</th>
                                  <th>Language Arts</th>
                                  <th>Arts/Digital Arts</th>
                                  <th>Mathematics</th>
                                  <th>Moral Education</th>
                                  <th>Robotics & Coding</th>
                                  <th>Physical Education</th>
                                  <th>Average</th>
                                  <th>Grade</th>
                                  <th>Rank</th>
                                </tr>
                                </thead>
                                <tbody>";
                foreach ($tbd as $t) {
                    foreach ($arrs2 as $ar) {
                        if ($t->sid == $ar['id']) {
                            $s = $ar['s'];
                            $ss = $ar['ss'];
                            $pc = $ar['pc'];
                            $eng = $ar['eng'];
                            $la = $ar['la'];
                            $d_a = $ar['d_a'];
                            $m = $ar['m'];
                            $me = $ar['me'];
                            $r_c = $ar['r_c'];
                            $pe = $ar['pe'];
                            $avg = $ar['avg'];
                        }
                    }
                    $rt .= "
                    <tr>
                        <td style='text-align: center'>{$t->en_name}</td>
                        <td style='text-align: center'>{$s}</td>
                        <td style='text-align: center'>{$ss}</td>
                        <td style='text-align: center'>{$pc}</td>
                        <td style='text-align: center'>{$eng}</td>
                        <td style='text-align: center'>{$la}</td>
                        <td style='text-align: center'>{$d_a}</td>
                        <td style='text-align: center'>{$m}</td>
                        <td style='text-align: center'>{$me}</td>
                        <td style='text-align: center'>{$r_c}</td>
                        <td style='text-align: center'>{$pe}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$avg)."</td>
                        <td style='text-align: center'>{$this->gradeac($avg)}</td>
                        <td style='text-align: center'></td>
                    </tr>
                ";
                }
                $rt .= "</tbody></table>";
                return ['rt' => $rt];
            } else {
                return ['rt' => "<h3 style='text-align: center'>No Data To Calculate !</h3>"];
            }
        } elseif ($r->mid == 7) {
            $q1 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 1, 'deleted' => 0])->get();
            $q2 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 2, 'deleted' => 0])->get();
            $q3 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 3, 'deleted' => 0])->get();
            $q4 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 4, 'deleted' => 0])->get();
            if (count($q4) > 0) {
                $arrq1 = [];
                foreach ($q2 as $qt) {
                    $s = $qt->s;
                    $ss = $qt->ss;
                    $pc = $qt->pc;
                    $eng = $qt->eng;
                    $la = $qt->la;
                    $d_a = $qt->d_a;
                    $m = $qt->m;
                    $me = $qt->me;
                    $r_c = $qt->r_c;
                    $pe = $qt->pe;
                    $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
                    if(count(array_filter($arrcnt))>0){
                        $mult = count(array_filter($arrcnt));
                    }
                }
//                $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
//                $mult = count(array_filter($arrcnt));
                foreach ($q1 as $q) {
                    $quater1 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if(count(array_filter($quater1))>0){
                        $mults = count(array_filter($quater1));
                    }
                    array_push($arrq1, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mults
                    ]);
                }
                $arrq2 = [];
                foreach ($q2 as $q) {
                    array_push($arrq2, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mult
                    ]);
                }
                $arrs1 = [];
                $avg=0;
                for ($i = 0; $i < sizeof($arrq2); $i++) {
//                    if (empty($arrq1[$i]['total'])) {
//                        $q1 = 60;
//                    } else {
//                        $q1 = $arrq1[$i]['total'];
//                    }
                    if ($arrq1[$i]['total']==0 || $arrq2[$i]['total']==0) {
                        $avg = 60;
                        if($arrq1[$i]['total']==0){
                            $avg=(60 + $arrq2[$i]['total'])/2;
                        }else if($arrq2[$i]['total']==0){
                            $avg=(60 + $arrq1[$i]['total'])/2;
                        }
                    }else{
                        $avg = ($arrq1[$i]['total'] + $arrq2[$i]['total'])/2;
                    }
                    array_push($arrs1, [
                        'id' => $arrq2[$i]['id'],
                        's' => ($arrq1[$i]['s'] + $arrq2[$i]['s']) / 2,
                        'ss' => ($arrq1[$i]['ss'] + $arrq2[$i]['ss']) / 2,
                        'pc' => ($arrq1[$i]['pc'] + $arrq2[$i]['pc']) / 2,
                        'eng' => ($arrq1[$i]['eng'] + $arrq2[$i]['eng']) / 2,
                        'la' => ($arrq1[$i]['la'] + $arrq2[$i]['la']) / 2,
                        'd_a' => ($arrq1[$i]['d_a'] + $arrq2[$i]['d_a']) / 2,
                        'm' => ($arrq1[$i]['m'] + $arrq2[$i]['m']) / 2,
                        'me' => ($arrq1[$i]['me'] + $arrq2[$i]['me']) / 2,
                        'r_c' => ($arrq1[$i]['r_c'] + $arrq2[$i]['r_c']) / 2,
                        'pe' => ($arrq1[$i]['pe'] + $arrq2[$i]['pe']) / 2,
                        'avg' => $avg]);
                }
                //End Semester 1
                //Semester 2
                $arrq3 = [];
                foreach ($q4 as $qt) {
                    $s = $qt->s;
                    $ss = $qt->ss;
                    $pc = $qt->pc;
                    $eng = $qt->eng;
                    $la = $qt->la;
                    $d_a = $qt->d_a;
                    $m = $qt->m;
                    $me = $qt->me;
                    $r_c = $qt->r_c;
                    $pe = $qt->pe;
                    $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
                    if(count(array_filter($arrcnt))>0){
                        $mult4 = count(array_filter($arrcnt));
                    }
                }
//                $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
//                $mult = count(array_filter($arrcnt));
                foreach ($q3 as $q) {
                    $quater3 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if(count(array_filter($quater3))>0){
                        $mults3 = count(array_filter($quater3));
                    }
                    array_push($arrq3, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mults3
                    ]);
                }
                $arrq4 = [];
                foreach ($q4 as $q) {
                    array_push($arrq4, [
                        'id' => $q->student_id,
                        's' => $q->s,
                        'ss' => $q->ss,
                        'pc' => $q->pc,
                        'eng' => $q->eng,
                        'la' => $q->la,
                        'd_a' => $q->d_a,
                        'm' => $q->m,
                        'me' => $q->me,
                        'r_c' => $q->r_c,
                        'pe' => $q->pe,
                        'total' => $q->total / $mult
                    ]);
                }
                $arrs2 = [];
                $avg=0;
                for ($i = 0; $i < sizeof($arrq4); $i++) {
//                    if (empty($arrq3[$i]['total'])) {
//                        $q1 = 60;
//                    } else {
//                        $q1 = $arrq3[$i]['total'];
//                    }
                    if ($arrq3[$i]['total']==0 || $arrq4[$i]['total']==0) {
                        $avg = 60;
                        if($arrq3[$i]['total']==0){
                            $avg=(60 + $arrq4[$i]['total'])/2;
                        }else if($arrq4[$i]['total']==0){
                            $avg=(60 + $arrq3[$i]['total'])/2;
                        }
                    }else{
                        $avg = ($arrq3[$i]['total'] + $arrq4[$i]['total'])/2;
                    }
                    array_push($arrs2, [
                        'id' => $arrq4[$i]['id'],
                        's' => ($arrq3[$i]['s'] + $arrq4[$i]['s']) / 2,
                        'ss' => ($arrq3[$i]['ss'] + $arrq4[$i]['ss']) / 2,
                        'pc' => ($arrq3[$i]['pc'] + $arrq4[$i]['pc']) / 2,
                        'eng' => ($arrq3[$i]['eng'] + $arrq4[$i]['eng']) / 2,
                        'la' => ($arrq3[$i]['la'] + $arrq4[$i]['la']) / 2,
                        'd_a' => ($arrq3[$i]['d_a'] + $arrq4[$i]['d_a']) / 2,
                        'm' => ($arrq3[$i]['m'] + $arrq4[$i]['m']) / 2,
                        'me' => ($arrq3[$i]['me'] + $arrq4[$i]['me']) / 2,
                        'r_c' => ($arrq3[$i]['r_c'] + $arrq4[$i]['r_c']) / 2,
                        'pe' => ($arrq3[$i]['pe'] + $arrq4[$i]['pe']) / 2,
                        'avg' => $avg]);
                }
                $arrf = [];
                for ($i = 0; $i < sizeof($arrs2); $i++) {
//                    if (empty($arrs1[$i]['avg'])) {
//                        $s1 = 60;
//                    } else {
//                        $s1 = $arrs1[$i]['avg'];
//                    }
                    if (empty($arrs1[$i]['avg'])|| empty($arrs2[$i]['avg'])) {
                        if(empty($arrs1[$i]['avg'])){
                          $s1=60;
                        }else if(empty($arrs2[$i]['avg'])){
                          $s1=60;
                        }
                    }else{
                        $s1 = $arrs1[$i]['avg'];
                    }
                    array_push($arrf, [
                        'id' => $arrs2[$i]['id'],
                        's' => ($s1[$i]['s'] + $arrs2[$i]['s']) / 2,
                        'ss' => ($s1['ss'] + $arrs2[$i]['ss']) / 2,
                        'pc' => ($s1['pc'] + $arrs2[$i]['pc']) / 2,
                        'eng' => ($s1['eng'] + $arrs2[$i]['eng']) / 2,
                        'la' => ($s1['la'] + $arrs2[$i]['la']) / 2,
                        'd_a' => ($s1['d_a'] + $arrs2[$i]['d_a']) / 2,
                        'm' => ($s1['m'] + $arrs2[$i]['m']) / 2,
                        'me' => ($s1['me'] + $arrs2[$i]['me']) / 2,
                        'r_c' => ($s1['r_c'] + $arrs2[$i]['r_c']) / 2,
                        'pe' => ($s1['pe'] + $arrs2[$i]['pe']) / 2,
                        'avg' => ($s1 + $arrs2[$i]['avg']) / 2
                    ]);
                }
                $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 4])->get();
                $rt = "
                <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Science</th>
                                  <th>Social Science</th>
                                  <th>Computer</th>
                                  <th>Engineering</th>
                                  <th>Language Arts</th>
                                  <th>Arts/Digital Arts</th>
                                  <th>Mathematics</th>
                                  <th>Moral Education</th>
                                  <th>Robotics & Coding</th>
                                  <th>Physical Education</th>
                                  <th>Average</th>
                                  <th>Grade</th>
                                  <th>Rank</th>
                                </tr>
                                </thead>
                                <tbody>";
                foreach ($tbd as $t) {
                    foreach ($arrf as $ar) {
                        if ($t->sid == $ar['id']) {
                            $s = $ar['s'];
                            $ss = $ar['ss'];
                            $pc = $ar['pc'];
                            $eng = $ar['eng'];
                            $la = $ar['la'];
                            $d_a = $ar['d_a'];
                            $m = $ar['m'];
                            $me = $ar['me'];
                            $r_c = $ar['r_c'];
                            $pe = $ar['pe'];
                            $avg = $ar['avg'];
                        }
                    }
                    $rt .= "
                    <tr>
                        <td style='text-align: center'>{$t->en_name}</td>
                        <td style='text-align: center'>{$s}</td>
                        <td style='text-align: center'>{$ss}</td>
                        <td style='text-align: center'>{$pc}</td>
                        <td style='text-align: center'>{$eng}</td>
                        <td style='text-align: center'>{$la}</td>
                        <td style='text-align: center'>{$d_a}</td>
                        <td style='text-align: center'>{$m}</td>
                        <td style='text-align: center'>{$me}</td>
                        <td style='text-align: center'>{$r_c}</td>
                        <td style='text-align: center'>{$pe}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$avg)."</td>
                        <td style='text-align: center'>{$this->gradeac($avg)}</td>
                        <td style='text-align: center'></td>
                    </tr>
                ";
                }
                $rt .= "</tbody></table>";
                return ['rt' => $rt];
            }else{
                return ['rt' => "<h3 style='text-align: center'>No Data To Calculate !</h3>"];
            }
        }else{
            $msc = DB::table('score_ac')->selectRaw('*,student.en_name, rank() over(ORDER BY total desc) as rank')->join('student','score_ac.student_id','=','student.id')->where(['class_id' => $r->cid, 'quarter' => $r->mid])->get();
            if(count($msc)>0) {
                $rt = "
                <table id='exps' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Science</th>
                                  <th>Social Science</th>
                                  <th>Computer</th>
                                  <th>Engineering</th>
                                  <th>Language Arts</th>
                                  <th>Arts/Digital Arts</th>
                                  <th>Mathematics</th>
                                  <th>Moral Education</th>
                                  <th>Robotics & Coding</th>
                                  <th>Physical Education</th>
                                  <th>Average</th>
                                  <th>Grade</th>
                                  <th>Rank</th>
                                </tr>
                                </thead>
                                <tbody>";
                foreach ($msc as $m) {
                    $cnt = [$m->s, $m->ss, $m->pc, $m->eng, $m->la, $m->d_a, $m->m, $m->me, $m->r_c, $m->pe];
                    if(count(array_filter($cnt))>0){
                        $avg = $m->total/count(array_filter($cnt));
                    }else{
                        $avg = 60;
                    }
                    $rt .= "
                    <tr>
                        <td style='text-align: center'>{$m->en_name}</td>
                        <td style='text-align: center'>{$this->ifn($m->s)}</td>
                        <td style='text-align: center'>{$this->ifn($m->ss)}</td>
                        <td style='text-align: center'>{$this->ifn($m->pc)}</td>
                        <td style='text-align: center'>{$this->ifn($m->eng)}</td>
                        <td style='text-align: center'>{$this->ifn($m->la)}</td>
                        <td style='text-align: center'>{$this->ifn($m->d_a)}</td>
                        <td style='text-align: center'>{$this->ifn($m->m)}</td>
                        <td style='text-align: center'>{$this->ifn($m->me)}</td>
                        <td style='text-align: center'>{$this->ifn($m->r_c)}</td>
                        <td style='text-align: center'>{$this->ifn($m->pe)}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$avg)."</td>
                        <td style='text-align: center'>{$this->gradeac($avg)}</td>
                        <td style='text-align: center'>{$m->rank}</td>
                    </tr>
                ";
                }
                $rt .= "</tbody></table>";
                return ['rt' => $rt];
            }else{
                return ['rt' => "<h3 style='text-align: center'>No Data To Calculate !</h3>"];
            }
        }
    }
}


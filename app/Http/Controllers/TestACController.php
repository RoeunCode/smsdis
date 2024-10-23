<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Scoreac;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
class TestACController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 2, 'campus_id' => Auth::user()->camp_id])->get();
        $mo = DB::table('quarter')->get();
        return view('report.testreportac')->with(['cl' => $cl, 'mo' => $mo]);

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
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
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

    private function ifn($num)
    {
//            if($num == null ) {
//    //            $r = "<i class='fas fa-ban'></i>";
//                $r = "<i class='fas fa-ban'></i>";
//
//                return $r;
//
//            }else{
//                $r=$num;
//                return $r;
//            }
        if ($num == 0) {
            if (is_null($num)) {
                return "<i class='fas fa-ban'></i>";
            }
            return 0;
        } else {
            return $num;
        }
    }

    public function testajax_ac(Request $r)
    {
        if ($r->mid == 5) {
            $q1 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 1, 'deleted' => 0])->get();
            $q2 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 2, 'deleted' => 0])->get();
            if (count($q2) > 0) {
                $arrq1 = [];
                $arrq2 = [];
                foreach ($q1 as $q) {
                    $quater1 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if (count(array_filter($quater1, 'strlen')) > 0) {
                        $mults = count(array_filter($quater1, 'strlen'));
                    }else{
                        $mults=1;
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
                foreach ($q2 as $q) {
                    $arrcnt = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
//                    print_r(array_filter($arrcnt,'strlen'));
                    if (count(array_filter($arrcnt, 'strlen')) > 0) {
                        $mult = count(array_filter($arrcnt, 'strlen'));
                    }else{
                        $mult=1;
                    }
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
                $avg = 0;
                $coefficient = 0;
                for ($i = 0; $i < sizeof($arrq2); $i++) {
                    if ($arrq1[$i]['total'] == 0 || $arrq2[$i]['total'] == 0) {
                        //
                        $coefficient = 1;
                    } else {
                        $coefficient = 2;
                    }
                    $avg = ($arrq1[$i]['total'] + $arrq2[$i]['total']) / $coefficient;
                    array_push($arrs1, [
                            'id' => $arrq2[$i]['id'],
                            's' => ($arrq1[$i]['s'] + $arrq2[$i]['s']) / $coefficient,
                            'ss' => ($arrq1[$i]['ss'] + $arrq2[$i]['ss']) / $coefficient,
                            'pc' => ($arrq1[$i]['pc'] + $arrq2[$i]['pc']) / $coefficient,
                            'eng' => ($arrq1[$i]['eng'] + $arrq2[$i]['eng']) / $coefficient,
                            'la' => ($arrq1[$i]['la'] + $arrq2[$i]['la']) / $coefficient,
                            'd_a' => ($arrq1[$i]['d_a'] + $arrq2[$i]['d_a']) / $coefficient,
                            'm' => ($arrq1[$i]['m'] + $arrq2[$i]['m']) / $coefficient,
                            'me' => ($arrq1[$i]['me'] + $arrq2[$i]['me']) / $coefficient,
                            'r_c' => ($arrq1[$i]['r_c'] + $arrq2[$i]['r_c']) / $coefficient,
                            'pe' => ($arrq1[$i]['pe'] + $arrq2[$i]['pe']) / $coefficient,
                            'avg' => $avg
                        ]
                    );
                }
                $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 2])->get();
                $rt = "
                            <h3 style='text-align: center;font-family: Battambang'>ពិន្ទុនៃការប្រឡងប្រចាំឆមាសទី១កម្មវិធី American </h3>
                            <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button>
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                            <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                            <thead>
                                            <tr style='text-align: center;font-size: 12px'>
                                              <th>Student Name</th>
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
                                    <tr style='text-align: center;font-size: 12px'>
                                        <td style='text-align: center'>{$t->en_name}</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $s)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $ss)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $pc)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $eng)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $la)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $d_a)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $m)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $me)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $r_c)."</td>
                                        <td style='text-align: center'>".sprintf("%0.2f", $pe)."</td>
                                        <td style='text-align: center'>" . sprintf("%0.2f", $avg) . "</td>
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
//                   print_r(array_filter($arrcnt,'strlen'));
                    if (count(array_filter($arrcnt, 'strlen')) > 0) {
                        $mult4 = count(array_filter($arrcnt, 'strlen'));
                    }else{
                        $mult4=1;
                    }

                }

//                $arrcnt = [$s, $ss, $pc, $eng, $la, $d_a, $m, $me, $r_c, $pe];
//                $mult = count(array_filter($arrcnt));
                foreach ($q3 as $q) {
                    $quater3 = [$q->s, $q->ss, $q->pc, $q->eng, $q->la, $q->d_a, $q->m, $q->me, $q->r_c, $q->pe];
                    if (count(array_filter($quater3, 'strlen')) > 0) {
                        $mults3 = count(array_filter($quater3, 'strlen'));
                    }else{
                        $mults3=1;
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
                $avg = 0;
                $coefficient = 0;
                for ($i = 0; $i < sizeof($arrq4); $i++) {
                    if ($arrq3[$i]['total'] == 0 || $arrq4[$i]['total'] == 0) {
                        $coefficient = 1;
                    } else {

                        $coefficient = 2;

                    }
                    $avg = ($arrq3[$i]['total'] + $arrq4[$i]['total']) / $coefficient;

                    array_push($arrs2, [
                            'id' => $arrq4[$i]['id'],
                            's' => ($arrq3[$i]['s'] + $arrq4[$i]['s']) / $coefficient,
                            'ss' => ($arrq3[$i]['ss'] + $arrq4[$i]['ss']) / $coefficient,
                            'pc' => ($arrq3[$i]['pc'] + $arrq4[$i]['pc']) / $coefficient,
                            'eng' => ($arrq3[$i]['eng'] + $arrq4[$i]['eng']) / $coefficient,
                            'la' => ($arrq3[$i]['la'] + $arrq4[$i]['la']) / $coefficient,
                            'd_a' => ($arrq3[$i]['d_a'] + $arrq4[$i]['d_a']) / $coefficient,
                            'm' => ($arrq3[$i]['m'] + $arrq4[$i]['m']) / $coefficient,
                            'me' => ($arrq3[$i]['me'] + $arrq4[$i]['me']) / $coefficient,
                            'r_c' => ($arrq3[$i]['r_c'] + $arrq4[$i]['r_c']) / $coefficient,
                            'pe' => ($arrq3[$i]['pe'] + $arrq4[$i]['pe']) / $coefficient,
                            'avg' => $avg
                        ]
                    );
                }
                $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 4])->get();
                $rt = "
                            <h3 style='text-align: center;font-family: Battambang'>ពិន្ទុនៃការប្រឡងប្រចាំឆមាសទី២កម្មវិធី American </h3>
                            <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button>
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                            <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr style='text-align: center;font-size: 12px'>
                                  <th>Student Name</th>
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
                            <tr style='text-align: center;font-size: 12px'>
                                <td style='text-align: center'>{$t->en_name}</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $s)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $ss)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $pc)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $eng)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $la)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $d_a)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $m)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $me)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $r_c)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $pe)."</td>
                                <td style='text-align: center'>" . sprintf("%0.2f", $avg) . "</td>
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
            $arr1 = [];
            $arr2 = [];
            $arr3 = [];
            $arr4 = [];
            //c_t varilble for store to mutl data
            $q1 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 1, 'deleted' => 0])->get();
            $q2 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 2, 'deleted' => 0])->get();
            $q3 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 3, 'deleted' => 0])->get();
            $q4 = Scoreac::where(['class_id' => $r->cid, 'quarter' => 4, 'deleted' => 0])->get();
            if (count($q1) > 0) {
                foreach ($q1 as $q) {
                    if(is_null($q->test_null) && $q->total==0)
                    {
                        $c_t=0;
                    }else{
                        $c_t=1;
                    }
                    array_push($arr1, [
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
                        'test_null' => $q->test_null,
                        'c_t'=>$c_t
                    ]);
                }
            }
            if (count($q2) > 0) {
                foreach ($q2 as $q) {
                    if(is_null($q->test_null) && $q->total==0)
                    {
                        $c_t=0;
                    }else{
                        $c_t=1;
                    }
                    array_push($arr2, [
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
                        'test_null' => $q->test_null,
                        'c_t'=>$c_t
                    ]);
                }
            };
            if (count($q3) > 0) {
                foreach ($q3 as $q) {
                    if(is_null($q->test_null) && $q->total==0)
                    {
                        $c_t=0;
                    }else{
                        $c_t=1;
                    }
                    array_push($arr3, [
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
                        'test_null' => $q->test_null,
                        'c_t'=>$c_t
                    ]);
                }
            }
            if (count($q4) > 0) {
                foreach ($q4 as $q) {
                    if(is_null($q->test_null) && $q->total==0)
                    {
                        $c_t=0;
                    }else{
                        $c_t=1;
                    }
                    array_push($arr4, [
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
                        'test_null' => $q->test_null,
                        'c_t'=>$c_t
                    ]);
                }
            }
            $res = [];
            for ($i = 0; $i < sizeof($q4); $i++) {
                $count =  ($arr1[$i]['c_t'] + $arr2[$i]['c_t'] + $arr3[$i]['c_t'] + $arr4[$i]['c_t']);
                if ($count <= 0) $count = 1;
                $d_a = ($arr1[$i]['d_a'] + $arr2[$i]['d_a'] + $arr3[$i]['d_a'] + $arr4[$i]['d_a'])/$count;
                $eng = ($arr1[$i]['eng'] + $arr2[$i]['eng'] + $arr3[$i]['eng'] + $arr4[$i]['eng'])/$count;
                $la = ($arr1[$i]['la'] + $arr2[$i]['la'] + $arr3[$i]['la'] + $arr4[$i]['la'])/$count;
                $m = ($arr1[$i]['m'] + $arr2[$i]['m'] + $arr3[$i]['m'] + $arr4[$i]['m'])/$count;
                $me = ($arr1[$i]['me'] + $arr2[$i]['me'] + $arr3[$i]['me'] + $arr4[$i]['me'])/$count;
                $pc = ($arr1[$i]['pc'] + $arr2[$i]['pc'] + $arr3[$i]['pc'] + $arr4[$i]['pc'])/$count;
                $pe = ($arr1[$i]['pe'] + $arr2[$i]['pe'] + $arr3[$i]['pe'] + $arr4[$i]['pe'])/$count;
                $r_c = ($arr1[$i]['r_c'] + $arr2[$i]['r_c'] + $arr3[$i]['r_c'] + $arr4[$i]['r_c'])/$count;
                $s = ($arr1[$i]['s'] + $arr2[$i]['s'] + $arr3[$i]['s'] + $arr4[$i]['s'])/$count;
                $ss = ($arr1[$i]['ss'] + $arr2[$i]['ss'] + $arr3[$i]['ss'] + $arr4[$i]['ss'])/$count;
                $avg = ($d_a + $eng + $la + $m + $me + $pc + $pe + $r_c + $s + $ss)/10;
                array_push($res, [
                    'id' => $arr4[$i]['id'],
                    's' => $s,
                    'ss' => $ss,
                    'pc' => $pc,
                    'eng' => $eng,
                    'la' => $la,
                    'd_a' => $d_a,
                    'm' => $m,
                    'me' => $me,
                    'r_c' => $r_c,
                    'pe' => $pe,
                    'avg' => $avg,
                    'ct'=>$count
                ]);
            }
            $tbd = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => 4])->get();
            $rt = "
                            <h3 style='text-align: center;font-family: Battambang'>ពិន្ទុនៃការប្រឡង Final កម្មវិធី American </h3>
                            <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;Export To Excel</button>
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;Print</button>
                            <table id='exp' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr style='text-align: center;font-size: 12px'>
                                      <th>Student Name</th>
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
                    foreach ($res as $ar) {
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
                                <tr style='text-align: center;font-size: 12px'>
                                    <td style='text-align: center;font-size: 12px'>{$t->en_name}</td>
                                    <td style='text-align: center;font-size: 12px'>".sprintf("%0.2f", $s)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $ss)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $pc)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $eng)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $la)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $d_a)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $m)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $me)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $r_c)."</td>
                                    <td style='text-align: center'>".sprintf("%0.2f", $pe)."</td>
                                    <td style='text-align: center'>" . sprintf("%0.2f", $avg) . "</td>
                                    <td style='text-align: center'>{$this->gradeac($avg)}</td>
                                    <td style='text-align: center'></td>
                                </tr>
                            ";
                }
                $rt .= "</tbody></table>";
            return ['rt' => $rt,'r'=>$res];

        }
        else{

                    $msc = DB::table('score_ac')->selectRaw('*,student.en_name, rank() over(ORDER BY total desc) as rank')->join('student','score_ac.student_id','=','student.id')->where(['class_id' => $r->cid, 'quarter' => $r->mid])->get();
                    if(count($msc)>0) {
                        $rt = "
                         <h3 style='text-align: center;font-family: Battambang'>ពិន្ទុនៃការប្រឡងប្រចាំត្រីមាសកម្មវិធី American </h3>
                        <table id='exps' class='table table-bordered table-condensed  animated slideInDown fast'>
                                        <thead>
                                            <tr style='text-align: center;font-size: 12px'>
                                                  <th>Student Name</th>
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
                                //for array_filter with 0 number
    //                          print_r(array_filter($cnt,'strlen'));
                            if(count(array_filter($cnt,'strlen'))>0) {
                                    $avg = $m->total / count(array_filter($cnt,'strlen'));
                            }else{
                                $avg=0;
                            }
                            $rt .= "
                                <tr style='text-align: center;font-size: 12px'>
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


<?php

namespace App\Http\Controllers;

use App\Scoreac;
use App\ScoreCCOnline;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use function PHPUnit\Framework\StaticAnalysis\HappyPath\AssertIsArray\consume;

class ScoreacController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 1){
            $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 2])->get();
        }else{
            $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 2,'campus_id'=>Auth::user()->camp_id])->get();
        }
        $mo = DB::table('quarter')->whereBetween('id',[1,4])->get();
        return view('score.scoreac')->with(['cl' => $cl, 'mo' => $mo]);
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

    }

    public function ajscore(Request $r)
    {
        $sc = DB::table('score_ac')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_ac.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'quarter' => $r->mid])->get();
        $stic = DB::table('student_class')->select(['*', 'student.id as sid'])->join('student', 'student_class.student_id', '=', 'student.id')->where('class_id', '=', $r->cid)->get();
        if (count($sc) > 0) {
            $rt = "
                            <table id='tb' class='table table-bordered table-condensed  animated slideInDown fast'>
                                <thead>
                                <tr>
                                  <th style='display: none'>ID</th>
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
                                </tr>
                                </thead>
                                <tbody>";
            $i = 1;
            foreach ($sc as $s) {
                $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->en_name}</td>
                        <td><input class='intsc form-control ' type='text' id='s{$i}' value='{$s->s}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\" ></td>
                        <td><input class='intsc form-control '  type='text' id='ss{$i}' value='{$s->ss}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control '  type='text' id='pc{$i}' value='{$s->pc}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control '  type='text' id='eng{$i}' value='{$s->eng}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control '  type='text' id='la{$i}' value='{$s->la}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' type='text' id='d_a{$i}' value='{$s->d_a}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"'></td>
                        <td><input class='intsc form-control '  type='text' id='m{$i}' value='{$s->m}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' type='text' id='me{$i}' value='{$s->me}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control '  type='text' id='r_c{$i}' value='{$s->r_c}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control '  type='text' id='pe{$i}' value='{$s->pe}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                      
                        </tr>
                        ";
                $i++;
            }
            $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='mid' value='{$r->mid}'>";
            return ['rt' => $rt];
        } else {
            $rt = "
                           <table id='tb' class='table table-bordered table-condensed  animated slideInDown fast'>
                               <thead>
                               <tr>
                                  <th  style='display: none' >ID</th>
                                  <th>Name</th>
                                  <th>Science</th>
                                  <th>Social Science</th>
                                  <th>Computer</th>
                                  <th>Engineering</th>
                                  <th>Language Arts</th>
                                  <th>Arts/Digital Arts<                                                                                                                                                                                                                                                                                                                                                                                                                                                                       /th>
                                  <th>Mathematics</th>
                                  <th>Moral Education</th>
                                  <th>Robotics & Coding</th>
                                  <th>Physical Education</th>
                                </tr>
                                </thead><tbody>";
            $i = 1;
            foreach ($stic as $s) {
                $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->en_name}</td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='s{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='ss{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='pc{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='eng{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='la{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='d_a{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='m{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='me{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='r_c{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                        <td><input class='intsc form-control ' style='width: 5rem' type='text' id='pe{$i}' maxlength=\"3\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\"></td>
                      
                        </tr>
                        ";
                $i++;
        }
        $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='mid' value='{$r->mid}'>";
        return ['rt' => $rt];
        }
    }
    public function inscoreac(Request $r)
    {
        $arr = $r->data;
        for ($i = 1; $i <= count($arr); $i++) {
            $old = Scoreac::where(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'quarter' => $arr[$i]['quarter']])->get();
            if (count($old) > 0) {
                Scoreac::updateOrCreate(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'quarter' => $arr[$i]['quarter']], [
                    'student_id' => $arr[$i]['student_id'],
                    'class_id' => $arr[$i]['class_id'],
                    'quarter' => $arr[$i]['quarter'],
                    's' => $arr[$i]['s'],
                    'ss' => $arr[$i]['ss'],
                    'pc' => $arr[$i]['pc'],
                    'eng' => $arr[$i]['eng'],
                    'la' => $arr[$i]['la'],
                    'd_a' => $arr[$i]['d_a'],
                    'm' => $arr[$i]['m'],
                    'me' => $arr[$i]['me'],
                    'r_c' => $arr[$i]['r_c'],
                    'pe' => $arr[$i]['pe'],
                    'updated_by' => Auth::id(),
                ]);
            } else {
                Scoreac::updateOrCreate(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'quarter' => $arr[$i]['quarter']], [
                    'student_id' => $arr[$i]['student_id'],
                    'class_id' => $arr[$i]['class_id'],
                    'quarter' => $arr[$i]['quarter'],
                    's' => $arr[$i]['s'],
                    'ss' => $arr[$i]['ss'],
                    'pc' => $arr[$i]['pc'],
                    'eng' => $arr[$i]['eng'],
                    'la' => $arr[$i]['la'],
                    'd_a' => $arr[$i]['d_a'],
                    'm' => $arr[$i]['m'],
                    'me' => $arr[$i]['me'],
                    'r_c' => $arr[$i]['r_c'],
                    'pe' => $arr[$i]['pe'],
                    'created_by' => Auth::id(),
                ]);
            }
        }
        return 1;
    }


}


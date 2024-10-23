<?php

namespace App\Http\Controllers;

use App\ScoreFLA;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ScoreFLAController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 1){
            $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 3])->get();
        }else{
            $cl = DB::table('v_search_class_en')->where(['deleted' => 0, 'cur_id' => 3,'campus_id'=>Auth::user()->camp_id])->get();
        }
        $mo = DB::table('month_fla')->whereBetween('id', [1, 12])->get();
        return view('score.scorefla')->with(['cl' => $cl, 'mo' => $mo]);
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

    public function ajscore(Request $r)
    {
        $sc = DB::table('score_fla')->select(['*', 'student.en_name as en_name', 'student.id as sid'])->join('student', 'score_fla.student_id', '=', 'student.id')->where(['class_id' => $r->cid, 'month_id' => $r->mid])->get();
        $stic = DB::table('student_class')->select(['*', 'student.id as sid'])->join('student', 'student_class.student_id', '=', 'student.id')->where('class_id', '=', $r->cid)->get();
        $cl = DB::table('class')->where('id', '=', $r->cid)->get();
        if (count($sc) > 0) {
            $rt = "
                            <table id='tb' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th style='display: none'>ID</th>
                                  <th>Name</th>
                                  <th>Reading</th>
                                  <th>Speaking</th>
                                  <th>Listening</th>
                                  <th>Writing</th>
                                  <th>Grammar</th>
                                  <th>Vocabulary</th>
                                  <th>Homework</th>
                                  <th>Class Participation</th>
                                </tr>
                                </thead>
                                <tbody>";
            $i = 1;
            foreach ($sc as $s) {
                $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->en_name}</td>
                        <td><input class='intsc' type='number' id='r{$i}' value='{$s->r}'></td>
                        <td><input class='intsc' type='number' id='s{$i}' value='{$s->s}'></td>
                        <td><input class='intsc' type='number' id='l{$i}' value='{$s->l}'></td>
                        <td><input class='intsc' type='number' id='w{$i}' value='{$s->w}'></td>
                        <td><input class='intsc' type='number' id='g{$i}' value='{$s->g}'></td>
                        <td><input class='intsc' type='number' id='v{$i}' value='{$s->v}'></td>
                        <td><input class='intsc' type='number' id='h{$i}' value='{$s->h}'></td>
                        <td><input class='intsc' type='number' id='cp{$i}' value='{$s->cp}'></td>
                        </tr>
                        ";
                $i++;
            }
            $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='mid' value='{$r->mid}'>";
            return ['rt' => $rt];
        } else {
            $rt = "
                           <table id='tb' class='table table-bordered table-condensed'>
                               <thead>
                               <tr>
                                   <th  style='display: none' >ID</th>
                                  <th>Name</th>
                                  <th>Reading</th>
                                  <th>Speaking</th>
                                  <th>Listening</th>
                                  <th>Writing</th>
                                  <th>Grammar</th>
                                  <th>Vocabulary</th>
                                  <th>Homework</th>
                                  <th>Class Participation</th>
                                </tr>
                                </thead><tbody>";
            $i = 1;
            foreach ($stic as $s) {
                $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->en_name}</td>
                        <td><input class='intsc' type='number' id='r{$i}'></td>
                        <td><input class='intsc' type='number' id='s{$i}'></td>
                        <td><input class='intsc' type='number' id='l{$i}'></td>
                        <td><input class='intsc' type='number' id='w{$i}'></td>
                        <td><input class='intsc' type='number' id='g{$i}'></td>
                        <td><input class='intsc' type='number' id='v{$i}'></td>
                        <td><input class='intsc' type='number' id='h{$i}'></td>
                        <td><input class='intsc' type='number' id='cp{$i}'></td>
                        </tr>
                        ";
                $i++;
            }
            $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='mid' value='{$r->mid}'>";
            return ['rt' => $rt];
        }
    }

    public function inscorefla(Request $r)
    {
        $arr = $r->data;
        for ($i = 1; $i <= count($arr); $i++) {
            $old = ScoreFLA::where(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'month_id' => $arr[$i]['month_id']])->get();
            if (count($old) > 0) {
                ScoreFLA::updateOrCreate(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'month_id' => $arr[$i]['month_id']], [
                    'student_id' => $arr[$i]['student_id'],
                    'class_id' => $arr[$i]['class_id'],
                    'month_id' => $arr[$i]['month_id'],
                    'r' => $arr[$i]['r'],
                    's' => $arr[$i]['s'],
                    'l' => $arr[$i]['l'],
                    'w' => $arr[$i]['w'],
                    'g' => $arr[$i]['g'],
                    'v' => $arr[$i]['v'],
                    'h' => $arr[$i]['h'],
                    'cp' => $arr[$i]['cp'],
                    'updated_by'=>Auth::id(),
                ]);
            } else {
                ScoreFLA::updateOrCreate(['student_id' => $arr[$i]['student_id'], 'class_id' => $arr[$i]['class_id'], 'month_id' => $arr[$i]['month_id']], [
                    'student_id' => $arr[$i]['student_id'],
                    'class_id' => $arr[$i]['class_id'],
                    'month_id' => $arr[$i]['month_id'],
                    'r' => $arr[$i]['r'],
                    's' => $arr[$i]['s'],
                    'l' => $arr[$i]['l'],
                    'w' => $arr[$i]['w'],
                    'g' => $arr[$i]['g'],
                    'v' => $arr[$i]['v'],
                    'h' => $arr[$i]['h'],
                    'cp' => $arr[$i]['cp'],
                    'created_by'=>Auth::id(),
                ]);
            }
        }
        return 1;
    }
}

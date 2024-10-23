<?php

namespace App\Http\Controllers;

use App\Scorecc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ScoreccController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 1){
            $cl = DB::table('v_search_class')->where(['deleted'=>0,'cur_id'=>1])->get();
        }else{
            $cl = DB::table('v_search_class')->where(['deleted'=>0,'cur_id'=>1,'campus_id'=>Auth::user()->camp_id])->get();
        }
        $mo = DB::table('month')->get();
        return view('score.scorecc')->with(['cl'=>$cl,'mo'=>$mo]);
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

    public function ajscore(Request $r)
    {
        $sc = DB::table('score_cc')->select(['*','student.kh_name as kh_name','student.id as sid'])->join('student','score_cc.student_id','=','student.id')->where(['class_id' => $r->cid, 'month_id' => $r->mid])->get();
        $stic = DB::table('student_class')->select(['*','student.id as sid'])->join('student','student_class.student_id','=','student.id')->where('class_id','=',$r->cid)->get();
        $cl = DB::table('class')->where('id','=',$r->cid)->get();
        foreach($sc as $s){
            $ao = $s->avg_m;
        }
        if (count($sc) > 0) {
            $rt = "
                            <table id='tb' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th style='display: none'>ID</th>
                                  <th>ឈ្មោះ</th>
                                  <th>ភាសាខ្មែរ</th>
                                  <th>ពលរដ្ធវិជ្ជា</th>
                                  <th>ប្រវ័ត្តវិទ្យា</th>
                                  <th>ភូមិវិទ្យា</th>
                                  <th>គិណិតវិទ្យា</th>
                                  <th>រូបវិទ្យា</th>
                                  <th>គីមីវិទ្យា</th>
                                  <th>ជីវះវិទ្យា</th>
                                  <th>ផែនដីវិទ្យា</th>
                                  <th>អង់គ្លេស</th>
                                </tr>
                                </thead>
                                <tbody>";
            $i = 1;
            foreach ($sc as $s) {
                $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->kh_name}</td>
                        <td><input class='intsc' type='number' id='k{$i}' value='{$s->k}'></td>
                        <td><input class='intsc' type='number' id='ph{$i}' value='{$s->ph}'></td>
                        <td><input class='intsc' type='number' id='h{$i}' value='{$s->h}'></td>
                        <td><input class='intsc' type='number' id='g{$i}' value='{$s->g}'></td>
                        <td><input class='intsc' type='number' id='m{$i}' value='{$s->m}'></td>
                        <td><input class='intsc' type='number' id='p{$i}' value='{$s->p}'></td>
                        <td><input class='intsc' type='number' id='c{$i}' value='{$s->c}'></td>
                        <td><input class='intsc' type='number' id='b{$i}' value='{$s->b}'></td>
                        <td><input class='intsc' type='number' id='e{$i}' value='{$s->e}'></td>
                        <td><input class='intsc' type='number' id='eng{$i}' value='{$s->eng}'></td>
                        </tr>
                        ";
                $i++;
            }
            $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='avg_o' value='{$ao}'><input type='hidden' id='mid' value='{$r->mid}'>";
            return ['rt'=>$rt];
        } else {
            if($r->mid == 13){
                $rt = "
                    <div style='text-align: center'><h3>ពិន្ទុប្រចាំឆ្នាំមិនតម្រូវអោយបញ្ចូល !</h3></div>
                ";
                return ['rt'=>$rt,'mst'=>true];
            }else{
                $rt = "
                           <table id='tb' class='table table-bordered table-condensed'>
                               <thead>
                               <tr>
                                    <th  style='display: none' >ID</th>
                                   <th>ឈ្មោះ</th>
                                  <th>ភាសាខ្មែរ</th>
                                  <th>ពលរដ្ធវិជ្ជា</th>
                                  <th>ប្រវ័ត្តវិទ្យា</th>
                                  <th>ភូមិវិទ្យា</th>
                                  <th>គិណិតវិទ្យា</th>
                                  <th>រូបវិទ្យា</th>
                                  <th>គីមីវិទ្យា</th>
                                  <th>ជីវះវិទ្យា</th>
                                  <th>ផែនដីវិទ្យា</th>
                                  <th>អង់គ្លេស</th>
                                </tr>
                                </thead><tbody>";
                $i = 1;
                foreach ($stic as $s) {
                    $rt .= "
                        <tr style='text-align: center'>
                        <td  style='display: none' id='sid{$i}'>{$s->sid}</td>
                        <td>{$s->kh_name}</td>
                        <td><input class='intsc' type='number' id='k{$i}'></td>
                        <td><input class='intsc' type='number' id='ph{$i}'></td>
                        <td><input class='intsc' type='number' id='h{$i}'></td>
                        <td><input class='intsc' type='number' id='g{$i}'></td>
                        <td><input class='intsc' type='number' id='m{$i}'></td>
                        <td><input class='intsc' type='number' id='p{$i}'></td>
                        <td><input class='intsc' type='number' id='c{$i}'></td>
                        <td><input class='intsc' type='number' id='b{$i}'></td>
                        <td><input class='intsc' type='number' id='e{$i}'></td>
                        <td><input class='intsc' type='number' id='eng{$i}'></td>
                        </tr>
                        ";
                    $i++;
                }
                $rt .= "</tbody></table><input type='hidden' id='cid' value='{$r->cid}'><input type='hidden' id='mid' value='{$r->mid}'>";
                return ['rt'=>$rt];
            }
        }
    }

    public function inscorecc(Request $r)
    {
        $arr = $r->data;
        for($i=1;$i<=count($arr);$i++){
            $old = Scorecc::where(['student_id'=>$arr[$i]['student_id'],'class_id'=>$arr[$i]['class_id'],'month_id'=>$arr[$i]['month_id']])->get();
            if(count($old)>0){
                Scorecc::updateOrCreate(['student_id'=>$arr[$i]['student_id'],'class_id'=>$arr[$i]['class_id'],'month_id'=>$arr[$i]['month_id']],[
                    'student_id'=> $arr[$i]['student_id'],
                    'class_id'=>$arr[$i]['class_id'],
                    'month_id'=>$arr[$i]['month_id'],
                    'avg_m'=>$arr[$i]['avg_m'],
                    'eng'=>$arr[$i]['eng'],
                    'b'=>$arr[$i]['b'],
                    'c'=>$arr[$i]['c'],
                    'e'=>$arr[$i]['e'],
                    'g'=>$arr[$i]['g'],
                    'h'=>$arr[$i]['h'],
                    'k'=>$arr[$i]['k'],
                    'm'=>$arr[$i]['m'],
                    'p'=>$arr[$i]['p'],
                    'ph'=>$arr[$i]['ph'],
                    'updated_by'=>Auth::id(),
                ]);
            }else{
                Scorecc::updateOrCreate(['student_id'=>$arr[$i]['student_id'],'class_id'=>$arr[$i]['class_id'],'month_id'=>$arr[$i]['month_id']],[
                    'student_id'=> $arr[$i]['student_id'],
                    'class_id'=>$arr[$i]['class_id'],
                    'month_id'=>$arr[$i]['month_id'],
                    'avg_m'=>$arr[$i]['avg_m'],
                    'eng'=>$arr[$i]['eng'],
                    'b'=>$arr[$i]['b'],
                    'c'=>$arr[$i]['c'],
                    'e'=>$arr[$i]['e'],
                    'g'=>$arr[$i]['g'],
                    'h'=>$arr[$i]['h'],
                    'k'=>$arr[$i]['k'],
                    'm'=>$arr[$i]['m'],
                    'p'=>$arr[$i]['p'],
                    'ph'=>$arr[$i]['ph'],
                    'created_by'=>Auth::id(),
                ]);
            }
        }
        return 1;
    }
}

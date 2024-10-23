<?php

namespace App\Http\Controllers;

use App\Scorecc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportCCController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cl = DB::table('v_search_class')->where(['deleted'=>0,'cur_id'=>1])->get();
        $mo = DB::table('month')->get();
        return view('report.reportcc')->with(['cl'=>$cl,'mo'=>$mo]);
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

    private function ccrnk($avg){
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

    public function ajreport(Request $r)
    {
        if($r->mid == 3) {
            $ss1 = DB::table('score_cc')->selectRaw('*,score_cc.student_id,student.kh_name as kh_name')->join('student','score_cc.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $r->cid, 'score_cc.deleted' => 0])->get();
            $m1 = Scorecc::where(['month_id' => 12, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m2 = Scorecc::where(['month_id' => 1, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m3 = Scorecc::where(['month_id' => 2, 'class_id' => $r->cid, 'deleted' => 0])->get();
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
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>ពលរដ្ធ</th>
                                  <th style='text-align: center'>ប្រវ័ត្តិ</th>
                                  <th style='text-align: center'>ភូមិ</th>
                                  <th style='text-align: center'>គិណិត</th>
                                  <th style='text-align: center'>រូប</th>
                                  <th style='text-align: center'>គីមី</th>
                                  <th style='text-align: center'>ជីវៈ</th>
                                  <th style='text-align: center'>ផែនដី</th>
                                  <th style='text-align: center'>អង់គ្លេស</th>
                                  <th style='text-align: center'>មធ្យមភាគខែ</th>
                                  <th style='text-align: center'>មធ្យមភាគឆមាស</th>
                                  <th style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី១</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($ss1 as $s){
                foreach($arrms1 as $am){
                    if($am['id'] == $s->student_id){
                        //ERROR Maybe Duplicate  Filed Student_id on Table Student with Student_id in table score_cc
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
                        <td style='text-align: center'>{$s->k}</td>
                        <td style='text-align: center'>{$s->ph}</td>
                        <td style='text-align: center'>{$s->h}</td>
                        <td style='text-align: center'>{$s->g}</td>
                        <td style='text-align: center'>{$s->m}</td>
                        <td style='text-align: center'>{$s->p}</td>
                        <td style='text-align: center'>{$s->c}</td>
                        <td style='text-align: center'>{$s->b}</td>
                        <td style='text-align: center'>{$s->e}</td>
                        <td style='text-align: center'>{$s->eng}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->ccrnk($fnc)."</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 7){
            $ss1 = DB::table('score_cc')->selectRaw('*,score_cc.student_id,student.kh_name as kh_name')->join('student','score_cc.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $r->cid, 'score_cc.deleted' => 0])->get();
            $m1 = Scorecc::where(['month_id' => 4, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m2 = Scorecc::where(['month_id' => 5, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m3 = Scorecc::where(['month_id' => 6, 'class_id' => $r->cid, 'deleted' => 0])->get();
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
            $rt ="
                   <button onclick='prt()' class='btn btn-app-blue'><i class=\"fas fa-file-excel\"></i>&nbsp;ទាញទិន្នន័យជា Excel</button> 
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='exp' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>ពលរដ្ធ</th>
                                  <th style='text-align: center'>ប្រវ័ត្តិ</th>
                                  <th style='text-align: center'>ភូមិ</th>
                                  <th style='text-align: center'>គិណិត</th>
                                  <th style='text-align: center'>រូប</th>
                                  <th style='text-align: center'>គីមី</th>
                                  <th style='text-align: center'>ជីវៈ</th>
                                  <th style='text-align: center'>ផែនដី</th>
                                  <th style='text-align: center'>អង់គ្លេស</th>
                                  <td style='text-align: center'>មធ្យមភាគខែ</td>
                                  <td style='text-align: center'>មធ្យមភាគឆមាស</td>
                                  <td style='text-align: center'>មធ្យមភាគប្រចាំឆមាសទី២</td>
                                  <td style='text-align: center'>ចំណាត់ថ្នាក់</td>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($ss1 as $s){
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
                        <td style='text-align: center'>{$s->k}</td>
                        <td style='text-align: center'>{$s->ph}</td>
                        <td style='text-align: center'>{$s->h}</td>
                        <td style='text-align: center'>{$s->g}</td>
                        <td style='text-align: center'>{$s->m}</td>
                        <td style='text-align: center'>{$s->p}</td>
                        <td style='text-align: center'>{$s->c}</td>
                        <td style='text-align: center'>{$s->b}</td>
                        <td style='text-align: center'>{$s->e}</td>
                        <td style='text-align: center'>{$s->eng}</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$mtc)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$s->avg)."</td>
                        <td style='text-align: center'>". sprintf("%0.2f",$fnc)."</td>
                        <td style='text-align: center'></td>
                        <td style='text-align: center'>".$this->ccrnk($fnc)."</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }elseif($r->mid == 13){
            $ss1 = DB::table('score_cc')->selectRaw('*,score_cc.student_id,student.kh_name as kh_name')->join('student','score_cc.student_id','=','student.id')->where(['month_id' => 3, 'class_id' => $r->cid, 'score_cc.deleted' => 0])->get();
            $ss2 = DB::table('score_cc')->selectRaw('*,score_cc.student_id,student.kh_name as kh_name')->join('student','score_cc.student_id','=','student.id')->where(['month_id' => 7, 'class_id' => $r->cid, 'score_cc.deleted' => 0])->get();
            $m1 = Scorecc::where(['month_id' => 12, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m2 = Scorecc::where(['month_id' => 1, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m3 = Scorecc::where(['month_id' => 2, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m4 = Scorecc::where(['month_id' => 4, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m5 = Scorecc::where(['month_id' => 5, 'class_id' => $r->cid, 'deleted' => 0])->get();
            $m6 = Scorecc::where(['month_id' => 6, 'class_id' => $r->cid, 'deleted' => 0])->get();
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
                            <button onclick='printtag(\"exp\")' class='btn btn-app-blue'><i class=\"fas fa-print\"></i>&nbsp;ព្រីនទិន្នន័យ</button>
                <table id='anual' class='table table-bordered table-condensed'>
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
                        <td style='text-align: center'>".$this->ccrnk($fnttl)."</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }else{
            $msc = DB::table('score_cc')->selectRaw('*,score_cc.student_id,student.kh_name, rank() over(ORDER BY avg desc) as rank')->join('student','score_cc.student_id','=','student.id')->where(['class_id' => $r->cid, 'month_id' => $r->mid])->get();
            $rt ="
                <table id='exps' class='table table-bordered table-condensed'>
                                <thead>
                                <tr>
                                  <th style='text-align: center'>ឈ្មោះ</th>
                                  <th style='text-align: center'>ភាសាខ្មែរ</th>
                                  <th style='text-align: center'>ពលរដ្ធវិជ្ជា</th>
                                  <th style='text-align: center'>ប្រវ័ត្តវិទ្យា</th>
                                  <th style='text-align: center'>ភូមិវិទ្យា</th>
                                  <th style='text-align: center'>គិណិតវិទ្យា</th>
                                  <th style='text-align: center'>រូបវិទ្យា</th>
                                  <th style='text-align: center'>គីមីវិទ្យា</th>
                                  <th style='text-align: center'>ជីវៈវិទ្យា</th>
                                  <th style='text-align: center'>ផែនដីវិទ្យា</th>
                                  <th style='text-align: center'>អង់គ្លេស</th>
                                  <th style='text-align: center'>ពិន្ទុសរុប</th>
                                  <th style='text-align: center'>មធ្យមភាគ</th>
                                  <th style='text-align: center'>ចំណាត់ថ្នាក់</th>
                                  <th style='text-align: center'>និទ្ទេសន៍</th>
                                </tr>
                                </thead>
                                <tbody>";
            foreach ($msc as $m){
                $rt .= "
                    <tr>
                        <td style='text-align: center'>{$m->kh_name}</td>
                        <td style='text-align: center'>{$m->k}</td>
                        <td style='text-align: center'>{$m->ph}</td>
                        <td style='text-align: center'>{$m->h}</td>
                        <td style='text-align: center'>{$m->g}</td>
                        <td style='text-align: center'>{$m->m}</td>
                        <td style='text-align: center'>{$m->p}</td>
                        <td style='text-align: center'>{$m->c}</td>
                        <td style='text-align: center'>{$m->b}</td>
                        <td style='text-align: center'>{$m->e}</td>
                        <td style='text-align: center'>{$m->eng}</td>
                        <td style='text-align: center'>{$m->total}</td>
                        <td style='text-align: center'>".sprintf("%0.2f",$m->avg)."</td>
                        <td style='text-align: center'>{$m->rank}</td>
                        <td style='text-align: center'>".$this->ccrnk($m->avg)."</td>
                    </tr>
                ";
            }
            $rt .= "</tbody></table>";
            return ['rt'=>$rt];
        }
    }
}

<?php

namespace App\Http\Controllers;

use App\Attendance;
use App\Studentclass;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cur = DB::table('curriculum')->get();
        return view('attendance.attendance')->with(['cur'=>$cur]);
    }

    public function ajcl(Request $r)
    {
        if($r->id == 1){
            if(Auth::user()->role == 4){
                $cl = DB::table('v_search_class')->whereRaw('deleted = 0 AND cur_id = '.$r->id.' AND campus_id ='.Auth::user()->camp_id.' AND id IN (SELECT class_id FROM teacher_class WHERE teacher_id = '.Auth::user()->teacher_id.')')->get();
            }else{
                $cl = DB::table('v_search_class')->where(['deleted'=>0,'cur_id'=>$r->id,'campus_id'=>Auth::user()->camp_id])->get();
            }
            return $cl;
        }elseif($r->id == 2 || $r->id == 3){
            if(Auth::user()->role == 4){
                $cl = DB::table('v_search_class_en')->whereRaw('deleted = 0 AND cur_id = '.$r->id.' AND campus_id ='.Auth::user()->camp_id.' AND id IN (SELECT class_id FROM teacher_class WHERE teacher_id = '.Auth::user()->teacher_id.')')->where('campus_id',Auth::user()->camp_id)->get();
            }else{
                $cl = DB::table('v_search_class_en')->where(['deleted'=>0,'cur_id'=>$r->id,'campus_id'=>Auth::user()->camp_id])->get();
            }
            return $cl;
        }else{
            return 0;
        }
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
    public function take(Request $r)
    {

        if(isset($r)){
            $stc = DB::table('student_class')->selectRaw('student.kh_name,student.en_name,student_class.student_id as sid,student_class.class_id')->join('student','student_class.student_id','=','student.id')->whereRaw('class_id = '.$r->cid.' AND student_class.student_id NOT IN (SELECT student_id FROM attendance WHERE class_id = '.$r->cid.' AND date = \''.date('Y-m-d').'\')')->get();
            if(count($stc)>0){
                $rt = "
                <table id='attb' class='table table-condensed table-bordered'>
                <thead>
                    <tr>
                        <th style='display: none'>SID</th>
                        <th>KH Name</th>
                        <th>EN Name</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
            ";
                $i = 0;
                foreach($stc as $s){
                    $rt .= "
                   <tr>
                        <td style='display: none'><input type='hidden' class='sid' value='{$s->sid}'></td>
                        <td>{$s->kh_name}</td>
                        <td>{$s->en_name}</td>
                        <td>
                            <label class='css-input css-radio css-radio-lg css-radio-success'>
								<input class='rdpr' type='radio' name='rd{$s->sid}' id='rdpr{$s->sid}' value='1' checked/><span></span> Present
							</label>
							<label class='css-input css-radio css-radio-lg css-radio-warning'>
								<input class='rdpm' type='radio' name='rd{$s->sid}' id='rdpm{$s->sid}' value='1'/><span></span> Permission
							</label>
							<label class='css-input css-radio css-radio-lg css-radio-danger'>
								<input class='rdab' type='radio' name='rd{$s->sid}' id='rdab{$s->sid}' value='1'/><span></span> Absent
							</label>
                        </td>
                   </tr>
                ";
                    $i++;
                }
                $rt .= "</tbody></table><input type='hidden' id='acid' value='$r->cid'><input type='hidden' id='rcnt' value='{$i}'>";
                return ['stc'=>$stc,'rt'=>$rt];
            }else{
                return ['rt'=>"<h3 style='text-align: center'>Attendance Already Taken !</h3>"];
            }
        }else{
            return 0;
        }
    }
    public function add(Request $r){

        $data = $r->data;
        foreach($data as $d){
            if($d['pr'] == 1){
                Attendance::create(['student_id'=>$d['id'],'class_id'=>$d['cid'],'status'=>1,'created_by'=>Auth::id(),'date'=>date('Y-m-d')]);
            }elseif($d['pm'] == 1){
                Attendance::create(['student_id'=>$d['id'],'class_id'=>$d['cid'],'status'=>2,'created_by'=>Auth::id(),'date'=>date('Y-m-d')]);
            }elseif($d['ab'] == 1){
                Attendance::create(['student_id'=>$d['id'],'class_id'=>$d['cid'],'status'=>0,'created_by'=>Auth::id(),'date'=>date('Y-m-d')]);
            }
        }
        return 1;
    }
    public function editatt(Request $r)
    {
        $cur = DB::table('curriculum')->get();
        return view('attendance.attendance_view')->with(['cur'=>$cur]);
    }
    public function ajatt(Request $r)
    {
        if(isset($r)){
            $stc = DB::table('attendance')->selectRaw('attendance.id,attendance.status,student.kh_name,student.en_name,attendance.student_id as sid,attendance.class_id')->join('student','attendance.student_id','=','student.id')->whereRaw('class_id = '.$r->cid.' AND  date = \''.$r->date.'\'')->get();
            if(count($stc)>0){
                $rt = "
                <table id='attb' class='table table-condensed table-bordered'>
                <thead>
                    <tr>
                        <th style='display: none'>ID</th>
                        <th>KH Name</th>
                        <th>EN Name</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
            ";
                $i = 0;
                foreach($stc as $s){
                    if($s->status == 1){
                        $pr = "checked";
                    }else{
                        $pr = "";
                    }
                    if($s->status == 2){
                        $pm = "checked";
                    }else{
                        $pm = "";
                    }
                    if($s->status == 0){
                        $ab = "checked";
                    }else{
                        $ab = "";
                    }
                    $rt .= "
                   <tr>
                        <td style='display: none'><input type='hidden' class='aid' value='{$s->id}'></td>
                        <td>{$s->kh_name}</td>
                        <td>{$s->en_name}</td>
                        <td>
                            <label class='css-input css-radio css-radio-lg css-radio-success'>
								<input class='rdpr' type='radio' name='rd{$s->sid}' id='rdpr{$s->sid}' value='1' {$pr}/><span></span> Present
							</label>
							<label class='css-input css-radio css-radio-lg css-radio-warning'>
								<input class='rdpm' type='radio' name='rd{$s->sid}' id='rdpm{$s->sid}' value='1' {$pm}/><span></span> Permission
							</label>
							<label class='css-input css-radio css-radio-lg css-radio-danger'>
								<input class='rdab' type='radio' name='rd{$s->sid}' id='rdab{$s->sid}' value='1' {$ab}/><span></span> Absent
							</label>
                        </td>
                   </tr>
                ";
                    $i++;
                }
                $rt .= "</tbody></table>";
                return ['stc'=>$stc,'rt'=>$rt];
            }else{
                return ['rt'=>"<h3 style='text-align: center'>No Data !</h3>"];
            }
        }else{
            return 0;
        }

    }
    public function ajattp(Request $r){
        $stic = DB::table('attendance')->selectRaw('attendance.student_id,student.kh_name,student.en_name')->join('student','attendance.student_id','=','student.id')->whereRaw('SUBSTRING(attendance.created_at,1,10) BETWEEN "'.$r->from.'" AND "'.$r->to.'" AND class_id = '.$r->cid)->groupBy('student_id')->get();
        $arrst = [];
        foreach ($stic as $s){
            array_push($arrst,['id'=>$s->student_id,'kh'=>$s->kh_name,'en'=>$s->en_name]);
        }
        $arrsts = [];
        for($i=0;$i<sizeof($arrst);$i++){
            $pre[$i] = DB::table('attendance')->select('id')->whereRaw('SUBSTRING(attendance.created_at,1,10) BETWEEN "'.$r->from.'" AND "'.$r->to.'" AND class_id = '.$r->cid.' AND student_id ='.$arrst[$i]['id'].' AND status = 1')->get();
            $perm[$i] = DB::table('attendance')->select('id')->whereRaw('SUBSTRING(attendance.created_at,1,10) BETWEEN "'.$r->from.'" AND "'.$r->to.'" AND class_id = '.$r->cid.' AND student_id ='.$arrst[$i]['id'].' AND status = 2')->get();
            $ab[$i] = DB::table('attendance')->select('id')->whereRaw('SUBSTRING(attendance.created_at,1,10) BETWEEN "'.$r->from.'" AND "'.$r->to.'" AND class_id = '.$r->cid.' AND student_id ='.$arrst[$i]['id'].' AND status = 0')->get();
            array_push($arrsts,['kh'=>$arrst[$i]['kh'],'en'=>$arrst[$i]['en'],'pre'=>count($pre[$i]),'perm'=>count($perm[$i]),'ab'=>count($ab[$i])]);
        }
        $rt = "
            <table id='exps' class='table table-condensed table-bordered'>
                <thead>
                    <tr>
                        <th>KH Name</th>
                        <th>EN Name</th>
                        <th>Present</th>
                        <th>Permission</th>
                        <th>Absent</th>
                    </tr>
                </thead>
                <tbody>
        ";
        for($i=0;$i<sizeof($arrsts);$i++){
            $rt .= "
                <tr>
                        <td>{$arrsts[$i]['kh']}</td>
                        <td>{$arrsts[$i]['en']}</td>
                        <td>{$arrsts[$i]['pre']}</td>
                        <td>{$arrsts[$i]['perm']}</td>
                        <td>{$arrsts[$i]['ab']}</td>
                   </tr>
            ";
        }
        $rt .= "</tbody></table>";
        return ['rt'=>$rt,'arr'=>$arrsts];
    }

    public function upatt(Request $r){
        $data = $r->data;
        foreach($data as $d){
            if($d['pr'] == 1){
                Attendance::updateOrCreate(['id'=>$d['id']],['status'=>1,'updated_by'=>Auth::id()]);
            }elseif($d['pm'] == 1){
                Attendance::updateOrCreate(['id'=>$d['id']],['status'=>2,'updated_by'=>Auth::id()]);
            }elseif($d['ab'] == 1){
                Attendance::updateOrCreate(['id'=>$d['id']],['status'=>0,'updated_by'=>Auth::id()]);
            }
        }
        return 1;
    }
}
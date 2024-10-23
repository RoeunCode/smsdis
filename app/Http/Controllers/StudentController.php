<?php

namespace App\Http\Controllers;

use App\Parents;
use App\Student;
use App\Violation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Student::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->get();
        return view('student.student')->with(['data'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $sid = Student::orderBy('student_id','desc')->limit(1)->get();
        return view('student.student_add')->with(['sid'=>$sid]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $r)
    {
        if($r->hasFile('photo')){
            $file = $r->file('photo');
            $ext = $file->getClientOriginalExtension();
            $filename = time().'.'.$ext;
            $file->move('uploads/photo',$filename);
        }else{
            $filename = null;
        }
        student::create($r->all());
        $stuid = $r->student_id;
        student::updateOrCreate(['student_id'=>$stuid],['photo'=>$filename]);
        //Mother
        $khm = $r->khm;
        $enm = $r->enm;
        $sexm = "F";
        $dobm = $r->dobm;
        $jobm = $r->jobm;
        $phonem = $r->phonem;
        $emailm = $r->emailm;
        $pob_vm = $r->pob_vm;
        $pob_cm = $r->pob_cm;
        $pob_dm = $r->pob_dm;
        $pob_pm = $r->pob_pm;
        $fbm = $r->facebookm;
        $natm = $r->natm;
        $am = $r->am;
        //End Mother
        //Father
        $khf = $r->khf;
        $enf = $r->enf;
        $sexf = "M";
        $dobf = $r->dobf;
        $jobf = $r->jobf;
        $phonef = $r->phonef;
        $emailf = $r->emailf;
        $pob_vf = $r->pob_vf;
        $pob_cf = $r->pob_cf;
        $pob_df = $r->pob_df;
        $pob_pf = $r->pob_pf;
        $fbf = $r->facebookf;
        $natf = $r->natf;
        $af = $r->af;
        //End Father
        Parents::create(['student_id'=>$stuid,'kh_name'=>$khm,'en_name'=>$enm,'sex'=>$sexm,'dob'=>$dobm,'nat'=>$natm,'job'=>$jobm,'phone'=>$phonem,'email'=>$emailm,'facebook'=>$fbm,'pob_v'=>$pob_vm,'pob_c'=>$pob_cm,'pob_d'=>$pob_dm,'pob_p'=>$pob_pm,'nationality'=>$natm,'alive'=>$am,'relation'=>'mother']);
        Parents::create(['student_id'=>$stuid,'kh_name'=>$khf,'en_name'=>$enf,'sex'=>$sexf,'dob'=>$dobf,'nat'=>$natf,'job'=>$jobf,'phone'=>$phonef,'email'=>$emailf,'facebook'=>$fbf,'pob_v'=>$pob_vf,'pob_c'=>$pob_cf,'pob_d'=>$pob_df,'pob_p'=>$pob_pf,'nationality'=>$natf,'alive'=>$af,'relation'=>'father']);
        return redirect()->route('student.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        $data = student::findorfail($id);
        $sid = $data->student_id;
        $vl = Violation::where('student_id',$id)->get();
        $f = Parents::where(['student_id'=>$sid,'relation'=>'father'])->get();
        $m = Parents::where(['student_id'=>$sid,'relation'=>'mother'])->get();
        return view('student.student_detail')->with(['d'=>$data,'fa'=>$f,'mo'=>$m,'vl'=>$vl]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = student::findorfail($id);
        $sid = $data->student_id;
        $f = parents::where(['student_id'=>$sid,'relation'=>'father'])->get();
        $m = parents::where(['student_id'=>$sid,'relation'=>'mother'])->get();
        return view('student.student_edit')->with(['d'=>$data,'fa'=>$f,'mo'=>$m]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $r, $id)
    {
        student::updateOrCreate(['id'=>$id],$r->all());
        $stuid = $r->student_id;
        //Mother
        $khm = $r->khm;
        $enm = $r->enm;
        $sexm = "F";
        $dobm = $r->dobm;
        $jobm = $r->jobm;
        $phonem = $r->phonem;
        $emailm = $r->emailm;
        $pob_vm = $r->pob_vm;
        $pob_cm = $r->pob_cm;
        $pob_dm = $r->pob_dm;
        $pob_pm = $r->pob_pm;
        $fbm = $r->facebookm;
        $natm = $r->natm;
        $am = $r->am;
        //End Mother
        //Father
        $khf = $r->khf;
        $enf = $r->enf;
        $sexf = "M";
        $dobf = $r->dobf;
        $jobf = $r->jobf;
        $phonef = $r->phonef;
        $emailf = $r->emailf;
        $pob_vf = $r->pob_vf;
        $pob_cf = $r->pob_cf;
        $pob_df = $r->pob_df;
        $pob_pf = $r->pob_pf;
        $fbf = $r->facebookf;
        $natf = $r->natf;
        $af = $r->af;
        //End Father
        parents::updateOrCreate(['student_id'=>$stuid,'relation'=>'mother'],['kh_name'=>$khm,'en_name'=>$enm,'sex'=>$sexm,'dob'=>$dobm,'nat'=>$natm,'job'=>$jobm,'phone'=>$phonem,'email'=>$emailm,'facebook'=>$fbm,'pob_v'=>$pob_vm,'pob_c'=>$pob_cm,'pob_d'=>$pob_dm,'pob_p'=>$pob_pm,'nationality'=>$natm,'alive'=>$am]);
        parents::updateOrCreate(['student_id'=>$stuid,'relation'=>'father'],['kh_name'=>$khf,'en_name'=>$enf,'sex'=>$sexf,'dob'=>$dobf,'nat'=>$natf,'job'=>$jobf,'phone'=>$phonef,'email'=>$emailf,'facebook'=>$fbf,'pob_v'=>$pob_vf,'pob_c'=>$pob_cf,'pob_d'=>$pob_df,'pob_p'=>$pob_pf,'nationality'=>$natf,'alive'=>$af]);
        return redirect()->route('student.show',$id);
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

    public function delete($id)
    {
        student::updateOrCreate(['id'=>$id],['deleted'=>"1"]);
        return redirect()->route('student.index');
    }

    public function restore($id)
    {
        student::updateOrCreate(['id'=>$id],['deleted'=>"0"]);
        return redirect()->route('student.index');
    }

    public function deleted()
    {
        $data = student::where('deleted',1)->get();
        return view('student.student_deleted')->with('data',$data);
    }
    public  function  chksid(Request $r)
    {
//        $idnum =Student::select('student_id')->where('campus_id',Auth::user()->camp_id)->Max('student_id')->first();
        $sid= Student::where('student_id',$r->student_id)->get();
        return count($sid);
    }
    public function proup(Request $r)
    {
        if($r->hasFile('photo')){
            
            $file = $r->file('photo');
            $ext = $file->getClientOriginalExtension();
            $filename = time().'.'.$ext;
            $file->move('uploads/photo',$filename);
        }
        student::updateOrCreate(['id'=>$r->id],['photo'=>$filename]);
        return redirect()->back();
    }
}

<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Heang\Student;
use DB;
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
        $student = DB::table('student')->get();
        return view('Heang/student', [
            'student' => $student
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Heang/student_add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [
            'student_id' => $request['student_id'],
            'kh_name' => $request['kh_name'],
            'en_name' => $request['en_name'],
            'sex' => $request['sex'],
            'dob' => $request['dob'],
            'phone_student' => $request['stel'],
            'national' => $request['national'],
            'village_pob' => $request['pob_v'],
            'commue_pob' => $request['pob_c'],
            'district_pob' => $request['pob_d'],
            'province_pob' => $request['pob_p'],
            'village_current' => $request['cur_v'],
            'commue_current' => $request['cur_c'],
            'district_current' => $request['cur_d'],
            'province_current' => $request['cur_p'],
            'old_grade' => $request['old_school_grade'],
            'old_school' => $request['old_school'],
            'old_en_grade' => $request['old_en_school'],
            'farther_name' => $request['fnm'],
            'mother_name' => $request['mname'],
            'farther_job' => $request['jobf'],
            'mother_job' => $request['jobm'],
            'national_far' => $request['natf'],
            'national_mother' => $request['natm'],
            'phone_farther' => $request['telf'],
            'address_farther' => $request['pob_vf'],
            'address_mother' => $request['pob_vm'],

        ];

        $data = Student::create($data);
        return redirect()->route('student.create')->with('message','Data has been inserted!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $student = DB::table('student')
        ->where('id' , '=', $id)
        ->get();

        return view('Heang/student_detail', [
            'student' => $student
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $student = Student::findorfail($id);

        return view('Heang/student_edit', [
            'student' => $student
        ]);
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
        $student = DB::table('student')
        ->where('id', $id)
        ->update([
            'student_id' => $request->input('student_id'),
            'kh_name' => $request->input('kh_name'),
            'en_name' => $request->input('en_name'),
            'sex' => $request->input('sex'),
            'dob' => $request->input('dob'),
            'phone_student' => $request->input('stel'),
            'national' => $request->input('national'),
            'village_pob' => $request->input('pob_v'),
            'commue_pob' => $request->input('pob_c'),
            'district_pob' => $request->input('pob_d'),
            'province_pob' => $request->input('pob_p'),
            'village_current' => $request->input('cur_v'),
            'commue_current' => $request->input('cur_c'),
            'district_current' => $request->input('cur_d'),
            'province_current' => $request->input('cur_p'),
            'old_grade' => $request->input('old_school_grade'),
            'old_school' => $request->input('old_school'),
            'old_en_grade' => $request->input('old_en_school'),
            'farther_name' => $request->input('fnm'),
            'mother_name' => $request->input('mname'),
            'farther_job' => $request->input('jobf'),
            'mother_job' => $request->input('jobm'),
            'national_far' => $request->input('natf'),
            'national_mother' => $request->input('natm'),
            'phone_farther' => $request->input('telf'),
            'address_farther' => $request->input('pob_vf'),
            'address_mother' => $request->input('pob_vm')
        ]);
        return redirect()->route('student.index');
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

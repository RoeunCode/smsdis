<?php

namespace App\Http\Controllers;

use App\Campus;
use App\Student;
use App\Studentclass;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Excel;
use App\Imports\UsersImport;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $stu = Student::where(['deleted'=>0,'campus_id'=>Auth::user()->camp_id])->get();
        $cc = DB::table('v_cur_percent')->whereRaw('ccur = 1 AND SUBSTRING(created_at,1,4) = '.date('Y'))->get();
        $ac = DB::table('v_cur_percent')->whereRaw('ccur = 2 AND SUBSTRING(created_at,1,4) = '.date('Y'))->get();
        $fla = DB::table('v_cur_percent')->whereRaw('ccur = 3 AND SUBSTRING(created_at,1,4) = '.date('Y'))->get();
        $tch = Teacher::where(['deleted'=>0,'campus_id'=>Auth::user()->camp_id])->get();
        $camp = Campus::where(['deleted'=>0,'id'=>Auth::user()->camp_id])->get();
        $janba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-01"."'")->get();
        $febba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-02"."'")->get();
        $marba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-03"."'")->get();
        $aprba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-04"."'")->get();
        $mayba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-05"."'")->get();
        $junba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-06"."'")->get();
        $julba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-07"."'")->get();
        $augba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-08"."'")->get();
        $sepba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-09"."'")->get();
        $octba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-10"."'")->get();
        $novba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-11"."'")->get();
        $decba = student::whereRaw("deleted='0' AND SUBSTRING(created_at,1,7) = '".date('Y')."-12"."'")->get();
        return view('dashboard')->with([
            'stu'=>$stu,'tch'=>$tch,'camp'=>$camp,
            'ba1'=>$janba,'ba2'=>$febba,'ba3'=>$marba,'ba4'=>$aprba,'ba5'=>$mayba,'ba6'=>$junba,
            'ba7'=>$julba,'ba8'=>$augba,'ba9'=>$sepba,'ba10'=>$octba,'ba11'=>$novba,'ba12'=>$decba,
            'cc'=>$cc,'ac'=>$ac,'fla'=>$fla
        ]);
    }
    function import(Request $request)
    {
        $path = $request->file('select_file')->getRealPath();
        Excel::import(new UsersImport,$path);
        return back()->with('success', 'Excel Data Imported successfully.');
    }
}

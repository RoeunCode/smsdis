<?php

namespace App\Http\Controllers\ReportCC;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class ReportUpperController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $academic = DB::table('academic_year')->orderby('name','DESC')->get();
        $month = DB::table('month')->get();
        return view('reportcc.report_upper')->with('academic',$academic)
        ->with('month',$month);


    }
    public function __construct(){

        // Need to remove CSRF token for request api
        //For Permission to do API
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
        header('Content-Type: application/json');
        header("Access-Control-Allow-Headers: *");
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

    public function reportuper_cc_per_month(Request $request)
    {

        $data = DB::select(DB::raw("SELECT *,student.kh_name,student.sex FROM score_upper_cc INNER JOIN student ON score_upper_cc.student_id = student.id WHERE class_id=".$request->class_id."  and month_id=".$request->month_id." "));

        if($data)
        {

            return response()->json([
                "status"=>0,
                "data"=>$data,
                "message"=>"Succesfully"
            ]);
        } else{

            return response()->json([
                "status"=>1,
                "message"=>"UnSuccesfully"
            ]);
        }


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
}

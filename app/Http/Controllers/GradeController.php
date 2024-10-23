<?php

namespace App\Http\Controllers;

use App\Grade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GradeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Grade::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->where('cur_id',Auth::user()->cur_id)->get();
        $cur = DB::table('curriculum')->get();
        return view('grade.grade')->with(['data'=>$data,'cur'=>$cur]);
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
        Grade::create($request->all());
        return 1;
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

    public function ajup(Request $r)
    {
        Grade::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }

    public function restore($id)
    {
        Grade::updateOrCreate(['id'=>$id],['deleted'=>"0"]);
        return redirect()->back();
    }

    public function delete($id)
    {
        Grade::updateOrCreate(['id'=>$id],['deleted'=>1]);
        return redirect()->back();
    }

    public function deleted()
    {
        $data = Grade::where(['deleted'=>1])->get();
        return view('grade.grade_deleted')->with('data',$data);
    }
}

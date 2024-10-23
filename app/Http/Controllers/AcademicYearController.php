<?php

namespace App\Http\Controllers;

use App\AcademicYear;
use Illuminate\Http\Request;

class AcademicYearController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = AcademicYear::where('deleted',0)->get();
        return view('academic_year.academic_year')->with(['data'=>$data]);
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
        AcademicYear::create($request->all());
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
        AcademicYear::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }

    public function restore($id)
    {
        AcademicYear::updateOrCreate(['id'=>$id],['deleted'=>"0"]);
        return redirect()->back();
    }

    public function delete($id)
    {
        AcademicYear::updateOrCreate(['id'=>$id],['deleted'=>1]);
        return redirect()->back();
    }

    public function deleted()
    {
        $data = AcademicYear::where('deleted',1)->get();
        return view('academic_year.academic_year_deleted')->with(['data'=>$data]);
    }
}

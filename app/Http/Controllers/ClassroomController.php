<?php

namespace App\Http\Controllers;

use App\Classrooms;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class ClassroomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Classrooms::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->get();
        return view('classroom.classroom')->with(['data'=>$data]);
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
        Classrooms::create($request->all());
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
        Classrooms::where('id',$id)->update(['deleted'=>1]);
        return 1;
    }

    public function ajup(Request $r)
    {
        Classrooms::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }

    public function restore($id)
    {
        Classrooms::updateOrCreate(['id'=>$id],['deleted'=>"0"]);
        return redirect()->back();
    }

    public function delete($id)
    {
        Classrooms::updateOrCreate(['id'=>$id],['deleted'=>1]);
        return redirect()->back();
    }
}

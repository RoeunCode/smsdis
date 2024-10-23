<?php

namespace App\Http\Controllers;

use App\Campus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CampusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role==1){
            $data = Campus::where('deleted',0)->get();
        }else if(Auth::user()->role==2) {
            $data = Campus::where('deleted', 0)->where('id',Auth::user()->camp_id)->get();
        }
        return view('campus.campus')->with(['data'=>$data]);
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
        Campus::create($request->all());
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
        Campus::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }

    public function restore($id)
    {
        Campus::updateOrCreate(['id'=>$id],['deleted'=>"0"]);
        return redirect()->back();
    }

    public function delete($id)
    {
        Campus::updateOrCreate(['id'=>$id],['deleted'=>1]);
        return redirect()->back();
    }

    public function deleted()
    {
        $data = Campus::where('deleted',1)->get();
        return view('campus.campus_deleted')->with(['data'=>$data]);
    }
}

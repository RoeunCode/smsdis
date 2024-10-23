<?php

namespace App\Http\Controllers;

use App\Teacher;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 1){
            $data = User::all();
        }elseif(Auth::user()->role == 2){
            $data = User::whereRaw('role > 2 AND camp_id = '.Auth::user()->camp_id.' AND cur_id = '.Auth::user()->cur_id)->get();
        }
        $rl = DB::table('role')->get();
        $cp = DB::table('campus')->get();
        $cu = DB::table('curriculum')->get();
        $tch = Teacher::where('deleted',0)->where('campus_id',Auth::user()->camp_id)->get();
        return view('user.users')->with(['data'=>$data,'tch'=>$tch,'rl'=>$rl,'cu'=>$cu,'cp'=>$cp]);
    }
    public function deleted()
    {
        $rl = DB::table('role')->get();
        $tch = Teacher::where('deleted',0)->get();
        $data = User::where('deleted',1)->get();
        return view('user.users_deleted')->with(['data'=>$data,'tch'=>$tch,'rl'=>$rl]);
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

    public function changepw(Request $r)
    {
        $old = $r->old;
        $og = User::findOrFail($r->id);
        $chk = Hash::check($old,$og->password);
        if($chk){
            User::updateOrCreate(['id'=>$r->id],['password'=>Hash::make($r->new)]);
            return '1';
        }else{
            return '0';
        }
    }
    public function uup(Request $r){
        User::updateOrCreate(['id'=>$r->id],$r->all());
        return 1;
    }
    public function usrdel(Request $r)
    {
        if($r->st == 0){
            User::updateOrCreate(['id'=>$r->id],['deleted'=>1]);
        }elseif($r->st == 1){
            User::updateOrCreate(['id'=>$r->id],['deleted'=>0]);
        }
        return 1;
    }
    public function usrrst($id)
    {
        User::updateOrCreate(['id'=>$id],['deleted'=>0]);
        return redirect()->back();
    }
    public function register(Request $request)
    {
        User::create([
            'username'=>$request->username,
            'role'=>$request->role,
            'camp_id'=>$request->camp,
            'cur_id'=>$request->cur_id,
            'teacher_id'=>$request->teacher_id,
            'password'=>Hash::make($request->password),
        ]);
        return 1;
    }
}

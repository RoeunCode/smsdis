<?php

namespace App\Http\Controllers;

// use App\sela\student;
use App\User;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
class AccountstudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        $user =  DB::table('v_user_student')->get();
        $student = DB::table('student')->where('deleted',0)->get();
        return view('accountstudent.view_account')->with('data_user', $user)->with('student', $student);
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
        if($request->status=='create')
        {
            $user = User::where('username', '=', $request->username)->first();
            if ($user === null) {
                User::create([
                    'username'=>$request->username,
                    'role'=>4,
                    'student_id'=>$request->student_id,
                    'password'=>Hash::make($request->password),
                ]);
                return "Add Successfully !";
            }else{


                return "Username has exist";
            }


        }else{



            $user = User::where('id', '=', $request->id)->update([
                'password' =>Hash::make($request->password)
            ]);
            if($user){

                return "Change Successfully !";

            }else{


                return "Error change";

            }

        }


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

<?php

namespace App\Http\Controllers\roeun;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class UpperSecondaryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $academic = DB::table('academic_year')->orderby('name','DESC')->get();
        $month = DB::table('month')->get();
        return view('scoreiconic.upper_secondary')->with('academic',$academic)
        ->with('month',$month);
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
    public function getclassuppercc(Request $request){

        $class = DB::table('class_view')
                ->where('ac_id',$request->id_ac)
                ->where('cur_id',1)
                ->where('deleted',0)
                ->whereBetween('grade',[9,12])
                // ->whereRaw('CAST(`grade` AS SIGNED) BETWEEN ? AND ?', [1, 6])
                ->orderby('academic_year','DESC')
                ->get();

        return response()->json(
            [
                "class"=>$class,

            ]
        ) ;
    }
    public function showstudentupper(Request $request){


        $check_score = DB::table('score_upper_cc')
        ->where('class_id',$request->class_id)
        ->where('month_id',$request->month_id)

        ->count();


        if($check_score == 0 )
        {



            $student_class = DB::table('v_student_class')
            ->where('class_id',$request->class_id)
            ->orderby('sort')
            ->get();
            return response()->json(
                [
                    "student_class"=>$student_class,
                    "status"=>1
                ]
            ) ;
            }else{

                $seachStudent = DB::table('score_upper_cc')
                                ->join('student','score_upper_cc.student_id' ,'=','student.id')
                                ->where('class_id',$request->class_id)
                                ->where('month_id',$request->month_id)
                ->select(DB::raw('score_upper_cc.*,student.kh_name'))
                ->get();

                $seachStudent2 = DB::table('student_class')
                ->join('student','student_class.student_id' ,'=','student.id')
                ->join('class','student_class.class_id','=','class.id')
                ->where('class.id',$request->class_id)
                // ->where('score_upper_cc.month_id',$request->month_id)
                ->whereRaw('student_class.student_id NOT IN (SELECT student_id from score_upper_cc where student_class.class_id='.$request->class_id.' and
                score_upper_cc.month_id = '.$request->month_id.' )')
                ->select(DB::raw('null as khmer, null as morality,'.$request->class_id.' as class_id, null as history,null as
                geography , null as math,null as physical, null as chemistry, null as id, null as biology, null as earth_sicence,
                '.$request->month_id.' as month_id, null as english ,
                student.kh_name'))
                ->get()->toArray();

            if(count($seachStudent2) > 0 )
            {
                $item= array();
                foreach($seachStudent as $obj)
                {
                    $array1[] = (array) $obj;
                }
                // dd($array1);
                $new_data = array_merge($array1,$seachStudent2);
                //   dd($new_data);
                return response()->json(
                    [
                        "student_class"=>$new_data,
                        "status"=>2
                    ]
                ) ;
            }else{



                return response()->json(
                    [
                        "student_class"=>$seachStudent,
                        "status"=>3
                    ]
                ) ;


            }




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

        if($request->status == 1 )
        {
            $array_save=[];
            for($i=0;$i<count($request->student_id);$i++)
            {
                $array_save[]=[

                    'student_id'=>$request->student_id[$i],
                    'class_id' =>$request->class_id,
                    'month_id'=>$request->month_id,
                    'avg_m' =>$request->avg,
                    'khmer'=>$request->khmer[$i],
                    'morality'=>$request->morality[$i],
                    'history'=>$request->history[$i],
                    'geography'=>$request->geography[$i],
                    'math'=>$request->math[$i],
                    'physical'=>$request->physical[$i],
                    'chemistry'=>$request->chemistry[$i],
                    'biology'=>$request->biology[$i],
                    'earth_science'=>$request->earth_science[$i],
                    'english'=>$request->english[$i]




                ];

            }

            $data = DB::table('score_upper_cc')->insert($array_save);

            if($data)
            {
                return response()->json(
                    [
                        "message"=>"Save Successfully",
                        "status"=>0


                    ]
                ) ;
            }else{
                return response()->json(
                    [
                        "message"=>"Something Wrong !",
                        "status"=>1

                    ]
                ) ;
            }

        }else{
            $array_save2=[];
            $del = DB::table('score_upper_cc')
            ->where('class_id',$request->class_id)
            ->where('month_id',$request->month_id)
            ->delete();
            if($del)
            {

                    for($i=0;$i<count($request->student_id);$i++)
                    {


                        $array_save2[]=[

                            'student_id'=>$request->student_id[$i],
                            'class_id' =>$request->class_id,
                            'month_id'=>$request->month_id,
                            'avg_m' =>$request->avg,
                            'khmer'=>$request->khmer[$i],
                            'morality'=>$request->morality[$i],
                            'history'=>$request->history[$i],
                            'geography'=>$request->geography[$i],
                            'math'=>$request->math[$i],
                            'physical'=>$request->physical[$i],
                            'chemistry'=>$request->chemistry[$i],
                            'biology'=>$request->biology[$i],
                            'earth_science'=>$request->earth_science[$i],
                            'english'=>$request->english[$i]



                        ];
                        // $del = DB::table('score_primary_cc')
                        // ->where('id',$request->id[$i])->delete();


                    }
                    $data= DB::table('score_upper_cc')
                    ->insert($array_save2);

                    if($data)
                        {
                            return response()->json(
                                [
                                    "message"=>"Save Successfully1",
                                    "status"=>0

                                ]
                            ) ;
                        }else{
                            return response()->json(
                                [
                                    "message"=>"Something Wrong !",
                                    "status"=>1

                                ]
                            ) ;
                        }


            }else{
                echo 1;
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

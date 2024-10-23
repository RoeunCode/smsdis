<?php

namespace App\Http\Controllers\ScoreCCOnline;
use App\Http\Controllers\Controller;
use App\ScoreCCOnline;
use Illuminate\Http\Request;
use DB;

class ScoreCCGrade8Controller extends Controller
{

    public function index()
    {
        $grade=DB::table('v_class')->where('grade','like','%8%')->get();
        $month=DB::table('month')->get();
        return view('score_cc_online.score_cc_online_8')->with('grade',$grade)->with('month',$month);
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

        $db=DB::table('score_cc_online')->where('grade',8)->where('class_id',$request->grade)->where('month_id',$request->month)->count();
        if($request->month==13){
            return "";
        }else if($db==0) {
            //Return HTML for View Insert to Databas in table score_cc_online
            $sql=DB::table('v_student_class')->where('class_id',$request->grade)->orderby('kh_name')->get();
            $output = "
            <table class='table table-bordered table-condensed  animated slideInDown fast' id='tbl_online'>
                <thead>
                       <th style='text-align: center;'>ល.រ</th>     
                     <th style='text-align: center;'>គោត្តនាមនិងនាម</th>
                     <th style='text-align: center'>តែងសេចក្តី</th>
                     <th style='text-align: center'>សរសេរតាមអា​ន</th>
                     <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                     <th style='text-align: center'>ប្រវិត្តវិទ្យា</th> 
                     <th style='text-align: center'>ភូមិវិទ្យា</th>
                     <th style='text-align: center'>គណិតវិទ្យា</th>
                     <th style='text-align: center'>ភាសាខ្មែរ</th>
                     <th style='text-align: center'>រូបវិទ្យា</th>
                     <th style='text-align: center'>គីមី</th>
                     <th style='text-align: center'>ជីវវិទ្យា</th>  
                     <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                     <th style='text-align: center'>គេហវិទ្យា</th>
                     <th style='text-align: center'>ភាសាអង់គ្លេស</th>
                     <th style='text-align: center'>អប់រំកាយ-កីឡា</th>
                     <th style='text-align: center'>ពលកម្ម</th>    
                     <th hidden>month</th> 
                     <th hidden>student_id</th>
                     <th hidden>grade</th>
                     <th hidden>class_id</th>
                     
                </thead>
               <tbody>
        ";
            $i=1;
            foreach ($sql as $row) {
                if($row->sex=="F"){
                    $sex="កញ្ញា";
                }else{
                    $sex="";
                }
                $output .= '
             <tr class="text-center">
                <td style="text-align: center">'.$i++.'</td>
                <td style="text-align: left"><p style="width: 10rem">'. $row->kh_name . '</p></td>
                <td><input type="text" class=" form-control  teasekdey" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  writting" style="text-align: center;font-size: 14px  ;width: 5rem" maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  polroth" style="text-align: center;font-size: 14px  ;width: 5rem" maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  history" style="text-align: center;font-size: 14px  ;width: 5rem" maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  phum" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  math" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  khmer" style="text-align: center;font-size: 14px ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  physical" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  chemistry" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control   biology" style="text-align: center;font-size: 14px ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  phandey" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  kehak" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  english" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                 <td><input type="text" class=" form-control  sport" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="number" class=" form-control  polakam" style="text-align: center;font-size: 14px  ;width: 5rem"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td hidden><input type="text" class="month" value="'.$request->month.'"></td>
                <td hidden><input type="text" class="student_id" value="' . $row->id . '"></td>
                <td hidden><input type="text" class="grade" value="8"></td>
                <td hidden><input type="text" class="class_id" value="'.$request->grade.'"></td>
            </tr>
           ';
            }
            $output .= "
            </tbody>
            </table>
        ";
            return response(['output'=>$output,'con'=>1]);
        }else{
//            $sql=DB::table('v_student_class')->where('class_id',$request->grade)->get();
            $sql=DB::select('select *,student.kh_name,score_cc_online.student_id as st_id ,score_cc_online.id as score_id from score_cc_online INNER  JOIN  student ON score_cc_online.student_id = student.id WHERE  
                    class_id="'.$request->grade.'" and grade=8 and month_id="'.$request->month.' Order by kh_name "
                ');
            $output = "
            <table class='table table-bordered table-condensed animated slideInDown fast' id='tbl_online'>
                <thead>
                     <th style='text-align: center;'>ល.រ</th>  
                     <th style='text-align: center' >គោត្តនាមនិងនាម</th>
                     <th style='text-align: center'>តែងសេចក្តី</th>
                     <th style='text-align: center'>សរសេរតាមអា​ន</th>
                     <th style='text-align: center'>សីលធម៌-ពលរដ្ឋវិជ្ជា</th>
                     <th style='text-align: center'>ប្រវិត្តវិទ្យា</th> 
                     <th style='text-align: center'>ភូមិវិទ្យា</th>
                     <th style='text-align: center'>គណិតវិទ្យា</th>
                     <th style='text-align: center'>ភាសាខ្មែរ</th>
                     <th style='text-align: center'>រូបវិទ្យា</th>
                     <th style='text-align: center'>គីមី</th>
                     <th style='text-align: center'>ជីវវិទ្យា</th>  
                     <th style='text-align: center'>ផែនដីវិទ្យា</th> 
                     <th style='text-align: center'>គេហវិទ្យា</th>
                     <th style='text-align: center'>ភាសាអង់គ្លេស</th>
                     <th style='text-align: center'>អប់រំកាយ-កីឡា</th>
                     <th style='text-align: center'>ពលកម្ម</th> 
                     <th hidden>month</th> 
                     <th hidden >student_id</thhidden>
                     <th hidden>grade</th>
                     <th hidden>class_id</th>
                     <th hidden>ID</th>   
                </thead>
               <tbody>
        ";
            $avg='';
            $i=1;
            foreach ($sql as $row) {
                $avg=$row->avg_m;
                if($row->sex=="F"){
                    $sex="កញ្ញា";
                }else{
                    $sex="";
                }
                $output .= '
             <tr class="text-center">
              <td style="text-align: center">'.$i++.'</td>
               <td style="text-align: left" ><p style="width: 10rem;">'. $row->kh_name . '</p></td>
                <td><input type="text" class=" form-control  teasekdey" style="text-align: center;font-size: 14px ;width: 5rem" value="'.$row->teasekdey.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  writting" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->writting.'" maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  polroth" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->polroth.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  history" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->history.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class="  form-control  phum" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->phum.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  math" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->math.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  khmer" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->khmer.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  physical" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->physical.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  chemistry" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->chemistry.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control   biology" style="text-align: center;font-size: 14px ;width: 5rem" value="'.$row->biology.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  phandey" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->phandey.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  kehak" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->kehak.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  english" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->english.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  sport" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->sport.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td><input type="text" class=" form-control  polakam" style="text-align: center;font-size: 14px  ;width: 5rem" value="'.$row->polakam.'"  maxlength="3" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
                <td hidden><input type="text" class="month" value="'.$request->month.'"></td>
                <td hidden><input type="text" class="student_id" value="' . $row->st_id . '"></td>
                <td hidden><input type="text" class="grade" value="8"></td>
                <td hidden><input type="text" class="class_id" value="'.$request->grade.'"></td>
                <td hidden ><input type="text" class="score_id" value="'.$row->score_id.'"></td>
            </tr>
           ';
            }
            $output .= "
            </tbody>
            </table>
        
        ";
            return response(['output'=>$output,'con'=>2,'AVG'=>$avg]);


        }


    }
    public function InsertScore(Request $request){
        if($request->con==1){
            for($i=0;$i<count($request->student_id);$i++)
            {
                $form_arr=[
                    'avg_m'=>$request->txtavg,
                    'student_id'=>$request->student_id[$i],
                    'grade'=>$request->grade[$i],
                    'class_id'=>$request->class_id[$i],
                    'month_id'=>$request->month[$i],
                    'math'=>$request->math[$i],
                    'khmer'=>$request->khmer[$i],
                    'physical'=>$request->physical[$i],
                    'chemistry'=>$request->chemistry[$i],
                    'biology'=>$request->biology[$i],
                    'history'=>$request->history[$i],
                    'phum'=>$request->phum[$i],
                    'polakam'=>$request->polakam[$i],
                    'sport'=>$request->sport[$i],
                    'writting'=>$request->writting[$i],
                    'teasekdey'=>$request->teasekdey[$i],
                    'polroth'=>$request->polroth[$i],
                    'kehak'=>$request->kehak[$i],
                    'phandey'=>$request->phandey[$i],
                    'english'=>$request->english[$i]
                ];
                $insert[]=$form_arr;
            }
            ScoreCCOnline::insert($insert);
        }else{
            for($i=0;$i<count($request->score_id);$i++)
            {
                DB::table('score_cc_online')->where('id',$request->score_id[$i])
                    ->where('class_id',$request->class_id[$i])->where('month_id',$request->month[$i])->where('grade',8)
                    ->update(
                        [
                            'avg_m'=>$request->txtavg,
                            'student_id'=>$request->student_id[$i],
                            'grade'=>$request->grade[$i],
                            'class_id'=>$request->class_id[$i],
                            'month_id'=>$request->month[$i],
                            'math'=>$request->math[$i],
                            'khmer'=>$request->khmer[$i],
                            'physical'=>$request->physical[$i],
                            'chemistry'=>$request->chemistry[$i],
                            'biology'=>$request->biology[$i],
                            'phum'=>$request->phum[$i],
                            'polakam'=>$request->polakam[$i],
                            'sport'=>$request->sport[$i],
                            'writting'=>$request->writting[$i],
                            'teasekdey'=>$request->teasekdey[$i],
                            'polroth'=>$request->polroth[$i],
                            'history'=>$request->history[$i],
                            'kehak'=>$request->kehak[$i],
                            'phandey'=>$request->phandey[$i],
                            'english'=>$request->english[$i]
                        ]
                    );

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

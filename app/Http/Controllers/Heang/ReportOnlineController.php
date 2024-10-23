<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class ReportOnlineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $month = DB::table('month')->get();
        $class = DB::table('class')
        ->join('classroom', 'class.classroom_id', '=', 'classroom.id')
        ->join('grade', 'class.grade_id', '=', 'grade.id')
        ->join('academic_year', 'class.academic_year_id', '=', 'academic_year.id')
        ->select('class.*', 'classroom.name AS class', 'grade.name AS gname', 'academic_year.name AS year')
        ->get();
        $subject = DB::table('subject')->get();
        return view('Heang/report/reportonline', [
            'month' => $month,
            'class' => $class,
            'subject' => $subject
        ]);

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
        $getsub = DB::table('score_online')
            ->join('class', 'score_online.class_id', '=', 'class.id')
            ->join('subject', 'score_online.subject_id', '=', 'subject.id')
            ->select('score_online.*', 'subject.name', 'subject.id')
            ->where('score_online.class_id', '=', $id)
            ->groupBy('score_online.subject_id')
            ->get();
        return response()->json($getsub);
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

    public function rptonline(Request $request)
    {
        $getrpt = DB::table('score_online')
            ->join('student', 'score_online.student_id', '=', 'student.id')
            ->join('subject', 'score_online.subject_id', '=', 'subject.id')
            ->select('score_online.*', 'student.kh_name', 'student.sex')
            ->where('score_online.subject_id', '=', $request->subid)
            ->where('score_online.month_id', '=', $request->month)
            ->orderby('kh_name')
            ->get();
        if ($request->month && $request->subid) {
            $i=0;
            $output = "

                <table id='exp' class='table table-condensed table-bordered  animated slideInDown fast'>
                <thead class='bg-blue bg-inverse'>
                    <tr>
                        <th>ល.រ</th>
                        <th>នាម និងគោត្តនាម</th>
                        <th>ប្រលង៥០%</th>
                        <th>កិច្ចការ២០%</th>
                        <th>វត្តមាន១០%</th>2
                        <th>Quiz២០%</th>
                        <th>ពិន្ទុសរុប</th>
                    </tr>
                </thead>
                <tbody>
            ";
            foreach ($getrpt as $row) {
                $i++;
                $output.="
                    <tr>
                        <td>$i</td>
                        <td>$row->kh_name</td>
                        <td>$row->exam</td>
                        <td>$row->homework</td>
                        <td>$row->attendance</td>
                        <td>$row->quiz</td>
                        <td>$row->total</td>
                    </tr>
               ";
            }
            $output.="</tbody></table>";
            return ['output'=>$output];
        } else {
            return $output = "
                <table id='exps' class='table table-condensed table-bordered' style='margin-top: 10px;'>
                    <thead class='bg-blue bg-inverse'>
                        <tr>
                            <th>N<sup>o</sup></th>
                            <th>នាម និងគោត្តនាម</th>
                            <th>ភេទ</th>
                            <th>ប្រលង</th>
                            <th>កិច្ចការ</th>
                            <th>វត្តមាន</th>
                            <th>Quiz</th>
                            <th>ពិន្ទុសរុប</th>
                        </tr>
                    </thead>
                </table>
            ";
        }
    }
}

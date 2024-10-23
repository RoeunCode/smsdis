<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Heang\Score;
use DB;

class ClassController extends Controller
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
        return view('Heang/class/class', [
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

    public function getStudent(Request $request)
    {
        $db = DB::table('score_online')->where('class_id', $request->cid)->where('subject_id', $request->subid)->where('month_id', $request->month)->count();
        if ($request->month == 13) {
            return '';
        } else if ($db == 0) {
            $getstudent = DB::table('student_class')
                ->join('student', 'student_class.student_id', '=', 'student.id')
                ->select('student_class.*', 'student.kh_name', 'student.sex')
                ->where('student_class.class_id', '=', $request->cid)
                ->get();
            $i=0;
            $output = "
                <table id='attb' class='table table-condensed table-bordered animated slideInDown fast'>
                <thead class='bg-blue bg-inverse'>
                    <tr>
                        <th>N<sup>o</sup></th>
                        <th>នាម និងគោត្តនាម</th>
                        <th>ប្រលង 50%</th>
                        <th>កិច្ចការ 20%</th>
                        <th>វត្តមាន 10%</th>
                        <th>Quiz 20%</th>
                    </tr>
                </thead>
                <tbody>
            ";
            foreach ($getstudent as $row) {
                $i++;
                $output.="
                    <tr>
                        <td>$i</td>
                        <td style='text-align: left;'>$row->kh_name</td>
                        <td><input type='number' class='form-control exam' style='text-align: center;font-size: 14px;'></td>
                        <td><input type='number' class='form-control homework' style='text-align: center;font-size: 14px;'></td>
                        <td><input type='number' class='form-control attendance' style='text-align: center;font-size: 14px;'></td>
                        <td><input type='number' class='form-control quiz' style='text-align: center;font-size: 14px;'></td>
                        <td hidden><input type='text' class='stuid' value='" . $row->student_id . "'></td>
                        <td hidden><input type='text' class='cid' value='" . $row->class_id . "'></td>
                        <td hidden><input type='text' class='subid' value='" . $request->subid . "'></td>
                        <td hidden><input type='text' class='month' value='" . $request->month . "'></td>
                    </tr>
               ";
            }
            $output.="</tbody></table>";
            return response(['output' => $output, 'con' => 1]);
        } else {
            $getstudent = DB::table('score_online')
                ->join('student', 'score_online.student_id', '=', 'student.id')
                ->select('score_online.*', 'student.kh_name', 'student.sex')
                ->where('score_online.class_id', '=', $request->cid)
                ->where('score_online.subject_id', '=', $request->subid)
                ->where('score_online.month_id', '=', $request->month)
                ->get();
            $i=0;
            $output = "
                <table id='attb' class='table table-condensed table-bordered animated slideInDown fast'>
                <thead class='bg-blue bg-inverse'>
                    <tr>
                        <th>N<sup>o</sup></th>
                        <th>នាម និងគោត្តនាម</th>
                        <th>ប្រលង 50%</th>
                        <th>កិច្ចការ 20%</th>
                        <th>វត្តមាន 10%</th>
                        <th>Quiz 20%</th>
                    </tr>
                </thead>
                <tbody>
            ";
            foreach ($getstudent as $row) {
                $i++;
                $output.="
                    <tr>
                        <td>$i</td>
                        <td style='text-align: left;'>$row->kh_name</td>
                        <td><input type='number' class='form-control exam' style='text-align: center;font-size: 14px; margin: 0 auto;' value='" . $row->exam . "'></td>
                        <td><input type='number' class='form-control homework' style='text-align: center;font-size: 14px; margin: 0 auto;' value='" . $row->homework . "'></td>
                        <td><input type='number' class='form-control attendance' style='text-align: center;font-size: 14px; margin: 0 auto;' value='" . $row->attendance . "'></td>
                        <td><input type='number' class='form-control quiz' style='text-align: center;font-size: 14px; margin: 0 auto;' value='" . $row->quiz . "'></td>
                        <td hidden><input type='text' class='stuid' value='" . $row->student_id . "'></td>
                        <td hidden><input type='text' class='cid' value='" . $row->class_id . "'></td>
                        <td hidden><input type='text' class='subid' value='" . $row->subject_id . "'></td>
                        <td hidden><input type='text' class='month' value='" . $row->month_id . "'></td>
                        <td hidden><input type='text' class='score_id' value='" . $row->id . "'></td>
                    </tr>
               ";
            }
            $output.="</tbody></table>";
            return response(['output' => $output, 'con' => 2]);
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
        if ($request->con == 1) {
            $dataSet = [];
            for ($i = 0; $i < count($request->stuid); $i++)
            {
                $dataSet[] = [
                    'student_id' => $request->stuid[$i],
                    'class_id' => $request->cid[$i],
                    'subject_id' => $request->subid,
                    'month_id' => $request->month,
                    'exam' => $request->exam[$i],
                    'homework' => $request->homework[$i],
                    'attendance' => $request->attendance[$i],
                    'quiz' => $request->quiz[$i]
                ];
                // $insert[] = $dataSet;
            }
            // Score::insert($insert);
            DB::table('score_online')->insert($dataSet);
        } else {

            for ($i = 0; $i < count($request->stuid); $i++)
            {
                DB::table('score_online')
                    ->where('id', $request->score_id[$i])
                    ->where('class_id', $request->cid[$i])
                    ->where('subject_id', $request->subid)
                    ->where('month_id', $request->month)
                    ->update([
                        'student_id' => $request->stuid[$i],
                        'class_id' => $request->cid[$i],
                        'subject_id' => $request->subid,
                        'month_id' => $request->month,
                        'exam' => $request->exam[$i],
                        'homework' => $request->homework[$i],
                        'attendance' => $request->attendance[$i],
                        'quiz' => $request->quiz[$i]
                   ]);
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

<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Heang\PrimaryScore;
use DB;

class PrimaryScoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $month = DB::table('month')->get();
        $class = DB::table('class')
        ->join('classroom', 'class.classroom_id', '=', 'classroom.id')
        ->join('grade', 'class.grade_id', '=', 'grade.id')
        ->join('academic_year', 'class.academic_year_id', '=', 'academic_year.id')
        ->select('class.*', 'classroom.name AS class', 'grade.name AS gname', 'academic_year.name AS year')
        ->where('grade.name', 'NOT REGEXP', '[a-z]')
        ->orderBy('grade.name','ASC')
        ->get();
        return view('Heang/primary/score/score', [
            'month' => $month,
            'class' => $class
        ]);
    }

    public function getStudnetScore(Request $request)
    {
        // $query = DB::table('class')
        // ->join('grade', 'class.grade_id', '=', 'grade.id')
        // ->select('class.*', 'grade.name AS gname')
        // ->where('grade.name', 'LIKE', '១ %')
        // ->orWhere('grade.name', 'LIKE', '២ %')
        // ->where('class.id', $request->cid)
        // ->get();

        $db = DB::table('primary_score')->where('class_id', $request->cid)->where('month_id', $request->mid)->count();
        if ($request->mid == 13) {
            $output = '<div style="text-align: center"><h3>ពិន្ទុប្រចាំឆ្នាំមិនតម្រូវអោយបញ្ចូល !</h3></div>';
            return response(['output' => $output]);
        } else if ($db == 0) {
            $getstudent = DB::table('student_class')
                ->join('student', 'student_class.student_id', '=', 'student.id')
                ->select('student_class.*', 'student.kh_name', 'student.sex')
                ->where('student_class.class_id', '=', $request->cid)
                ->get();
            $output = "
                <table class='table table-condensed table-bordered'>
                    <thead>
                        <tr>
                            <th style='vertical-align:middle'>ល.រ</th>
                            <th style='vertical-align:middle; width: 20%;'>គោត្តនាម និងនាម</th>
                            <th style='vertical-align:middle;'>ភេទ</th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>អំណាន</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>សរ-តាមអាន</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>តែងសេចក្តី</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>អក្សរផ្ចង់</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>គំនូរ</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>វេយ្យាករណ៏</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>គណិតវិទ្យា</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>សីលធម៏</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>វិទ្យាសាស្រ្ត</div></th>
                        </tr>
                    </thead>
                <tbody>
            ";
            $i = 1;
            foreach ($getstudent as $row) {
                $output.="
                    <tr>
                        <td>".$i++."</td>
                        <td style='text-align: left;'>$row->kh_name</td>";
                        if ($row->sex == 'M') {
                            $output .= "<td style='text-align: center;'>ប</td>";
                        } else {
                            $output .= "<td style='text-align: center;'>ស</td>";
                        }
                        $output .= "<td><input type='number' class='intsc form-control reading' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control written' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control essay' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control calligraphy' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control draw' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control grammer' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control math' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control moral' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td><input type='number' class='intsc form-control science' style='text-align: center;font-size: 14px; margin: 0 auto;'></td>
                        <td hidden><input type='text' class='stuid' value='" . $row->student_id . "'></td>
                        <td hidden><input type='text' class='cid' value='" . $row->class_id . "'></td>
                        <td hidden><input type='text' class='mid' value='" . $request->mid . "'></td>
                    </tr>
               ";
            }
            $output.="</tbody></table>";
            return response(['output' => $output, 'con' => 1]);
        } else {
            $getstudent = DB::table('primary_score')
                ->join('student', 'primary_score.student_id', '=', 'student.id')
                ->select('primary_score.*', 'student.kh_name', 'student.sex')
                ->where('primary_score.class_id', $request->cid)
                ->where('primary_score.month_id', $request->mid)
                ->get();
            $output = "
                <table class='table table-condensed table-bordered'>
                    <thead>
                        <tr>
                            <th style='vertical-align:middle'>ល.រ</th>
                            <th style='vertical-align:middle; width: 20%;'>គោត្តនាម និងនាម</th>
                            <th style='vertical-align:middle;'>ភេទ</th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>អំណាន</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>សរ-តាមអាន</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>តែងសេចក្តី</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>អក្សរផ្ចង់</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>គំនូរ</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>វេយ្យាករណ៏</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>គណិតវិទ្យា</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>សីលធម៏</div></th>
                            <th style='vertical-align:middle;' class='vertical'><div class='vertical'>វិទ្យាសាស្រ្ត</div></th>
                        </tr>
                    </thead>
                <tbody>
            ";
            $i = 1;
            foreach ($getstudent as $row) {
                $avg = $row->numsub;
                $output.="
                    <tr>
                        <td>".$i++."</td>
                        <td style='text-align: left;'>$row->kh_name</td>";
                        if ($row->sex == 'M') {
                            $output .= "<td style='text-align: center;'>ប</td>";
                        } else {
                            $output .= "<td style='text-align: center;'>ស</td>";
                        }
                        $output .= "<td><input type='number' class='intsc form-control reading' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->reading."></td>
                        <td><input type='number' class='intsc form-control written' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->written."></td>
                        <td><input type='number' class='intsc form-control essay' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->essay."></td>
                        <td><input type='number' class='intsc form-control calligraphy' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->calligraphy."></td>
                        <td><input type='number' class='intsc form-control draw' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->draw."></td>
                        <td><input type='number' class='intsc form-control grammer' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->grammer."></td>
                        <td><input type='number' class='intsc form-control math' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->math."></td>
                        <td><input type='number' class='intsc form-control moral' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->moral."></td>
                        <td><input type='number' class='intsc form-control science' style='text-align: center;font-size: 14px; margin: 0 auto;' value=".$row->science."></td>
                        <td hidden><input type='text' class='stuid' value='" . $row->student_id . "'></td>
                        <td hidden><input type='text' class='cid' value='" . $row->class_id . "'></td>
                        <td hidden><input type='text' class='mid' value='" . $row->month_id . "'></td>
                        <td hidden><input type='text' class='score_id' value='" . $row->id . "'></td>
                    </tr>
               ";
            }
            $output.="</tbody></table>";
            return response(['output' => $output, 'con' => 2, 'AVG' => $avg]);
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
                for ($i = 0; $i < count($request->stuid); $i++)
                {
                    $dataSet = [
                        'student_id' => $request->stuid[$i],
                        'class_id' => $request->cid[$i],
                        'month_id' => $request->mid,
                        'reading' => $request->r[$i],
                        'written' => $request->w[$i],
                        'essay' => $request->e[$i],
                        'calligraphy' => $request->c[$i],
                        'draw' => $request->d[$i],
                        'grammer' => $request->g[$i],
                        'math' => $request->ma[$i],
                        'moral' => $request->mo[$i],
                        'science' => $request->science[$i],
                        'numsub' => $request->numsub
                    ];
                    $insert[] = $dataSet;
                }
                PrimaryScore::insert($insert);
            } else {
                for ($i = 0; $i < count($request->score_id); $i++)
                {
                    DB::table('primary_score')
                    ->where('id', $request->score_id[$i])
                    ->where('class_id', $request->cid[$i])
                    ->where('month_id', $request->mid)
                    ->update([
                        'student_id' => $request->stuid[$i],
                        'class_id' => $request->cid[$i],
                        'numsub' => $request->numsub,
                        'month_id' => $request->mid,
                        'reading' => $request->r[$i],
                        'written' => $request->w[$i],
                        'essay' => $request->e[$i],
                        'calligraphy' => $request->c[$i],
                        'draw' => $request->d[$i],
                        'grammer' => $request->g[$i],
                        'math' => $request->ma[$i],
                        'moral' => $request->mo[$i],
                        'science' => $request->science[$i]
                    ]);
                }
            }
    }

}

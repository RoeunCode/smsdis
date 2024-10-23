<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class ReportPrimaryScoreController extends Controller
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
        ->where('grade.name', 'NOT REGEXP', '[a-z]')
        ->orderBy('grade.name','ASC')
        ->get();
        return view('Heang/primary/score/report', [
            'month' => $month,
            'class' => $class
        ]);
    }

    public function rptPrimaryScore(Request $request)
    {
        $grade = DB::table('primary_score')->where('primary_score.class_id', '=', $request->cid)->where('primary_score.month_id', '=', $request->mid)->get();
        foreach ($grade as $grade) {
            if ($grade->numsub == 8) {
                $getrpt = DB::select("SELECT primary_score.*, student.kh_name, student.sex, primary_score.avg, RANK() OVER(ORDER BY primary_score.avg DESC) AS rank FROM primary_score INNER JOIN student ON primary_score.student_id = student.id WHERE primary_score.class_id = '".$request->cid."' AND primary_score.month_id = '".$request->mid."'");

                if ($request->cid && $request->mid) {
                    $output = "
                        <table class='table table-condensed table-bordered report' id='exp'>
                            <thead class='bg-blue bg-inverse'>
                                <tr>
                                    <th>ល.រ</th>
                                    <th style='width: 20%;'>គោត្តនាម និងនាម</th>
                                    <th>ភេទ</th>
                                    <th><div class='rotate'>អំណាន</div></th>
                                    <th><div class='rotate'>សរ-តាមអាន</div></th>
                                    <th><div class='rotate'>តែងសេចក្តី</div></th>
                                    <th><div class='rotate'>អក្សរផ្ចង់</div></th>
                                    <th><div class='rotate'>គំនូរ</div></th>
                                    <th><div class='rotate'>គណិតវិទ្យា</div></th>
                                    <th><div class='rotate'>សីលធម៏</div></th>
                                    <th><div class='rotate'>វិទ្យាសាស្រ្ត</div></th>
                                    <th><div class='rotate font-weight'>ពិន្ទុសរុប</div></th>
                                    <th><div class='rotate font-weight'>មធ្យមភាគ</div></th>
                                    <th><div class='rotate font-weight'>ចំណាក់ថ្នាក់</div></th>
                                    <th>ផ្សេងៗ</th>
                                </tr>
                            </thead>
                        <tbody>
                    ";
                    $i = 0;
                    foreach ($getrpt as $row) {
                        $i++;
                        $output.="
                            <tr>
                                <td>$i</td>
                                <td>$row->kh_name</td>";
                                if ($row->sex == 'M') {
                                    $output .= "<td style='text-align: center;'>ប</td>";
                                } else {
                                    $output .= "<td style='text-align: center;'>ស</td>";
                                }
                                $output .="<td>$row->reading</td>
                                <td>$row->written</td>
                                <td>$row->essay</td>
                                <td>$row->calligraphy</td>
                                <td>$row->draw</td>
                                <td>$row->math</td>
                                <td>$row->moral</td>
                                <td>$row->science</td>
                                <td>$row->total</td>
                                <td>$row->avg</td>
                                <td>$row->rank</td>
                                <td></td>
                            </tr>
                       ";
                    }
                    $output.="</tbody></table>";
                    return ['output'=>$output];
                }
            } else if ($grade->numsub == 9) {
                $getrpt = DB::select("SELECT primary_score.*, student.kh_name, student.sex, primary_score.avg, RANK() OVER(ORDER BY primary_score.avg DESC) AS rank FROM primary_score INNER JOIN student ON primary_score.student_id = student.id WHERE primary_score.class_id = '".$request->cid."' AND primary_score.month_id = '".$request->mid."'");

                if ($request->cid && $request->mid) {
                    $output = "
                        <table class='table table-condensed table-bordered report' id='exp'>
                            <thead class='bg-blue bg-inverse'>
                                <tr>
                                    <th>ល.រ</th>
                                    <th style='width: 15%;'>គោត្តនាម និងនាម</th>
                                    <th>ភេទ</th>
                                    <th><div class='rotate'>អំណាន</div></th>
                                    <th><div class='rotate'>សរ-តាមអាន</div></th>
                                    <th><div class='rotate'>តែងសេចក្តី</div></th>
                                    <th><div class='rotate'>អក្សរផ្ចង់</div></th>
                                    <th><div class='rotate'>គំនូរ</div></th>
                                    <th><div class='rotate'>វេយ្យាករណ៏</div></th>
                                    <th><div class='rotate'>គណិតវិទ្យា</div></th>
                                    <th><div class='rotate'>សីលធម៏</div></th>
                                    <th><div class='rotate'>វិទ្យាសាស្រ្ត</div></th>
                                    <th><div class='rotate font-weight'>ពិន្ទុសរុប</div></th>
                                    <th><div class='rotate font-weight'>មធ្យមភាគ</div></th>
                                    <th><div class='rotate font-weight'>ចំណាក់ថ្នាក់</div></th>
                                    <th>ផ្សេងៗ</th>
                                </tr>
                            </thead>
                        <tbody>
                    ";
                    $i = 0;
                    foreach ($getrpt as $row) {
                        $i++;
                        $output.="
                            <tr>
                                <td>$i</td>
                                <td>$row->kh_name</td>";
                                if ($row->sex == 'M') {
                                    $output .= "<td style='text-align: center;'>ប</td>";
                                } else {
                                    $output .= "<td style='text-align: center;'>ស</td>";
                                }
                                $output .="<td>$row->reading</td>
                                <td>$row->written</td>
                                <td>$row->essay</td>
                                <td>$row->calligraphy</td>
                                <td>$row->draw</td>
                                <td>$row->grammer</td>
                                <td>$row->math</td>
                                <td>$row->moral</td>
                                <td>$row->science</td>
                                <td>$row->total</td>
                                <td>$row->avg</td>
                                <td>$row->rank</td>
                                <td></td>
                            </tr>
                       ";
                    }
                    $output.="</tbody></table>";
                    return ['output'=>$output];
                }
            } else {
                $getrpt = DB::select("SELECT primary_score.*, student.kh_name, student.sex, primary_score.avg, RANK() OVER(ORDER BY primary_score.avg DESC) AS rank FROM primary_score INNER JOIN student ON primary_score.student_id = student.id WHERE primary_score.class_id = '".$request->cid."' AND primary_score.month_id = '".$request->mid."'");

                if ($request->cid && $request->mid) {
                    $output = "
                        <table class='table table-condensed table-bordered report' id='exp'>
                            <thead class='bg-blue bg-inverse'>
                                <tr>
                                    <th>ល.រ</th>
                                    <th style='width: 15%;'>គោត្តនាម និងនាម</th>
                                    <th>ភេទ</th>
                                    <th><div class='rotate'>អំណាន</div></th>
                                    <th><div class='rotate'>សរ-តាមអាន</div></th>
                                    <th><div class='rotate'>តែងសេចក្តី</div></th>
                                    <th><div class='rotate'>អក្សរផ្ចង់</div></th>
                                    <th><div class='rotate'>គំនូរ</div></th>
                                    <th><div class='rotate'>វេយ្យាករណ៏</div></th>
                                    <th><div class='rotate'>គណិតវិទ្យា</div></th>
                                    <th><div class='rotate'>សីលធម៏</div></th>
                                    <th><div class='rotate'>វិទ្យាសាស្រ្ត</div></th>
                                    <th><div class='rotate font-weight'>ពិន្ទុសរុប</div></th>
                                    <th><div class='rotate font-weight'>មធ្យមភាគ</div></th>
                                    <th><div class='rotate font-weight'>ចំណាក់ថ្នាក់</div></th>
                                    <th>ផ្សេងៗ</th>
                                </tr>
                            </thead>
                        <tbody>
                    ";
                    $i = 0;
                    foreach ($getrpt as $row) {
                        $i++;
                        $output.="
                            <tr>
                                <td>$i</td>
                                <td>$row->kh_name</td>";
                                if ($row->sex == 'M') {
                                    $output .= "<td style='text-align: center;'>ប</td>";
                                } else {
                                    $output .= "<td style='text-align: center;'>ស</td>";
                                }
                                $output .="<td>$row->reading</td>
                                <td>$row->written</td>
                                <td>$row->essay</td>
                                <td>$row->calligraphy</td>
                                <td>$row->draw</td>
                                <td>$row->grammer</td>
                                <td>$row->math</td>
                                <td>$row->moral</td>
                                <td>$row->science</td>
                                <td>$row->total</td>
                                <td>$row->avg</td>
                                <td>$row->rank</td>
                                <td></td>
                            </tr>
                       ";
                    }
                    $output.="</tbody></table>";
                    return ['output'=>$output];
                }
            }
        }
    }
}

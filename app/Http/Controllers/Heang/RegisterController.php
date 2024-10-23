<?php

namespace App\Http\Controllers\Heang;
use App\payment;
use App\payment_detail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Redirect,Response;
use App\Heang\Student;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {

        $student = DB::table('student')->get();
        $pay_method=DB::table('payment_method')->get();
        $pro_type=DB::Table('service_type')->get();
        $acdemic=DB::Table('academic_year')->orderBy('id','DESC')->get();
        $notification  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','users.username','payment_detail.Volidty_of_payment','payment_detail.expired_date','student.phone_student','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit',  'payment_method.payment_method')
            ->where('payment_detail.expired_date','=', Carbon::today())
            ->where('invoice.cam_id',auth()->user()->camp_id)
            ->orderby('payment_detail.expired_date','DESC')
            ->get();
        return view('Heang/register/register_view', [
            'student' => $student,
            'pay_method'=>$pay_method,
            'notification' => $notification,
            'pro_service'=>$pro_type,
            'academic'=>$acdemic
        ]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Heang/register/register_add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [
            'student_id' => $request['student_id'],
            'kh_name' => $request['kh_name'],
            'en_name' => $request['en_name'],
            'sex' => $request['sex'],
            'dob' => $request['dob'],
            'phone_student' => $request['stel'],
            'national' => $request['national'],
            'village_pob' => $request['pob_v'],
            'commue_pob' => $request['pob_c'],
            'district_pob' => $request['pob_d'],
            'province_pob' => $request['pob_p'],
            'village_current' => $request['cur_v'],
            'commue_current' => $request['cur_c'],
            'district_current' => $request['cur_d'],
            'province_current' => $request['cur_p'],
            'old_grade' => $request['old_school_grade'],
            'old_school' => $request['old_school'],
            'old_en_grade' => $request['old_en_school'],
            'farther_name' => $request['fnm'],
            'mother_name' => $request['mname'],
            'farther_job' => $request['jobf'],
            'mother_job' => $request['jobm'],
            'national_far' => $request['natf'],
            'national_mother' => $request['natm'],
            'phone_farther' => $request['telf'],
            'address_farther' => $request['pob_vf'],
            'address_mother' => $request['pob_vm'],
            'campus_id' => $request['campus_id'],
        ];
        $data = Student::create($data);
        return Response::json($data);
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
    public function countAllPro()
    {
        $service=DB::table('product_service')->where('status',0)->count();
        $service_type=DB::table('service_type')->where('status',0)->count();
        $dis=DB::table('discount_pay')->where('status',0)->count();
        $academic=DB::table('academic_year')->where('deleted',0)->count();
        return response()->json([
            "pro_service"=>$service,
            "service_type"=>$service_type,
            "discount"=>$dis,
            "academic"=>$academic
        ]);

    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $student = DB::table('student')->where('id', $id)->first();
        return view('Heang/register/register_edit', [
            'student' => $student
        ]);
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
        $student = DB::table('student')
        ->where('id', $id)
        ->update([
            'student_id' => $request->input('student_id'),
            'kh_name' => $request->input('kh_name'),
            'en_name' => $request->input('en_name'),
            'sex' => $request->input('sex'),
            'dob' => $request->input('dob'),
            'phone_student' => $request->input('stel'),
            'national' => $request->input('national'),
            'village_pob' => $request->input('pob_v'),
            'commue_pob' => $request->input('pob_c'),
            'district_pob' => $request->input('pob_d'),
            'province_pob' => $request->input('pob_p'),
            'village_current' => $request->input('cur_v'),
            'commue_current' => $request->input('cur_c'),
            'district_current' => $request->input('cur_d'),
            'province_current' => $request->input('cur_p'),
            'old_grade' => $request->input('old_school_grade'),
            'old_school' => $request->input('old_school'),
            'old_en_grade' => $request->input('old_en_school'),
            'farther_name' => $request->input('fnm'),
            'mother_name' => $request->input('mname'),
            'farther_job' => $request->input('jobf'),
            'mother_job' => $request->input('jobm'),
            'national_far' => $request->input('natf'),
            'national_mother' => $request->input('natm'),
            'phone_farther' => $request->input('telf'),
            'address_farther' => $request->input('pob_vf'),
            'address_mother' => $request->input('pob_vm'),
            'campus_id'=>auth()->user()->camp_id
        ]);
        return Response::json($student);
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
    public function service_type(){
        $type=DB::Table('service_type')->where('status',0)->get();
        return response()->json([
            "data"=>$type
        ]);
    }
    public function show_proservice($idpaid,$idyear){
        $service=DB::Table('product_service')
               ->join('service_type','product_service.id_service_type','=','service_type.id')
               ->select('product_service.id_pay','product_service.id','product_service.price_service','product_service.pro_service','product_service.price_service','service_type.service_type','product_service.id_service_type')
               ->where('product_service.status',0)
               ->where('product_service.id_pay',$idpaid)
                ->where('product_service.id_academic',$idyear)
                ->get();
        return response()->json([
            'data'=>$service
        ]);
    }
    public function delete_service(Request $request)
    {
        $dele=DB::table('product_service')->where('id',$request->id)->update(["status"=>1]);
        if($dele){

//           return $this->show_proservice();
            $service=DB::Table('product_service')
                ->join('service_type','product_service.id_service_type','=','service_type.id')
                ->select('product_service.id_pay','product_service.id','product_service.price_service','product_service.pro_service','product_service.price_service','service_type.service_type','product_service.id_service_type')
                ->where('product_service.status',0)->get();
            return response()->json([
                'data'=>$service
            ]);
        }
    }
    public function edit_service_type(Request $request){

        if($request->ajax())
        {
           $frm=[
             "pro_service"=>$request->edit_service_name,
             "id_service_type"=>$request->edit_type,
             'price_service'=>$request->edit_price
           ];
           $update=DB::Table('product_service')->where('id',$request->id_service)->update($frm);
           if($update){
//                return $this->show_proservice();

               $service=DB::Table('product_service')
                   ->join('service_type','product_service.id_service_type','=','service_type.id')
                   ->select('product_service.id_pay','product_service.id','product_service.price_service','product_service.pro_service','product_service.price_service','service_type.service_type','product_service.id_service_type')
                   ->where('product_service.status',0)->get();

               return response()->json([
                   'data'=>$service
               ]);
           }

        }

    }
    public  function  history_cancel_paid(){
        //for view history report cancel paid

            //condition where status =2 it payment equal cancel
        $report = DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('student.en_name', 'users.username','payment.updated_at','invoice.invoice_number', 'payment.payment_date', 'payment_detail.description','payment_detail.total_amount','payment_detail.total_payment')
            ->where('payment_detail.status',2)
            //    ->groupBy('payment_detail.id_payment')
            ->get();
        return response()->json([
            'report' => $report
        ]);
    }
    public function save_service_type(Request $request){

            if($request->ajax()){
                $service_type=DB::Table('service_type')->insert(["service_type"=>$request->service_type]);
                if($service_type){

                    $data=DB::Table('service_type')->where('status',0)->get();
                    return response()->json([
                        "data"=>$data
                    ]);
                }
            }

    }
    public function update_pro_type(Request $request)
    {
        if($request->ajax())
        {
            $update_type=DB::table('service_type')->where('id',$request->id)
                         ->update(["service_type"=>$request->edit_service_type]);
             if($update_type)
             {
                return $this->service_type();
             }
        }
    }
    public function view_history_cancel(Request $request){

        $from='';
        $to='';
        if($request->ajax())
        {
                //condition where status =2 it payment equal cancel
                $payment  =  DB::table('payment')
                ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                ->join('student', 'payment.student_id', '=', 'student.id')
                ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                ->join('users','payment_detail.user_id_pay','=','users.id')
                ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                ->where('student.id',$request->id )->where('payment_detail.status',2)
                ->where('payment.payment_method',$request->pay_method)
                ->whereBetween('payment.payment_date',[$from,$to])
                ->groupBy('payment_detail.id_payment')
                ->get();
        }
        return response()->json([
           'data'=>$payment
        ]);

    }
    public function delete_pro_type(Request $resquest)
    {
        if($resquest->ajax())
        {
             $del_type=DB::table('service_type')->where('id',$resquest->id)->update(["status"=>1]);
             if($del_type){

                $data=DB::Table('service_type')->where('status',0)->get();
                return response()->json([
                    "data"=>$data
                ]);
             }
        }
    }
    public function show_discount(){
        $data=DB::table('discount_pay')->where('status',0)->get();
        return response()->json([
            "data"=>$data
        ]);
    }
    public function add_discount(Request $request){

        if($request->ajax())
        {
            $frm_array=[
                "discount_name"=>$request->txtdescription,
                "percent_dis"=>$request->txtdiscount,
                "from_date"=>$request->txtfromdate,
                "exp_date"=>$request->txtexpdate,
                "note"=>$request->txtnote,
            ];
            $insert=DB::table('discount_pay')->insert($frm_array);
            if($insert){
                return $this->show_discount();
            }
        }

    }
    public function edit_discount(Request $request)
    {
        if($request->ajax())
        {
            $update=DB::table('discount_pay')->where('id',$request->id)
                    ->update($request->frm_arr);

                    if($update){

                        return  $this->show_discount();
                    }
        }

    }
    public function delete_discount(Request $request)
    {
        if($request->ajax())
        {
            $del=DB::table('discount_pay')->where('id',$request->id)
                ->update(["status"=>1]);
                if($del)
                {
                   return $this->show_discount();
                }
        }
    }
    public function show_acedamic_pay(){
        $data=DB::table('academic_year')->where('deleted',0)->get();
            return response()->json([
                "data"=>$data
            ]);
    }
    public function add_accdemic_pay(Request $request){

        $academic=DB::table('academic_year')->insert($request->frm);
        if($academic){
            return $this->show_acedamic_pay();
        }
    }
    public function edit_accdemic_pay(Request $request ){

        $update_ac=DB::table('academic_year')->where('id',$request->id)
                   ->update($request->frm);
                   if($update_ac)
                   {
                      return $this->show_acedamic_pay();
                   }
    }
    public function del_accdemic_pay(Request $request)
    {
        $del=DB::table('academic_year')->where('id',$request->id)
              ->update(['deleted'=>1]);
              if($del){
                  return $this->show_acedamic_pay();
              }
    }
    public  function list_invoice(){
            $invoice  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','payment.id as p_id','student.phone_student','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
            ->where('payment_detail.status',0)
            ->where('invoice.cam_id',auth()->user()->camp_id)
            ->groupBy('payment_detail.id_payment')
            ->get();
        return response()->json([
            'data'=>$invoice
        ]);
    }
    public  function delete_pay(Request $request)
    {
        date_default_timezone_set("Asia/Bangkok");
        //update status = 2  for payment cancel

//        $test_select=DB::Table('payment_detail')->where('id_payment',$request->id)->get();
        $current_date =date('Y-m-d h:i:s');
          $frm_payment=[
            'status'=>2,
             'updated_at'=>$current_date
          ];
        $frm_payment2=[
            'status'=>2,
            'user_id_pay'=>auth()->user()->id
        ];
          $update_first=payment_detail::where('id_payment',$request->id)->update($frm_payment2);
          if($update_first)
          {
              $update_second=payment::where('id',$request->id)->update($frm_payment);
              if($update_second)
              {
                  return response()->json([
                     'status'=>$current_date

                  ],200);
              }else{
                  return response()->json([
                      'status'=>'delete not successfully'
                  ],401);
              }
          }

    }
    public  function  view_cancel_paid(Request $request)
    {

        $payment  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('payment.payment_method','invoice.invoice_number','users.username','payment_detail.total_payment','payment_detail.Volidty_of_payment','payment_detail.expired_date','student.phone_student','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit',  'payment_method.payment_method')
            ->where('payment_detail.status',0)
            ->where('payment_detail.id_payment',$request->id)
            ->get();
        return response()->json([
            "data"=>$payment
        ]);

    }
    public function selectInfoByID($id)
    {
//        $student  = Student::where('id', $id)->first();
//        return response()->json($student);
            $student  = Student::where('id', $id)->first();
            $payment  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
            ->where('student.id', $id)->where('payment_detail.status',0)
            ->groupBy('payment_detail.id_payment')
            ->get();
            $balance = DB::table('payment')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_detail', 'payment_detail.id_payment', '=', 'payment.id')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->select(DB::raw("SUM(total_payment) as balance"),DB::raw("COUNT(payment_detail.id_invoice) as invoice"))
            ->where('student.id', $id)->where('payment_detail.status',0)->first();
            $deposit=DB::Table('payment')->select(DB::raw('SUM(payment.deposit) as deposit'))->where('student_id',$id)->first();
            $count_expired_date  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select(DB::raw('COUNT(expired_date) as over_due'),'student.id')
            ->where('student.id', $id)->where('payment_detail.status',0)
            ->where('payment_detail.expired_date','<=', Carbon::today())
            ->first();
            return response()->json([
                "data_payment"=>$balance,
                "student"=>$student,
                "data"=>$payment,
                "count_over_due"=>$count_expired_date,
                "deposit"=>$deposit,
            ]);
    }
    public function searchOverdue($id)
    {

        $payment  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','users.username','payment_detail.Volidty_of_payment','payment_detail.expired_date','student.phone_student','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit',  'payment_method.payment_method')
            ->where('student.id', $id)
            ->where('payment_detail.expired_date','<=', Carbon::today())->where('payment_detail.status',0)
            ->get();
        return response()->json([
            "data"=>$payment
        ]);

    }

    public function searhByDate(Request $request)
    {
        $from = date($request->from_date);
        $to = date($request->to_date);
        $pay_method=$request->pay_method;
        if($request->ajax()){
              if($pay_method=="allpay"){
                  $payment  =  DB::table('payment')
                      ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                      ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                      ->join('student', 'payment.student_id', '=', 'student.id')
                      ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                      ->join('users','payment_detail.user_id_pay','=','users.id')
                      ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                      ->where('student.id',$request->id )->where('payment_detail.status',0)
                      ->whereBetween('payment.payment_date',[$from,$to])
                      ->groupBy('payment_detail.id_payment')
                      ->get();
              }elseif ($pay_method==1){
                      $payment  =  DB::table('payment')
                      ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                      ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                      ->join('student', 'payment.student_id', '=', 'student.id')
                      ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                      ->join('users','payment_detail.user_id_pay','=','users.id')
                      ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                      ->where('student.id',$request->id )->where('payment_detail.status',0)
                      ->where('payment.payment_method',$request->pay_method)
                      ->whereBetween('payment.payment_date',[$from,$to])
                      ->groupBy('payment_detail.id_payment')
                      ->get();
              }else{
                      $payment  =  DB::table('payment')
                      ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                      ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                      ->join('student', 'payment.student_id', '=', 'student.id')
                      ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                      ->join('users','payment_detail.user_id_pay','=','users.id')
                      ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                      ->where('student.id',$request->id )->where('payment_detail.status',0)
                      ->where('payment.payment_method',$request->pay_method)
                      ->whereBetween('payment.payment_date',[$from,$to])
                      ->groupBy('payment_detail.id_payment')
                      ->get();
              }
        }

        return  response()->json(
            [
                "data"=>$payment
            ]
        );
    }
    public function viewDeposit($id){
        $deposit=DB::Table('payment')
                    ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                    ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                    ->join('student', 'payment.student_id', '=', 'student.id')
                    ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                    ->select('invoice.invoice_number,student.en_name,student.phone_student,payment.payment_date,payment_method.payment_method,payment.due_date,payment_detail.expired_date,SUM(payment_detail.total_payment)-deposit as luykvas')
                    ->where('payment.id',$id)->where('payment_detail.status',0)->get();
           return response()->json([
                'data'=>$deposit
           ]);
    }


    public function viewInvoice($id_student,$id_payment)
    {
        $output = '';
        $payment  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','payment_detail.total_amount as original_price' ,'invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit', 'payment_method.payment_method')
            ->where('student.id', $id_student)
            ->where('invoice.id',$id_payment)->where('payment_detail.status',0)
            ->get();
        $header  =  DB::table('payment')
            ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
            ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
            ->join('student', 'payment.student_id', '=', 'student.id')
            ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
            ->join('users','payment_detail.user_id_pay','=','users.id')
            ->select('invoice.invoice_number','payment_detail.total_amount as original_price' ,'invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit', 'payment_method.payment_method', DB::raw('SUM(payment_detail.lose_piad) as total_discount')
            ,DB::raw('SUM(payment_detail.total_amount) as total_subtotal'))
            ->where('student.id', $id_student)
            ->where('invoice.id',$id_payment)->where('payment_detail.status',0)
            ->first();

        $total_row = $payment->count();
        if($total_row > 0)
        {
            foreach($payment as $row)
            {
                $output .= '
                    <tr>
                        <td style="text-align: left;font-size: 12px">'.$row->description.'</td>
                        <td style="vertical-align: middle;text-align: center;font-size: 12px">1.00</td>
                        <td style="vertical-align: middle;text-align: center;font-size: 12px">$ '.number_format( $row->original_price,2).'</td>
                        <td style="vertical-align: middle;text-align: center;font-size: 12px">$ '.number_format( $row->original_price,2).'</td>
                    </tr>
                    ';
            }
        }
        return response()->json([
            "descriptions"=> $output,
            "header"=>$header
        ]);
    }

    public function placementTestView()
    {
        return view('Heang/placement_test/placement_test');
    }


}

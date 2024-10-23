<?php

namespace App\Http\Controllers\Heang;

use App\payment;
use App\payment_detail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class CashCollectionReport extends Controller
{
   	public function index()
   	{
   		// return view('Heang/report/cash_collection_report');
   	}

   	public function searchReport(Request $request)
   	{
   	   $report = DB::table('payment')
        ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
        ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
        ->join('student', 'payment.student_id', '=', 'student.id')
        ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
        ->join('users','payment_detail.user_id_pay','=','users.id')
        ->select('student.en_name', 'users.username', 'invoice.invoice_number', 'payment.payment_date', 'payment_detail.description','payment_detail.total_amount','payment_detail.total_payment')
        ->whereBetween('payment.payment_date', array($request->start_date, $request->from_date))->where('payment_detail.status',0)
     //    ->groupBy('payment_detail.id_payment')
        ->get();
        return response()->json([
        	'report' => $report
        ]);
      }
      public function searchByInvoice_report(Request $request)
      {

         $payment  =  DB::table('payment')
         ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
         ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
         ->join('student', 'payment.student_id', '=', 'student.id')
         ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
         ->join('users','payment_detail.user_id_pay','=','users.id')
         ->select('payment.payment_date','payment.due_date','invoice.invoice_number','users.username','invoice.invoice_number','payment_detail.lose_piad','payment_detail.total_amount','payment_detail.total_payment as original_price' ,'invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit', 'payment_method.payment_method')
         ->where('invoice.invoice_number',$request->id_invoice)->where('payment_detail.status',0)
         ->get();
         if(count($payment) > 0){
            return response()->json([
               "data"=>$payment
            ]);
         }else{
            return response()->json([
               "data"=>
                  [
                     "payment_date"=>"No Data",
                     "payment_method"=>"No Data",
                     "description"=>"No Data",
                     "original_price"=>"0.00$",
                     "username"=>"No Data",
                     "en_name"=>"No Data"
                  ]
            ]);
         }
      }
      public function searchByDue_service(Request $request)
      {
         $report = DB::table('payment')
        ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
        ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
        ->join('student', 'payment.student_id', '=', 'student.id')
        ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
        ->join('users','payment_detail.user_id_pay','=','users.id')
        ->join('product_service','payment_detail.id_pro_service','=','product_service.id')
        ->join('service_type','product_service.id_service_type','=','service_type.id')
        ->select('student.en_name', 'users.username', 'invoice.invoice_number', 'payment.payment_date', 'payment_detail.description','payment_detail.total_amount','payment_detail.total_payment')
        ->whereBetween('payment.payment_date', array($request->start_date, $request->from_date))
        ->where('payment.payment_method',$request->pay_method)->where('payment_detail.status',0)
      //   ->where('service_type.id',$request->val_due_service)
     //    ->groupBy('payment_detail.id_payment')
        ->get();
         return response()->json([
          'report' => $report
         ]);
      }


      public function searchExpiredByPeroid(Request $request)
      {
            if($request->ajax())
            {
                $payment  =  DB::table('payment')
               ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
               ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
               ->join('student', 'payment.student_id', '=', 'student.id')
               ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
               ->join('users','payment_detail.user_id_pay','=','users.id')
               ->select('payment.student_id','invoice.invoice_number','users.username','payment_detail.Volidty_of_payment','payment_detail.expired_date','student.phone_student','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment_detail.description', 'payment.payment_date', 'payment.due_date', 'payment.deposit',  'payment_method.payment_method')
               ->whereBetween('payment_detail.expired_date', array($request->start, $request->end))->where('payment_detail.status',0)
               ->get();
               return response()->json([
                     "data"=>$payment
               ]);

            }
      }

      public function search_customer_not_paid(Request $request){

   	        if($request->ajax() || $request->all()!=null)
            {
                   $payment  =  DB::table('payment')
                    ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                    ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                    ->join('student', 'payment.student_id', '=', 'student.id')
                    ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                    ->join('users','payment_detail.user_id_pay','=','users.id')
                    ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','payment.id as p_id','student.id','student.phone_student' ,'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                    ->where('payment_detail.status',1)->where('payment.status',1)
                    ->groupBy('payment_detail.id_payment')
                    ->get();


                    return response()->json([
                        'data' =>$payment
                    ],200);
            }else{

                return response()->json([
                   'data'=>"Not Found"
                ],404);

            }

      }
      public  function  update_save_paid(Request $request)

      {
          $mytime= date('Y-m-d ');

            if($request->ajax() || $request->all()!=null)
            {
                $update_payment=payment::where('id',$request->id)->update(['status'=>0,'payment_date'=>$mytime]);
                if($update_payment==true) {

                    payment_detail::where('id_payment',$request->id)->update(['status'=>0]);
                    return response()->json(["status"=>"Update Successfully "],200);
                }else{
                    return response()->json(["status"=>"Error Successfully "],501);
                }
            }else{
                return response()->json(["status"=>"Request not successfully"],401);
            }

      }
      public function search_confirm_paid($id)
      {
          if($id!=null || $id!='')
          {
              $payment  =  DB::table('payment')
                  ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
                  ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
                  ->join('student', 'payment.student_id', '=', 'student.id')
                  ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
                  ->join('users','payment_detail.user_id_pay','=','users.id')
                  ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','payment.id as p_id','student.id','student.phone_student' ,'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
                  ->where('payment_detail.status',1)->where('payment.status',1)->where('invoice.invoice_number',$id)
                  ->groupBy('payment_detail.id_payment')
                  ->get();
              return response()->json([
                  'data' =>$payment
              ],200);

          }else{
              return response()->json([
                  'data'=>"Not Found"
              ],404);
          }
      }
      public function viewDeposit_View(Request $request)
      {
              $payment  =  DB::table('payment')
              ->join('payment_detail', 'payment.id', '=', 'payment_detail.id_payment')
              ->join('invoice', 'payment_detail.id_invoice', '=', 'invoice.id')
              ->join('student', 'payment.student_id', '=', 'student.id')
              ->join('payment_method', 'payment.payment_method', '=', 'payment_method.id')
              ->join('users','payment_detail.user_id_pay','=','users.id')
              ->select('invoice.invoice_number','users.username','invoice.id as Invoice_id','student.id', 'student.en_name', 'payment.invoice_des', 'payment.payment_date', 'payment.due_date', 'payment.deposit', DB::raw('SUM(payment_detail.total_payment) as total_pay'), 'payment_method.payment_method')
              ->where('student.id', $request->id)->where('payment_detail.status',0)->where('payment.deposit','!=','null')
              ->groupBy('payment_detail.id_payment')
              ->get();

              return response()->json([
                 'data'=>$payment
              ]);
      }

}

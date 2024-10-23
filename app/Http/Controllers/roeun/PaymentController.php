<?php

namespace App\Http\Controllers\roeun;

use App\Http\Controllers\Controller;
use App\invoice;
use App\payment;
use App\payment_detail;
use Illuminate\Http\Request;
use DB;
use App\AcademicYear;
use App\Student;
class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


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
        //function for piad status =0
        if($request->ajax()){
            $frm_payment=[
                'student_id'=>$request->student_id,'payment_date'=>$request->payment_date,'due_date'=>$request->due_date,'payment_method'=>$request->payment_method
                ,'invoice_des'=>$request-> invoice_des,'deposit'=>$request->txtdeposit,'year_academic'=>$request->txtacademic
            ];
            $p= payment::create($frm_payment);
            if($p==true){
                $invoice=invoice::create(['invoice_number'=>$request->txt_text_invoice,'cam_id'=>auth()->user()->camp_id]);
                if($invoice==true){
                    $payment_id=payment::latest('id')->first();
                    for($i=0;$i<count($request->qty);$i++){
                        $form_pay=[
                            'id_invoice'=>$request->invoice_id,
                            'id_payment'=>$payment_id->id,
                            'id_inovice_type'=>$request->id_invoice_type,
                            'id_pro_service'=>$request->id_pro_service[$i],
                            'id_payterm'=>$request->id_payterm[$i],
                            'campus_id'=>$request->campus_id,
                            'user_id_pay'=>$request->user_id_pay,
                            'description'=>$request->description[$i],
                            'qty'=>$request->qty[$i],
                            'ori_price'=>$request->ori_price[$i],
                            'disccount'=>$request->disccount[$i],
                            'total_amount'=>$request->amount[$i],
                            'Volidty_of_payment'=>$request->Volidty_of_payment[$i],
                            'expired_date'=>$request->expired_date[$i],
                            'school_year'=>$request->school_year[$i],
                            'remark'=>$request->remark
                        ];
                        $insert[]=$form_pay;
                    }
                }
                payment_detail::insert($insert);
            }
        }
        return response()->json("success insert",200);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $student=Student::where('campus_id',1)->orderByRaw('(id='.$id.')DESC')->get();
            $student=Student::where('campus_id',1)->where('id',$id)->get();
            $invoice=DB::Table('invoice')->where('cam_id',auth()->user()->camp_id)->latest('id')->first();
            $service=DB::Table('product_service')->where('camp_id',auth()->user()->camp_id)->where('status',0)->get();
            $ac=AcademicYear::where('deleted',0)->orderByRaw('(year(start)='.date('Y').')DESC')->get();
            $pay_method=DB::Table('payment_method')->where('status',0)->get();
            $discount=DB::table('discount_pay')->where('status',0)->get();
            if(is_null($invoice))
            {
                $id_two=1;
                $num_invoice=1000;
            }else{
                $id_two=$invoice->id+1;
                $num_invoice=$invoice->invoice_number+1;
            }
            return view('payment.payment')
            ->with('pro_service',$service)
//            ->with('invoice',['id'=>$id_two,'invoice_number'=>$num_invoice])
            ->with('ac',$ac)
            ->with('id_invoice',$id_two)
            ->with('num_invoice',$num_invoice)
            ->with('service',$service)
            ->with('student',$student)
            ->with('pay_method',$pay_method)
            ->with('discount',$discount);
    }
    public function save_prosevice(Request $request){
        if($request->ajax())
        {
            for($i=1;$i<=6;$i++)
            {
                $frm_service=[
                    "pro_service"=>'DIS-CC Tuition Free Primary School Grade::'.$i.'',
                    "price_service"=>$request->txt_permont_pri,
                    "id_service_type"=>1,
                    'id_pay'=>1,
                    'id_academic'=>$request->txt_acdemic_service_save,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $insert[]=$frm_service;
            }
            $result= DB::Table('product_service')->insert($insert);
            if($result)
            {
                $count=7;
                for($c=1;$c<=3;$c++) {
                    $frm_service = [
                        "pro_service" => 'DIS-CC Tuition Free Secondary School Grade::'.$count++. '',
                        "price_service" => $request->txt_permont_secon,
                        "id_service_type" => 1,
                        'id_pay' => 1,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in2[]=$frm_service;
                }
            }
            $result2= DB::Table('product_service')->insert($in2);
            if($result2)
            {
                $count=10;
                for($c=1;$c<=3;$c++) {
                    $frm_service = [
                        "pro_service" => 'DIS-CC Tuition Free High School Grade::'.$count++. '',
                        "price_service" => $request->txt_permont_hig,
                        "id_service_type" => 1,
                        'id_pay' => 1,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in3[]=$frm_service;
                }
            }
            $result3= DB::Table('product_service')->insert($in3);

            //end Per Month
            // Start Per Term
            for($i=1;$i<=6;$i++)
            {
                $frm_term_pri_1=[

                    "pro_service"=>'DIS-CC Tuition Free Primary School Grade::'.$i.'',
                    "price_service"=>$request->txt_perterm_pri,
                    "id_service_type"=>1,
                    'id_pay'=>3,
                    'id_academic'=>$request->txt_acdemic_service_save,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_term_1[]=$frm_term_pri_1;
            }
            $result_first_term= DB::Table('product_service')->insert($in_term_1);
            if($result_first_term)
            {
                $count=7;
                for($c=1;$c<=3;$c++) {
                    $frm_term_pri_2 = [
                        "pro_service" => 'DIS-CC Tuition Free Secondary School Grade::'.$count++. '',
                        "price_service" => $request->txt_perterm_secon,
                        "id_service_type" => 1,
                        'id_pay' => 3,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_term_2[]=$frm_term_pri_2;
                }
            }
            $r_term_2= DB::Table('product_service')->insert($in_term_2);
            if($r_term_2)
            {
                $count=10;
                for($c=1;$c<=3;$c++) {
                    $frm_term_pri_3 = [
                        "pro_service" => 'DIS-CC Tuition Free High School Grade::'.$count++. '',
                        "price_service" => $request->txt_perterm_hig,
                        "id_service_type" => 1,
                        'id_pay' => 3,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_term_3[]=$frm_term_pri_3;
                }
            }
            $r_term_3= DB::Table('product_service')->insert($in_term_3);

            //End Per Term

            //Start Per Semeseter

            for($i=1;$i<=6;$i++)
            {
                $frm_sem_1=[

                    "pro_service"=>'DIS-CC Tuition Free Primary School Grade::'.$i.'',
                    "price_service"=>$request->txt_persem_pri,
                    "id_service_type"=>1,
                    'id_pay'=>6,
                    'id_academic'=>$request->txt_acdemic_service_save,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_sem_1[]=$frm_sem_1;
            }
            $r_in_sem= DB::Table('product_service')->insert($in_sem_1);
            if($r_in_sem)
            {
                $count=7;
                for($c=1;$c<=3;$c++) {
                    $frm_sem_2 = [
                        "pro_service" => 'DIS-CC Tuition Free Secondary School Grade::'.$count++. '',
                        "price_service" => $request->txt_persem_secon,
                        "id_service_type" => 1,
                        'id_pay' => 6,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_sem_2[]=$frm_sem_2;
                }
            }
            $r_sem_2= DB::Table('product_service')->insert($in_sem_2);
            if($r_sem_2)
            {
                $count=10;
                for($c=1;$c<=3;$c++) {
                    $frm_ses_3 = [
                        "pro_service" => 'DIS-CC Tuition Free High School Grade::'.$count++. '',
                        "price_service" => $request->txt_persem_hig,
                        "id_service_type" => 1,
                        'id_pay' => 6,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_sem_3[]=$frm_ses_3;
                }
            }
            $r_sem_3= DB::Table('product_service')->insert($in_sem_3);

            //End

            //Start Per Year
            for($i=1;$i<=6;$i++)
            {
                $frm_year_1=[

                    "pro_service"=>'DIS-CC Tuition Free Primary School Grade::'.$i.'',
                    "price_service"=>$request->txt_peryear_pri,
                    "id_service_type"=>1,
                    'id_pay'=>12,
                    'id_academic'=>$request->txt_acdemic_service_save,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_year_1[]=$frm_year_1;
            }
            $r_year_1= DB::Table('product_service')->insert($in_year_1);
            if($r_year_1)
            {
                $count=7;
                for($c=1;$c<=3;$c++) {
                    $frm_year_2 = [
                        "pro_service" => 'DIS-CC Tuition Free Secondary School Grade::'.$count++. '',
                        "price_service" => $request->txt_peryear_secon,
                        "id_service_type" => 1,
                        'id_pay' => 12,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_year_2[]=$frm_year_2;
                }
            }
            $r_year_2= DB::Table('product_service')->insert($in_year_2);
            if($r_year_2)
            {
                $count=10;
                for($c=1;$c<=3;$c++) {
                    $frm_year_3 = [
                        "pro_service" => 'DIS-CC Tuition Free High School Grade::'.$count++. '',
                        "price_service" => $request->txt_peryear_high,
                        "id_service_type" => 1,
                        'id_pay' => 12,
                        'id_academic' => $request->txt_acdemic_service_save,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $in_year_3[]=$frm_year_3;
                }
            }
            $in_year_3= DB::Table('product_service')->insert($in_year_3);
            //End
            if($in_year_3){

                $service=DB::Table('product_service')
                    ->join('service_type','product_service.id_service_type','=','service_type.id')
                    ->select('product_service.id_pay','product_service.id','product_service.price_service','product_service.pro_service','product_service.price_service','service_type.service_type','product_service.id_service_type')
                    ->where('product_service.status',0)->get();

                return response()->json([
                    'data'=>$service
                ]);
            }
        }else{
            return redirect()->back();
        }
    }
    public function save_prosevice_ac(Request $request)
    {
        if($request->ajax())
        {
            //Start 1
            for($i=1;$i<=12;$i++)
            {
                $frm_service_1=[

                    "pro_service"=>'DIS-AC  Tuition  School Grade::'.$i.'',
                    "price_service"=>$request->ac_month_1,
                    "id_service_type"=>1,
                    'id_pay'=>1,
                    'id_academic'=>$request->txt_academic_service_save_ac,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $insert[]=$frm_service_1;
            }

            $result1= DB::Table('product_service')->insert($insert);
            if($result1)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_2=[

                        "pro_service"=>'DIS-AC Tuition  School Grade::'.$i.'',
                        "price_service"=>$request->ac_term_1,
                        "id_service_type"=>1,
                        'id_pay'=>3,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert2[]=$frm_service_2;
                }
                $result2= DB::Table('product_service')->insert($insert2);
            }
            if($result2)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_3=[

                        "pro_service"=>'DIS-AC Tuition  School Grade::'.$i.'',
                        "price_service"=>$request->ac_sem_1,
                        "id_service_type"=>1,
                        'id_pay'=>6,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert3[]=$frm_service_3;
                }
                $result3= DB::Table('product_service')->insert($insert3);
            }
            if($result3)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_4=[

                        "pro_service"=>'DIS-AC Tuition School Grade::'.$i.'',
                        "price_service"=>$request->ac_year_1,
                        "id_service_type"=>1,
                        'id_pay'=>12,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert4[]=$frm_service_4;
                }
                $result4= DB::Table('product_service')->insert($insert4);
            }

            ///END 1
         //Start 2

            for($i=1;$i<=12;$i++)
            {
                $frm_service_5=[

                    "pro_service"=>'DIS-AC & CC  Tuition School Grade::'.$i.'',
                    "price_service"=>$request->ac_month_2,
                    "id_service_type"=>1,
                    'id_pay'=>1,
                    'id_academic'=>$request->txt_academic_service_save_ac,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $insert_5[]=$frm_service_5;
            }

            $result5= DB::Table('product_service')->insert($insert_5);
            if($result5)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_6=[

                        "pro_service"=>'DIS-AC & CC Tuition  School Grade::'.$i.'',
                        "price_service"=>$request->ac_term_2,
                        "id_service_type"=>1,
                        'id_pay'=>3,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert6[]=$frm_service_6;
                }
                $result6= DB::Table('product_service')->insert($insert6);
            }
            if($result6)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_7=[
                        "pro_service"=>'DIS-AC & CC  Tuition School Grade::'.$i.'',
                        "price_service"=>$request->ac_sem_2,
                        "id_service_type"=>1,
                        'id_pay'=>6,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert7[]=$frm_service_7;
                }
                $result7= DB::Table('product_service')->insert($insert7);
            }
            if($result7)
            {
                for($i=1;$i<=12;$i++)
                {
                    $frm_service_8=[

                        "pro_service"=>'DIS-AC & CC Tuition  School Grade::'.$i.'',
                        "price_service"=>$request->ac_year_2,
                        "id_service_type"=>1,
                        'id_pay'=>12,
                        'id_academic'=>$request->txt_academic_service_save_ac,
                        'camp_id'=>auth()->user()->camp_id
                    ];
                    $insert8[]=$frm_service_8;
                }
                $result8= DB::Table('product_service')->insert($insert8);
            }
         //End Start 2
                if($result8)
                {

                        $frm_service_9 = [
                            "pro_service" => 'DIS-AC Tuition Preparatory',
                            "price_service" => $request->pep_month_ac_1,
                            "id_service_type" => 1,
                            'id_pay' => 1,
                            'id_academic' => $request->txt_academic_service_save_ac,
                            'camp_id'=>auth()->user()->camp_id
                        ];
                        $in_9[]=$frm_service_9;

                       $result9= DB::Table('product_service')->insert($in_9);
                        $frm_service_10 = [
                            "pro_service" => 'DIS-AC Tuition Preparatory',
                            "price_service" => $request->pep_term_ac_1,
                            "id_service_type" => 1,
                            'id_pay' => 3,
                            'id_academic' => $request->txt_academic_service_save_ac,
                            'camp_id'=>auth()->user()->camp_id
                        ];
                        $in_10[]=$frm_service_10;
                        $result10= DB::Table('product_service')->insert($in_10);

                        $frm_service_11 = [
                            "pro_service" => 'DIS-AC Tuition Preparatory',
                            "price_service" => $request->pep_sem_ac_1,
                            "id_service_type" => 1,
                            'id_pay' => 6,
                            'id_academic' => $request->txt_academic_service_save_ac,
                            'camp_id'=>auth()->user()->camp_id
                        ];
                        $in_11[]=$frm_service_11;
                        $result11= DB::Table('product_service')->insert($in_11);

                        $frm_service_12 = [
                            "pro_service" => 'DIS-AC Tuition Preparatory',
                            "price_service" => $request->pep_year_ac_1,
                            "id_service_type" => 1,
                            'id_pay' => 12,
                            'id_academic' => $request->txt_academic_service_save_ac,
                            'camp_id'=>auth()->user()->camp_id
                        ];
                        $in_12[]=$frm_service_12;
                        $result12= DB::Table('product_service')->insert($in_12);
                }

            if($result12)
            {

                $frm_service_13 = [
                    "pro_service" => 'DIS-AC & CC Tuition Preparatory',
                    "price_service" => $request->pep_month_ac_2,
                    "id_service_type" => 1,
                    'id_pay' => 1,
                    'id_academic' => $request->txt_academic_service_save_ac,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_13[]=$frm_service_13;

                $result13= DB::Table('product_service')->insert($in_13);
                $frm_service_14 = [
                    "pro_service" => 'DIS-AC & CC Tuition Preparatory',
                    "price_service" => $request->pep_term_ac_2,
                    "id_service_type" => 1,
                    'id_pay' => 3,
                    'id_academic' => $request->txt_academic_service_save_ac,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_14[]=$frm_service_14;
                $result14= DB::Table('product_service')->insert($in_14);

                $frm_service_15 = [
                    "pro_service" => 'DIS-AC & CC Tuition Preparatory',
                    "price_service" => $request->pep_sem_ac_2,
                    "id_service_type" => 1,
                    'id_pay' => 6,
                    'id_academic' => $request->txt_academic_service_save_ac,
                    'camp_id'=>auth()->user()->camp_id
                ];
                $in_15[]=$frm_service_15;
                $result15= DB::Table('product_service')->insert($in_15);

                $frm_service_16 = [
                    "pro_service" => 'DIS-AC & C Tuition Preparatory',
                    "price_service" => $request->pep_year_ac_2,
                    "id_service_type" => 1,
                    'id_pay' => 12,
                    'id_academic' => $request->txt_academic_service_save_ac
                    ,  'camp_id'=>auth()->user()->camp_id
                ];
                $in_16[]=$frm_service_16;
                $result16= DB::Table('product_service')->insert($in_16);
            }
            //End
            if($result16){
                $service=DB::Table('product_service')
                    ->join('service_type','product_service.id_service_type','=','service_type.id')
                    ->select('product_service.id_pay','product_service.id','product_service.price_service','product_service.pro_service','product_service.price_service','service_type.service_type','product_service.id_service_type')
                    ->where('product_service.status',0)->get();

                return response()->json([
                    'data'=>$service
                ]);
            }
        }else{
            return redirect()->back();
        }
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
    public function selectTypePay(Request $request)
    {
        $pro_sevice=DB::Table('product_service')->where('id_pay',$request->txtterm)->where('id_academic',$request->id_acedemic)->get();
        return json_encode($pro_sevice);
    }
    public function save_payment(Request $request)
    {
        // if status =0 is payment  or status=1 not paid
        //function for save payment when customer  not pay
        if($request->ajax()){
            $frm_payment=[
                'student_id'=>$request->student_id,'payment_date'=>$request->payment_date,'due_date'=>$request->due_date,'payment_method'=>$request->payment_method
                ,'invoice_des'=>$request-> invoice_des,'deposit'=>$request->txtdeposit,'status'=>1,'year_academic'=>$request->txtacademic
            ];
            $p= payment::create($frm_payment);
            if($p==true){
                $invoice=invoice::create(['invoice_number'=>$request->txt_text_invoice]);
                if($invoice==true){
                    $payment_id=payment::latest('id')->first();
                    for($i=0;$i<count($request->qty);$i++){
                        $form_pay=[
                            'id_invoice'=>$request->invoice_id,
                            'id_payment'=>$payment_id->id,
                            'id_inovice_type'=>$request->id_invoice_type,
                            'id_pro_service'=>$request->id_pro_service[$i],
                            'id_payterm'=>$request->id_payterm[$i],
                            'campus_id'=>$request->campus_id,
                            'user_id_pay'=>$request->user_id_pay,
                            'description'=>$request->description[$i],
                            'qty'=>$request->qty[$i],
                            'ori_price'=>$request->ori_price[$i],
                            'disccount'=>$request->disccount[$i],
                            'total_amount'=>$request->amount[$i],
                            'Volidty_of_payment'=>$request->Volidty_of_payment[$i],
                            'expired_date'=>$request->expired_date[$i],
                            'school_year'=>$request->school_year[$i],
                            'remark'=>$request->remark,
                            'status'=>1
                        ];
                        $insert[]=$form_pay;
                    }
                }
                payment_detail::insert($insert);
            }
            return response()->json("Data save paid successfully ",200);
        }else{
            return response()->json("Data save pay Not successfully",501);

        }
    }
}

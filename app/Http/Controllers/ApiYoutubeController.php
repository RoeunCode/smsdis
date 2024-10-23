<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Feedback;
class ApiYoutubeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct(){
        //For Permission to do API
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
        header('Content-Type: application/json');
        header("Access-Control-Allow-Headers: *");
    }

    public function index()
    {
        //For Get Class in Database
        $data=DB::Table('api_class')->get();
        return response()->json([
            'items'=>$data,
            'success'=>200
        ]);
    }

    public function getSubject($id){
        //this function for get Subject from Database
        $data=DB::Table('api_subject')->get();
        return response()->json([
            'items'=>$data,
            'id_class'=>$id
        ]);
    }
    public function getVideo($idclass,$idsub){

        ///This Function for get API youtube to play
        $data=DB::Table('api_youtube')->where('type_class',$idclass)->where('subject_id',$idsub)->get();
        return response()->json([
            'items'=>$data
        ]);
    }
    public function getVideoTop10(){
        //This function fet get API Video youtube last insert 10 row
        $data=DB::Table('api_youtube')->orderBy('id','DESC')->limit(5)->get();
        return response()->json([
            'items'=>$data
        ]);
    }
    public function getPromotion(){
        //This Function for get API Promotion Data
        $data=DB::Table('api_promotion')->where('status',0)->orderBy('id','DESC')->get();
        return response()->json([
            'items'=>$data
        ]);

    }
    public function getPromotionDetail($id){
        $data=DB::Table('api_promotion')->where('status',0)->where('id',$id)->first();
        return response()->json([
            'items'=>$data
        ]); 
    }
    public function getPromotionTop(){
       $data=DB::Table('api_promotion')->where('status',0)->orderBy('id','DESC')->limit(8)->get();
        return response()->json([
            'items'=>$data
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
        //Route for feedback clients
    
    }
    public function creatFeedback(Request $request){
   
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
        header('Access-Control-Allow-Credentials: true');
        header('Content-Type: application/application/json');
        header("Access-Control-Allow-Headers: *");
         $form=[
              'name'=>$request->name,
              'number_phone'=>$request->number_phone,
              'description'=>$request->description  
         ]; 

         $article = Feedback::create($form);
    
               

      return response()->json('success',201);
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

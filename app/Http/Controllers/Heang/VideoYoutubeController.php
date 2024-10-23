<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Validator;
use Redirect,Response;
use DB;
use App\Heang\ApiYoutube;

class VideoYoutubeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $class = DB::table('api_class')->get();
        $subject = DB::table('api_subject')->get();

        $video = DB::table('api_youtube')->join('api_class', 'api_youtube.type_class', '=', 'api_class.id')->join('api_subject', 'api_youtube.subject_id', '=', 'api_subject.id')->select('api_youtube.id', 'api_class.name', 'api_subject.subject_title', 'api_youtube.title', 'api_youtube.url')->orderBy('api_youtube.id', 'desc')->get();
        return view('Heang/api/video/video', [
            'c' => $class,
            's' => $subject,
            'v' => $video
        ]);
    }

    function sendMessage() {
               $content      = array(

            "en" => 'វីដេអូមេរៀនថ្មីៗសម្រាប់ថ្ងៃនេះ'
        );
          $heading = array(
            "en" => "Dewey International School"
          );

        $hashes_array = array();
        array_push($hashes_array, array(
            "id" => "like-button",
            "text" => "Like",
            "icon" => "http://i.imgur.com/N8SN8ZS.png",
            "url" => "https://yoursite.com"
        ));
        $fields = array(
            'app_id' => "4ae69674-83d3-41c4-a1e5-fb3f595b98ad",
            'included_segments' => array(
                'All'
            ),
            'data' => array(
                "foo" => "bar"
            ),

            'contents' => $content,
            'headings' => $heading,
            'web_buttons' => $hashes_array
        );
        
        $fields = json_encode($fields);
        print("\nJSON sent:\n");
        print($fields);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Authorization: Basic YWFlNTFhOTktYTVhMC00YjQ1LWIzOWUtNDk0YzQ5MDE5NzIy'
        ));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        
        $response = curl_exec($ch);
        curl_close($ch);
        
        return $response;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $class = DB::table('api_class')->get();
        $array_class = json_decode("$class", true);

        $subject = DB::table('api_subject')->get();
        $array_subject = json_decode("$subject", true);

        return view('Heang/api/video/video_add', [
            'array_class' => $array_class,
            'array_subject' => $array_subject
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
            foreach ($request->cid as $key => $value) {
            $data = array(
                'type_class' => $request->cid[$key],
                'subject_id' => $request->sid[$key],
                'title' => $request->title[$key],
                'url' => $request->url[$key]
            );
            ApiYoutube::create($data);
            $this->sendMessage();
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
        
        $apivideo  = ApiYoutube::where('id', $id)->first();
 
        return Response::json($apivideo);
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
        $apivideo = ApiYoutube::find($id);
        $apivideo->type_class = $request['ucid'];
        $apivideo->subject_id = $request['usid'];
        $apivideo->title = $request['utitle'];
        $apivideo->url = $request['uurl'];
        $apivideo->update();

        return $apivideo;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $apivideo = ApiYoutube::where('id',$id)->delete();
   
        return Response::json($apivideo);
    }
}

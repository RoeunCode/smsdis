<?php

namespace App\Http\Controllers\Heang;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;
use Validator;
use Redirect,Response;
use DB;
use App\Heang\ApiPromotion;

class ApiPromotionController extends Controller
{
    protected $rules = [
        'title' => 'required|min:5',
        'description' => 'required',
        // 'image' => 'required',
        'date' => 'required'
    ];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $promotion = DB::table('api_promotion')->orderBy('api_promotion.id', 'desc')->get();
        return view('Heang/api/promotion/promotion', [
            'p' => $promotion
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Heang/api/promotion/promotion_add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // $current_date = date('Y-m-d');
        // foreach ($request->title as $key => $value) {   
        //     $image = $request->file('file')[$key]->store('public/imgs');
        //     $images = str_replace('public/imgs/', '', $image); 
        //     $data = array(
        //         'title' => $request->title[$key],
        //         'description' => $request->description[$key],
        //         'id_cat' => $request->cat[$key],
        //         'post_date' => $current_date,
        //         'image' => $images
        //     );
        //     $promotion = ApiPromotion::create($data);
        // }

        $current_date = date('Y-m-d');

        $image = $request->file('file')->store('public/imgs');
        $images = str_replace('public/imgs/', '', $image);

        $promotion = new ApiPromotion;
        $promotion->title = $request->title;
        $promotion->description = $request->description;
        $promotion->id_cat = $request->cat;
        $promotion->post_date = $current_date;
        $promotion->image = $images;
        $promotion->save();

        return Response::json($promotion);



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
        $promotion  = ApiPromotion::where('id', $id)->first();
 
        return view('Heang/api/promotion/promotion_edit')->with('p', $promotion);
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
        
        $image = $request->file('image')->store('public/imgs')->fit(300, 300);
        $images = str_replace('public/imgs/', '', $image);

        $promotion = DB::table('api_promotion')
        ->where('id', $id)
        ->update([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'id_cat' => $request->input('cat'),
            'image' => $images
        ]);

        return redirect()->route('promotion.index');

        // $promotion = ApiPromotion::find($id);
        // $promotion->title = $request['title'];
        // $promotion->description = $request['description'];
        // $promotion->image = $images;
        // $promotion->update();

        // return $promotion;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $promotion = ApiPromotion::findOrFail($id);
        $promotion->delete();

        return response()->json($promotion);

        // $promotion = ApiPromotion::where('id',$id)->delete();
   
        // return Response::json($promotion);
    }
}

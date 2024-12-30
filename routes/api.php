<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('/login', [App\Http\Controllers\API\AuthController::class, 'login']);

Route::get('viewscore-secondary/{student_id}/{class_id}/{month_id}/{type}',[App\Http\Controllers\API\AuthController::class, 'viewscoresecondary']);
Route::get('viewscore-uppersecondary/{student_id}/{class_id}/{month_id}/{type}',[App\Http\Controllers\API\AuthController::class, 'viewscoreuppersecondary']);

Route::get('/athenticateds', [App\Http\Controllers\API\AuthController::class, 'athenticateds']);
Route::get('/getclass/{student_id}/{academic_year}', [App\Http\Controllers\API\AuthController::class, 'getclass']);
Route::GET('/getacademic',[App\Http\Controllers\API\AuthController::class, 'getacademic']);
Route::GET('/getattendance/{student_id}/{class_id}/{month_id}',[App\Http\Controllers\API\AuthController::class, 'getattendance']);
Route::GET('/getmonth/{type}',[App\Http\Controllers\API\AuthController::class, 'getmonth']);
Route::GET('getStudent','ApiController@getStudent');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});



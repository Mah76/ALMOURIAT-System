<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|

*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'AlmouriatData'], function(){
Route::get('/race','App\Http\Controllers\RaceController@index');
Route::get('/stages','App\Http\Controllers\StageController@index2');
Route::get('/horses','App\Http\Controllers\HorseController@index3');
Route::get('/riders','App\Http\Controllers\RiderController@index4');
Route::get('/stables','App\Http\Controllers\StableController@index5');
Route::get('/trainers','App\Http\Controllers\TrainerController@index6');
Route::post('/registration','App\Http\Controllers\RegistrationController@submitregister');
Route::get('/registration','App\Http\Controllers\RegistrationController@index');


});


<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

Route::get('/', function (Request $request) {

        print($request->url());

        Log::info('Coucou le monde');

        return view('welcome');
    });


Route::get('/{test}', function (Request $request) {

    print($request->url());

    eval(\Psy\sh());

    return view('welcome');
});


Route::post('/email', function() {
    return view('about');
});
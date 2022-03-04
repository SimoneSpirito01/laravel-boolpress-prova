<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

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

Auth::routes();

// Backoffice
Route::prefix('admin')->namespace('Admin')->middleware('auth')->group(function() {
    Route::resource('posts', 'PostController');
    Route::resource('categories', 'CategoryController');
    Route::resource('tags', 'TagController');
    Route::resource('authors', 'AuthorController');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::patch('comments-approves/{id}', 'CommentController@approves')->name('comments.approves');
    Route::patch('comments-disapproves/{id}', 'CommentController@disapproves')->name('comments.disapproves');
    Route::delete('comments/{id}', 'CommentController@destroy')->name('comments.destroy');
});

Route::get("{any?}", function() {
    return view("front");
})->where("any", ".*");


<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// api posts
Route::get('/posts', 'Api\PostController@index');
Route::get('/posts-main', 'Api\PostController@main');
Route::get('/posts-latest', 'Api\PostController@latest');
Route::get('/posts/{slug}', 'Api\PostController@show');

// api categories
Route::get('/categories', 'Api\CategoryController@index');
Route::get('/categories/{slug}', 'Api\CategoryController@show');

// api tags
Route::get('/tags', 'Api\TagController@index');
Route::get('/tags/{slug}', 'Api\TagController@show');

// api authors
Route::get('/authors/{slug}', 'Api\AuthorController@show');
Route::get('/authors-id/{id}', 'Api\AuthorController@id');

// apc comments
Route::post('/comments', 'Api\CommentController@store');
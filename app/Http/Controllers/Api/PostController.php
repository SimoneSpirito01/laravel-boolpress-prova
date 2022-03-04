<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::where('published', 1)->with(['category', 'tags'])->get();

        return response()->json($posts);
    }

    public function show($slug)
    {
        $post = Post::where('slug', $slug)->with(['category', 'tags', 'author', 'comments' => function($query) {
            $query->where('approved', 1)->orderBy('created_at', 'desc');
        }])->first();

        if (empty($post)) {
            return response()->json(['message' => 'page not found'], 404);
        }

        return response()->json($post);
    }
    
    public function main()
    {
        $posts = Post::inRandomOrder()->limit(5)->with(['category', 'tags', 'author'])->get();
        
        return response()->json($posts);
    }

    public function latest()
    {
        $posts = Post::orderBy('created_at', 'desc')->with(['category', 'tags', 'author'])->take(15)->get();
        
        return response()->json($posts);
    }
}

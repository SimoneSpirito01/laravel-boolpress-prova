<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Tag;
use Illuminate\Http\Request;

class TagController extends Controller
{
    public function index()
    {
        $tags = Tag::all();

        return response()->json($tags);
    }

    public function show($slug)
    {
        $tag = Tag::where('slug', $slug)->with('posts')->first();
        foreach ($tag->posts as $post) {
            $post->author = $post->author;
        }

        if (empty($tag)) {
            return response()->json(['message' => 'page not found'], 404);
        }

        return response()->json($tag);
    }
}

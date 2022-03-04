<?php

namespace App\Http\Controllers\Api;

use App\Author;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function show($slug)
    {
        $author = Author::where('slug', $slug)->with('posts')->first();

        if (empty($author)) {
            return response()->json(['message' => 'page not found'], 404);
        }

        return response()->json($author);
    }
    public function id($id)
    {
        $author = Author::find($id);

        if (empty($author)) {
            return response()->json(['message' => 'page not found'], 404);
        }

        return response()->json($author);
    }
}

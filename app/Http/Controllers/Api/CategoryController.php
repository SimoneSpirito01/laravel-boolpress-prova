<?php

namespace App\Http\Controllers\Api;

use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();

        return response()->json($categories);
    }

    public function show($slug)
    {
        $category = Category::where('slug', $slug)->with(['posts'])->first();
        foreach ($category->posts as $post) {
            $post->author = $post->author;
        }

        if (empty($category)) {
            return response()->json(['message' => 'page not found'], 404);
        }

        return response()->json($category);
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Comment;
use App\Http\Controllers\Controller;
use App\Mail\CommentMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller
{
    public function store(Request $request) {

        $data = $request->all();

        $validator = Validator::make($data, [
            'name' => 'nullable|string|max:50',
            'content' => 'required|string',
            'post_id' => 'exists:posts,id'
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 400);
        }

        $newComment = new Comment();
        if(!empty($data['name'])) $newComment->name = $data['name'];
        $newComment->content = $data['content'];
        $newComment->post_id = $data['post_id'];
        $newComment->save();

        Mail::to('simospiri01@gmail.com')->send(new CommentMail($newComment->post));

        return response()->json([
            'success' => true
        ]);
    }
}

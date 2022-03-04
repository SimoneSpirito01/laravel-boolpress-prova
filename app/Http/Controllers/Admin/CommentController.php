<?php

namespace App\Http\Controllers\Admin;

use App\Comment;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function approves($id)
    {
        $comment = Comment::find($id);
        $comment->approved = true;
        $comment->save();

        return redirect("admin/posts/{$comment->post->slug}#comments");
    }
    public function disapproves($id)
    {
        $comment = Comment::find($id);
        $comment->approved = false;
        $comment->save();

        return redirect("admin/posts/{$comment->post->slug}#comments");
    }

    public function destroy($id)
    {
        $comment = Comment::find($id);
        $comment->delete();

        return redirect("admin/posts/{$comment->post->slug}#comments");
    }
}

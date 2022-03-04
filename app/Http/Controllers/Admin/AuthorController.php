<?php

namespace App\Http\Controllers\Admin;

use App\Author;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\URL;

class AuthorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $authors = Author::all();
        return view('admin.authors.index', compact('authors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $request->validate([
            'username' => 'required|unique:authors|max:50'
        ]);

        $newCategory = new Author();
        $newCategory->username = $data['username'];
        $newCategory->slug = Str::of($newCategory->username)->slug('-');
        $newCategory->save();

        return redirect()->route('authors.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Author $author)
    {
        return view('admin.authors.show', compact('author'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Author $author)
    {
        $data = $request->all();

        $request->validate([
            'username' => "required|unique:authors,username,{$author->id}|max:50"
        ]);

        $author->username = $data['username'];
        $author->slug = Str::of($author->username)->slug('-');
        $author->save();

        return redirect()->route('authors.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Author $author)
    {
        $author->delete();

        if(URL::previous() == 'http://127.0.0.1:8000/admin/authors/'.$author->id) {
            return redirect()->route('authors.index');
        } 
    }
}

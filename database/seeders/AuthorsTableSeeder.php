<?php

namespace Database\Seeders;

use App\Author;
use Illuminate\Database\Seeder;

class AuthorsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $str = file_get_contents('database/seeders/boolpress.json');
        $json = json_decode($str, true);
        $posts = $json[2]['data'];

        foreach ($posts as $key => $post) {
            $newPost = new Author();
            $newPost->id = $post['id'];
            $newPost->username = $post['username'];
            $newPost->slug = $post['slug'];
            $newPost->created_at = $post['created_at'];
            $newPost->updated_at = $post['updated_at'];
            $newPost->save();
        }
    }
}

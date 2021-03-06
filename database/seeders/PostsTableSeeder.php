<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Post;
use Illuminate\Support\Str;

class PostsTableSeeder extends Seeder
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
        $posts = $json[8]['data'];

        foreach ($posts as $key => $post) {
            $newPost = new Post();
            $newPost->title = $post['title'];
            $newPost->slug = $post['slug'];
            $newPost->content = $post['content'];
            $newPost->published = $post['published'];
            $newPost->image = $post['image'];
            $newPost->author_id = $post['author_id'];
            $newPost->category_id = $post['category_id'];
            $newPost->created_at = $post['created_at'];
            $newPost->updated_at = $post['updated_at'];

            $newPost->save();
        }
    }
}

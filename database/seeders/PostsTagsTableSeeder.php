<?php

namespace Database\Seeders;

use App\PostTag;
use Illuminate\Database\Seeder;

class PostsTagsTableSeeder extends Seeder
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
        $posts = $json[9]['data'];

        foreach ($posts as $key => $post) {
            $newPost = new PostTag();
            $newPost->tag_id = $post['tag_id'];
            $newPost->post_id = $post['post_id'];
            $newPost->save();
        }
    }
}

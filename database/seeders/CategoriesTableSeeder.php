<?php

namespace Database\Seeders;

use App\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;


class CategoriesTableSeeder extends Seeder
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
        $posts = $json[3]['data'];

        foreach ($posts as $key => $post) {
            $newPost = new Category();
            $newPost->name = $post['name'];
            $newPost->slug = $post['slug'];
            $newPost->created_at = $post['created_at'];
            $newPost->updated_at = $post['updated_at'];
            $newPost->save();
        }
    }
}

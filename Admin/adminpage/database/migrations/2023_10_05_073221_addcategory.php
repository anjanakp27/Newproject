<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

 class addcategory extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('category',function(Blueprint $table){
            $table->increments('id');
            $table->string('categoryname',255);

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::dropIfExists('category');
    }
}

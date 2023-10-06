<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

 class admintable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('admin',function(Blueprint $table){
            $table->increments('id');
            $table->string('username',255);
            $table->string('password',255);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::dropIfExists('admin');
    }
}

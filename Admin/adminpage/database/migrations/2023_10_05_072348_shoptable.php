<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

 class shoptable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('shop',function(Blueprint $table){
            $table->increments('id');
            $table->string('shopname',255);
            $table->string('category',255);
            $table->integer('phonenumber');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::dropIfExists('shop');
    }
}

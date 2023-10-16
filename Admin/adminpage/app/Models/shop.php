<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class shop extends Model
{
     public $timestamps = false;
    protected $table = 'shop'; // Set the table name explicitly

    protected $fillable = ['shopname', 'category','phonenumber'];
}

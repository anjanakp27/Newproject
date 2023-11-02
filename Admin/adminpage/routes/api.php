<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiShopController;
use App\Http\Controllers\ShopApiController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/listshops', [ShopApiController::class, 'index']);

Route::post('/addrequest', [ShopApiController::class, 'store']);

Route::get('/fetchcategory', [ShopApiController::class, 'fetchcategory']);

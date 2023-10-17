<?php

use Illuminate\Support\Facades\route;
use App\Http\Controllers\AdminController; 
use App\Http\Controllers\ShopController; 
use App\Http\Controllers\CategoryController; 
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('loginpage');

});
Route::get('/header', function () {
    return view('header');
});
Route::get('/table', function () {
    return view('table');
});
Route::get('/category', [CategoryController::class, 'create'])->name('listcategory');
Route::post('/category', [CategoryController::class, 'store'])->name('storecategory');
Route::get('/viewcategory', [CategoryController::class, 'index'])->name('storecategory');

Route::get('/welcome', [AdminController::class, 'home']);

Route::get('/create', [ShopController::class, 'create'])->name('addshop');
Route::post('/create', [ShopController::class, 'store'])->name('storeshop');
Route::get('/viewshop', [ShopController::class, 'index'])->name('viewshop ');
Route::get('/edit/{shop}/edit', [ShopController::class, 'edit']);
Route::put('/shop/{shop}', [ShopController::class, 'update']);
Route::get('/viewtable', [ShopController::class, 'index'])->name('viewshop');



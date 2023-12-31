<?php

use Illuminate\Support\Facades\route;
use App\Http\Controllers\AdminController; 
use App\Http\Controllers\ShopController; 
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\RequestController;  
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
Route::get('/viewcategory', [CategoryController::class, 'index'])->name('viewcategory');
Route::get('/editcategory/{category}', [CategoryController::class, 'edit'])->name('editcategory');

Route::put('/category/{category}', [CategoryController::class, 'update'])->name('updatecategory');

Route::delete('/category/{category}', [CategoryController::class, 'destroy'])->name('destroycategory');

Route::get('/welcome', [AdminController::class, 'home']);

Route::get('/create', [ShopController::class, 'create'])->name('addshop');
Route::post('/create', [ShopController::class, 'store'])->name('storeshop');
Route::get('/viewtable', [ShopController::class, 'index'])->name('viewshop');
Route::get('/edit/{shop}', [ShopController::class, 'edit'])->name('edit');
Route::put('/shop/{shop}', [ShopController::class, 'update'])->name('update-shop');



Route::delete('/shop/{shop}', [ShopController::class, 'destroy'])->name('destroy');
Route::get('/signout',[AdminController::class,'perform'])->name('signout');

Route::put('/add/{requestadmin}',[RequestController::class,'add'])->name('add');
Route::get('/requestview',[RequestController::class,'show'])->name('requestview');
Route::get('/createrequest', [RequestController::class, 'create'])->name('createrequest');
Route::post('/storerequest', [RequestController::class, 'store'])->name('storerequest');
Route::get('/viewrequest/{requestadmin}', [RequestController::class, 'edit'])->name('addrequest');
Route::delete('/deleterequest/{requestadmin}', [RequestController::class, 'destroy'])->name('deleterequest');

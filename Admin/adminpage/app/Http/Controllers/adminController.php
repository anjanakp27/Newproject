<?php

namespace App\Http\Controllers;
use App\Models\shop;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('loginpage');
    }
    public function perform()
    {
       
        return redirect('/');
    }
    public function notify()
    {
       
       $shops = shop::all();
    return view('request', compact('shops'));
    }
   public function add(Request $request, shop $shop)
    {
        $shop->update($request->all());
        return redirect()->route('request');
        
    }
    public function addedit()
    {
        return view('add');
    }


    /**
     * Show the form for creating a new resource.
     */
public function category(){
    return view('category');
}

    public function home(){
        return view('welcome');
    }

    public function create()
    {
   return view('shop');
       }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit()
    {
        return view('edit');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, admin $shop)
    {
        $shop->update($request->all());
        return redirect()->route('welcome');
        
    }

  
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

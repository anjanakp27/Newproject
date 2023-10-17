<?php

namespace App\Http\Controllers;
use App\Models\shop;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $shops = shop::all();
    return view('listshoptable', compact('shops'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('shop');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
         shop::create($request->all());
    return redirect()->route('addshop');
    }

    /**
     * Display the specified resource.
     */
    public function show(shop $shop)
    {
        return view('listshoptable', compact('shop'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(shop $shop)
    {

         return view('edit', compact('shop'));
    }

    /**
     * Update the specified resource in storage.
     */
    
    public function update(Request $request, shop $shop)
    {
        $shop->update($request->all());
        return redirect()->route('welcome');
        
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(shop $shop)
    {
           $shop->delete();
    return redirect()->route('shop');
    }
}

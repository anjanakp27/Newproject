<?php

namespace App\Http\Controllers;
use App\Models\shop;
use App\Models\category;
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
        
        $category = category::all();
    return view('shop', compact('category'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        
        shop::create($request->all());
    return redirect()->route('viewshop');
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
        $category = category::all();
        return view('edit', compact('shop','category'));
    }



    /**
     * Update the specified resource in storage.
     */
    
    public function update(Request $request, shop $shop)
    {
        $shop->update($request->all());
        return redirect()->route('viewshop');
        
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(shop $shop)
    {
           $shop->delete();
    return redirect()->route('viewshop');
    }
}

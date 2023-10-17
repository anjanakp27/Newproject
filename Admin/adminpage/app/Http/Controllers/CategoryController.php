<?php

namespace App\Http\Controllers;
use App\Models\category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $category = category::all();
    return view('listcategorytable', compact('category'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('category');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        category::create($request->all());
         return redirect()->route('storecategory ');
    }

    /**
     * Display the specified resource.
     */
    public function show(category $category)
    {
     return view('listcategorytable', compact('category'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(category $category)
    {
        $category->delete();
    return redirect()->route('welcome');
    }
}

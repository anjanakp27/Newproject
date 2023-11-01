<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\shop;

class ShopApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $shops = shop::all();
        return response()->json($shops);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'shopname' => 'required',
            'category' => 'required',
            'phonenumber'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        $shop = shop::create($request->all());
        return response()->json($shop, 201);
    }

}

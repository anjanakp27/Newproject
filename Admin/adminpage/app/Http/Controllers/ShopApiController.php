<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\shop;
use App\Models\category;
class ShopApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $shops = shop::all();
        // return response()->json($shops);
        $shops = Shop::all();

$data = [];

foreach ($shops as $index => $shop) {
    $data[] = [
        'id' => ($index + 1), // You can set the ID as needed
        'shopname' => $shop->shopname,
        'category' => $shop->category,
        'phonenumber' => $shop->phonenumber,
    ];
}

$response = [
    'status' => 'success',
    'data' => $data,
];

return response()->json($response);

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

 public function fetchcategory()
    {
        // $category = category::all();
        // return response()->json($category);
       $category = category::all();

// Create an array to store the transformed data
$data = [];

foreach ($category as $index => $item) {
    $data[] = [
        'id' => ($index + 1), // You can set the ID as needed
        'categoryname' => ucfirst($item->categoryname), // Capitalize the category name
    ];
}

// Create the desired JSON structure
$response = [
    'status' => 'success',
    'data' => $data,
];

return response()->json($response);

    }


    public function filterByCategory($category)
{
    $shops = Shop::where('category', $category)->get();

    if ($shops->isEmpty()) {
        return response()->json(['message' => 'No shops found for the specified category'], 404);
    }

    return response()->json(['status' => 'success', 'data' => $shops]);
}


public function getShopById($id)
{
    $shop = Shop::find($id);

    if (!$shop) {
        return response()->json(['message' => 'Shop not found'], 404);
    }

    return response()->json(['status' => 'success', 'data' => $shop]);
}

}

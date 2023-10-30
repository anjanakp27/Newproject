<?php

namespace App\Http\Controllers;
use App\Models\newrequest;
use App\Models\category;
use Illuminate\Http\Request;

class RequestController extends Controller
{
    //  public function index()
    // {
    //    $requestadmin = newrequest::all();
    // return view('request', compact('requestadmin'));
    // }
    public function create()
    {

        return view('add');
    }
     public function store(Request $request)
    {
        newrequest::create($request->all());
         return redirect()->route('viewshop');
    }
 public function show(newrequest $requestadmin)
    {
       
     $requestadmin = newrequest::all();
    return view('request', compact('requestadmin'));
    }
 public function edit(newrequest $requestadmin)
    {
        $category = category::all();
        return view('add', compact('category','requestadmin'));
    }
public function destroy(newrequest $requestadmin)
    {
        $requestadmin->delete();
    return redirect()->route('requestview');
    }
// public function add(Request $request, newrequest $requestadmin)
//     {
//         $requestadmin->create($request->all());
//         return redirect()->route('addedit');
        
//     }
//     public function addedit(newrequest $requestadmin)
//     {
//         return view('request',compact('requestadmin'));
//     }
}
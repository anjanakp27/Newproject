<?php

namespace App\Http\Controllers;
use App\Models\request;

use Illuminate\Http\Request;

class RequestController extends Controller
{
    
public function add(Request $request, request $requestadmin)
    {
        $requestadmin->create($request->all());
        return redirect()->route('request');
        
    }
    public function addedit(request $requestadmin)
    {
        return view('add',compact('requestadmin'));
    }
}
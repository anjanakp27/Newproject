<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>
  <style type="text/css">
    * {box-sizing: border-box}
.container {
  padding: 50px;
  display:grid;
  flex-direction: row;
}
input[type=text]{
  width: 50%;
  padding: 15px;
  margin: 24px 24px 24px 24px;
  display: inline-block;
  border: none;
  background: #f1f1f1;



}

input[type=text]:focus {
  background-color: #ddd;
  padding: 20px;
  outline: none;
}


.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 20px 50px;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity:1;
}

  </style>
</head>
<body>
  @include('header')
<form action="{{ route('add', ['shop' => $shop->id]) }}" method="POST">
@csrf
@method('PUT')

  <div class="container">
    <h1>Edit Shop</h1>
       
                      <!-- <tr>
                        <td>{{$shop->id}}</td>
                        <td>{{$shop->shopname}}</td>
                        <td>{{$shop->phonenumber}}</td>
                       <td>{{$shop->category}}</td>
                         -->

    <label for="shopname"><b>Shop Name:</b></label>
    <input type="text" placeholder="Enter shopname" name="shopname" id="shopname" required value="{{ $shop->shopname }}">

<br>
    <label for="phonenumber"><b>Phone Number:</b></label>
    <input type="text" placeholder="Enter Phonenumber" name="phonenumber" id="phonenumber" required value="{{ $shop->phonenumber }}">
<br>
    <label for="category"><b>Category:</b></label>
    <!-- <input type="text" placeholder="Enter Category" name="category" id="category" required value="{{ $shop->category }}"> -->
    <select  class="form-control" name="categoryname" value=required value="{{ $shop->category }}"> 
       @foreach($shop as $category)
    <option value="{{$shop->category}}">{{$shop->category}}</option>
    @endforeach
  </select>
    <br>
    <button type="submit" class="registerbtn">Add</button>
  </div>
</form>
@include('footer')
</body>
</html>


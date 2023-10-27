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
<form action="{{route('addedit',$requestadmin)}}" method="post">
@csrf
@method('post')

  <div class="container">
    <h1>Edit Shop</h1>
       
                    

    <label for="shopname"><b>Shop Name:</b></label>
    <input type="text" placeholder="Enter shopname" name="shopname" id="shopname" required value="{{ $requestadmin->shopname }}">

<br>
    <label for="phonenumber"><b>Phone Number:</b></label>
    <input type="text" placeholder="Enter Phonenumber" name="phonenumber" id="phonenumber" required value="{{ $requestadmin->phonenumber }}">
<br>
    <label for="category"><b>Category:</b></label>
    <!-- <input type="text" placeholder="Enter Category" name="category" id="category" required value="{{ $shops->category }}"> -->
    <select  class="form-control" name="category" value=required value="{{ $requestadmin->category }}"> 
       @foreach($shops as $category)
    <option value="{{$shops->category}}">{{$shops->category}}</option>
    @endforeach
  </select>
    <br>
    <button type="submit" class="registerbtn">Add</button>
  </div>
</form>
@include('footer')
</body>
</html>


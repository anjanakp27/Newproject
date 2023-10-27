
<head>

  <style type="text/css">
    
      * {box-sizing:border-box;

      }

.container {
  padding: 50px;
  display:grid;
  flex-direction: row;

}


input[type=text]{
  width: 50%;
  padding: 15px;
  margin: 24px 24px 24px 24px;
  display:inline-block;
  border: none;
  background: #f1f1f1;


    }  



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
<form action="{{route('storeshop')}}" method="post">
  @csrf
  <div class="container">
    <h1>Add Shop</h1>
    

    <label for="shopname"><b>Shop Name:</b></label>
  <div class="row"><div class="col-sm-6" style="background-color:whitesmoke;">  <input type="text" placeholder="Enter shopname" name="shopname" id="shopname" required>
    </div><div class="col-sm-6" >
    </div></div>
   <!--   <div class="row">
    <div class="col-sm-6" style="background-color:whitesmoke;">
      <p>Enter shop name:</p>
    </div>
    <div class="col-sm-6" style="background-color:pink;">
      
    </div>
  </div> -->
<br>
    <label for="phonenumber"><b>Phone Number:</b></label>
      <div class="row"><div class="col-sm-6" style="background-color:whitesmoke;"> 
    <input type="text"  placeholder="Enter Phonenumber" name="phonenumber" id="phonenumber" required>
  </div></div>
<br>
    <label for="category"><b>Category:</b></label>
      <div class="row"><div class="col-sm-6" style="background-color:whitesmoke;"> 
   <select class="form-control" name="category" > 
    <!-- <input type="text" placeholder="Enter Category" name="category" id="category" required> -->
       @foreach($category as $category)
    <option value="{{$category->categoryname}}">{{$category->categoryname}}</option>
    @endforeach
  </select>
</div></div>
 
                     
    <br>
    <button type="submit" class="registerbtn btn-danger">Register</button>
  </div>
  

</form>
@include('footer')
</body>
</html>


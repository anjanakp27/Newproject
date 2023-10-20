  
<head>  
<title> Category Page </title>  
<style> 
 input[type=text], select, textarea{
    font-size: 15px;
  width: 50%;
  padding: 22px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
  
 
}
label {
  padding: 20px 35px 35px 150px;
  display: inline-block;
  font-size: 20px;



}
input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 20px 30px 20px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
margin: 0 auto;

}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;

} 
.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

</style>   
</head>    
<body>  
@include('header')  
<h1><b><center>EDIT CATEGORY</center></b></h1>
    <div class="container">
  <form action="{{route('updatecategory', ['category' => $category->id])}} " method="post">
   @csrf
@method('PUT')


    <div class="row">
      <div class="col-sm-4">
        <label for="fname">Category Name:</label>
        </div>
      <div class="col-sm-8" style="background-color:whitesmoke;"> 
        
     
        <input type="text" id="categoryname" name="categoryname" placeholder="Enter category name" required value="{{ $category->categoryname }}">
        </div>
      </div>

     
    
    <div class="row">
      <input type="submit" value="Submit" >
    </div>
</form>
</div>


@include('footer') 
</body>     




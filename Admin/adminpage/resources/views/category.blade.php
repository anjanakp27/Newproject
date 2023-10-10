<!DOCTYPE html>   
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login Page </title>  
<style>   
Body {  
  font-family: TimesNewRoman, Helvetica, sans-serif;
  padding: 150px;  
  background-color: white;  
}  
button {   
       background-color:  blue;   
       width: 50%;  
        color: black;   
        padding: 10px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
  
 input[type=text], input[type=password] {   
        width: 50%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
 button:hover {   
        opacity: 0.7;   
    }   
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {   
        padding: 50px;   
        width: 50%;
        background-color: thistle;
        font-size: 20px;  
    }   
</style>   
</head>    
<body>    
    <center> <h1> Add Category </h1>  
    <form>  
        <div class="container">   
            <label>Category Name : </label>   
            <input type="text" placeholder="Enter Categoryname" name="category name" required>  <br>
             
            <button type="submit">Add</button><br>  
            
        </div>   
    </form> 
    </center>      
</body>     
</html>  



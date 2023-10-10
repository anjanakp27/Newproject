<!DOCTYPE html>   
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login Page </title>  
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;
  padding: 150px;  
  background-color: white;  
}  
button {   
       background-color: solid blue;   
       width: 50%;  
        color: orange;   
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
        background-color: lightblue;  
    }   
</style>   
</head>    
<body>    
    <center> <h1> Login Form </h1>  
    <form>  
        <div class="container">   
            <label>Username : </label>   
            <input type="text" placeholder="Enter Username" name="username" required>  <br>
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="password" required>  
            <button type="submit">Login</button><br>  
            <input type="checkbox" checked="checked"> Remember me   
            <button type="button" class="cancelbtn"> Cancel</button>   
            Forgot <a href="#"> password? </a>   
        </div>   
    </form> 
    </center>      
</body>     
</html>  



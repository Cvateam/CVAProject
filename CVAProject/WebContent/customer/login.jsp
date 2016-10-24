<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/loginstyle.css">
	<script type="text/javascript" src="../script/jquery-3.1.0.min.js"></script>
	<script>
		$(function(){
			$("#previousBtn").on('click' , function(){
				location.href = "../index";
			});
			
		});
	
	</script>
  </head>
  <body>
    <div class="login">
  <header class="header">
    <span class="text">LOGIN</span>
    <span class="loader"></span>
  </header>
  <form class="form" action="customer/login" method="POST">  
    <input class="input" type="text", placeholder="Username" id = "Username">
    <input class="input" type="password" placeholder="Password" id = "Password">
    <button class="btn" type="submit" ></button>
  </form>
</div>
<button class ="arrowbtn" id = "previousBtn">←
</button>
<!-- <button class ="resetbtn" type= "reset">Reset
</button> -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="../js/index.js"></script>

    
    
  </body>
</html>

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
     <link rel="stylesheet" href="../css/main.css">
	<script type="text/javascript" src="../script/jquery-3.1.0.min.js"></script>
		<script>
/* 		$(function(){
			$("#previousBtn").on('click' , function(){
				location.href = "../history.go(-1)";
			});
			
		});
	 */
	</script>
  </head>
  <body  style="background-image: url(../images/img3.jpg); background-size: contain;  ">
  			<div class="codrops-header">
				<nav class="codrops-demos">
					<a href="joinForm">회원가입</a>
					<a href="searchCustomerForm.action">ID/PASSWORD찾기</a>
				</nav>
			</div><!-- /codrops-header -->
    <div class="login">
  <header class="header">
    <span class="text">LOGIN</span>
    <span class="loader"></span>
  </header>
  <form class="form" action="../login" method="POST" id="form"> 
    <input class="input" type="text" placeholder="Username" id = "Username" name = "custid">
    <input class="input" type="password" placeholder="Password" id = "Password" name = "password">
    <button class="btn" type="submit" id = "login"></button>
  </form>
</div>
<button class ="arrowbtn" id = "previousBtn" onClick="history.go(-1); return false;">←
</button>
<!-- <button class ="resetbtn" type= "reset">Reset
</button> -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="../js/index.js"></script>

    
    
  </body>
</html>

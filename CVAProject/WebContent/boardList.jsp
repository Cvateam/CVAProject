<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>사용자게시판</title>
<meta charset="utf-8" />


<link rel="stylesheet" href="css/5grid/core.css" />
<link rel="stylesheet" href="css/5grid/core-desktop.css" />
<link rel="stylesheet" href="css/5grid/core-1200px.css" />
<link rel="stylesheet" href="css/5grid/core-noscript.css" />
<link rel="stylesheet" href="css/styleBoard.css" />
<link rel="stylesheet" href="css/style-desktop.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" media="screen and (max-width: 600px)" href="css/style-mobile.css" />
<link rel="stylesheet" media="screen and (max-width: 600px)" href="css/5grid/core-mobile.css" />
<link rel="stylesheet" media="screen and (max-width: 600px)" href="css/5grid/mobileUI-beveled.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none"></script>
</head>
<body style="overflow: scroll; ">
<!-- <div id="wrapper"> -->
	<div id="header-wrapper">
			<div class="5grid-layout">
			
				<div class="row">
					<div class="12u" id="logo"> <!-- Logo -->
						<h1><a href="#" class="mobileUI-site-name">C.VA</a></h1>
					</div>
				</div>
			</div>
			<header class="codrops-header" ><!-- id = "header" -->
<!-- 			<div class="5grid-layout">
				<div class="row">
					<div class="12u" id="menu"> -->
						<h1 class="codrops-header__title">    A class 7 group</h1>
						<!-- 	<nav class="mobileUI-site-nav"> -->
						<nav class="codrops-demos">
							<a class="current-demo" href="index">Home</a>
							<s:if test='%{#session.loginId == null}'>
							<a href="customer/loginForm.action">Login</a>
							</s:if>
							<s:if test='%{#session.loginId != null}'>
							<a href="customer/loginForm.action">Logout</a>
							</s:if>
							<a href="#" class="menu">Converter</a>
						</nav>
<!-- 					</div>
				</div>
			</div> -->
		</header>
	</div>
	<div id="page-wrapper" class="5grid-layout">
		<div class="5grid-layout">
			<div class="row">
				<div class="6u">
					<div id="content">
<%-- 						<section>
							<div class="post">
								<h2>${sessionScope.loginId}님</h2>
								<p><a href="#"><img src="images/spongiBob.jpg" alt="" class="img-alignleft"></a> Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. Pellentesque adipiscing purus ac magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.	 Pellentesque pede. Donec pulvinar ullamcorper metus. In eu odio at lectus pulvinar mollis.</p>
								<p class="button-style"><a href="#">Profile Update</a></p>
							</div>
						</section> --%>

					</div>
				</div>
				<div class="3u" id="sidebar1">
					<section>
						<h2>날짜별</h2>
						<ul class="style1">
							<s:iterator value="boardList">
								<s:if test="boardList != null">
									<li><a href="boardRead.action?boardTitle="${boardTitle1}>${boardTitle1}</a></li>
								</s:if>
							</s:iterator>
						</ul>
					</section>
				</div>
				<div class="3u">
					<div id="sidebar2">
						<section>
							<div class="sbox1">
								<h2>Java</h2>
								<ul class="style1">
									<s:iterator value="boardList">
								<s:if test="javaboardList != null">
									<li><a href="#">${boardTitle1}</a></li>
								</s:if>
							</s:iterator>
								</ul>
							</div>
							<div class="sbox2">
								<h2>C#</h2>
								<ul class="style1">
									<s:iterator value="boardList">
								<s:if test="cSharpboardList != null">
									<li><a href="#">${boardTitle1}</a></li>
								</s:if>
							</s:iterator>
								</ul>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

</body>
</html>
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none"></script>
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<header id="header">
			<div class="5grid-layout">
				<div class="row">
					<div class="12u" id="logo"> <!-- Logo -->
						<h1><a href="#" class="mobileUI-site-name">Board</a></h1>
					</div>
				</div>
			</div>
			<div class="5grid-layout">
				<div class="row">
					<div class="12u" id="menu">
						<div id="menu-wrapper">
							<nav class="mobileUI-site-nav">
								<ul>
									<li><a href="index.html">Converter</a></li>
									<li class="current_page_item"><a href="threecolumn.html">Board</a></li><!-- here -->
									<li><a href="twocolumn1.html">Main</a></li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<div id="page-wrapper" class="5grid-layout">
		<div class="5grid-layout">
			<div class="row">
				<div class="6u">
					<div id="content">
						<section>
							<div class="post">
								<h2>사용자 ID</h2>
								<p><a href="#"><img src="images/pics02.jpg" alt="" class="img-alignleft"></a> Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. Pellentesque adipiscing purus ac magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.	 Pellentesque pede. Donec pulvinar ullamcorper metus. In eu odio at lectus pulvinar mollis.</p>
								<p class="button-style"><a href="#">Profile Update</a></p>
							</div>
						</section>

					</div>
				</div>
				<div class="3u" id="sidebar1">
					<section>
						<h2>날짜별</h2>
						<ul class="style1">
							<s:iterator value="boardList">
								<s:if test="boardList != null">
									<li><a href="#">${boardTitle1}</a></li>
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
									<li><a href="#">Maecenas luctus lectus at sapien</a></li>
									<li><a href="#">Etiam rhoncus volutpat erat</a></li>
									<li><a href="#">Etiam posuere augue sit amet nisl</a></li>
									<li><a href="#">Mauris vulputate dolor sit amet nibh</a></li>
									<li><a href="#">Nulla luctus eleifend purus</a></li>
								</ul>
							</div>
							<div class="sbox2">
								<h2>C#</h2>
								<ul class="style1">
									<li><a href="#">Maecenas luctus lectus at sapien</a></li>
									<li><a href="#">Etiam rhoncus volutpat erat</a></li>
									<li><a href="#">Donec dictum metus in sapien</a></li>
									<li><a href="#">Maecenas  lectus  sapien</a></li>
									<li><a href="#">Integer gravida  quis urna</a></li>
									<li><a href="#">Etiam posuere   amet nisl</a></li>
									<li><a href="#">Integer gravida  quis urna</a></li>
									<li><a href="#">Etiam posuere   amet nisl</a></li>
									<li><a href="#">Mauris vulputate   amet </a></li>
									<li><a href="#">Nulla luctus eleifend </a></li>
									<li><a href="#">Mauris vulputate dolor sit amet nibh</a></li>
									<li><a href="#">Nulla luctus eleifend purus</a></li>
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
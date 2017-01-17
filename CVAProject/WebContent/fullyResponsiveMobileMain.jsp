<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>CVAProject</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/Mmain.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/brandLogo.png" alt="" /></span>
							<h1 id="title">C.VA</h1>
							<p>안드로이드프로젝트</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<!--

								Prologue's nav expects links in one of two formats:

								1. Hash link (scrolls to a different section within the page)

								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>

							-->
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Intro</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Portfolio</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">About Me</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Contact</span></a></li>
							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="mConverter" class="icon fa fa-exchange" aria-hidden="true"><span class="label">Converter</span></a></li>
							<li><a href="boardList" class="icon fa fa-th-list" aria-hidden="true"><span class="label">Board</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<!-- <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li> -->
						<!-- 	<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li> -->
						</ul>

				</div>

			</div>

		<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 class="alt"><strong>C.VA</strong></h2>
							</header>

							<footer>
								<a href="#portfolio" class="button scrolly">↓</a>
							</footer>

						</div>
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
									<h2>What is C.VA?</h2>
							</header>

							<p>
							C.VA is an online compiler and debugging tool which allows you to
							compile source code and execute it online in C# and JAVA.
							Furthermore, C.VA can translate C# source code to JAVA and JAVA
							to C#.
							</p>
							<h2>How to use C.VA?</h2>
							<br>
							<p>
							You have to type JAVA on left side, and C# on right side. enter
							the source code with optional input data... and you are ready to
							go! Plus, if you know what JAVA code is of C#, C# is of JAVA,
							click the translate button!
							</p>
							<h2>Having problems?</h2>
							<br>
							<p>
							Check the samples to see how to write code which works correctly.
							If you find out more, please do not have a question on our
							project. C.VA!!! We are proud to present our C.VA!!! technology,
							which allows you to execute programs on a remote server in a
							secure way within a complete runtime environment. Visit the on
							the 4th floor COEX.
							</p>

							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
										<header>
											<h3>김범욱</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
										<header>
											<h3>김도경</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic04.png" alt="" /></a>
										<header>
											<h3>Ja#</h3>
										</header>
									</article>
<!-- 									<article class="item">
										<a href="#" class="image fit"><img src="images/pic05.jpg" alt="" /></a>
										<header>
											<h3>Natoque Vitae</h3>
										</header>
									</article> -->
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
										<header>
											<h3>김두리나</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic07.jpg" alt="" /></a>
										<header>
											<h3>박유진</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
									<h2>팀원</h2>
							</header>
							<h2>김범욱</h2>
							<p>
							씨샵담당
							</p>
							<h2>김도경</h2>
							<p>
							서류 / 부가기능담당
							</p>
							<h2>김두리나</h2>
							<p>
							번역파트 / 부가기능 담당
							</p>
							<h2>박유진</h2>
							<p>
							자바 담당
							</p>
						</div>
					</section>

				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">

							<header>
								<h2>Contact</h2>
							</header>

							<p></p>

							<form method="post" action="#">
								<div class="row">
									<div class="6u 12u$(mobile)"><input type="text" name="name" placeholder="Name" /></div>
									<div class="6u$ 12u$(mobile)"><input type="text" name="email" placeholder="Email" /></div>
									<div class="12u$">
										<textarea name="message" placeholder="Message"></textarea>
									</div>
									<div class="12u$">
										<input type="submit" value="Send Message" />
									</div>
								</div>
							</form>

						</div>
					</section>

			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; 31기 A반 7조 </li><li><a href="">Ja#</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollzer.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/Mmain.js"></script>

	</body>
</html>
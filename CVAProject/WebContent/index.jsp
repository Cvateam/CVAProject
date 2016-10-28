<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>C.Va</title>
		<meta name="description" content="A landing page template with a featured content section and background sounds that change according to the view" />
		<meta name="keywords" content="landing page, background sound, aquatic theme, effect, transition, animation" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Vidaloka" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<script>document.documentElement.className = 'js';</script>
	</head>
	<body>
		<svg class="hidden">
			<defs>
				<symbol id="icon-arrow" viewBox="0 0 24 24">
					<title>arrow</title>
					<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 "/>
				</symbol>
				<symbol id="icon-grid" viewBox="0 0 100 100">
					<title>grid</title>
					<rect x="8.4" y="8.9" width="20.1" height="20.1"/>
					<rect x="40" y="8.9" width="20.1" height="20.1"/>
					<rect x="71.6" y="8.9" width="20.1" height="20.1"/>
					<rect x="8.3" y="40" width="20.1" height="20.1"/>
					<rect x="39.9" y="40" width="20.1" height="20.1"/>
					<rect x="71.6" y="40" width="20.1" height="20.1"/>
					<rect x="8.3" y="71" width="20.1" height="20.1"/>
					<rect x="39.9" y="71" width="20.1" height="20.1"/>
					<rect x="71.6" y="71" width="20.1" height="20.1"/>
				</symbol>
				<symbol id="icon-sound-on" viewBox="0 0 100 100">
					<title>sound on</title>
					<path d="M57.9,13c-6.6,0-13.1,1.8-18.8,5.1c-5.1,3-9.3,7.1-12.5,12.1H12.5c-5.7,0-10.4,4.7-10.4,10.4v18.9
						c0,5.7,4.7,10.4,10.4,10.4h14.1c3.1,4.9,7.4,9.1,12.5,12.1c5.7,3.3,12.1,5.1,18.8,5.1c1.5,0,2.7-1.2,2.7-2.7V15.7
						C60.6,14.2,59.4,13,57.9,13z M25.5,64.5h-13c-2.8,0-5.1-2.3-5.1-5.1V40.6c0-2.8,2.3-5.1,5.1-5.1h13C25.5,35.5,25.5,64.5,25.5,64.5
						z M55.2,81.6c-10-0.8-19.1-6.5-24.4-15.1V33.6c5.3-8.6,14.4-14.3,24.4-15.1V81.6z"/>
					<path d="M71,29.4c-1.2-0.8-2.9-0.6-3.7,0.7c-0.8,1.2-0.6,2.9,0.7,3.7c5.3,3.7,8.5,9.8,8.5,16.3S73.3,62.6,68,66.3
						c-1.2,0.8-1.5,2.5-0.7,3.7c0.5,0.8,1.3,1.1,2.2,1.1c0.5,0,1.1-0.2,1.5-0.5C77.8,66,81.8,58.3,81.8,50S77.8,34.1,71,29.4z"/>
					<path d="M81.3,18.3c-1.2-0.8-2.9-0.6-3.7,0.7c-0.8,1.2-0.6,2.9,0.7,3.7c8.9,6.2,14.3,16.4,14.3,27.3
						s-5.3,21.1-14.3,27.3c-1.2,0.8-1.5,2.5-0.7,3.7c0.5,0.8,1.3,1.1,2.2,1.1c0.5,0,1.1-0.2,1.5-0.5C91.7,74.5,97.9,62.6,97.9,50
						S91.7,25.5,81.3,18.3z"/>
				</symbol>
				<symbol id="icon-sound-off" viewBox="0 0 100 100">
					<title>sound off</title>
					<path d="M57.9,13c-6.6,0-13.1,1.8-18.8,5.1c-5.1,3-9.3,7.1-12.5,12.1H12.5c-5.7,0-10.4,4.7-10.4,10.4v18.9
						c0,5.7,4.7,10.4,10.4,10.4h14.1c3.1,4.9,7.4,9.1,12.5,12.1c5.7,3.3,12.1,5.1,18.8,5.1c1.5,0,2.7-1.2,2.7-2.7V15.7
						C60.6,14.2,59.4,13,57.9,13z M25.5,64.5h-13c-2.8,0-5.1-2.3-5.1-5.1V40.6c0-2.8,2.3-5.1,5.1-5.1h13C25.5,35.5,25.5,64.5,25.5,64.5z
						M55.2,81.6c-10-0.8-19.1-6.5-24.4-15.1V33.6c5.3-8.6,14.4-14.3,24.4-15.1V81.6z"/>
					<g>
						<path d="M68.4,66.4c-0.7,0-1.4-0.3-1.9-0.8c-1-1-1-2.7,0-3.8l27.6-27.6c1-1,2.7-1,3.8,0c1,1,1,2.7,0,3.8L70.3,65.7
						C69.8,66.2,69.1,66.4,68.4,66.4z"/>
						<path d="M96,66.4c-0.7,0-1.4-0.3-1.9-0.8L66.6,38.1c-1-1-1-2.7,0-3.8c1-1,2.7-1,3.8,0l27.6,27.6c1,1,1,2.7,0,3.8
						C97.4,66.2,96.7,66.4,96,66.4z"/>
					</g>
				</symbol>
			</defs>
		</svg>
		<main class="landing-layout">
			<!-- Landing wrap with sections -->
			<div class="landing-wrap">
				<section class="landing landing--above" style="background-image: url(img/main_img123.png);"></section>
				<section class="landing landing--beneath" style="background-image: url(img/2.jpg);">
					<canvas id="bubbles"></canvas>
				</section>
			</div><!-- /landing-wrap -->
			<!-- Landing header with title -->
			<header class="landing-header">
				<h1 class="landing-header__title" aria-label="title_c.va">
					<span>C</span><span>.</span><span>V</span><span>a</span>
				</h1>
				<p class="landing-header__tagline">Java To C# Converter</p>
			</header><!-- /landing-header -->
			<!-- Trigger button for layout change -->
			<button class="button button--trigger" aria-label="View more">
				<svg class="icon icon--grid icon--shown"><use xlink:href="#icon-grid"></use></svg>
				<svg class="icon icon--arrow-up icon--hidden"><use xlink:href="#icon-arrow"></use></svg>
			</button>

			<!-- Featured content that gets shown after the layout opens -->
			<section class="featured-content">
				<ul class="featured-list">
					<li class="featured-list__item">
						<a href="converter" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/converter.png" alt="Seaweed 1">
							<h3 class="featured-list__title">Converter</h3>
						</a>
					</li>
					<li class="featured-list__item">
						<a href="#" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/board.png" alt="Seaweed 3">
							<h3 class="featured-list__title">Board</h3>
						</a>
					</li>
					<li class="featured-list__item">
						<a href="#" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/contactus.png" alt="Seaweed 4">
							<h3 class="featured-list__title">Contact Us</h3>
						</a>
					</li>
					<li class="featured-list__item">
						<a href="#" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/aboutus.png" alt="Seaweed 2">
							<h3 class="featured-list__title">About Us</h3>
						</a>
					</li>
<!-- 					<li class="featured-list__item">
						<a href="#" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/sw5.svg" alt="Seaweed 5">
							<h3 class="featured-list__title">Holy Water</h3>
						</a>
					</li>
					<li class="featured-list__item">
						<a href="#" class="featured-list__link">
							<img class="featured-list__img" src="img/icons/sw6.svg" alt="Seaweed 6">
							<h3 class="featured-list__title">Juicy Magic</h3>
						</a>
					</li> -->
				</ul>
			</section><!-- /featured-content -->
			<!-- Codrops header -->
			<header class="codrops-header">
				<div class="codrops-links">
				<!-- Sound on/off button -->
					<button class="button button--sound codrops-icon codrops-icon--prev" aria-label="Toggle sound">
						<svg class="icon icon--sound-on icon--shown"><use xlink:href="#icon-sound-on"></use></svg>
						<svg class="icon icon--sound-off icon--hidden"><use xlink:href="#icon-sound-off"></use></svg>
					</button>
				</div>
				<h1 class="codrops-header__title">    A class 7 group</h1>
				<nav class="codrops-demos">
					<a class="current-demo" href="#">Home</a>
					<s:if test='%{#session.loginId == null}'>
					<a href="customer/loginForm.action">Login</a>
					</s:if>
					<s:if test='%{#session.loginId != null}'>
					<a href="customer/loginForm.action">Logout</a>
					</s:if>
					<a href="#" class="menu">Menu</a>
				</nav>
			</header><!-- /codrops-header -->
			<div class="loader">
				<svg class="loader__img" viewBox="0 0 100 100" width="100px" height="100px">
					<circle class="loader__circle" cx="22.8" cy="77.6" r="16.5"/>
					<circle class="loader__circle" cx="52.2" cy="82.9" r="6.5"/>
					<circle class="loader__circle" cx="79.8" cy="69.8" r="13.1"/>
				</svg>
			</div>
		</main>
		<script src="js/howler.min.js"></script>
		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>

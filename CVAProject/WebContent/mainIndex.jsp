<!DOCTYPE html>
<html>
	<head>
		<title>C.va - java to c# translate</title>
		<meta charset="UTF-8">
		<link rel="shortcut icon" href="images/icon.png">

		<link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Open+Sans:400,300' type='text/css'>
		<style type="text/css">
			body
			{
				font-family: 'Open Sans', Arial, Helvetica, sans-serif;
				font-weight: 300;
				font-size: 15px;
				margin: 0px;
			}
			h1
			{
				margin-top: 0px;
				padding-top: 0px;
				font-size: 19px;
				color: #636466;
			}
			h2
			{
				font-size: 15px;
			}
			a:link, a:visited, a:hover, a:active
			{
				color: #0072bb;
				text-decoration: none;
			}
			img
			{
				vertical-align: middle;
			}
			input, select, textarea
			{
				font-family: 'Open Sans', Arial, Helvetica, sans-serif;
				font-weight: 300;
				font-size: 15px;
			}
			.headerTable
			{
				position: fixed;
				top: 0;
				width: 100%;
				z-index: 100;
				background: white;
			}
			.menuSection
			{
				width: 143px;
				height: 25px;
				text-align: center;
				font-weight: bold;
				font-size: 16px;
			}
			.menuSection a:link,
			.menuSection a:visited,
			.menuSection a:hover,
			.menuSection a:active
			{
				color: white;
				outline: 0;
			}
			.section
			{
				width: 1040px;
				margin: auto;
				text-align: justify;
				padding-bottom: 50px;

				/* position anchor links below the fixed header */
				padding-top: 193px;
				margin-top: -147px;
			}
			.logo
			{
				width: 1040px;
				height: 404px;
				background: url(images/013.jpg);
				background-attachment: fixed;
				background-position: center 147px;
				background-repeat: no-repeat;
			}
			.logo-content
			{
				position: fixed;
				margin-left: 14px;
				margin-top: 147px;
				height: 257px;
				overflow: hidden;
			}
			
.button {
	margin: 0;
	padding: 0;
	color: #fff;
	border: none;
	background: none;
	width: 4em;
	height: 4em;
}
polygon {
  stroke-width: 0;
  stroke: #0072bb;
  fill: #0072bb;
}

.button:hover {
	color: #84ff84;
}

.button:focus {
	outline: none;
}

.button--trigger {
	position: absolute;
	right: 30em;
	bottom: 0em;
}
	#slider1{
	list-type: none;
	list-style: none;
	padding: 0;
	margin: 0;
}
.slider{
 margin: 0 auto;
 width: 625px;
 height: 345px;	

}
			
		</style>
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.3"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/jquery.cycle.all.js"></script> 
		<script>
			var numberOfSections = 4;
			var selectedSection = 1;

			function selectSection(j)
			{
				for(var i = 1; i <= numberOfSections; i++)
				{
					var td = document.getElementById("menuSection" + i);
					td.style.background = (i == j) ? "#0072bb" : "#636466";
				}
				selectedSection = j;
			}

			$(document).ready(function()
			{
				$(window).scroll(function()
				{
					var scrolled = $(window).scrollTop();

					// update menu
					var visibleTop = scrolled + 147;
					var visibleBottom = visibleTop + $(window).height() - 147;

					var biggestSection = 1;
					var biggestPercentage = 0;
					for(var i = 1; i <= numberOfSections; i++)
					{
						var section = $("#section" + i);
						var sectionTop = section.position().top + 46;
						var sectionHeight = section.height() + 10;
						var sectionBottom = sectionTop + sectionHeight;
						var percentage = 100 / sectionHeight * (Math.min(visibleBottom, sectionBottom) - Math.max(visibleTop, sectionTop));
						if(percentage > biggestPercentage)
						{
							biggestSection = i;
							biggestPercentage = percentage;
						}
					}
					if(biggestSection != selectedSection) selectSection(biggestSection);

					// update logo content
					$("#logo-content").height(Math.max(Math.min(257 - scrolled, 257), 0));
				});
				selectSection(selectedSection);
			});
		</script>
		
	</head>
	<body>

	<!-- header table -->
	<table border="0" cellpadding="0" cellspacing="0" class="headerTable">
		<tr>
			<td style="padding-bottom: 1px;" align="center">
				<table border="0" cellpadding="0" cellspacing="0" width="1040">
					<tr>
						<td align="left"><img src="images/Logomakr_1yE4r7.png" width="130" height="110"></td>
						<td align="right" valign="bottom">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="menuSection" id="menuSection1"><a class="smooth" href="#section1">Introduction</a></td>
									<td width="1"></td>
									<td class="menuSection" id="menuSection2"><a class="smooth" href="#section2">번역!</a></td>
									<td width="1"></td>
									<td class="menuSection" id="menuSection3"><a class="smooth" href="#section3">About Us</a></td>
									<td width="1"></td>
									<td class="menuSection" id="menuSection4"><a class="smooth" href="#section4">Contact Us</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="26" bgcolor="1b96fe"></td>
		</tr>
	</table>

	<!-- content table -->
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="contentTable">
		<tr><td height="101"></td></tr> <!-- header table is here -->

		<!-- Introduction -->
		<tr bgcolor="#e5e5e5">
		<td>
		<div id="section1" class="section">
				<div class="logo">
					<div id="logo-content" class="logo-content">
						<span style="color:#4d79ff ; font-weight: 600; margin-left: 20em;">
							<span style="font-size: 34px;">Java To C# Translation</span><br>
							<span style="font-size: 24px; margin-left: 10em;">Automatic, Complete, Correct <i>By A Class 7 Group </i></span>
						</span><br><br>
					</div>
				</div><br>

				We translate Java source code to C# source code.
				The translation is completely automatic, supports the entire C# language
				and creates functionally equivalent Java code - ready to be executed.

				<div style="margin-top: 8px; margin-bottom: 8px;">
				Here are just a few ways you could benefit from our technology:
				<ul style="margin-top:0px; margin-bottom:0px;">
				<li>Good Point</li>
				<li>Good Point</li>
				<li>Good Point</li>
				<li>Good Point</li>
				</ul>
				</div>
				Take a look at the <a class="smooth" href="#section2">Converter</a> and <a class="smooth" href="#section3">About Us</a>
				sections to get an impression of what you can expect from us.

				<br><br>

		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>

		<!-- Converter -->
		<tr bgcolor="#f2f2f2">
		<td>
		<div id="section2" class="section">
				<h1>Converter </h1> <h2>Try it!</h2>
		<svg class="hidden">
			<defs>
				<symbol id="icon-arrow"  viewbox='0, 0, 24, 100'>
					<title>arrow</title>
					<polygon points="0,0 100,50 0,100 20, 50" />
				</symbol>
			</defs>
		</svg>
			<button class="button button--trigger" aria-label="View more">
				<svg class="icon icon--arrow-up icon--hidden"><use xlink:href="#icon-arrow"></use></svg>
			</button>
<!-- 		<div class="slider">
		<ul id="slider1">
			<li><img border="0" src="images/img1.jpg" width="624" height="345" /></li>
			<li><img border="0" src="images/img2.jpg" width="624" height="345" /></li>
			<li><img border="0" src="images/img3.jpg" width="624" height="345" /></li>

		</ul>
		</div> -->
		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>

		<!-- FAQ -->
		<tr bgcolor="#e5e5e5">
		<td>
		<div id="section3" class="section">
				<h1>팀명: </h1>

				<h2 style="margin-top:0px;">조장 :  뽕상</h2>
				1
				2
				3
				4
				

				<h2>조원 : 김도경</h2>
				1
				2
				3
				4
				
				<h2>조원 :김두리나</h2>
				1
				2
				3
				4
					
				<h2>조원: 박유진</h2>
				1
				2
				3
				4
		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>

		<!-- Contact Us -->
		<tr bgcolor="#f2f2f2">
		<td>
		<div id="section4" class="section">
				<h1>Contact Us</h1>

				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td nowrap>
							Send us a message. We would be happy to hear from you.<br>
							Email us at <a href="mailto:neverCheck@naver.com">neverCheck@naver.com</a> or use the contact form:
						</td>
					</tr>
					<tr>
						<td align="center">
							<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td align="right" nowrap>Name</td>
								<td><input type="text" style="width: 220px; height: 25px;" id="contact-name"></td>
							</tr>
							<tr>
								<td align="right" nowrap>Email</td>
								<td><input type="text" style="width: 220px; height: 25px;" id="contact-email"></td>
							</tr>
							<tr>
								<td align="right" nowrap>Subject</td>
								<td><input type="text" style="width: 220px; height: 25px;" id="contact-subject"></td>
							</tr>
							<tr>
								<td align="right" valign="top" style="padding-top: 12px;" nowrap>Message</td>
								<td><textarea style="width: 220px; height: 135px;" id="contact-message"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><br>
									<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
										<td id="contact-result"></td>
										<td align="right"><input type="button" value="Send" onclick="sendEmail();" id="contact-sendButton"></td>
									</tr></table>
<!--  sendEmail() 자바스크립트 없음 ㅋㅋㅋㅋ -->									
						</td>
							</tr>
							</table>
						</td>
					</tr>
				</table>
		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>

		<!-- Copyright -->
		<tr bgcolor="#e5e5e5">
		<td>
		</td>
		</tr>

	</table>

	<script type="text/javascript">
		$(function()
		{
			$('a.smooth').bind('click', function(event)
			{
				var $anchor = $(this);
				$('html, body').stop().animate({
						scrollTop: $($anchor.attr('href')).offset().top
					}, 1500,'easeInOutExpo');
				event.preventDefault();
			});
			$('#slider1') .cycle({
				fx: 'turnDown', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
				speed:  'slow', 
		   		timeout: 2000 
			});
		});
		
	</script>
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-50415822-1', 'auto');
		ga('send', 'pageview');
	</script>

	</body>
</html>


<!DOCTYPE html>
<html>
	<head>
		<title>C.va - java to c# translate</title>
		<meta charset="utf-8">

		<link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Open+Sans:400,300' type='text/css'>
		<link rel="stylesheet" href="codemirror-3.21/codemirror.css">
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
			.beach
			{
				width: 1040px;
				height: 404px;
				background: url(images/013.jpg);
				background-attachment: fixed;
				background-position: center 147px;
				background-repeat: no-repeat;
			}
			.beach-content
			{
				position: fixed;
				margin-left: 14px;
				margin-top: 147px;
				height: 257px;
				overflow: hidden;
			}
			
		</style>
		<style type="text/css">
			.CodeMirror
			{
				border: 2px inset #dee;
				width: 511px;
				height: 267px;
				font-size: 13px;
			}
			.CodeMirror-linenumber
			{
				min-width: 16px;
			}
		</style>

		<script src="codemirror-3.21/codemirror.js"></script>
		<script src="codemirror-3.21/clike.js"></script>
		<script src="codemirror-3.21/matchbrackets.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js?ver=3.3"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
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
						var sectionHeight = section.height();
						var sectionBottom = sectionTop + sectionHeight;
						var percentage = 100 / sectionHeight * (Math.min(visibleBottom, sectionBottom) - Math.max(visibleTop, sectionTop));
						if(percentage > biggestPercentage)
						{
							biggestSection = i;
							biggestPercentage = percentage;
						}
					}
					if(biggestSection != selectedSection) selectSection(biggestSection);

					// update beach content
					$("#beach-content").height(Math.max(Math.min(257 - scrolled, 257), 0));
				});
				selectSection(selectedSection);
			});
		</script>
		<script>
			var exampleMap =
				{
					"Intro":
						"namespace Intro" +
						"\n" +
						"/*\n" +
						"  You can write C# or Java code here or look at the examples.\n" +
						"  It will be translated as \"demo/demo_translation.c\".\n" +
						"  There are also translations of full programs below.\n" +
						"*/\n" +
						"{\n" +
						"class Program\n"+
						"\t{" + 
						"      static void Main(string[] args)\n"+
						"      {"+
						"            System.Console.WriteLine(\"Hello World...\");"+
						"        }"+
						"    }"+
						"}"
						
				};
			var cEditor;
			var javaEditor;
			var maxCodeLength = 1111;
			var warningThreshold = 10;
			var currentlyTranslating = false;

			function setupDemo()
			{
				cEditor = CodeMirror.fromTextArea(document.getElementById("c-code"), {
						lineNumbers: true,
						matchBrackets: true,
						mode: "text/x-csrc"
					});

				var exampleSelect = document.getElementById("demo-example");
				for(var exampleName in exampleMap)
				{
					var option = document.createElement("option");
					option.text = exampleName;
					exampleSelect.add(option);
				}

				demoExampleChanged(); // 바꿀게 없음 하나만  예 들어놓음.. 허허허허
			}

			function demoExampleChanged()
			{
				cEditor.setValue(exampleMap[document.getElementById("demo-example").value]);
			}

			function maximizeDemoTable(maximize)
			{
				var demoTable = document.getElementById("demo-table");
				var xGrowth = 0, yGrowth = 0;
				if(maximize)
				{
					var spacing = 15;
					var rect = demoTable.getBoundingClientRect();
					var yScroll = rect.top - 140 - spacing;
					window.scrollBy(0, yScroll);
					xGrowth = Math.max(rect.left - spacing, 0);
					yGrowth = Math.max($(window).height() - rect.bottom + yScroll - spacing, 0);
				}
				demoTable.style.marginLeft = -xGrowth + 'px';
				demoTable.style.marginRight = -xGrowth + 'px';
				cEditor.setSize(511 + xGrowth, 267 + yGrowth);
				javaEditor.setSize(511 + xGrowth, 267 + yGrowth);
			}

			function runTranslation()
			{
				
				var translateButton = document.getElementById("translate-button");

				translateButton.disabled = true;
				currentlyTranslating = true;
				
				
				var  exampleMapJava = "package Intro;" +
				"\n" +
				"/*\n" +
				"  You can write C# or Java code here or look at the examples.\n" +
				"  It will be translated as \"demo/demo_translation.c\".\n" +
				"  There are also translations of full programs below.\n" +
				"*/\n" +
				"public class Program{\n"+
				"      public static void Main(string[] args){\n"+
				"            System.out.println(\"Hello World...\");\n"+
				"      }\n"+
				"}";
					document.getElementById("java-code").value = exampleMapJava;
					javaEditor = CodeMirror.fromTextArea(document.getElementById("java-code"), {
						lineNumbers: true,
						matchBrackets: true,
						readOnly: true,
						mode: "text/x-java"
					});
					translateButton.disabled = !/\S/.test(cEditor.getValue());
					currentlyTranslating = false;
				};
				
		</script>

	</head>
	<body onload="setupDemo();">

	<!-- header table -->
	<table border="0" cellpadding="0" cellspacing="0" class="headerTable">
		<tr>
			<td style="padding-bottom: 1px;" align="center">
				<table border="0" cellpadding="0" cellspacing="0" width="1040">
					<tr>
						<td align="left"><img src="images/Logomakr_1yE4r7.png" width="145" height="119"></td>
						<td align="right" valign="bottom">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="menuSection" id="menuSection1"><a class="smooth" href="#section1">Introduction</a></td>
									<td width="1"></td>
									<td class="menuSection" id="menuSection3"><a class="smooth" href="#section3">About Us</a></td>
									<td width="1"></td>
									<td class="menuSection" id="menuSection2"><a class="smooth" href="#section2">Converter</a></td>
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
				<div class="beach">
					<div id="beach-content" class="beach-content">
                  <span style="color:#4d79ff ; font-weight: 600; margin-left: 20em;">
                     <span style="font-size: 34px;">Java To C# Translation</span><br>
                     <span style="font-size: 24px; margin-left: 10em;">Automatic, Complete, Correct <i>By A Class 7 Group </i></span>
                  </span><br><br>
					</div>
				</div><br>
				
				<br><br>
										
							<h2>What is C.VA?</h2>
							C.VA is an online compiler and debugging tool which allows you to
							compile source code and execute it online in C# and JAVA.
							Furthermore, C.VA can translate C# source code to JAVA and JAVA
							to C#.
							<h2>How to use C.VA?</h2>
							You have to type JAVA on left side, and C# on right side. enter
							the source code with optional input data... and you are ready to
							go! Plus, if you know what JAVA code is of C#, C# is of JAVA,
							click the translate button!
							<h2>Having problems?</h2>
							Check the samples to see how to write code which works correctly.
							If you find out more, please do not have a question on our
							project. C.VA!!! We are proud to present our C.VA!!! technology,
							which allows you to execute programs on a remote server in a
							secure way within a complete runtime environment. Visit the on
							the 4th floor COEX.
						
						<br> <br><br>

		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>
		
				<!-- About Us-->
		<tr bgcolor="#e5e5e5">
		<td>
		<div id="section3" class="section">
				<h1>About Us &nbsp; </h1>
				<img alt="팀 사진" src="images/photo.jpg">
				<br>
				<h2 style="margin-top:0px;">Leader : Gim Beom Uk</h2>
						

				<h2>Member :  Kim Durina</h2>
				

				<h2>Member : Kim Do Kyung</h2>
			

				<h2>Member : Park Yu Jin </h2>
				
		</div>
		</td>
		</tr>
		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>

		<!-- Converter Sample -->
		<tr bgcolor="#f2f2f2">
		<td>
		<div id="section2" class="section">
				<h1>Converter</h1>

				<table border="0" cellpadding="0" cellspacing="0" id="demo-table">
				<tr>
					<td><h2 style="margin:2px;">C# Code</h2></td>
					<td rowspan="3" width="10"></td>
					<td><h2 style="margin:2px;">Translated Java Code</h2></td>
				</tr>
				<tr>
					<td><textarea id="c-code"></textarea></td>
					<td><textarea rows="13" cols="70" id="java-code"></textarea></td>
				</tr>
				<tr>
					<td>
						<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
							<td nowrap>
								Examples:
								<select onchange="demoExampleChanged()" id="demo-example"></select>
							</td>
							<td width="100%" align="center">
								<input type="button" value="Translate" onclick="runTranslation();" id="translate-button">
							</td>
							<td nowrap>
								<span id="limitSpan"></span>
								<input type="button" value="Clear" onclick="cEditor.setValue('');">
							</td>
						</tr></table>
					</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
							<td width="100%" align="center"><input type="checkbox" onclick="maximizeDemoTable(this.checked);" id="maximize-button">Maximize</td>
							<td><input type="button" value="Clear" onclick="javaEditor.setValue('');"></td>
						</tr></table>
					</td>
				</tr>
				</table>
					<h2>Do You Want To Try C.VA?   &nbsp;&nbsp; <a href="converterMain">Click Here! </a></h2>
				<br>
		</div>
		</td>
		</tr>

		<!-- Separator -->
		<tr><td height="1" bgcolor="#c7c5c5"></td></tr>


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
							Email us at <a href="mailto:info@mtsystems.com">info@mtsystems.com</a> or use the contact form:
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
								<td><input type="checkbox" id="contact-sendCopy">Send me a copy.</td>
							</tr>
							<tr>
								<td></td>
								<td><br>
									<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
										<td id="contact-result"></td>
										<td align="right"><input type="button" value="Send" onclick="sendEmail();" id="contact-sendButton"></td>
									</tr></table>
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


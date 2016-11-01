<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제 리스트</title>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="script/mp.mansory.js"></script>
	<link rel="stylesheet" type="text/css" href="css/Teststyle.css">
</head>
<body>
<div class="jquery-script-ads"><script type="text/javascript"><!--
</script>
</div>
<div class="jquery-script-clear"></div>
	<div class="container">
	<h1>코딩 문제 게시판</h1>
	<s:iterator value="" status=""></s:iterator>
		<div class="" id="my-gallery-container">
			<div class="item" data-order="31">
				<p>item 0</p>
			</div>
			<div class="item h200" data-order="30">
				<p>item 1</p>
			</div>
			<div class="item h250" data-order="29">
				<p>item 2</p>
			</div>
			<div class="item h150" data-order="28">
				<p>item 3</p>
			</div>
			<div class="item h100" data-order="27">
				<p>item 4</p>
			</div>
			<div class="item" data-order="26">
				<p>item 5</p>
			</div>
			<div class="item h200" data-order="25">
				<p>item 6</p>
			</div>
			<div class="item h150" data-order="24">
				<p>item 7</p>
			</div>
			<div class="item h100" data-order="23">
				<p>item 8</p>
			</div>
			<div class="item" data-order="22">
				<p>item 9</p>
			</div>
			<div class="item h200" data-order="21">
				<p>item 10</p>
			</div>
			<div class="item h150" data-order="20">
				<p>item 11</p>
			</div>
			<div class="item h100" data-order="19">
				<p>item 12</p>
			</div>
			<div class="item" data-order="18">
				<p>item 13</p>
			</div>
			<div class="item h200" data-order="17">
				<p>item 14</p>
			</div>
			<div class="item h150" data-order="16">
				<p>item 15</p>
			</div>
			<div class="item h150" data-order="15">
				<p>item 16</p>
			</div>
			<div class="item h100" data-order="14">
				<p>item 17</p>
			</div>
			<div class="item" data-order="13">
				<p>item 18</p>
			</div>
			<div class="item h200" data-order="12">
				<p>item 19</p>
			</div>
			<div class="item h250" data-order="11">
				<p>item 20</p>
			</div>
			<div class="item h200" data-order="10">
				<p>item 21</p>
			</div>
			<div class="item h200" data-order="9">
				<p>item 22</p>
			</div>
			<div class="item" data-order="8">
				<p>item 23</p>
			</div>
			<div class="item h150" data-order="7">
				<p>item 24</p>
			</div>
			<div class="item h100" data-order="6">
				<p>item 25</p>
			</div>
			<div class="item" data-order="5">
				<p>item 26</p>
			</div>
			<div class="item h200" data-order="4">
				<p>item 27</p>
			</div>
			<div class="item h150" data-order="3">
				<p>item 28</p>
			</div>
			<div class="item" data-order="2">
				<p>item 29</p>
			</div>
			<div class="item h150" data-order="1">
				<p>item 30</p>
			</div>
			<div class="item" data-order="0">
				<p>item 31</p>
			</div>

		</div>


	</div>
	<script type="text/javascript">
		jQuery(document).ready(function ( $ ) {
			$("#my-gallery-container").mpmansory(
				{
					childrenClass: 'item', // default is a div
					columnClasses: 'padding', //add classes to items
					breakpoints:{
						lg: 3, 
						md: 4, 
						sm: 6,
						xs: 12
					},
					distributeBy: { order: false, height: false, attr: 'data-order', attrOrder: 'asc' }, //default distribute by order, options => order: true/false, height: true/false, attr => 'data-order', attrOrder=> 'asc'/'desc'
					onload: function (items) {
						//make somthing with items
					} 
				}
			);
		});
	</script><script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
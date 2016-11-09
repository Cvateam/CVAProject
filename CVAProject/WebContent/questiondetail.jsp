<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>C.VA</title>
<link rel="shortcut icon" type="image/png" href="images/faviconLogo.png">
<link
	href="//stx1.ideone.com/gfx2/libs/bootstrap/css/bootstrap-with-responsive-1200-only.min.css"
	rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- , initial-scale=0.25 -->

<style>
[class^="icon-"], [class*=" icon-"] {
	display: inline;
	width: auto;
	height: auto;
	/*line-height: normal;*/
	vertical-align: baseline;
	background-image: none;
	background-position: 0% 0%;
	background-repeat: repeat;
	margin-top: 0;
}

a [class^="icon-"], a [class*=" icon-"] {
	display: inline;
}
</style>

<link
	href="http://stx1.ideone.com/themes/smoothness/jquery-ui-1.10.1.custom.min.css"
	type="text/css" rel="stylesheet">
<!-- jak sie wrzuci do bundle to nie dziala -->
<!-- <link href="/gfx2/css/jquery-ui-bootstrap/jquery-ui-1.10.0.custom.css" type="text/css" rel="stylesheet" /> -->
<!-- mozna ew wlaczyc zamiast tego powyzej -->

<!-- 2013-02-07 by wiele: na czas develu wyrzucam to z bundle zeby moc latwiej debugowac w firebugu -->
<!-- <link href="http://stx1.ideone.com/gfx2/css/ideone-1-2.css?8"
	rel="stylesheet"> -->
<link href="css/converter.css" rel="stylesheet">
<link href="http://stx1.ideone.com/gfx2/css/ideone-recent.css?8"
	rel="stylesheet">
<link href="http://stx1.ideone.com/gfx2/css/ideone-myrecent.css?8"
	rel="stylesheet">
<!-- <link href="http://stx1.ideone.com/gfx2/css/ideone-view.css?8"
	rel="stylesheet"> -->
<link href="css/view.css" rel="stylesheet">



<!-- end of rzeczy przeniesione tymczasowo z bundle -->

<script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="script/jquery-migrate-1.0.0.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<!--원래 1.4였음  -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript">
	var cookie_name = 'settings';
	var cookie_time = '15552000';
	var is_mobile = 0;

	$(function() {
		/*최초 테이블 띄우기  */
		$
				.ajax({
					method : "get",
					url : "list"//struts.xml
					,
					success : function(response) {
						var txt = "";
						$
								.each(
										response.boardList,
										function(index, item) {
											var javaFile = item.savedfile;
											var csharpFile = item.savedfile2;

											if (javaFile != null
													&& csharpFile != null) {
												txt = "<tr id='conTr'><td>"
														+ item.boardnum
														+ "</td><td>"
														+ item.title
														+ "</td><td>"
														+ item.inputdate
														+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
											}
											if (javaFile != null
													&& csharpFile == null) {
												txt = "<tr id='conTr'><td>"
														+ item.boardnum
														+ "</td><td>"
														+ item.title
														+ "</td><td>"
														+ item.inputdate
														+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
											}
											if (javaFile == null
													&& csharpFile != null) {
												txt = "<tr id='conTr'><td>"
														+ item.boardnum
														+ "</td><td>"
														+ item.title
														+ "</td><td>"
														+ item.inputdate
														+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
											}
											if (javaFile == null
													&& csharpFile == null) {
												txt = "<tr id='conTr'><td>"
														+ item.boardnum
														+ "</td><td>"
														+ item.title
														+ "</td><td>"
														+ item.inputdate
														+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
											}
											$("div.contents table").append(txt);
										});
					}
				});
		/* 테이블 검색 시  */
		$('#searchBtn')
				.on(
						'click',
						function() {
							var searchText = $("#searchText").val();
							var item = {
								"searchText" : searchText
							};//json Type으로 보내기
							$
									.ajax({
										type : "GET",
										url : "search",
										dataType : "json",
										data : item,
										success : function(response) {
											var txt = "";
											var txt2 = response.boardList;//파일 넣기부분 만들기
											$("div.contents table #conTr")
													.remove(txt);

											$
													.each(
															response.boardList,
															function(index,
																	item) {
																var javaFile = item.savedfile;
																var csharpFile = item.savedfile2;

																if (javaFile != null
																		&& csharpFile != null) {
																	txt = "<tr id='conTr'><td>"
																			+ item.boardnum
																			+ "</td><td>"
																			+ item.title
																			+ "</td><td>"
																			+ item.inputdate
																			+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
																}
																if (javaFile != null
																		&& csharpFile == null) {
																	txt = "<tr id='conTr'><td>"
																			+ item.boardnum
																			+ "</td><td>"
																			+ item.title
																			+ "</td><td>"
																			+ item.inputdate
																			+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
																}
																if (javaFile == null
																		&& csharpFile != null) {
																	txt = "<tr id='conTr'><td>"
																			+ item.boardnum
																			+ "</td><td>"
																			+ item.title
																			+ "</td><td>"
																			+ item.inputdate
																			+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
																}
																if (javaFile == null
																		&& csharpFile == null) {
																	txt = "<tr id='conTr'><td>"
																			+ item.boardnum
																			+ "</td><td>"
																			+ item.title
																			+ "</td><td>"
																			+ item.inputdate
																			+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
																}
																$(
																		"div.contents table")
																		.append(
																				txt);
															});

										}
									});
						});
		/* JavaPop버튼 클릭 시  */
		$('table').on(
				'click',
				'.javaPop',
				function() {
					var boardnum = $(this).parent().parent().parent()
							.children().first().text();
					$.ajax({
						type : "GET",
						url : "javaPopLoad",
						dataType : "json",
						data : {
							"boardnum" : boardnum
						},
						success : function(response) {
							var txt = "";
							var txt2 = response.board;
							txt = "<h3>" + txt2.savedfile + "<h3>";
							$("#javaSource").append(txt);
						}
					});
				});
		/* CsharpPop버튼 클릭 시  */
		$('table').on(
				'click',
				'.csharpPop',
				function() {

					var boardnum = $(this).parent().parent().parent()
							.children().first().text();

					$.ajax({
						type : "GET",
						url : "csharpPopLoad",
						dataType : "json",
						data : {
							"boardnum" : boardnum
						},
						success : function(response) {
							var txt = "";
							var txt2 = response.board;
							txt = "<h3>" + txt2.savedfile2 + "<h3>";
							$("#csharpSource").append(txt);
						}
					});
				});

		/* JavaPop 닫기버튼 클릭 시  */
		$('#closeBtnJ').on('click', function() {
			$("#javaSource > ").remove();
		});
		/* CsharpPop 닫기버튼 클릭 시  */
		$('#closeBtnC').on('click', function() {
			$("#csharpSource > ").remove();
		});

	});
</script>
<script type="text/javascript"
	src="//stx1.ideone.com/gfx2/js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript"
	src="//stx1.ideone.com/gfx2/libs/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="script/jquery.cookie.js"></script>
<script type="text/javascript" src="script/jquery.ajaxmanager.js"></script>
<script type="text/javascript" src="script/jquery.textarea.js"></script>
<script type="text/javascript" src="script/ace.js"
	data-ace-base="/gfx2/libs/ace-2013-08"></script>
<script src="http://ideone.com/gfx2/libs/ace-2013-08/mode-csharp.js"></script>
<script src="http://ideone.com/gfx2/libs/ace-2013-08/mode-java.js"></script>
<script src="script/cva.js"></script>
<style id="ace_editor">
.ace_editor {
	position: relative;
	overflow: hidden;
	font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas',
		'source-code-pro', monospace;
	font-size: 12px;
	line-height: normal;
	color: black;
}

.ace_scroller {
	position: absolute;
	overflow: hidden;
	top: 0;
	bottom: 0;
	background-color: inherit;
}

.ace_content {
	position: absolute;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	cursor: text;
}

.ace_gutter {
	position: absolute;
	overflow: hidden;
	width: auto;
	top: 0;
	bottom: 0;
	left: 0;
	cursor: default;
	z-index: 4;
}

.ace_gutter-active-line {
	position: absolute;
	left: 0;
	right: 0;
}

.ace_scroller.ace_scroll-left {
	box-shadow: 17px 0 16px -16px rgba(0, 0, 0, 0.4) inset;
}

.ace_gutter-cell {
	padding-left: 19px;
	padding-right: 6px;
	background-repeat: no-repeat;
}

.ace_gutter-cell.ace_error {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUM2OEZDQTQ4RTU0MTFFMUEzM0VFRTM2RUY1M0RBMjYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUM2OEZDQTU4RTU0MTFFMUEzM0VFRTM2RUY1M0RBMjYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBQzY4RkNBMjhFNTQxMUUxQTMzRUVFMzZFRjUzREEyNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBQzY4RkNBMzhFNTQxMUUxQTMzRUVFMzZFRjUzREEyNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PkgXxbAAAAJbSURBVHjapFNNaBNBFH4zs5vdZLP5sQmNpT82QY209heh1ioWisaDRcSKF0WKJ0GQnrzrxasHsR6EnlrwD0TagxJabaVEpFYxLWlLSS822tr87m66ccfd2GKyVhA6MMybgfe97/vmPUQphd0sZjto9XIn9OOsvlu2nkqRzVU+6vvlzPf8W6bk8dxQ0NPbxAALgCgg2JkaQuhzQau/El0zbmUA7U0Es8v2CiYmKQJHGO1QICCLoqilMhkmurDAyapKgqItezi/USRdJqEYY4D5jCy03ht2yMkkvL91jTTX10qzyyu2hruPRN7jgbH+EOsXcMLgYiThEgAMhABW85oqy1DXdRIdvP1AHJ2acQXvDIrVHcdQNrEKNYSVMSZGMjEzIIAwDXIo+6G/FxcGnzkC3T2oMhLjre49sBB+RRcHLqdafK6sYdE/GGBwU1VpFNj0aN8pJbe+BkZyevUrvLl6Xmm0W9IuTc0DxrDNAJd5oEvI/KRsNC3bQyNjPO9yQ1YHcfj2QvfQc/5TUhJTBc2iM0U7AWDQtc1nJHvD/cfO2s7jaGkiTEfa/Ep8coLu7zmNmh8+dc5lZDuUeFAGUNA/OY6JVaypQ0vjr7XYjUvJM37vt+j1vuTK5DgVfVUoTjVe+y3/LxMxY2GgU+CSLy4cpfsYorRXuXIOi0Vt40h67uZFTdIo6nLaZcwUJWAzwNS0tBnqqKzQDnjdG/iPyZxo46HaKUpbvYkj8qYRTZsBhge+JHhZyh0x9b95JqjVJkT084kZIPwu/mPWqPgfQ5jXh2+92Ay7HedfAgwA6KDWafb4w3cAAAAASUVORK5CYII=");
	background-repeat: no-repeat;
	background-position: 2px center;
}

.ace_gutter-cell.ace_warning {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUM2OEZDQTg4RTU0MTFFMUEzM0VFRTM2RUY1M0RBMjYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUM2OEZDQTk4RTU0MTFFMUEzM0VFRTM2RUY1M0RBMjYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBQzY4RkNBNjhFNTQxMUUxQTMzRUVFMzZFRjUzREEyNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBQzY4RkNBNzhFNTQxMUUxQTMzRUVFMzZFRjUzREEyNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pgd7PfIAAAGmSURBVHjaYvr//z8DJZiJgUIANoCRkREb9gLiSVAaQx4OQM7AAkwd7XU2/v++/rOttdYGEB9dASEvOMydGKfH8Gv/p4XTkvRBfLxeQAP+1cUhXopyvzhP7P/IoSj7g7Mw09cNKO6J1QQ0L4gICPIv/veg/8W+JdFvQNLHVsW9/nmn9zk7B+cCkDwhL7gt6knSZnx9/LuCEOcvkIAMP+cvto9nfqyZmmUAksfnBUtbM60gX/3/kgyv3/xSFOL5DZT+L8vP+Yfh5cvfPvp/xUHyQHXGyAYwgpwBjZYFT3Y1OEl/OfCH4ffv3wzc4iwMvNIsDJ+f/mH4+vIPAxsb631WW0Yln6ZpQLXdMK/DXGDflh+sIv37EivD5x//Gb7+YWT4y86sl7BCCkSD+Z++/1dkvsFRl+HnD1Rvje4F8whjMXmGj58YGf5zsDMwcnAwfPvKcml62DsQDeaDxN+/Y0qwlpEHqrdB94IRNIDUgfgfKJChGK4OikEW3gTiXUB950ASLFAF54AC94A0G9QAfOnmF9DCDzABFqS08IHYDIScdijOjQABBgC+/9awBH96jwAAAABJRU5ErkJggg==");
	background-position: 2px center;
}

.ace_gutter-cell.ace_info {
	background-image:
		url("data:image/gif;base64,R0lGODlhEAAQAMQAAAAAAEFBQVJSUl5eXmRkZGtra39/f4WFhYmJiZGRkaampry8vMPDw8zMzNXV1dzc3OTk5Orq6vDw8P///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAkAABQALAAAAAAQABAAAAUuICWOZGmeaBml5XGwFCQSBGyXRSAwtqQIiRuiwIM5BoYVbEFIyGCQoeJGrVptIQA7");
	background-position: 2px center;
}

.ace_dark .ace_gutter-cell.ace_info {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGRTk5MTVGREIxNDkxMUUxOTc5Q0FFREQyMTNGMjBFQyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGRTk5MTVGRUIxNDkxMUUxOTc5Q0FFREQyMTNGMjBFQyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZFOTkxNUZCQjE0OTExRTE5NzlDQUVERDIxM0YyMEVDIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkZFOTkxNUZDQjE0OTExRTE5NzlDQUVERDIxM0YyMEVDIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+SIDkjAAAAJ1JREFUeNpi/P//PwMlgImBQkB7A6qrq/+DMC55FkIGKCoq4pVnpFkgTp069f/+/fv/r1u37r+tre1/kg0A+ptn9uzZYLaRkRHpLvjw4cNXWVlZhufPnzOcO3eOdAO0tbVPAjHDmzdvGA4fPsxIsgGSkpJmv379Ynj37h2DjIyMCMkG3LhxQ/T27dsMampqDHZ2dq/pH41DxwCAAAMAFdc68dUsFZgAAAAASUVORK5CYII=");
}

.ace_scrollbar {
	position: absolute;
	overflow: hidden;
	overflow-y: auto;
	right: 0;
	top: 0;
	bottom: 0;
}

.ace_scrollbar-inner {
	position: absolute;
	width: 1px;
	left: 0;
}

.ace_scrollbar-h {
	position: absolute;
	overflow-x: auto;
	overflow-y: hidden;
	right: 0;
	left: 0;
	bottom: 0;
}

.ace_scrollbar-inner {
	position: absolute;
	height: 1px;
	left: 0;
}

.ace_print-margin {
	position: absolute;
	height: 100%;
}

.ace_text-input {
	position: absolute;
	z-index: 0;
	width: 0.5em;
	height: 1em;
	opacity: 0;
	background: transparent;
	-moz-appearance: none;
	appearance: none;
	border: none;
	resize: none;
	outline: none;
	overflow: hidden;
	font: inherit;
	padding: 0 1px;
	margin: 0 -1px;
}

.ace_text-input.ace_composition {
	background: #f8f8f8;
	color: #111;
	z-index: 1000;
	opacity: 1;
}

.ace_layer {
	z-index: 1;
	position: absolute;
	overflow: hidden;
	white-space: nowrap;
	height: 100%;
	width: 100%;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	/* setting pointer-events: auto; on node under the mouse, which changesduring scroll, will break mouse wheel scrolling in Safari */
	pointer-events: none;
}

.ace_gutter-layer {
	position: relative;
	width: auto;
	text-align: right;
	pointer-events: auto;
}

.ace_text-layer {
	font: inherit !important;
}

.ace_cjk {
	display: inline-block;
	text-align: center;
}

.ace_cursor-layer {
	z-index: 4;
}

.ace_cursor {
	z-index: 4;
	position: absolute;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.ace_hidden-cursors .ace_cursor {
	opacity: 0.2;
}

.ace_smooth-blinking .ace_cursor {
	-moz-transition: opacity 0.18s;
	-webkit-transition: opacity 0.18s;
	-o-transition: opacity 0.18s;
	-ms-transition: opacity 0.18s;
	transition: opacity 0.18s;
}

.ace_cursor[style*="opacity: 0"] {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
}

.ace_editor.ace_multiselect .ace_cursor {
	border-left-width: 1px;
}

.ace_line {
	white-space: nowrap;
}

.ace_marker-layer .ace_step, .ace_marker-layer .ace_stack {
	position: absolute;
	z-index: 3;
}

.ace_marker-layer .ace_selection {
	position: absolute;
	z-index: 5;
}

.ace_marker-layer .ace_bracket {
	position: absolute;
	z-index: 6;
}

.ace_marker-layer .ace_active-line {
	position: absolute;
	z-index: 2;
}

.ace_marker-layer .ace_selected-word {
	position: absolute;
	z-index: 4;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.ace_line .ace_fold {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	display: inline-block;
	height: 11px;
	margin-top: -2px;
	vertical-align: middle;
	background-image:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%11%00%00%00%09%08%06%00%00%00%D4%E8%C7%0C%00%00%03%1EiCCPICC%20Profile%00%00x%01%85T%DFk%D3P%14%FE%DAe%9D%B0%E1%8B%3Ag%11%09%3Eh%91ndStC%9C%B6kW%BA%CDZ%EA6%B7!H%9B%A6m%5C%9A%C6%24%ED~%B0%07%D9%8Bo%3A%C5w%F1%07%3E%F9%07%0C%D9%83o%7B%92%0D%C6%14a%F8%AC%88%22L%F6%22%B3%9E%9B4M'S%03%B9%F7%BB%DF%F9%EE9'%E7%E4%5E%A0%F9qZ%D3%14%2F%0F%14USO%C5%C2%FC%C4%E4%14%DF%F2%01%5E%1CC%2B%FChM%8B%86%16J%26G%40%0F%D3%B2y%EF%B3%F3%0E%1E%C6lt%EEo%DF%AB%FEc%D5%9A%95%0C%11%F0%1C%20%BE%945%C4%22%E1Y%A0i%5C%D4t%13%E0%D6%89%EF%9D15%C2%CDLsX%A7%04%09%1Fg8oc%81%E1%8C%8D%23%96f45%40%9A%09%C2%07%C5B%3AK%B8%408%98i%E0%F3%0D%D8%CE%81%14%E4'%26%A9%92.%8B%3C%ABER%2F%E5dE%B2%0C%F6%F0%1Fs%83%F2_%B0%A8%94%E9%9B%AD%E7%10%8Dm%9A%19N%D1%7C%8A%DE%1F9%7Dp%8C%E6%00%D5%C1%3F_%18%BDA%B8%9DpX6%E3%A35~B%CD%24%AE%11%26%BD%E7%EEti%98%EDe%9A%97Y)%12%25%1C%24%BCbT%AE3li%E6%0B%03%89%9A%E6%D3%ED%F4P%92%B0%9F4%BF43Y%F3%E3%EDP%95%04%EB1%C5%F5%F6KF%F4%BA%BD%D7%DB%91%93%07%E35%3E%A7)%D6%7F%40%FE%BD%F7%F5r%8A%E5y%92%F0%EB%B4%1E%8D%D5%F4%5B%92%3AV%DB%DB%E4%CD%A6%23%C3%C4wQ%3F%03HB%82%8E%1Cd(%E0%91B%0Ca%9Ac%C4%AA%F8L%16%19%22J%A4%D2itTy%B28%D6%3B(%93%96%ED%1CGx%C9_%0E%B8%5E%16%F5%5B%B2%B8%F6%E0%FB%9E%DD%25%D7%8E%BC%15%85%C5%B7%A3%D8Q%ED%B5%81%E9%BA%B2%13%9A%1B%7Fua%A5%A3n%E17%B9%E5%9B%1Bm%AB%0B%08Q%FE%8A%E5%B1H%5Ee%CAO%82Q%D7u6%E6%90S%97%FCu%0B%CF2%94%EE%25v%12X%0C%BA%AC%F0%5E%F8*l%0AO%85%17%C2%97%BF%D4%C8%CE%DE%AD%11%CB%80q%2C%3E%AB%9ES%CD%C6%EC%25%D2L%D2%EBd%B8%BF%8A%F5B%C6%18%F9%901CZ%9D%BE%24M%9C%8A9%F2%DAP%0B'%06w%82%EB%E6%E2%5C%2F%D7%07%9E%BB%CC%5D%E1%FA%B9%08%AD.r%23%8E%C2%17%F5E%7C!%F0%BE3%BE%3E_%B7o%88a%A7%DB%BE%D3d%EB%A31Z%EB%BB%D3%91%BA%A2%B1z%94%8F%DB'%F6%3D%8E%AA%13%19%B2%B1%BE%B1~V%08%2B%B4%A2cjJ%B3tO%00%03%25mN%97%F3%05%93%EF%11%84%0B%7C%88%AE-%89%8F%ABbW%90O%2B%0Ao%99%0C%5E%97%0CI%AFH%D9.%B0%3B%8F%ED%03%B6S%D6%5D%E6i_s9%F3*p%E9%1B%FD%C3%EB.7U%06%5E%19%C0%D1s.%17%A03u%E4%09%B0%7C%5E%2C%EB%15%DB%1F%3C%9E%B7%80%91%3B%DBc%AD%3Dma%BA%8B%3EV%AB%DBt.%5B%1E%01%BB%0F%AB%D5%9F%CF%AA%D5%DD%E7%E4%7F%0Bx%A3%FC%06%A9%23%0A%D6%C2%A1_2%00%00%00%09pHYs%00%00%0B%13%00%00%0B%13%01%00%9A%9C%18%00%00%00%B5IDAT(%15%A5%91%3D%0E%02!%10%85ac%E1%05%D6%CE%D6%C6%CE%D2%E8%ED%CD%DE%C0%C6%D6N.%E0V%F8%3D%9Ca%891XH%C2%BE%D9y%3F%90!%E6%9C%C3%BFk%E5%011%C6-%F5%C8N%04%DF%BD%FF%89%DFt%83DN%60%3E%F3%AB%A0%DE%1A%5Dg%BE%10Q%97%1B%40%9C%A8o%10%8F%5E%828%B4%1B%60%87%F6%02%26%85%1Ch%1E%C1%2B%5Bk%FF%86%EE%B7j%09%9A%DA%9B%ACe%A3%F9%EC%DA!9%B4%D5%A6%81%86%86%98%CC%3C%5B%40%FA%81%B3%E9%CB%23%94%C16Azo%05%D4%E1%C1%95a%3B%8A'%A0%E8%CC%17%22%85%1D%BA%00%A2%FA%DC%0A%94%D1%D1%8D%8B%3A%84%17B%C7%60%1A%25Z%FC%8D%00%00%00%00IEND%AEB%60%82"),
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%05%00%00%007%08%06%00%00%00%C4%DD%80C%00%00%03%1EiCCPICC%20Profile%00%00x%01%85T%DFk%D3P%14%FE%DAe%9D%B0%E1%8B%3Ag%11%09%3Eh%91ndStC%9C%B6kW%BA%CDZ%EA6%B7!H%9B%A6m%5C%9A%C6%24%ED~%B0%07%D9%8Bo%3A%C5w%F1%07%3E%F9%07%0C%D9%83o%7B%92%0D%C6%14a%F8%AC%88%22L%F6%22%B3%9E%9B4M'S%03%B9%F7%BB%DF%F9%EE9'%E7%E4%5E%A0%F9qZ%D3%14%2F%0F%14USO%C5%C2%FC%C4%E4%14%DF%F2%01%5E%1CC%2B%FChM%8B%86%16J%26G%40%0F%D3%B2y%EF%B3%F3%0E%1E%C6lt%EEo%DF%AB%FEc%D5%9A%95%0C%11%F0%1C%20%BE%945%C4%22%E1Y%A0i%5C%D4t%13%E0%D6%89%EF%9D15%C2%CDLsX%A7%04%09%1Fg8oc%81%E1%8C%8D%23%96f45%40%9A%09%C2%07%C5B%3AK%B8%408%98i%E0%F3%0D%D8%CE%81%14%E4'%26%A9%92.%8B%3C%ABER%2F%E5dE%B2%0C%F6%F0%1Fs%83%F2_%B0%A8%94%E9%9B%AD%E7%10%8Dm%9A%19N%D1%7C%8A%DE%1F9%7Dp%8C%E6%00%D5%C1%3F_%18%BDA%B8%9DpX6%E3%A35~B%CD%24%AE%11%26%BD%E7%EEti%98%EDe%9A%97Y)%12%25%1C%24%BCbT%AE3li%E6%0B%03%89%9A%E6%D3%ED%F4P%92%B0%9F4%BF43Y%F3%E3%EDP%95%04%EB1%C5%F5%F6KF%F4%BA%BD%D7%DB%91%93%07%E35%3E%A7)%D6%7F%40%FE%BD%F7%F5r%8A%E5y%92%F0%EB%B4%1E%8D%D5%F4%5B%92%3AV%DB%DB%E4%CD%A6%23%C3%C4wQ%3F%03HB%82%8E%1Cd(%E0%91B%0Ca%9Ac%C4%AA%F8L%16%19%22J%A4%D2itTy%B28%D6%3B(%93%96%ED%1CGx%C9_%0E%B8%5E%16%F5%5B%B2%B8%F6%E0%FB%9E%DD%25%D7%8E%BC%15%85%C5%B7%A3%D8Q%ED%B5%81%E9%BA%B2%13%9A%1B%7Fua%A5%A3n%E17%B9%E5%9B%1Bm%AB%0B%08Q%FE%8A%E5%B1H%5Ee%CAO%82Q%D7u6%E6%90S%97%FCu%0B%CF2%94%EE%25v%12X%0C%BA%AC%F0%5E%F8*l%0AO%85%17%C2%97%BF%D4%C8%CE%DE%AD%11%CB%80q%2C%3E%AB%9ES%CD%C6%EC%25%D2L%D2%EBd%B8%BF%8A%F5B%C6%18%F9%901CZ%9D%BE%24M%9C%8A9%F2%DAP%0B'%06w%82%EB%E6%E2%5C%2F%D7%07%9E%BB%CC%5D%E1%FA%B9%08%AD.r%23%8E%C2%17%F5E%7C!%F0%BE3%BE%3E_%B7o%88a%A7%DB%BE%D3d%EB%A31Z%EB%BB%D3%91%BA%A2%B1z%94%8F%DB'%F6%3D%8E%AA%13%19%B2%B1%BE%B1~V%08%2B%B4%A2cjJ%B3tO%00%03%25mN%97%F3%05%93%EF%11%84%0B%7C%88%AE-%89%8F%ABbW%90O%2B%0Ao%99%0C%5E%97%0CI%AFH%D9.%B0%3B%8F%ED%03%B6S%D6%5D%E6i_s9%F3*p%E9%1B%FD%C3%EB.7U%06%5E%19%C0%D1s.%17%A03u%E4%09%B0%7C%5E%2C%EB%15%DB%1F%3C%9E%B7%80%91%3B%DBc%AD%3Dma%BA%8B%3EV%AB%DBt.%5B%1E%01%BB%0F%AB%D5%9F%CF%AA%D5%DD%E7%E4%7F%0Bx%A3%FC%06%A9%23%0A%D6%C2%A1_2%00%00%00%09pHYs%00%00%0B%13%00%00%0B%13%01%00%9A%9C%18%00%00%00%3AIDAT8%11c%FC%FF%FF%7F%18%03%1A%60%01%F2%3F%A0%891%80%04%FF%11-%F8%17%9BJ%E2%05%B1ZD%81v%26t%E7%80%F8%A3%82h%A12%1A%20%A3%01%02%0F%01%BA%25%06%00%19%C0%0D%AEF%D5%3ES%00%00%00%00IEND%AEB%60%82");
	background-repeat: no-repeat, repeat-x;
	background-position: center center, top left;
	color: transparent;
	border: 1px solid black;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	cursor: pointer;
	pointer-events: auto;
}

.ace_dark .ace_fold {
	
}

.ace_fold:hover {
	background-image:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%11%00%00%00%09%08%06%00%00%00%D4%E8%C7%0C%00%00%03%1EiCCPICC%20Profile%00%00x%01%85T%DFk%D3P%14%FE%DAe%9D%B0%E1%8B%3Ag%11%09%3Eh%91ndStC%9C%B6kW%BA%CDZ%EA6%B7!H%9B%A6m%5C%9A%C6%24%ED~%B0%07%D9%8Bo%3A%C5w%F1%07%3E%F9%07%0C%D9%83o%7B%92%0D%C6%14a%F8%AC%88%22L%F6%22%B3%9E%9B4M'S%03%B9%F7%BB%DF%F9%EE9'%E7%E4%5E%A0%F9qZ%D3%14%2F%0F%14USO%C5%C2%FC%C4%E4%14%DF%F2%01%5E%1CC%2B%FChM%8B%86%16J%26G%40%0F%D3%B2y%EF%B3%F3%0E%1E%C6lt%EEo%DF%AB%FEc%D5%9A%95%0C%11%F0%1C%20%BE%945%C4%22%E1Y%A0i%5C%D4t%13%E0%D6%89%EF%9D15%C2%CDLsX%A7%04%09%1Fg8oc%81%E1%8C%8D%23%96f45%40%9A%09%C2%07%C5B%3AK%B8%408%98i%E0%F3%0D%D8%CE%81%14%E4'%26%A9%92.%8B%3C%ABER%2F%E5dE%B2%0C%F6%F0%1Fs%83%F2_%B0%A8%94%E9%9B%AD%E7%10%8Dm%9A%19N%D1%7C%8A%DE%1F9%7Dp%8C%E6%00%D5%C1%3F_%18%BDA%B8%9DpX6%E3%A35~B%CD%24%AE%11%26%BD%E7%EEti%98%EDe%9A%97Y)%12%25%1C%24%BCbT%AE3li%E6%0B%03%89%9A%E6%D3%ED%F4P%92%B0%9F4%BF43Y%F3%E3%EDP%95%04%EB1%C5%F5%F6KF%F4%BA%BD%D7%DB%91%93%07%E35%3E%A7)%D6%7F%40%FE%BD%F7%F5r%8A%E5y%92%F0%EB%B4%1E%8D%D5%F4%5B%92%3AV%DB%DB%E4%CD%A6%23%C3%C4wQ%3F%03HB%82%8E%1Cd(%E0%91B%0Ca%9Ac%C4%AA%F8L%16%19%22J%A4%D2itTy%B28%D6%3B(%93%96%ED%1CGx%C9_%0E%B8%5E%16%F5%5B%B2%B8%F6%E0%FB%9E%DD%25%D7%8E%BC%15%85%C5%B7%A3%D8Q%ED%B5%81%E9%BA%B2%13%9A%1B%7Fua%A5%A3n%E17%B9%E5%9B%1Bm%AB%0B%08Q%FE%8A%E5%B1H%5Ee%CAO%82Q%D7u6%E6%90S%97%FCu%0B%CF2%94%EE%25v%12X%0C%BA%AC%F0%5E%F8*l%0AO%85%17%C2%97%BF%D4%C8%CE%DE%AD%11%CB%80q%2C%3E%AB%9ES%CD%C6%EC%25%D2L%D2%EBd%B8%BF%8A%F5B%C6%18%F9%901CZ%9D%BE%24M%9C%8A9%F2%DAP%0B'%06w%82%EB%E6%E2%5C%2F%D7%07%9E%BB%CC%5D%E1%FA%B9%08%AD.r%23%8E%C2%17%F5E%7C!%F0%BE3%BE%3E_%B7o%88a%A7%DB%BE%D3d%EB%A31Z%EB%BB%D3%91%BA%A2%B1z%94%8F%DB'%F6%3D%8E%AA%13%19%B2%B1%BE%B1~V%08%2B%B4%A2cjJ%B3tO%00%03%25mN%97%F3%05%93%EF%11%84%0B%7C%88%AE-%89%8F%ABbW%90O%2B%0Ao%99%0C%5E%97%0CI%AFH%D9.%B0%3B%8F%ED%03%B6S%D6%5D%E6i_s9%F3*p%E9%1B%FD%C3%EB.7U%06%5E%19%C0%D1s.%17%A03u%E4%09%B0%7C%5E%2C%EB%15%DB%1F%3C%9E%B7%80%91%3B%DBc%AD%3Dma%BA%8B%3EV%AB%DBt.%5B%1E%01%BB%0F%AB%D5%9F%CF%AA%D5%DD%E7%E4%7F%0Bx%A3%FC%06%A9%23%0A%D6%C2%A1_2%00%00%00%09pHYs%00%00%0B%13%00%00%0B%13%01%00%9A%9C%18%00%00%00%B5IDAT(%15%A5%91%3D%0E%02!%10%85ac%E1%05%D6%CE%D6%C6%CE%D2%E8%ED%CD%DE%C0%C6%D6N.%E0V%F8%3D%9Ca%891XH%C2%BE%D9y%3F%90!%E6%9C%C3%BFk%E5%011%C6-%F5%C8N%04%DF%BD%FF%89%DFt%83DN%60%3E%F3%AB%A0%DE%1A%5Dg%BE%10Q%97%1B%40%9C%A8o%10%8F%5E%828%B4%1B%60%87%F6%02%26%85%1Ch%1E%C1%2B%5Bk%FF%86%EE%B7j%09%9A%DA%9B%ACe%A3%F9%EC%DA!9%B4%D5%A6%81%86%86%98%CC%3C%5B%40%FA%81%B3%E9%CB%23%94%C16Azo%05%D4%E1%C1%95a%3B%8A'%A0%E8%CC%17%22%85%1D%BA%00%A2%FA%DC%0A%94%D1%D1%8D%8B%3A%84%17B%C7%60%1A%25Z%FC%8D%00%00%00%00IEND%AEB%60%82"),
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%05%00%00%007%08%06%00%00%00%C4%DD%80C%00%00%03%1EiCCPICC%20Profile%00%00x%01%85T%DFk%D3P%14%FE%DAe%9D%B0%E1%8B%3Ag%11%09%3Eh%91ndStC%9C%B6kW%BA%CDZ%EA6%B7!H%9B%A6m%5C%9A%C6%24%ED~%B0%07%D9%8Bo%3A%C5w%F1%07%3E%F9%07%0C%D9%83o%7B%92%0D%C6%14a%F8%AC%88%22L%F6%22%B3%9E%9B4M'S%03%B9%F7%BB%DF%F9%EE9'%E7%E4%5E%A0%F9qZ%D3%14%2F%0F%14USO%C5%C2%FC%C4%E4%14%DF%F2%01%5E%1CC%2B%FChM%8B%86%16J%26G%40%0F%D3%B2y%EF%B3%F3%0E%1E%C6lt%EEo%DF%AB%FEc%D5%9A%95%0C%11%F0%1C%20%BE%945%C4%22%E1Y%A0i%5C%D4t%13%E0%D6%89%EF%9D15%C2%CDLsX%A7%04%09%1Fg8oc%81%E1%8C%8D%23%96f45%40%9A%09%C2%07%C5B%3AK%B8%408%98i%E0%F3%0D%D8%CE%81%14%E4'%26%A9%92.%8B%3C%ABER%2F%E5dE%B2%0C%F6%F0%1Fs%83%F2_%B0%A8%94%E9%9B%AD%E7%10%8Dm%9A%19N%D1%7C%8A%DE%1F9%7Dp%8C%E6%00%D5%C1%3F_%18%BDA%B8%9DpX6%E3%A35~B%CD%24%AE%11%26%BD%E7%EEti%98%EDe%9A%97Y)%12%25%1C%24%BCbT%AE3li%E6%0B%03%89%9A%E6%D3%ED%F4P%92%B0%9F4%BF43Y%F3%E3%EDP%95%04%EB1%C5%F5%F6KF%F4%BA%BD%D7%DB%91%93%07%E35%3E%A7)%D6%7F%40%FE%BD%F7%F5r%8A%E5y%92%F0%EB%B4%1E%8D%D5%F4%5B%92%3AV%DB%DB%E4%CD%A6%23%C3%C4wQ%3F%03HB%82%8E%1Cd(%E0%91B%0Ca%9Ac%C4%AA%F8L%16%19%22J%A4%D2itTy%B28%D6%3B(%93%96%ED%1CGx%C9_%0E%B8%5E%16%F5%5B%B2%B8%F6%E0%FB%9E%DD%25%D7%8E%BC%15%85%C5%B7%A3%D8Q%ED%B5%81%E9%BA%B2%13%9A%1B%7Fua%A5%A3n%E17%B9%E5%9B%1Bm%AB%0B%08Q%FE%8A%E5%B1H%5Ee%CAO%82Q%D7u6%E6%90S%97%FCu%0B%CF2%94%EE%25v%12X%0C%BA%AC%F0%5E%F8*l%0AO%85%17%C2%97%BF%D4%C8%CE%DE%AD%11%CB%80q%2C%3E%AB%9ES%CD%C6%EC%25%D2L%D2%EBd%B8%BF%8A%F5B%C6%18%F9%901CZ%9D%BE%24M%9C%8A9%F2%DAP%0B'%06w%82%EB%E6%E2%5C%2F%D7%07%9E%BB%CC%5D%E1%FA%B9%08%AD.r%23%8E%C2%17%F5E%7C!%F0%BE3%BE%3E_%B7o%88a%A7%DB%BE%D3d%EB%A31Z%EB%BB%D3%91%BA%A2%B1z%94%8F%DB'%F6%3D%8E%AA%13%19%B2%B1%BE%B1~V%08%2B%B4%A2cjJ%B3tO%00%03%25mN%97%F3%05%93%EF%11%84%0B%7C%88%AE-%89%8F%ABbW%90O%2B%0Ao%99%0C%5E%97%0CI%AFH%D9.%B0%3B%8F%ED%03%B6S%D6%5D%E6i_s9%F3*p%E9%1B%FD%C3%EB.7U%06%5E%19%C0%D1s.%17%A03u%E4%09%B0%7C%5E%2C%EB%15%DB%1F%3C%9E%B7%80%91%3B%DBc%AD%3Dma%BA%8B%3EV%AB%DBt.%5B%1E%01%BB%0F%AB%D5%9F%CF%AA%D5%DD%E7%E4%7F%0Bx%A3%FC%06%A9%23%0A%D6%C2%A1_2%00%00%00%09pHYs%00%00%0B%13%00%00%0B%13%01%00%9A%9C%18%00%00%003IDAT8%11c%FC%FF%FF%7F%3E%03%1A%60%01%F2%3F%A3%891%80%04%FFQ%26%F8w%C0%B43%A1%DB%0C%E2%8F%0A%A2%85%CAh%80%8C%06%08%3C%04%E8%96%18%00%A3S%0D%CD%CF%D8%C1%9D%00%00%00%00IEND%AEB%60%82");
	background-repeat: no-repeat, repeat-x;
	background-position: center center, top left;
}

.ace_editor.ace_dragging .ace_content {
	cursor: move;
}

.ace_gutter-tooltip {
	background-color: #FFF;
	background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.1));
	background-image: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.1));
	border: 1px solid gray;
	border-radius: 1px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
	color: black;
	display: inline-block;
	max-width: 500px;
	padding: 4px;
	position: fixed;
	z-index: 300;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	cursor: default;
	white-space: pre-line;
	word-wrap: break-word;
	line-height: normal;
	font-style: normal;
	font-weight: normal;
	letter-spacing: normal;
}

.ace_folding-enabled>.ace_gutter-cell {
	padding-right: 13px;
}

.ace_fold-widget {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0 -12px 0 1px;
	display: none;
	width: 11px;
	vertical-align: top;
	background-image:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%05%00%00%00%05%08%06%00%00%00%8Do%26%E5%00%00%004IDATx%DAe%8A%B1%0D%000%0C%C2%F2%2CK%96%BC%D0%8F9%81%88H%E9%D0%0E%96%C0%10%92%3E%02%80%5E%82%E4%A9*-%EEsw%C8%CC%11%EE%96w%D8%DC%E9*Eh%0C%151(%00%00%00%00IEND%AEB%60%82");
	background-repeat: no-repeat;
	background-position: center;
	border-radius: 3px;
	border: 1px solid transparent;
	cursor: pointer;
}

.ace_folding-enabled .ace_fold-widget {
	display: inline-block;
}

.ace_fold-widget.ace_end {
	background-image:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%05%00%00%00%05%08%06%00%00%00%8Do%26%E5%00%00%004IDATx%DAm%C7%C1%09%000%08C%D1%8C%ECE%C8E(%8E%EC%02)%1EZJ%F1%C1'%04%07I%E1%E5%EE%CAL%F5%A2%99%99%22%E2%D6%1FU%B5%FE0%D9x%A7%26Wz5%0E%D5%00%00%00%00IEND%AEB%60%82");
}

.ace_fold-widget.ace_closed {
	background-image:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%03%00%00%00%06%08%06%00%00%00%06%E5%24%0C%00%00%009IDATx%DA5%CA%C1%09%000%08%03%C0%AC*(%3E%04%C1%0D%BA%B1%23%A4Uh%E0%20%81%C0%CC%F8%82%81%AA%A2%AArGfr%88%08%11%11%1C%DD%7D%E0%EE%5B%F6%F6%CB%B8%05Q%2F%E9tai%D9%00%00%00%00IEND%AEB%60%82");
}

.ace_fold-widget:hover {
	border: 1px solid rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.2);
	-moz-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.7);
	-webkit-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.7);
	box-shadow: 0 1px 1px rgba(255, 255, 255, 0.7);
}

.ace_fold-widget:active {
	border: 1px solid rgba(0, 0, 0, 0.4);
	background-color: rgba(0, 0, 0, 0.05);
	-moz-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.8);
	-webkit-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 1px rgba(255, 255, 255, 0.8);
} /*** Dark version for fold widgets*/
.ace_dark .ace_fold-widget {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHklEQVQIW2P4//8/AzoGEQ7oGCaLLAhWiSwB146BAQCSTPYocqT0AAAAAElFTkSuQmCC");
}

.ace_dark .ace_fold-widget.ace_end {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAH0lEQVQIW2P4//8/AxQ7wNjIAjDMgC4AxjCVKBirIAAF0kz2rlhxpAAAAABJRU5ErkJggg==");
}

.ace_dark .ace_fold-widget.ace_closed {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAHElEQVQIW2P4//+/AxAzgDADlOOAznHAKgPWAwARji8UIDTfQQAAAABJRU5ErkJggg==");
}

.ace_dark .ace_fold-widget:hover {
	box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
	background-color: rgba(255, 255, 255, 0.1);
}

.ace_dark .ace_fold-widget:active {
	-moz-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
	-webkit-box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
	box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
}

.ace_fold-widget.ace_invalid {
	background-color: #FFB4B4;
	border-color: #DE5555;
}

.ace_fade-fold-widgets .ace_fold-widget {
	-moz-transition: opacity 0.4s ease 0.05s;
	-webkit-transition: opacity 0.4s ease 0.05s;
	-o-transition: opacity 0.4s ease 0.05s;
	-ms-transition: opacity 0.4s ease 0.05s;
	transition: opacity 0.4s ease 0.05s;
	opacity: 0;
}

.ace_fade-fold-widgets:hover .ace_fold-widget {
	-moz-transition: opacity 0.05s ease 0.05s;
	-webkit-transition: opacity 0.05s ease 0.05s;
	-o-transition: opacity 0.05s ease 0.05s;
	-ms-transition: opacity 0.05s ease 0.05s;
	transition: opacity 0.05s ease 0.05s;
	opacity: 1;
}

.ace_underline {
	text-decoration: underline;
}

.ace_bold {
	font-weight: bold;
}

.ace_nobold .ace_bold {
	font-weight: normal;
}

.ace_italic {
	font-style: italic;
}

.ace_error-marker {
	background-color: rgba(255, 0, 0, 0.2);
	position: absolute;
	z-index: 9;
}

.ace_highlight-marker {
	background-color: rgba(255, 255, 0, 0.2);
	position: absolute;
	z-index: 8;
}
</style>
<style id="ace-tm">
.ace-tm .ace_gutter {
	background: #f0f0f0;
	color: #333;
}

.ace-tm .ace_print-margin {
	width: 1px;
	background: #e8e8e8;
}

.ace-tm .ace_fold {
	background-color: #6B72E6;
}

.ace-tm {
	background-color: #FFFFFF;
}

.ace-tm .ace_cursor {
	border-left: 2px solid black;
}

.ace-tm .ace_overwrite-cursors .ace_cursor {
	border-left: 0px;
	border-bottom: 1px solid black;
}

.ace-tm .ace_invisible {
	color: rgb(191, 191, 191);
}

.ace-tm .ace_storage, .ace-tm .ace_keyword {
	color: blue;
}

.ace-tm .ace_constant {
	color: rgb(197, 6, 11);
}

.ace-tm .ace_constant.ace_buildin {
	color: rgb(88, 72, 246);
}

.ace-tm .ace_constant.ace_language {
	color: rgb(88, 92, 246);
}

.ace-tm .ace_constant.ace_library {
	color: rgb(6, 150, 14);
}

.ace-tm .ace_invalid {
	background-color: rgba(255, 0, 0, 0.1);
	color: red;
}

.ace-tm .ace_support.ace_function {
	color: rgb(60, 76, 114);
}

.ace-tm .ace_support.ace_constant {
	color: rgb(6, 150, 14);
}

.ace-tm .ace_support.ace_type, .ace-tm .ace_support.ace_class {
	color: rgb(109, 121, 222);
}

.ace-tm .ace_keyword.ace_operator {
	color: rgb(104, 118, 135);
}

.ace-tm .ace_string {
	color: rgb(3, 106, 7);
}

.ace-tm .ace_comment {
	color: rgb(76, 136, 107);
}

.ace-tm .ace_comment.ace_doc {
	color: rgb(0, 102, 255);
}

.ace-tm .ace_comment.ace_doc.ace_tag {
	color: rgb(128, 159, 191);
}

.ace-tm .ace_constant.ace_numeric {
	color: rgb(0, 0, 205);
}

.ace-tm .ace_variable {
	color: rgb(49, 132, 149);
}

.ace-tm .ace_xml-pe {
	color: rgb(104, 104, 91);
}

.ace-tm .ace_entity.ace_name.ace_function {
	color: #0000A2;
}

.ace-tm .ace_heading {
	color: rgb(12, 7, 255);
}

.ace-tm .ace_list {
	color: rgb(185, 6, 144);
}

.ace-tm .ace_meta.ace_tag {
	color: rgb(0, 22, 142);
}

.ace-tm .ace_string.ace_regex {
	color: rgb(255, 0, 0)
}

.ace-tm .ace_marker-layer .ace_selection {
	background: rgb(181, 213, 255);
}

.ace-tm.ace_multiselect .ace_selection.ace_start {
	box-shadow: 0 0 3px 0px white;
	border-radius: 2px;
}

.ace-tm .ace_marker-layer .ace_step {
	background: rgb(252, 255, 0);
}

.ace-tm .ace_marker-layer .ace_stack {
	background: rgb(164, 229, 101);
}

.ace-tm .ace_marker-layer .ace_bracket {
	margin: -1px 0 0 -1px;
	border: 1px solid rgb(192, 192, 192);
}

.ace-tm .ace_marker-layer .ace_active-line {
	background: rgba(0, 0, 0, 0.07);
}

.ace-tm .ace_gutter-active-line {
	background-color: #dcdcdc;
}

.ace-tm .ace_marker-layer .ace_selected-word {
	background: rgb(250, 250, 255);
	border: 1px solid rgb(200, 200, 250);
}

.ace-tm .ace_indent-guide {
	background:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAACCAYAAACZgbYnAAAAE0lEQVQImWP4////f4bLly//BwAmVgd1/w11/gAAAABJRU5ErkJggg==")
		right repeat-y;
}
</style>
<script type="text/javascript" src="script/common-cookie-helper.js"></script>
<script type="text/javascript" src="script/custom-common.js"></script>
<!-- end of rzeczy przeniesione tymczasowo z bundle -->

<style type="text/css">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reposition {
	overflow: hidden;
	position: relative
}

.fb_invisible {
	display: none
}

.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 11px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}

.fb_reset>div {
	overflow: hidden
}

.fb_link img {
	border: none
}

@
keyframes fb_transform {
	from {opacity: 0;
	transform: scale(.95)
}

to {
	opacity: 1;
	transform: scale(1)
}

}
.fb_animate {
	animation: fb_transform .3s forwards
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reset .fb_dialog_legacy {
	overflow: visible
}

.fb_dialog_advanced {
	padding: 10px;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px
}

.fb_dialog_content {
	background: #fff;
	color: #333
}

.fb_dialog_close_icon {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yL/r/s816eWC-2sl.gif);
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}

.fb_dialog_mobile .fb_dialog_close_icon {
	top: 5px;
	left: 5px;
	right: auto
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_loader {
	background-color: #f6f7f9;
	border: 1px solid #606060;
	font-size: 24px;
	padding: 20px
}

.fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left,
	.fb_dialog_bottom_right {
	height: 10px;
	width: 10px;
	overflow: hidden;
	position: absolute
}

.fb_dialog_top_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -30px;
	right: -10px;
	bottom: -10px
}

.fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top,
	.fb_dialog_horiz_bottom {
	position: absolute;
	background: #525252;
	filter: alpha(opacity = 70);
	opacity: .7
}

.fb_dialog_vert_left, .fb_dialog_vert_right {
	width: 10px;
	height: 100%
}

.fb_dialog_vert_left {
	margin-left: -10px
}

.fb_dialog_vert_right {
	right: 0;
	margin-right: -10px
}

.fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
	width: 100%;
	height: 10px
}

.fb_dialog_horiz_top {
	margin-top: -10px
}

.fb_dialog_horiz_bottom {
	bottom: 0;
	margin-bottom: -10px
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #365899;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	-webkit-transform: none;
	height: 100%;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	left: 0;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	width: auto;
	height: auto;
	min-height: initial;
	min-width: initial;
	background: none
}

.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}

.loading.centered #fb_dialog_loader_close {
	color: #fff;
	display: block;
	padding-top: 20px;
	clear: both;
	font-size: 18px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .45);
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	width: 100%;
	min-height: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_content .dialog_header {
	-webkit-box-shadow: white 0 1px 1px -1px inset;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA),
		to(#2C4987));
	border-bottom: 1px solid;
	border-color: #1d4088;
	color: #fff;
	font: 14px Helvetica, sans-serif;
	font-weight: bold;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}

.fb_dialog_content .dialog_header table {
	-webkit-font-smoothing: subpixel-antialiased;
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 12px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 12px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6),
		color-stop(.5, #355492), to(#2A4887));
	border: 1px solid #29487d;
	-webkit-background-clip: padding-box;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: rgba(0, 0, 0, .117188) 0 1px 1px inset,
		rgba(255, 255, 255, .167969) 0 1px 0;
	display: inline-block;
	margin-top: 3px;
	max-width: 85px;
	line-height: 18px;
	padding: 4px 12px;
	position: relative
}

.fb_dialog_content .dialog_header .touchable_button input {
	border: none;
	background: none;
	color: #fff;
	font: 12px Helvetica, sans-serif;
	font-weight: bold;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #555;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f6f7f9;
	border: 1px solid #555;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
	background-repeat: no-repeat;
	background-position: 50% 50%;
	height: 24px;
	width: 24px
}

@
keyframes rotateSpinner { 0%{
	transform: rotate(0deg)
}

100%{
transform







:rotate(360deg)








}
}
.fb_iframe_widget {
	display: inline-block;
	position: relative
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_hide_iframes iframe {
	position: relative;
	left: -10000px
}

.fb_iframe_widget_loader {
	position: relative;
	display: inline-block
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_iframe_widget_loader iframe {
	min-height: 32px;
	z-index: 2;
	zoom: 1
}

.fb_iframe_widget_loader .FB_Loader {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}
</style>
<style type="text/css">
#code_position {
	margin: 0;
	margin-left: 20px;
	margin-right: 20px;
	width: 100%;
}

.code-panel {
	display: inline-block;
}

#java_container {
	position: relative;
}

#csharp_container {
	position: absolute;
}

input, textarea, .uneditable-input {
    width: 500px;

</style>
</head>
<body class="home  not-responsive">




	<div id="outer_container" style="background-color: gray; width: 530px;">

		<div id="customScrollBox">
			<div class="container" style="width: 500px">
				<div class="contents">
					<h1 align="center" style="color: black">
						정답<br />
					</h1>

					<script type="text/javascript">
					window.onload = function(){
						var output = '${question.solution}';
						var d1 = document.getElementById('test');
						d1.innerHTML = output;
					}
					</script>
					<br/>
					<s:textarea id="test" cols="100" rows="45" readonly="readonly"></s:textarea>					

					<img src="images/hide.png" id="arrow" style="position: absolute; left: 86%; top: 60%; "> 
				</div>
			</div>
		</div>
	</div>

	<div id="bg">
		<div id="tag"></div>
		<div id="middle" style="position: relative; left: 50px">


			<div class="navbar " id="primary-navigation"
				style="position: relative; left: 20px">
				<div class="navbar-inner">

					<div class="container" style="margin-left: 0;">
						<a class="btn btn-navbar collapsed" data-toggle="collapse"
							data-target=".nav-collapse"> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
						</a> <a href="/" class="brand scroll-page"><span
							style="background-image: url('images/Logomakr_1yE4r7.png');"></span></a>
						<div class="nav-collapse collapse " style="height: 0px;">
							<ul class="nav pull-right" style="margin-right: -400px">
								<li class="active"><a href="/" class="scroll-page"><i
										class="icon-home"></i>new code</a></li>
								<li class=""><a href="/samples" class="scroll-page"><i
										class="icon-lightbulb"></i> samples</a></li>
								<li class=""><a href="/recent" class="scroll-page"><i
										class="icon-cloud"></i> recent codes</a></li>
								<li class="dropdown"><a href="#"
									class="dropdown-toggle btn-singin-wnd-open"
									data-toggle="dropdown"><i class="icon-signin"></i> sign in</a>
									<ul class="dropdown-menu dropdown-form" id="signin-dropdown">
										<li class="dropdown-caret right"><span
											class="caret-outer"></span> <span class="caret-inner"></span></li>
										<li>
											<div class="modal-body">
												<form action="http://ideone.com/account/login" method="post">
													<div style="margin-bottom: 20px;">
														New user? <a class="normal-link" href="/account/register">Sign
															up</a>
													</div>

													<div class="control-group">
														<div class="controls">
															<div class="input-prepend" style="margin-bottom: 0px">
																<span class="add-on rel-tooltip" title="Username"><i
																	class="icon-user"></i></span> <input type="text" class="span2"
																	id="username" name="username" value=""
																	placeholder="Username">
															</div>
														</div>
													</div>

													<div class="control-group" style="margin-bottom: 0px">
														<div class="controls">
															<div class="input-prepend">
																<span class="add-on rel-tooltip" title="Password"><i
																	class="icon-key"></i></span> <input type="password"
																	class="span2" id="password" name="password" value=""
																	placeholder="Password">
															</div>
														</div>
													</div>

													<input type="hidden" name="remember" value="yes"> <input
														type="hidden" name="next" value="Lw==">

													<div class="control-group">
														<div class="controls">
															<button type="submit" class="btn">
																<i class="icon-signin"></i> Sign in
															</button>
														</div>
													</div>

													<div>
														<a class="normal-link" href="/account/forgot">Can't
															sign in?</a>
													</div>

													<hr class="clear" style="margin: 0px; margin-bottom: 10px">
													<a class="btn facebook-login-button"
														href="https://www.facebook.com/dialog/oauth?client_id=347515280067&amp;redirect_uri=http://ideone.com/account/registerfb/&amp;scope=email,user_location,user_hometown">Log
														in with Facebook</a>
												</form>
											</div>
										</li>
									</ul></li>

								<li class=" dropdown-hover"></li>

							</ul>
						</div>
						<!-- /.nav-collapse -->
					</div>
					<!-- /.container -->
				</div>
				<!-- /.navbar-inner -->
			</div>
			<div class="container">
				<div class="item">
					<div id="result"></div>
					<p>
						<s:property value="question.qno" />
						<s:property value="question.title" />
						<s:property value="question.lv" />
					</p>

					<p>
						<s:property value="question.content" />
					</p>
					<img src="img/question/<s:property value='qno'/>.PNG" />
				</div>
			</div>
			<section class="project-carousel">
				<div class="container" id="code_position">
					<div class="row">
						<div class="span12 home-main-box">
							<div id="featured-project-carousel" class="carousel slide">
								<div class="carousel-inner overflow-visible">
									<div class="item active">
										<div class="row">
											<div id="java_container" class="span8 code-panel">
												<div class="header">
													<i class="icon-code"></i> enter your source code <span
														id="insert-part-or" style="display: inline">or</span> <span
														id="insert-part-insert" style="display: inline">insert</span>
													<span id="insert-part-template" style="display: inline"><a
														id="insert-template-link" href="#" class="rel-tooltip"
														title="Insert template">template</a></span> <span
														id="insert-part-or2" style="display: inline">or</span> <span
														id="insert-part-sample" style="display: inline"><a
														id="insert-sample-link" href="#" class="rel-tooltip"
														title="Insert sample program">sample</a></span> <span
														id="insert-part-or3" style="display: inline">or</span> <span
														id="insert-part-users-template" style="display: inline"><a
														id="insert-users-template-link" href="#"
														class="rel-tooltip" title="Insert your template">your
															template</a></span> <img id="insert-loader"
														style="display: none; height: 11px"
														src="//stx1.ideone.com/gfx/loader.gif" alt="loading...">
													<div class="pull-right option-clear">
														<a href="#" class="rel-tooltip with-margin-right"
															title="Clear the editor"
															onclick="clearEditor(); return false;">clear</a>
													</div>
													<div class="clearfix"></div>
												</div>

												<!-- editor + ad -->
												<div id="class1" class="classEditor"
													style="border-bottom: 1px solid #ececec;">
													<div id="file_div1" class=" ace_editor ace-tm"
														style="height: 320px; display: block;">
														<textarea class="ace_text-input" wrap="off"
															autocapitalize="off" spellcheck="false"
															style="bottom: 305.6px; height: 14.4px; width: 6.6px; right: 712.4px;"></textarea>
														<div class="ace_gutter">
															<div
																class="ace_layer ace_gutter-layer ace_folding-enabled"
																style="margin-top: 0px; height: 348.8px; width: 47px;">
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	1<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">2</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">3</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">4</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">5</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">6</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	7<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">8</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	9<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">10</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	11<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">12</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">13</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">14</div>
															</div>
															<div class="ace_gutter-active-line"
																style="top: 0px; height: 14.4px;"></div>
														</div>
														<div class="ace_scroller"
															style="left: 47px; right: 0px; bottom: 0px;">
															<div class="ace_content"
																style="margin-top: 0px; width: 723px; height: 348.8px; margin-left: 0px;">
																<div class="ace_layer ace_print-margin-layer">
																	<div class="ace_print-margin"
																		style="left: 532px; visibility: visible;"></div>
																</div>
																<div class="ace_layer ace_marker-layer">
																	<div class="ace_active-line"
																		style="height: 14.40000057220459px; top: 0px; left: 0; right: 0;"></div>
																</div>
																<div class="ace_layer ace_text-layer"
																	style="padding: 0px 4px;">
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_comment">/*&nbsp;package&nbsp;whatever;&nbsp;//&nbsp;don't&nbsp;place&nbsp;package&nbsp;name!&nbsp;*/</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px"></div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">util</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">lang</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">io</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px"></div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_comment">/*&nbsp;Name&nbsp;of&nbsp;the&nbsp;class&nbsp;has&nbsp;to&nbsp;be&nbsp;"Main"&nbsp;only&nbsp;if&nbsp;the&nbsp;class&nbsp;is&nbsp;public.&nbsp;*/</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">class</span>&nbsp;<span
																			class="ace_identifier">Ideone</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">{</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_keyword">public</span>&nbsp;<span
																			class="ace_keyword">static</span>&nbsp;<span
																			class="ace_keyword">void</span>&nbsp;<span
																			class="ace_identifier">main</span>&nbsp;(<span
																			class="ace_support ace_function">String</span>[]&nbsp;<span
																			class="ace_identifier">args</span>)&nbsp;<span
																			class="ace_keyword">throws</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">lang</span>.<span
																			class="ace_support ace_function">Exception</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;{</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_indent-guide">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
																			class="ace_comment">//&nbsp;your&nbsp;code&nbsp;goes&nbsp;here</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;}</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">}</div>
																</div>
																<div class="ace_layer ace_marker-layer"></div>
																<div
																	class="ace_layer ace_cursor-layer ace_hidden-cursors">
																	<div class="ace_cursor"
																		style="left: 4px; top: 0px; width: 6.6px; height: 14.4px;"></div>
																</div>
															</div>
														</div>
														<div
															style="height: auto; width: auto; top: -100px; left: -100px; visibility: hidden; position: fixed; overflow: visible; white-space: nowrap;">X</div>
														<div class="ace_scrollbar"
															style="width: 26px; display: none; overflow-y: scroll; bottom: 0px;">
															<div class="ace_scrollbar-inner" style="height: 201.6px;"></div>
														</div>
														<div class="ace_scrollbar-h"
															style="height: 26px; display: none; overflow-x: scroll; left: 47px; right: 0px;">
															<div class="ace_scrollbar-inner" style="width: 723px;"></div>
														</div>
													</div>
													<div id="file_parent1"
														style="padding: 10px; display: none;">
														<textarea name="file" id="file1" tabindex="1">/* package whatever; // don't place package name! */
import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class Test
{
	public static void main (String[] args)
	{
		// your code goes here
	}
}</textarea>
													</div>
												</div>
												<input type="hidden" id="file_template1"
													value="/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be &quot;Main&quot; only if the class is public. */
class Ideone
{
	public static void main (String[] args) throws java.lang.Exception
	{
		// your code goes here
	}
}">
												<div id="class2" class="classEditor"
													style="border-bottom: 1px solid #ececec; display: none;">
													<div id="file_div3" class=" ace_editor ace-tm"
														style="height: 320px; display: block;">
														<textarea class="ace_text-input" wrap="off"
															autocapitalize="off" spellcheck="false"
															style="bottom: 305.6px; height: 14.4px; width: 6.6px; right: 712.4px;"></textarea>
														<div class="ace_gutter">
															<div
																class="ace_layer ace_gutter-layer ace_folding-enabled"
																style="margin-top: 0px; height: 348.8px; width: 47px;">
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	1<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">2</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">3</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">4</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">5</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">6</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	7<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">8</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	9<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">10</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	11<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">12</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">13</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">14</div>
															</div>
															<div class="ace_gutter-active-line"
																style="top: 0px; height: 14.4px;"></div>
														</div>
														<div class="ace_scroller"
															style="left: 47px; right: 0px; bottom: 0px;">
															<div class="ace_content"
																style="margin-top: 0px; width: 723px; height: 348.8px; margin-left: 0px;">
																<div class="ace_layer ace_print-margin-layer">
																	<div class="ace_print-margin"
																		style="left: 532px; visibility: visible;"></div>
																</div>
																<div class="ace_layer ace_marker-layer">
																	<div class="ace_active-line"
																		style="height: 14.40000057220459px; top: 0px; left: 0; right: 0;"></div>
																</div>
																<div class="ace_layer ace_text-layer"
																	style="padding: 0px 4px;">
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_comment">/*&nbsp;package&nbsp;whatever;&nbsp;//&nbsp;don't&nbsp;place&nbsp;package&nbsp;name!&nbsp;*/</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px"></div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">util</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">lang</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">import</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">io</span>.<span
																			class="ace_keyword ace_operator">*</span>;
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px"></div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_comment">/*&nbsp;Name&nbsp;of&nbsp;the&nbsp;class&nbsp;has&nbsp;to&nbsp;be&nbsp;"Main"&nbsp;only&nbsp;if&nbsp;the&nbsp;class&nbsp;is&nbsp;public.&nbsp;*/</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">class</span>&nbsp;<span
																			class="ace_identifier">Ideone</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">{</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_keyword">public</span>&nbsp;<span
																			class="ace_keyword">static</span>&nbsp;<span
																			class="ace_keyword">void</span>&nbsp;<span
																			class="ace_identifier">main</span>&nbsp;(<span
																			class="ace_support ace_function">String</span>[]&nbsp;<span
																			class="ace_identifier">args</span>)&nbsp;<span
																			class="ace_keyword">throws</span>&nbsp;<span
																			class="ace_identifier">java</span>.<span
																			class="ace_identifier">lang</span>.<span
																			class="ace_support ace_function">Exception</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;{</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_indent-guide">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
																			class="ace_comment">//&nbsp;your&nbsp;code&nbsp;goes&nbsp;here</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;}</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">}</div>
																</div>
																<div class="ace_layer ace_marker-layer"></div>
																<div
																	class="ace_layer ace_cursor-layer ace_hidden-cursors">
																	<div class="ace_cursor"
																		style="left: 4px; top: 0px; width: 6.6px; height: 14.4px;"></div>
																</div>
															</div>
														</div>
														<div
															style="height: auto; width: auto; top: -100px; left: -100px; visibility: hidden; position: fixed; overflow: visible; white-space: nowrap;">X</div>
														<div class="ace_scrollbar"
															style="width: 26px; display: none; overflow-y: scroll; bottom: 0px;">
															<div class="ace_scrollbar-inner" style="height: 201.6px;"></div>
														</div>
														<div class="ace_scrollbar-h"
															style="height: 26px; display: none; overflow-x: scroll; left: 47px; right: 0px;">
															<div class="ace_scrollbar-inner" style="width: 723px;"></div>
														</div>
													</div>
													<div id="file_parent3"
														style="padding: 10px; display: none;">
														<textarea name="file" id="file3" tabindex="1">/* package whatever; // don't place package name! */
import java.util.*;
import java.lang.*;
import java.io.*;

</textarea>
													</div>
												</div>
												<input type="hidden" id="file_template3"
													value="/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be &quot;Main&quot; only if the class is public. */
class Ideone
{
	public static void main (String[] args) throws java.lang.Exception
	{
		// your code goes here
	}
}">

												<!-- advanced config: input -->
												<div class="row visible" id="ex-input">
													<div class="span8">
														<div class="ex-more-options-box"
															style="padding: 10px; padding-top: 6px; color: #666">
															<div style="margin-bottom: 5px">
																<i class="icon-inbox"></i> enter input (stdin)
																<div class="pull-right option-clear">
																	<a href="#" class="rel-tooltip" title="Clear the input"
																		onclick="$('#input').val(''); return false;">clear</a>
																</div>
																<div class="clearfix"></div>
															</div>
															<textarea name="input" id="input1" rows="2" cols="80"></textarea>
														</div>
													</div>
												</div>

												<!-- advanced config: more options -->
												<div class="row visible" id="ex-more-options">
													<div class="span8">
														<!--
							<div class="row">
								<div class="span8 top-border">
								</div>
							</div>
							-->
														<div class="row">
															<div class="span8">
																<div class="ex-more-options-box"
																	style="padding-bottom: 0px; padding-top: 6px">
																	<!-- syntax -->
																	<div class="syntax-box" style="display: none;">
																		<input type="hidden" name="syntax" value="0">
																		<label for="syntax" class="checkbox"><input
																			type="checkbox" name="syntax" id="syntax1" value="1"
																			checked="checked"> <span>syntax
																				highlight</span></label>
																	</div>

																	<div class="timelimit-box" style="display: none">
																		<i class="icon-time"></i> time limit: <label
																			for="timelimit-0"><input type="radio"
																			name="timelimit" value="0" id="timelimit-0"
																			checked="checked"> <span>5s</span></label> <label
																			for="timelimit-1"><input type="radio"
																			name="timelimit" value="1" id="timelimit-1"
																			disabled="disabled"> <span>15s</span></label> <a
																			href="/faq#constraints" class="help-link rel-tooltip"
																			target="_blank" title="What's the time limit?"
																			style="margin-left: 2px"><i
																			class="icon-help-circled"></i></a>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="span8">
																<div class="ex-more-options-box"
																	style="padding-top: 4px">
																	<!-- note -->
																	<div style="margin-bottom: 5px">
																		<i class="icon-pencil"></i> &nbsp;&nbsp;Output
																		<!-- <div class="pull-right option-clear">
										<a href="#" class="rel-tooltip" title="Clear the note"
											onclick="$('#note1').val(''); return false;">clear</a>
									</div> -->
																		<div class="clearfix"></div>
																	</div>
																	<div class="ex-more-options-box"
																		style="padding: 10px; padding-top: 6px; color: #666">
																		<textarea id="output1" rows="2" cols="80"
																			readonly="readonly"></textarea>
																	</div>
																</div>
																<div class="ex-more-options-box"
																	style="padding-top: 4px; display: none;">
																	<!-- note -->
																	<div style="margin-bottom: 5px">
																		<i class="icon-pencil"></i> enter your note
																		<div class="pull-right option-clear">
																			<a href="#" class="rel-tooltip"
																				title="Clear the note"
																				onclick="$('#note').val(''); return false;">clear</a>
																		</div>
																		<div class="clearfix"></div>
																	</div>
																	<textarea name="note" id="note" rows="2" cols="80"></textarea>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="g"
													style="text-align: center; height: 90px; display: none;">


													<!--<script type="text/javascript" src="//ap.lijit.com/www/delivery/fpi.js?z=357751&u=sphere-research&width=728&height=90"></script>-->

													<!-- ideone_main_728x90_center -->
													<ins class="adsbygoogle"
														style="display: inline-block; width: 728px; height: 90px"
														data-ad-client="ca-pub-4453360425583535"
														data-ad-slot="4445601430"></ins>
													<script>
														(adsbygoogle = window.adsbygoogle
																|| []).push({});
													</script>


												</div>

												<!-- visible options + submit -->
												<div class="row">
													<div class="span8">
														<div class="footer">
															<!-- lang -->
															<input type="hidden" name="_lang" id="_lang1" value="10">

															<!-- simple lang select -->

															<!-- advanced lang select -->
															<div class="dropdown dropup" id="lang_advselect"
																style="display: none;">
																<a class="dropdown-toggle btn footer-item rel-tooltip"
																	data-toggle="dropdown" href="#" title="Choose language"
																	id="lang-dropdown-menu-button"><span>Java</span> <b
																	class="caret"></b></a>
																<div id="lang-dropdown-menu" class="dropdown-menu"
																	role="menu" aria-labelledby="lang-dropdown-menu-button">
																	<div id="language-details"></div>
																	<div class="clearfix"></div>
																	<div class="popular-box">
																		<legend>popular</legend>
																		<ul class="popular">
																			<li class=""><a href="#" id="menu-lang-28"
																				data-id="28" data-label="Bash"
																				title="Bash (bash 4.3.33)" class="lang "
																				tabindex="1000">Bash</a></li>
																			<li class=""><a href="#" id="menu-lang-22"
																				data-id="22" data-label="Pascal (fpc)"
																				title="Pascal (fpc) (fpc 2.6.4)" class="lang "
																				tabindex="1009">Pascal (fpc)</a></li>
																			<li class=""><a href="#" id="menu-lang-11"
																				data-id="11" data-label="C" title="C (gcc-5.1)"
																				class="lang " tabindex="1001">C</a></li>
																			<li class=""><a href="#" id="menu-lang-2"
																				data-id="2" data-label="Pascal (gpc)"
																				title="Pascal (gpc) (gpc 20070904)" class="lang "
																				tabindex="1010">Pascal (gpc)</a></li>
																			<li class=""><a href="#" id="menu-lang-27"
																				data-id="27" data-label="C#" title="C# (mono-4.0.2)"
																				class="lang " tabindex="1002">C#</a></li>
																			<li class=""><a href="#" id="menu-lang-3"
																				data-id="3" data-label="Perl"
																				title="Perl (perl 5.20.1)" class="lang "
																				tabindex="1011">Perl</a></li>
																			<li class=""><a href="#" id="menu-lang-1"
																				data-id="1" data-label="C++ 5.1"
																				title="C++ 5.1 (gcc-5.1)" class="lang "
																				tabindex="1003">C++ 5.1</a></li>
																			<li class=""><a href="#" id="menu-lang-29"
																				data-id="29" data-label="PHP"
																				title="PHP (php 5.6.4)" class="lang "
																				tabindex="1012">PHP</a></li>
																			<li class=""><a href="#" id="menu-lang-44"
																				data-id="44" data-label="C++14"
																				title="C++14 (gcc-5.1)" class="lang "
																				tabindex="1004">C++14</a></li>
																			<li class=""><a href="#" id="menu-lang-4"
																				data-id="4" data-label="Python"
																				title="Python (python 2.7.10)" class="lang "
																				tabindex="1013">Python</a></li>
																			<li class=""><a href="#" id="menu-lang-21"
																				data-id="21" data-label="Haskell"
																				title="Haskell (ghc-7.8)" class="lang "
																				tabindex="1005">Haskell</a></li>
																			<li class=""><a href="#" id="menu-lang-116"
																				data-id="116" data-label="Python 3"
																				title="Python 3 (python-3.4)" class="lang "
																				tabindex="1014">Python 3</a></li>
																			<li class="active"><a href="#" id="menu-lang-10"
																				data-id="10" data-label="Java"
																				title="Java (sun-jdk-8u51)" class="lang "
																				tabindex="1006">Java</a></li>
																			<li class=""><a href="#" id="menu-lang-17"
																				data-id="17" data-label="Ruby"
																				title="Ruby (ruby-2.1)" class="lang "
																				tabindex="1015">Ruby</a></li>
																			<li class=""><a href="#" id="menu-lang-55"
																				data-id="55" data-label="Java7"
																				title="Java7 (sun-jdk-1.7.0_10)" class="lang "
																				tabindex="1007">Java7</a></li>
																			<li class=""><a href="#" id="menu-lang-40"
																				data-id="40" data-label="SQL"
																				title="SQL (sqlite3-3.8.7)" class="lang "
																				tabindex="1016">SQL</a></li>
																			<li class=""><a href="#" id="menu-lang-43"
																				data-id="43" data-label="Objective-C"
																				title="Objective-C (gcc-5.1)" class="lang "
																				tabindex="1008">Objective-C</a></li>
																			<li class=""><a href="#" id="menu-lang-101"
																				data-id="101" data-label="VB.NET"
																				title="VB.NET (mono-3.10)" class="lang "
																				tabindex="1017">VB.NET</a></li>
																		</ul>
																	</div>
																	<div class="rest-box">
																		<legend>others</legend>
																		<ul class="rest">
																			<li class=""><a href="#" id="menu-lang-7"
																				data-id="7" data-label="Ada" title="Ada (gnat-5.1)"
																				class="lang " tabindex="1018">Ada</a></li>
																			<li class=""><a href="#" id="menu-lang-91"
																				data-id="91" data-label="CoffeeScript"
																				title="CoffeeScript (1.9.3)" class="lang "
																				tabindex="1033">CoffeeScript</a></li>
																			<li class=""><a href="#" id="menu-lang-16"
																				data-id="16" data-label="Icon"
																				title="Icon (iconc 9.4.3)" class="lang "
																				tabindex="1048">Icon</a></li>
																			<li class=""><a href="#" id="menu-lang-19"
																				data-id="19" data-label="Pike"
																				title="Pike (pike 7.8)" class="lang "
																				tabindex="1063">Pike</a></li>
																			<li class=""><a href="#" id="menu-lang-45"
																				data-id="45" data-label="Assembler"
																				title="Assembler (gcc-5.1)" class="lang "
																				tabindex="1019">Assembler</a></li>
																			<li class=""><a href="#" id="menu-lang-32"
																				data-id="32" data-label="Common Lisp (clisp)"
																				title="Common Lisp (clisp) (clisp 2.49)"
																				class="lang " tabindex="1034">Common Lisp
																					(clisp)</a></li>
																			<li class=""><a href="#" id="menu-lang-9"
																				data-id="9" data-label="Intercal"
																				title="Intercal (c-intercal 28.0-r1)" class="lang "
																				tabindex="1049">Intercal</a></li>
																			<li class=""><a href="#" id="menu-lang-108"
																				data-id="108" data-label="Prolog (gnu)"
																				title="Prolog (gnu) (gprolog-1.3.1)" class="lang "
																				tabindex="1064">Prolog (gnu)</a></li>
																			<li class=""><a href="#" id="menu-lang-13"
																				data-id="13" data-label="Assembler"
																				title="Assembler (nasm-2.11.05)" class="lang "
																				tabindex="1020">Assembler</a></li>
																			<li class=""><a href="#" id="menu-lang-84"
																				data-id="84" data-label="D" title="D (ldc 0.14)"
																				class="lang " tabindex="1035">D</a></li>
																			<li class=""><a href="#" id="menu-lang-35"
																				data-id="35" data-label="JavaScript (rhino)"
																				title="JavaScript (rhino) (rhino-1.7.7)"
																				class="lang " tabindex="1050">JavaScript (rhino)</a></li>
																			<li class=""><a href="#" id="menu-lang-15"
																				data-id="15" data-label="Prolog (swi)"
																				title="Prolog (swi) (swipl 5.6.64)" class="lang "
																				tabindex="1065">Prolog (swi)</a></li>
																			<li class=""><a href="#" id="menu-lang-104"
																				data-id="104" data-label="AWK (gawk)"
																				title="AWK (gawk) (gawk-4.1.1)" class="lang "
																				tabindex="1021">AWK (gawk)</a></li>
																			<li class=""><a href="#" id="menu-lang-20"
																				data-id="20" data-label="D" title="D (gdc 5.1)"
																				class="lang " tabindex="1036">D</a></li>
																			<li class=""><a href="#" id="menu-lang-112"
																				data-id="112" data-label="JavaScript (spidermonkey)"
																				title="JavaScript (spidermonkey) (spidermonkey 24.2)"
																				class="lang " tabindex="1051">JavaScript
																					(spidermonkey)</a></li>
																			<li class=""><a href="#" id="menu-lang-99"
																				data-id="99" data-label="Python (Pypy)"
																				title="Python (Pypy) (Pypy)" class="lang "
																				tabindex="1066">Python (Pypy)</a></li>
																			<li class=""><a href="#" id="menu-lang-105"
																				data-id="105" data-label="AWK (mawk)"
																				title="AWK (mawk) (mawk-3.3)" class="lang "
																				tabindex="1022">AWK (mawk)</a></li>
																			<li class=""><a href="#" id="menu-lang-102"
																				data-id="102" data-label="D (dmd)"
																				title="D (dmd) (dmd-2.067.1)" class="lang "
																				tabindex="1037">D (dmd)</a></li>
																			<li class=""><a href="#" id="menu-lang-26"
																				data-id="26" data-label="Lua" title="Lua (luac 5.2)"
																				class="lang " tabindex="1052">Lua</a></li>
																			<li class=""><a href="#" id="menu-lang-117"
																				data-id="117" data-label="R" title="R (R-2.11.1)"
																				class="lang " tabindex="1067">R</a></li>
																			<li class=""><a href="#" id="menu-lang-110"
																				data-id="110" data-label="bc"
																				title="bc (bc-1.06.95)" class="lang "
																				tabindex="1023">bc</a></li>
																			<li class=""><a href="#" id="menu-lang-96"
																				data-id="96" data-label="Elixir"
																				title="Elixir (1.1.0)" class="lang " tabindex="1038">Elixir</a>
																			</li>
																			<li class=""><a href="#" id="menu-lang-30"
																				data-id="30" data-label="Nemerle"
																				title="Nemerle (ncc 0.9.3)" class="lang "
																				tabindex="1053">Nemerle</a></li>
																			<li class=""><a href="#" id="menu-lang-93"
																				data-id="93" data-label="Rust" title="Rust (1.0.0)"
																				class="lang " tabindex="1068">Rust</a></li>
																			<li class=""><a href="#" id="menu-lang-12"
																				data-id="12" data-label="Brainf**k"
																				title="Brainf**k (bff-1.0.5)" class="lang "
																				tabindex="1024">Brainf**k</a></li>
																			<li class=""><a href="#" id="menu-lang-36"
																				data-id="36" data-label="Erlang"
																				title="Erlang (erl-18)" class="lang "
																				tabindex="1039">Erlang</a></li>
																			<li class=""><a href="#" id="menu-lang-25"
																				data-id="25" data-label="Nice"
																				title="Nice (nicec 0.9.6)" class="lang "
																				tabindex="1054">Nice</a></li>
																			<li class=""><a href="#" id="menu-lang-39"
																				data-id="39" data-label="Scala"
																				title="Scala (scala-2.11.7)" class="lang "
																				tabindex="1069">Scala</a></li>
																			<li class=""><a href="#" id="menu-lang-81"
																				data-id="81" data-label="C" title="C (clang 3.7)"
																				class="lang " tabindex="1025">C</a></li>
																			<li class=""><a href="#" id="menu-lang-124"
																				data-id="124" data-label="F#"
																				title="F# (fsharp-3.1)" class="lang "
																				tabindex="1040">F#</a></li>
																			<li class=""><a href="#" id="menu-lang-122"
																				data-id="122" data-label="Nim" title="Nim (0.11.2)"
																				class="lang " tabindex="1055">Nim</a></li>
																			<li class=""><a href="#" id="menu-lang-97"
																				data-id="97" data-label="Scheme (chicken)"
																				title="Scheme (chicken) (4.9)" class="lang "
																				tabindex="1070">Scheme (chicken)</a></li>
																			<li class=""><a href="#" id="menu-lang-82"
																				data-id="82" data-label="C++"
																				title="C++ (clang 3.7)" class="lang "
																				tabindex="1026">C++</a></li>
																			<li class=""><a href="#" id="menu-lang-123"
																				data-id="123" data-label="Factor"
																				title="Factor (factor-0.93)" class="lang "
																				tabindex="1041">Factor</a></li>
																			<li class=""><a href="#" id="menu-lang-56"
																				data-id="56" data-label="Node.js"
																				title="Node.js (0.12.7)" class="lang "
																				tabindex="1056">Node.js</a></li>
																			<li class=""><a href="#" id="menu-lang-33"
																				data-id="33" data-label="Scheme (guile)"
																				title="Scheme (guile) (guile 2.0.11)" class="lang "
																				tabindex="1071">Scheme (guile)</a></li>
																			<li class=""><a href="#" id="menu-lang-41"
																				data-id="41" data-label="C++ 4.3.2"
																				title="C++ 4.3.2 (gcc-4.3.2)" class="lang "
																				tabindex="1027">C++ 4.3.2</a></li>
																			<li class=""><a href="#" id="menu-lang-125"
																				data-id="125" data-label="Falcon"
																				title="Falcon (falcon-0.9.6.6)" class="lang "
																				tabindex="1042">Falcon</a></li>
																			<li class=""><a href="#" id="menu-lang-83"
																				data-id="83" data-label="Objective-C"
																				title="Objective-C (clang 3.7)" class="lang "
																				tabindex="1057">Objective-C</a></li>
																			<li class=""><a href="#" id="menu-lang-23"
																				data-id="23" data-label="Smalltalk"
																				title="Smalltalk (gst 3.2.4)" class="lang "
																				tabindex="1072">Smalltalk</a></li>
																			<li class=""><a href="#" id="menu-lang-34"
																				data-id="34" data-label="C99 strict"
																				title="C99 strict (gcc-5.1)" class="lang "
																				tabindex="1028">C99 strict</a></li>
																			<li class=""><a href="#" id="menu-lang-92"
																				data-id="92" data-label="Fantom"
																				title="Fantom (1.0.67)" class="lang "
																				tabindex="1043">Fantom</a></li>
																			<li class=""><a href="#" id="menu-lang-8"
																				data-id="8" data-label="Ocaml"
																				title="Ocaml (ocamlopt 4.01.0)" class="lang "
																				tabindex="1058">Ocaml</a></li>
																			<li class=""><a href="#" id="menu-lang-38"
																				data-id="38" data-label="Tcl"
																				title="Tcl (tclsh 8.6)" class="lang "
																				tabindex="1073">Tcl</a></li>
																			<li class=""><a href="#" id="menu-lang-14"
																				data-id="14" data-label="CLIPS"
																				title="CLIPS (clips 6.24)" class="lang "
																				tabindex="1029">CLIPS</a></li>
																			<li class=""><a href="#" id="menu-lang-107"
																				data-id="107" data-label="Forth"
																				title="Forth (gforth-0.7.2)" class="lang "
																				tabindex="1044">Forth</a></li>
																			<li class=""><a href="#" id="menu-lang-127"
																				data-id="127" data-label="Octave"
																				title="Octave (3.6.2)" class="lang " tabindex="1059">Octave</a>
																			</li>
																			<li class=""><a href="#" id="menu-lang-62"
																				data-id="62" data-label="Text"
																				title="Text (text 6.10)" class="lang "
																				tabindex="1074">Text</a></li>
																			<li class=""><a href="#" id="menu-lang-111"
																				data-id="111" data-label="Clojure"
																				title="Clojure (clojure 1.7)" class="lang "
																				tabindex="1030">Clojure</a></li>
																			<li class=""><a href="#" id="menu-lang-5"
																				data-id="5" data-label="Fortran"
																				title="Fortran (gfortran-5.1)" class="lang "
																				tabindex="1045">Fortran</a></li>
																			<li class=""><a href="#" id="menu-lang-119"
																				data-id="119" data-label="Oz"
																				title="Oz (mozart-1.4.0)" class="lang "
																				tabindex="1060">Oz</a></li>
																			<li class=""><a href="#" id="menu-lang-115"
																				data-id="115" data-label="Unlambda"
																				title="Unlambda (unlambda-2.0.0)" class="lang "
																				tabindex="1075">Unlambda</a></li>
																			<li class=""><a href="#" id="menu-lang-118"
																				data-id="118" data-label="COBOL"
																				title="COBOL (open-cobol-1.1)" class="lang "
																				tabindex="1031">COBOL</a></li>
																			<li class=""><a href="#" id="menu-lang-114"
																				data-id="114" data-label="Go" title="Go (1.4.2)"
																				class="lang " tabindex="1046">Go</a></li>
																			<li class=""><a href="#" id="menu-lang-54"
																				data-id="54" data-label="Perl 6"
																				title="Perl 6 (rakudo-2014.07)" class="lang "
																				tabindex="1061">Perl 6</a></li>
																			<li class=""><a href="#" id="menu-lang-6"
																				data-id="6" data-label="Whitespace"
																				title="Whitespace (wspace 0.3)" class="lang "
																				tabindex="1076">Whitespace</a></li>
																			<li class=""><a href="#" id="menu-lang-106"
																				data-id="106" data-label="COBOL 85"
																				title="COBOL 85 (tinycobol-0.65.9)" class="lang "
																				tabindex="1032">COBOL 85</a></li>
																			<li class=""><a href="#" id="menu-lang-121"
																				data-id="121" data-label="Groovy"
																				title="Groovy (groovy-2.4)" class="lang "
																				tabindex="1047">Groovy</a></li>
																			<li class=""><a href="#" id="menu-lang-94"
																				data-id="94" data-label="PicoLisp"
																				title="PicoLisp (3.1.1)" class="lang "
																				tabindex="1062">PicoLisp</a></li>
																		</ul>
																	</div>
																</div>
															</div>

															<!-- show input -->
															<button type="button" class="btn footer-item rel-tooltip"
																data-toggle="button" title="Specify input (stdin)"
																style="display: none;" id="button-input1">
																<i class="icon-inbox"></i> stdin
															</button>
															<button type="button" class="btn footer-item rel-tooltip"
																data-toggle="button" title="Class1" id="class1-button">
																<i class="icon-inbox"></i> 1
															</button>
															<button type="button" class="btn footer-item rel-tooltip"
																data-toggle="button" title="Class2" id="class2-button">
																<i class="icon-inbox"></i> 2
															</button>


															<!-- visibility -->
															<input type="hidden" name="public" value="1">
															<div class="btn-group footer-item" style="display: none;"
																data-toggle="buttons-radio" id="btn-group-visibility">
																<button type="button" class="rel-tooltip btn active"
																	data-value="1"
																	title="Public - your code will be available to everyone.">
																	<i class="icon-globe"></i>
																</button>
																<button type="button" class="rel-tooltip btn "
																	data-value="0"
																	title="Secret - your code will be available only to those with whom you share a link.">
																	<i class="icon-glasses"></i>
																</button>
																<button type="button" class="rel-tooltip btn  disabled"
																	disabled="disabled" data-value="-1"
																	title="Private - only you will be able to access the code. You have to be signed in to use this option.">
																	<i class="icon-lock"></i>
																</button>
															</div>


															<!-- more options -->
															<a href="#" id="button-more-options1" class="reverse"
																style="display: none;"> <span
																class="more-options-more">more&nbsp;options</span> <span
																class="more-options-less">fewer&nbsp;options</span>
															</a>


															<!-- submit -->
															<div class="pull-right">
																<input type="hidden" name="run" value="1">
																<button type="submit" name="Submit" id="Translate1"
																	tabindex="2"
																	class="btn btn-success footer-item rel-tooltip"
																	title="Translate">
																	<i class="icon-cog-alt"></i> Translate
																</button>
																<button type="submit" name="Submit" id="Submit1"
																	tabindex="2"
																	class="btn btn-success footer-item rel-tooltip"
																	title="Run the program">
																	<i class="icon-cog-alt"></i> Run
																</button>
															</div>

															<div class="clearfix"></div>
														</div>
													</div>
												</div>
											</div>

											<div id="csharp_container" class="span8 code-panel">
												<div class="header">
													<i class="icon-code"></i> enter your source code <span
														id="insert-part-or" style="display: inline">or</span> <span
														id="insert-part-insert" style="display: inline">insert</span>
													<span id="insert-part-template" style="display: inline"><a
														id="insert-template-link" href="#" class="rel-tooltip"
														title="" data-original-title="Insert template">template</a></span>
													<span id="insert-part-or2" style="display: inline">or</span>
													<span id="insert-part-sample" style="display: inline"><a
														id="insert-sample-link" href="#" class="rel-tooltip"
														title="Insert sample program">sample</a></span> <span
														id="insert-part-or3" style="display: inline">or</span> <span
														id="insert-part-users-template" style="display: inline"><a
														id="insert-users-template-link" href="#"
														class="rel-tooltip" title="Insert your template">your
															template</a></span> <img id="insert-loader"
														style="display: none; height: 11px"
														src="//stx1.ideone.com/gfx/loader.gif" alt="loading...">
													<div class="pull-right option-clear">
														<a href="#" class="rel-tooltip with-margin-right"
															title="Clear the editor"
															onclick="clearEditor(); return false;">clear</a>
													</div>
													<div class="clearfix"></div>
												</div>

												<!-- editor + ad -->
												<div style="border-bottom: 1px solid #ececec;">
													<div id="file_div2" class=" ace_editor ace-tm"
														style="height: 320px; display: block;">
														<textarea class="ace_text-input" wrap="off"
															autocapitalize="off" spellcheck="false"
															style="bottom: 190.4px; height: 14.4px; width: 6.6px; right: 712.8px;"></textarea>
														<div class="ace_gutter">
															<div
																class="ace_layer ace_gutter-layer ace_folding-enabled"
																style="margin-top: 0px; height: 348.8px; width: 40px;">
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">1</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">2</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">3</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	4<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">5</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">
																	6<span class="ace_fold-widget ace_start ace_open"
																		style="height: 14.40000057220459px"></span>
																</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">7</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">8</div>
																<div class="ace_gutter-cell "
																	style="height: 14.40000057220459px;">9</div>
															</div>
															<div class="ace_gutter-active-line"
																style="top: 115.2px; height: 14.4px;"></div>
														</div>
														<div class="ace_scroller"
															style="left: 40px; right: 0px; bottom: 0px;">
															<div class="ace_content"
																style="margin-top: 0px; width: 730px; height: 348.8px; margin-left: 0px;">
																<div class="ace_layer ace_print-margin-layer">
																	<div class="ace_print-margin"
																		style="left: 532px; visibility: visible;"></div>
																</div>
																<div class="ace_layer ace_marker-layer">
																	<div class="ace_active-line"
																		style="height: 14.40000057220459px; top: 115.20000457763672px; left: 0; right: 0;"></div>
																	<div class="ace_bracket ace_start"
																		style="height: 14.40000057220459px; width: 6.599999904632568px; top: 43.20000171661377px; left: 4px;"></div>
																</div>
																<div class="ace_layer ace_text-layer"
																	style="padding: 0px 4px;">
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">using</span>&nbsp;<span
																			class="ace_identifier">System</span><span
																			class="ace_punctuation ace_operator">;</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px"></div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_keyword">public</span>&nbsp;<span
																			class="ace_keyword">class</span>&nbsp;<span
																			class="ace_identifier">Test</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_paren ace_lparen">{</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_keyword">public</span>&nbsp;<span
																			class="ace_keyword">static</span>&nbsp;<span
																			class="ace_keyword">void</span>&nbsp;<span
																			class="ace_identifier">Main</span><span
																			class="ace_paren ace_lparen">(</span><span
																			class="ace_paren ace_rparen">)</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		&nbsp;&nbsp;&nbsp;&nbsp;<span
																			class="ace_paren ace_lparen">{</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_indent-guide">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
																			class="ace_comment">//&nbsp;your&nbsp;code&nbsp;goes&nbsp;here</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		&nbsp;&nbsp;&nbsp;&nbsp;<span
																			class="ace_paren ace_rparen">}</span>
																	</div>
																	<div class="ace_line"
																		style="height: 14.40000057220459px">
																		<span class="ace_paren ace_rparen">}</span>
																	</div>
																</div>
																<div class="ace_layer ace_marker-layer"></div>
																<div
																	class="ace_layer ace_cursor-layer ace_hidden-cursors">
																	<div class="ace_cursor"
																		style="left: 10.6px; top: 115.2px; width: 6.6px; height: 14.4px;"></div>
																</div>
															</div>
														</div>
														<div
															style="height: auto; width: auto; top: -100px; left: -100px; visibility: hidden; position: fixed; overflow: visible; white-space: nowrap;">X</div>
														<div class="ace_scrollbar"
															style="width: 26px; display: none; overflow-y: scroll; bottom: 0px;">
															<div class="ace_scrollbar-inner" style="height: 129.6px;"></div>
														</div>
														<div class="ace_scrollbar-h"
															style="height: 26px; display: none; overflow-x: scroll; left: 40px; right: 0px;">
															<div class="ace_scrollbar-inner" style="width: 730px;"></div>
														</div>
													</div>
													<div id="file_parent2"
														style="padding: 10px; display: none;">
														<textarea name="file" id="file2" tabindex="1">using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace CVa
{
	public class Test
	{
		public static void Main(string[] args)
		{
			// your code goes here
		}
	}
}</textarea>
													</div>
												</div>
												<input type="hidden" id="file_template2"
													value="using System;

public class Test
{
	public static void Main()
	{
		// your code goes here
	}
}">

												<!-- advanced config: input -->
												<div class="row visible" id="ex-input2">
													<div class="span8">
														<div class="ex-more-options-box"
															style="padding: 10px; padding-top: 6px; color: #666">
															<div style="margin-bottom: 5px">
																<i class="icon-inbox"></i> enter input (stdin)
																<div class="pull-right option-clear">
																	<a href="#" class="rel-tooltip" title="Clear the input"
																		onclick="$('#input').val(''); return false;">clear</a>
																</div>
																<div class="clearfix"></div>
															</div>
															<textarea name="input" id="input2" rows="2" cols="80"></textarea>
														</div>
													</div>
												</div>

												<!-- advanced config: more options -->
												<div class="row visible" id="ex-more-options">
													<div class="span8">
														<!--
							<div class="row">
								<div class="span8 top-border">
								</div>
							</div>
							-->
														<div class="row">
															<div class="span8">
																<div class="ex-more-options-box"
																	style="padding-bottom: 0px; padding-top: 6px">
																	<!-- syntax -->
																	<div class="syntax-box" style="display: none;">
																		<input type="hidden" name="syntax" value="0">
																		<label for="syntax" class="checkbox"><input
																			type="checkbox" name="syntax" id="syntax2" value="1"
																			checked="checked"> <span>syntax
																				highlight</span></label>
																	</div>

																	<div class="timelimit-box" style="display: none;">
																		<i class="icon-time"></i> time limit: <label
																			for="timelimit-0"><input type="radio"
																			name="timelimit" value="0" id="timelimit-0"
																			checked="checked"> <span>5s</span></label> <label
																			for="timelimit-1"><input type="radio"
																			name="timelimit" value="1" id="timelimit-1"
																			disabled="disabled"> <span>15s</span></label> <a
																			href="/faq#constraints" class="help-link rel-tooltip"
																			target="_blank" title="What's the time limit?"
																			style="margin-left: 2px"><i
																			class="icon-help-circled"></i></a>
																	</div>

																</div>
															</div>
														</div>
														<div class="row">
															<div class="span8">
																<div class="ex-more-options-box"
																	style="padding-top: 4px">
																	<!-- note -->
																	<div style="margin-bottom: 5px">
																		<i class="icon-pencil"></i> &nbsp;&nbsp;Output
																		<!-- <div class="pull-right option-clear">
										<a href="#" class="rel-tooltip" title="Clear the note"
											onclick="$('#note1').val(''); return false;">clear</a>
									</div> -->
																		<div class="clearfix"></div>
																	</div>
																	<div class="ex-more-options-box"
																		style="padding: 10px; padding-top: 6px; color: #666">
																		<textarea id="output2" rows="2" cols="80"
																			readonly="readonly"></textarea>
																	</div>
																</div>
																<div class="ex-more-options-box"
																	style="padding-top: 4px; display: none;">
																	<!-- note -->
																	<div style="margin-bottom: 5px">
																		<i class="icon-pencil"></i> enter your note
																		<div class="pull-right option-clear">
																			<a href="#" class="rel-tooltip"
																				title="Clear the note"
																				onclick="$('#note').val(''); return false;">clear</a>
																		</div>
																		<div class="clearfix"></div>
																	</div>
																	<textarea name="note" id="note" rows="2" cols="80"></textarea>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="g"
													style="text-align: center; height: 90px; display: none;">


													<!--<script type="text/javascript" src="//ap.lijit.com/www/delivery/fpi.js?z=357751&u=sphere-research&width=728&height=90"></script>-->

													<!-- ideone_main_728x90_center -->
													<ins class="adsbygoogle"
														style="display: inline-block; width: 728px; height: 90px"
														data-ad-client="ca-pub-4453360425583535"
														data-ad-slot="4445601430"></ins>
													<script>
														(adsbygoogle = window.adsbygoogle
																|| []).push({});
													</script>


												</div>

												<!-- visible options + submit -->
												<div class="row">
													<div class="span8">
														<div class="footer">
															<!-- lang -->
															<input type="hidden" name="_lang" id="_lang2" value="27">

															<!-- simple lang select -->

															<!-- advanced lang select -->
															<div class="dropdown dropup" id="lang_advselect"
																style="display: none;">
																<a class="dropdown-toggle btn footer-item rel-tooltip"
																	data-toggle="dropdown" href="#" title="Choose language"
																	id="lang-dropdown-menu-button"><span>C#</span> <b
																	class="caret"></b></a>
																<div id="lang-dropdown-menu" class="dropdown-menu"
																	role="menu" aria-labelledby="lang-dropdown-menu-button">
																	<div id="language-details"></div>
																	<div class="clearfix"></div>
																	<div class="popular-box">
																		<legend>popular</legend>
																		<ul class="popular">
																			<li class=""><a href="#" id="menu-lang-28"
																				data-id="28" data-label="Bash"
																				title="Bash (bash 4.3.33)" class="lang "
																				tabindex="1000">Bash</a></li>
																			<li class=""><a href="#" id="menu-lang-22"
																				data-id="22" data-label="Pascal (fpc)"
																				title="Pascal (fpc) (fpc 2.6.4)" class="lang "
																				tabindex="1009">Pascal (fpc)</a></li>
																			<li class=""><a href="#" id="menu-lang-11"
																				data-id="11" data-label="C" title="C (gcc-5.1)"
																				class="lang " tabindex="1001">C</a></li>
																			<li class=""><a href="#" id="menu-lang-2"
																				data-id="2" data-label="Pascal (gpc)"
																				title="Pascal (gpc) (gpc 20070904)" class="lang "
																				tabindex="1010">Pascal (gpc)</a></li>
																			<li class="active"><a href="#" id="menu-lang-27"
																				data-id="27" data-label="C#" title="C# (mono-4.0.2)"
																				class="lang " tabindex="1002">C#</a></li>
																			<li class=""><a href="#" id="menu-lang-3"
																				data-id="3" data-label="Perl"
																				title="Perl (perl 5.20.1)" class="lang "
																				tabindex="1011">Perl</a></li>
																			<li class=""><a href="#" id="menu-lang-1"
																				data-id="1" data-label="C++ 5.1"
																				title="C++ 5.1 (gcc-5.1)" class="lang "
																				tabindex="1003">C++ 5.1</a></li>
																			<li class=""><a href="#" id="menu-lang-29"
																				data-id="29" data-label="PHP"
																				title="PHP (php 5.6.4)" class="lang "
																				tabindex="1012">PHP</a></li>
																			<li class=""><a href="#" id="menu-lang-44"
																				data-id="44" data-label="C++14"
																				title="C++14 (gcc-5.1)" class="lang "
																				tabindex="1004">C++14</a></li>
																			<li class=""><a href="#" id="menu-lang-4"
																				data-id="4" data-label="Python"
																				title="Python (python 2.7.10)" class="lang "
																				tabindex="1013">Python</a></li>
																			<li class=""><a href="#" id="menu-lang-21"
																				data-id="21" data-label="Haskell"
																				title="Haskell (ghc-7.8)" class="lang "
																				tabindex="1005">Haskell</a></li>
																			<li class=""><a href="#" id="menu-lang-116"
																				data-id="116" data-label="Python 3"
																				title="Python 3 (python-3.4)" class="lang "
																				tabindex="1014">Python 3</a></li>
																			<li class=""><a href="#" id="menu-lang-10"
																				data-id="10" data-label="Java"
																				title="Java (sun-jdk-8u51)" class="lang "
																				tabindex="1006">Java</a></li>
																			<li class=""><a href="#" id="menu-lang-17"
																				data-id="17" data-label="Ruby"
																				title="Ruby (ruby-2.1)" class="lang "
																				tabindex="1015">Ruby</a></li>
																			<li class=""><a href="#" id="menu-lang-55"
																				data-id="55" data-label="Java7"
																				title="Java7 (sun-jdk-1.7.0_10)" class="lang "
																				tabindex="1007">Java7</a></li>
																			<li class=""><a href="#" id="menu-lang-40"
																				data-id="40" data-label="SQL"
																				title="SQL (sqlite3-3.8.7)" class="lang "
																				tabindex="1016">SQL</a></li>
																			<li class=""><a href="#" id="menu-lang-43"
																				data-id="43" data-label="Objective-C"
																				title="Objective-C (gcc-5.1)" class="lang "
																				tabindex="1008">Objective-C</a></li>
																			<li class=""><a href="#" id="menu-lang-101"
																				data-id="101" data-label="VB.NET"
																				title="VB.NET (mono-3.10)" class="lang "
																				tabindex="1017">VB.NET</a></li>
																		</ul>
																	</div>
																	<div class="rest-box">
																		<legend>others</legend>
																		<ul class="rest">
																			<li class=""><a href="#" id="menu-lang-7"
																				data-id="7" data-label="Ada" title="Ada (gnat-5.1)"
																				class="lang " tabindex="1018">Ada</a></li>
																			<li class=""><a href="#" id="menu-lang-91"
																				data-id="91" data-label="CoffeeScript"
																				title="CoffeeScript (1.9.3)" class="lang "
																				tabindex="1033">CoffeeScript</a></li>
																			<li class=""><a href="#" id="menu-lang-16"
																				data-id="16" data-label="Icon"
																				title="Icon (iconc 9.4.3)" class="lang "
																				tabindex="1048">Icon</a></li>
																			<li class=""><a href="#" id="menu-lang-19"
																				data-id="19" data-label="Pike"
																				title="Pike (pike 7.8)" class="lang "
																				tabindex="1063">Pike</a></li>
																			<li class=""><a href="#" id="menu-lang-45"
																				data-id="45" data-label="Assembler"
																				title="Assembler (gcc-5.1)" class="lang "
																				tabindex="1019">Assembler</a></li>
																			<li class=""><a href="#" id="menu-lang-32"
																				data-id="32" data-label="Common Lisp (clisp)"
																				title="Common Lisp (clisp) (clisp 2.49)"
																				class="lang " tabindex="1034">Common Lisp
																					(clisp)</a></li>
																			<li class=""><a href="#" id="menu-lang-9"
																				data-id="9" data-label="Intercal"
																				title="Intercal (c-intercal 28.0-r1)" class="lang "
																				tabindex="1049">Intercal</a></li>
																			<li class=""><a href="#" id="menu-lang-108"
																				data-id="108" data-label="Prolog (gnu)"
																				title="Prolog (gnu) (gprolog-1.3.1)" class="lang "
																				tabindex="1064">Prolog (gnu)</a></li>
																			<li class=""><a href="#" id="menu-lang-13"
																				data-id="13" data-label="Assembler"
																				title="Assembler (nasm-2.11.05)" class="lang "
																				tabindex="1020">Assembler</a></li>
																			<li class=""><a href="#" id="menu-lang-84"
																				data-id="84" data-label="D" title="D (ldc 0.14)"
																				class="lang " tabindex="1035">D</a></li>
																			<li class=""><a href="#" id="menu-lang-35"
																				data-id="35" data-label="JavaScript (rhino)"
																				title="JavaScript (rhino) (rhino-1.7.7)"
																				class="lang " tabindex="1050">JavaScript (rhino)</a></li>
																			<li class=""><a href="#" id="menu-lang-15"
																				data-id="15" data-label="Prolog (swi)"
																				title="Prolog (swi) (swipl 5.6.64)" class="lang "
																				tabindex="1065">Prolog (swi)</a></li>
																			<li class=""><a href="#" id="menu-lang-104"
																				data-id="104" data-label="AWK (gawk)"
																				title="AWK (gawk) (gawk-4.1.1)" class="lang "
																				tabindex="1021">AWK (gawk)</a></li>
																			<li class=""><a href="#" id="menu-lang-20"
																				data-id="20" data-label="D" title="D (gdc 5.1)"
																				class="lang " tabindex="1036">D</a></li>
																			<li class=""><a href="#" id="menu-lang-112"
																				data-id="112" data-label="JavaScript (spidermonkey)"
																				title="JavaScript (spidermonkey) (spidermonkey 24.2)"
																				class="lang " tabindex="1051">JavaScript
																					(spidermonkey)</a></li>
																			<li class=""><a href="#" id="menu-lang-99"
																				data-id="99" data-label="Python (Pypy)"
																				title="Python (Pypy) (Pypy)" class="lang "
																				tabindex="1066">Python (Pypy)</a></li>
																			<li class=""><a href="#" id="menu-lang-105"
																				data-id="105" data-label="AWK (mawk)"
																				title="AWK (mawk) (mawk-3.3)" class="lang "
																				tabindex="1022">AWK (mawk)</a></li>
																			<li class=""><a href="#" id="menu-lang-102"
																				data-id="102" data-label="D (dmd)"
																				title="D (dmd) (dmd-2.067.1)" class="lang "
																				tabindex="1037">D (dmd)</a></li>
																			<li class=""><a href="#" id="menu-lang-26"
																				data-id="26" data-label="Lua" title="Lua (luac 5.2)"
																				class="lang " tabindex="1052">Lua</a></li>
																			<li class=""><a href="#" id="menu-lang-117"
																				data-id="117" data-label="R" title="R (R-2.11.1)"
																				class="lang " tabindex="1067">R</a></li>
																			<li class=""><a href="#" id="menu-lang-110"
																				data-id="110" data-label="bc"
																				title="bc (bc-1.06.95)" class="lang "
																				tabindex="1023">bc</a></li>
																			<li class=""><a href="#" id="menu-lang-96"
																				data-id="96" data-label="Elixir"
																				title="Elixir (1.1.0)" class="lang " tabindex="1038">Elixir</a>
																			</li>
																			<li class=""><a href="#" id="menu-lang-30"
																				data-id="30" data-label="Nemerle"
																				title="Nemerle (ncc 0.9.3)" class="lang "
																				tabindex="1053">Nemerle</a></li>
																			<li class=""><a href="#" id="menu-lang-93"
																				data-id="93" data-label="Rust" title="Rust (1.0.0)"
																				class="lang " tabindex="1068">Rust</a></li>
																			<li class=""><a href="#" id="menu-lang-12"
																				data-id="12" data-label="Brainf**k"
																				title="Brainf**k (bff-1.0.5)" class="lang "
																				tabindex="1024">Brainf**k</a></li>
																			<li class=""><a href="#" id="menu-lang-36"
																				data-id="36" data-label="Erlang"
																				title="Erlang (erl-18)" class="lang "
																				tabindex="1039">Erlang</a></li>
																			<li class=""><a href="#" id="menu-lang-25"
																				data-id="25" data-label="Nice"
																				title="Nice (nicec 0.9.6)" class="lang "
																				tabindex="1054">Nice</a></li>
																			<li class=""><a href="#" id="menu-lang-39"
																				data-id="39" data-label="Scala"
																				title="Scala (scala-2.11.7)" class="lang "
																				tabindex="1069">Scala</a></li>
																			<li class=""><a href="#" id="menu-lang-81"
																				data-id="81" data-label="C" title="C (clang 3.7)"
																				class="lang " tabindex="1025">C</a></li>
																			<li class=""><a href="#" id="menu-lang-124"
																				data-id="124" data-label="F#"
																				title="F# (fsharp-3.1)" class="lang "
																				tabindex="1040">F#</a></li>
																			<li class=""><a href="#" id="menu-lang-122"
																				data-id="122" data-label="Nim" title="Nim (0.11.2)"
																				class="lang " tabindex="1055">Nim</a></li>
																			<li class=""><a href="#" id="menu-lang-97"
																				data-id="97" data-label="Scheme (chicken)"
																				title="Scheme (chicken) (4.9)" class="lang "
																				tabindex="1070">Scheme (chicken)</a></li>
																			<li class=""><a href="#" id="menu-lang-82"
																				data-id="82" data-label="C++"
																				title="C++ (clang 3.7)" class="lang "
																				tabindex="1026">C++</a></li>
																			<li class=""><a href="#" id="menu-lang-123"
																				data-id="123" data-label="Factor"
																				title="Factor (factor-0.93)" class="lang "
																				tabindex="1041">Factor</a></li>
																			<li class=""><a href="#" id="menu-lang-56"
																				data-id="56" data-label="Node.js"
																				title="Node.js (0.12.7)" class="lang "
																				tabindex="1056">Node.js</a></li>
																			<li class=""><a href="#" id="menu-lang-33"
																				data-id="33" data-label="Scheme (guile)"
																				title="Scheme (guile) (guile 2.0.11)" class="lang "
																				tabindex="1071">Scheme (guile)</a></li>
																			<li class=""><a href="#" id="menu-lang-41"
																				data-id="41" data-label="C++ 4.3.2"
																				title="C++ 4.3.2 (gcc-4.3.2)" class="lang "
																				tabindex="1027">C++ 4.3.2</a></li>
																			<li class=""><a href="#" id="menu-lang-125"
																				data-id="125" data-label="Falcon"
																				title="Falcon (falcon-0.9.6.6)" class="lang "
																				tabindex="1042">Falcon</a></li>
																			<li class=""><a href="#" id="menu-lang-83"
																				data-id="83" data-label="Objective-C"
																				title="Objective-C (clang 3.7)" class="lang "
																				tabindex="1057">Objective-C</a></li>
																			<li class=""><a href="#" id="menu-lang-23"
																				data-id="23" data-label="Smalltalk"
																				title="Smalltalk (gst 3.2.4)" class="lang "
																				tabindex="1072">Smalltalk</a></li>
																			<li class=""><a href="#" id="menu-lang-34"
																				data-id="34" data-label="C99 strict"
																				title="C99 strict (gcc-5.1)" class="lang "
																				tabindex="1028">C99 strict</a></li>
																			<li class=""><a href="#" id="menu-lang-92"
																				data-id="92" data-label="Fantom"
																				title="Fantom (1.0.67)" class="lang "
																				tabindex="1043">Fantom</a></li>
																			<li class=""><a href="#" id="menu-lang-8"
																				data-id="8" data-label="Ocaml"
																				title="Ocaml (ocamlopt 4.01.0)" class="lang "
																				tabindex="1058">Ocaml</a></li>
																			<li class=""><a href="#" id="menu-lang-38"
																				data-id="38" data-label="Tcl"
																				title="Tcl (tclsh 8.6)" class="lang "
																				tabindex="1073">Tcl</a></li>
																			<li class=""><a href="#" id="menu-lang-14"
																				data-id="14" data-label="CLIPS"
																				title="CLIPS (clips 6.24)" class="lang "
																				tabindex="1029">CLIPS</a></li>
																			<li class=""><a href="#" id="menu-lang-107"
																				data-id="107" data-label="Forth"
																				title="Forth (gforth-0.7.2)" class="lang "
																				tabindex="1044">Forth</a></li>
																			<li class=""><a href="#" id="menu-lang-127"
																				data-id="127" data-label="Octave"
																				title="Octave (3.6.2)" class="lang " tabindex="1059">Octave</a>
																			</li>
																			<li class=""><a href="#" id="menu-lang-62"
																				data-id="62" data-label="Text"
																				title="Text (text 6.10)" class="lang "
																				tabindex="1074">Text</a></li>
																			<li class=""><a href="#" id="menu-lang-111"
																				data-id="111" data-label="Clojure"
																				title="Clojure (clojure 1.7)" class="lang "
																				tabindex="1030">Clojure</a></li>
																			<li class=""><a href="#" id="menu-lang-5"
																				data-id="5" data-label="Fortran"
																				title="Fortran (gfortran-5.1)" class="lang "
																				tabindex="1045">Fortran</a></li>
																			<li class=""><a href="#" id="menu-lang-119"
																				data-id="119" data-label="Oz"
																				title="Oz (mozart-1.4.0)" class="lang "
																				tabindex="1060">Oz</a></li>
																			<li class=""><a href="#" id="menu-lang-115"
																				data-id="115" data-label="Unlambda"
																				title="Unlambda (unlambda-2.0.0)" class="lang "
																				tabindex="1075">Unlambda</a></li>
																			<li class=""><a href="#" id="menu-lang-118"
																				data-id="118" data-label="COBOL"
																				title="COBOL (open-cobol-1.1)" class="lang "
																				tabindex="1031">COBOL</a></li>
																			<li class=""><a href="#" id="menu-lang-114"
																				data-id="114" data-label="Go" title="Go (1.4.2)"
																				class="lang " tabindex="1046">Go</a></li>
																			<li class=""><a href="#" id="menu-lang-54"
																				data-id="54" data-label="Perl 6"
																				title="Perl 6 (rakudo-2014.07)" class="lang "
																				tabindex="1061">Perl 6</a></li>
																			<li class=""><a href="#" id="menu-lang-6"
																				data-id="6" data-label="Whitespace"
																				title="Whitespace (wspace 0.3)" class="lang "
																				tabindex="1076">Whitespace</a></li>
																			<li class=""><a href="#" id="menu-lang-106"
																				data-id="106" data-label="COBOL 85"
																				title="COBOL 85 (tinycobol-0.65.9)" class="lang "
																				tabindex="1032">COBOL 85</a></li>
																			<li class=""><a href="#" id="menu-lang-121"
																				data-id="121" data-label="Groovy"
																				title="Groovy (groovy-2.4)" class="lang "
																				tabindex="1047">Groovy</a></li>
																			<li class=""><a href="#" id="menu-lang-94"
																				data-id="94" data-label="PicoLisp"
																				title="PicoLisp (3.1.1)" class="lang "
																				tabindex="1062">PicoLisp</a></li>
																		</ul>
																	</div>
																</div>
															</div>

															<!-- show input -->
															<button type="button" class="btn footer-item rel-tooltip"
																data-toggle="button" title="Specify input (stdin)"
																id="button-input2" style="display: none;">
																<i class="icon-inbox"></i> stdin
															</button>

															<!-- visibility -->
															<input type="hidden" name="public" value="1">
															<div class="btn-group footer-item" style="display: none;"
																data-toggle="buttons-radio" id="btn-group-visibility">
																<button type="button" class="rel-tooltip btn active"
																	data-value="1"
																	title="Public - your code will be available to everyone.">
																	<i class="icon-globe"></i>
																</button>
																<button type="button" class="rel-tooltip btn "
																	data-value="0"
																	title="Secret - your code will be available only to those with whom you share a link.">
																	<i class="icon-glasses"></i>
																</button>
																<button type="button" class="rel-tooltip btn  disabled"
																	disabled="disabled" data-value="-1"
																	title="Private - only you will be able to access the code. You have to be signed in to use this option.">
																	<i class="icon-lock"></i>
																</button>
															</div>

															<!-- more options -->
															<a href="#" id="button-more-options2" class="reverse"
																style="display: none;"> <span
																class="more-options-more">more&nbsp;options</span> <span
																class="more-options-less">fewer&nbsp;options</span>
															</a>


															<!-- submit -->
															<div class="pull-right">
																<input type="hidden" name="run" value="1">
																<button type="submit" name="Submit" id="Translate2"
																	tabindex="2"
																	class="btn btn-success footer-item rel-tooltip"
																	title="Translate">
																	<i class="icon-cog-alt"></i> Translate
																</button>
																<button type="submit" name="Submit" id="Submit2"
																	tabindex="2"
																	class="btn btn-success footer-item rel-tooltip"
																	title="Run the program (Ctrl+Enter)">
																	<i class="icon-cog-alt"></i> Run
																</button>
															</div>

															<div class="clearfix"></div>
														</div>
													</div>
												</div>
											</div>
											<!-- <div class="span4">
												ad
												<div class="right-sidebar" data-spy="_affix"
													data-offset-top="40">
													<script type="text/javascript" src="//ap.lijit.com/www/delivery/fpi.js?z=357752&u=sphere-research&width=336&height=280"></script>
													<script async=""
														src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
													ideone_main_336x280_right
													<ins class="adsbygoogle"
														style="display: inline-block; width: 336px; height: 280px"
														data-ad-client="ca-pub-4453360425583535"
														data-ad-slot="5922334631"></ins>
													<script>
														(adsbygoogle = window.adsbygoogle
																|| []).push({});
													</script>
													<br> <br> <a
														href="http://spoj.com/?utm_campaign=permanent&amp;utm_medium=main-right&amp;utm_source=ideone"
														target="_blank"> <img
														src="//stx1.ideone.com/gfx2/img/spoj.png"
														style="width: 336px;">
													</a>
												</div>
											</div>
										 -->
										</div>
									</div>
									<!-- /.item -->
									<div class="item"></div>
									<!-- /.item -->
									<div class="item"></div>
								</div>
								<!-- 
						<a class="left carousel-control" href="#featured-project-carousel" data-slide="prev">?</a> 
						<a class="right carousel-control" href="#featured-project-carousel" data-slide="next">?</a> </div>
					 -->
							</div>
						</div>
					</div>

				</div>
			</section>

			<div class="white_content" id="openJ">
				<div id="javaPop">
					<h2>JAVA 코드창</h2>
					<a href="#close"><button type="button" id="closeBtnJ">닫기</button></a>
					<div id="javaSource"
						style="border: 5px inset orange; width: 730px auto; height: 330px">

					</div>
				</div>
			</div>

			<div class="white_content" id="openC">
				<div id="csharpPop">
					<h2>C# 코드창</h2>
					<a href="#close"><button type="button" id="closeBtnC">닫기</button></a>
					<div id="csharpSource"
						style="border: 5px inset purple; width: 730px auto; height: 330px">

					</div>
				</div>
			</div>

			<script type="text/javascript">
				//set default view mode
				$defaultViewMode = "full"; //full (fullscreen background), fit (fit to window), original (no scale)

				//cache var
				$bg = $("#bg");
				$outer_container = $("#outer_container");
				$tag = $('#tag');
				$arrow = $('#arrow');

				$(window).load(function() {
					SlidePanels("close");
				});

				//slide in/out left pane
				$tag.click(function() {
					SlidePanels("open");
				});

				$arrow.click(function() { //mouse out
					SlidePanels("close");
				});

				function SlidePanels(action) {
					var speed = 900;
					var easing = "easeInOutExpo";
					if (action == "open") {
						$("#tag").fadeTo("fast", 0);
						$outer_container.stop().animate({
							left : 0
						}, speed, easing);
						$bg.stop().animate({
							left : 585
						}, speed, easing);
					} else {
						$outer_container.stop().animate({
							left : -800
						}, speed, easing);
						$bg.stop().animate({
							left : 0
						}, speed, easing, function() {
							$("#tag").fadeTo("fast", 1);
						});
					}
				}
			</script>

		</div>
	</div>
	<script src="script/custom-index.js"></script>

	<input type="hidden" id="site" value="index">
	<input type="hidden" name="p1" id="p1"
		value="10995f790962d0d24a86cfc233e4c4bf">
	<input type="hidden" name="p2" id="p2" value="8">
	<input type="hidden" name="p3" id="p3" value="19">
	<input type="hidden" name="p4" id="p4" value="1368">
	<input type="hidden" name="clone_link" value="/">

	<div id="main_form_files"></div>

	<div class="bor"></div>

	<div id="cookie-ue"
		style="border: 0px; margin: 0px; padding: 0px; position: fixed; left: 0px; bottom: 0px; background-color: #ddd; width: 100%; font-size: 12px; z-index: 10000; opacity: 0.9;">
		<div style="padding: 5px;" class="container">
			<span id="cookie-ue-msg-content">We use cookies to improve our
				services. If you continue without changing your settings, we'll
				assume that you are happy to receive all cookies on Ideone website.</span>
			<button type="button" class="btn btn-small" title="OK"
				id="cookie-ue-button">OK</button>
		</div>

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#cookie-ue-msg-content")
										.text(
												"We use cookies to improve our services. If you continue without changing your settings, we'll assume that you are happy to receive all cookies on Ideone website.");
								$("#cookie-ue-button").click(function() {
									cookie_helper_set('ue', 1);
									$("#cookie-ue").hide();
								});
							});
		</script>

	</div>

	<div class="modal hide fade" id="bug-dialog" role="dialog"
		tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Report bug / make suggestion</h3>
		</div>
		<div class="modal-body">
			<img src="//stx1.ideone.com/gfx/loader.gif"
				style="width: 14px; height: 14px;" alt="loading...">
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
				class="btn btn-primary" id="bug-dialog-submit">submit</a>
		</div>
	</div>


	<div class="modal hide fade" id="lang-dialog">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Choose your language</h3>
		</div>
		<div class="modal-body">
			<ul style="list-style-type: none;">
				<li><a href="/lang/en"><b>English</b></a></li>
				<li><a href="/lang/hi">Hindi</a></li>
				<li><a href="/lang/hu">Hungarian</a></li>
				<li><a href="/lang/mn">Mongolian</a></li>
				<li><a href="/lang/pl">Polish</a></li>
				<li><a href="/lang/ru">Russian</a></li>
				<li><a href="/lang/es">Spanish</a></li>
				<li><a href="/lang/zh">Traditional Chinese</a></li>
			</ul>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
		</div>
	</div>

	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-10507872-8', 'auto');
		ga('send', 'pageview');
	</script>
	<script type="text/javascript">
		$(function() {
			$(document).on('click', '.track', function() {
				var event = $(this).attr('data-event');
				var action = $(this).attr('data-action');
				var value = $(this).attr('data-value');
				ga('send', 'event', event, action, value);
				console.log(event);
			});
		});
	</script>

	</div>
	<!-- end of #_container -->

	<!--
<script type="text/javascript">
(function() {
        var wrc = document.createElement('script'); wrc.type = 'text/javascript'; wrc.async = true; window.rc_utm_source='ideone';
        wrc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'recruitcoders.com/w4loader.js';
        var s = document.getElementsByTagName('body')[0]; s.appendChild(wrc);
})();
</script>
-->

	<iframe name="oauth2relay645593108" id="oauth2relay645593108"
		src="https://accounts.google.com/o/oauth2/postmessageRelay?parent=http%3A%2F%2Fideone.com&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.ko.b3EMGvUEw9Y.O%2Fm%3D__features__%2Fam%3DAQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNJUTGcG5rVed37F3A_9H-H7f8Ogw#rpctoken=627441766&amp;forcesecure=1"
		tabindex="-1" aria-hidden="true"
		style="width: 1px; height: 1px; position: absolute; top: -100px;"></iframe>
	<iframe id="rufous-sandbox" scrolling="no" frameborder="0"
		allowtransparency="true" allowfullscreen="true"
		style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: none;"></iframe>

</body>
</html>
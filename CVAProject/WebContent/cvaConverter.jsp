<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C.Va</title>
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
	color: #993333;
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
<!-- <style type="text/css">
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
</style> -->
<!-- 없어지면 모양이 이상해짐 -->
<link
	href="//stx1.ideone.com/gfx2/libs/bootstrap/css/bootstrap-with-responsive-1200-only.min.css"
	rel="stylesheet">
<!-- <link href="css/cva-bootstrap.css" rel="stylesheet"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="//stx1.ideone.com/themes/smoothness/jquery-ui-1.10.1.custom.min.css"
	type="text/css" rel="stylesheet">
<!-- <link href="css/custom-1-2.css" rel="stylesheet"> -->
<!-- <link href="//stx1.ideone.com/gfx2/css/ideone-recent.css?8"
	rel="stylesheet">
<link href="//stx1.ideone.com/gfx2/css/ideone-myrecent.css?8"
	rel="stylesheet"> -->
<!-- <link href="css/custom-view.css" rel="stylesheet"> -->
<link href="css/cva.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico">


<script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="script/jquery-migrate-1.0.0.js"></script>
<!-- 필요없는건가? -->
<!-- <script type="text/javascript" src="script/jquery-custom-file-input.js"></script> -->


<script type="text/javascript">
	var cookie_name = 'settings';
	var cookie_time = '15552000';
	var is_mobile = 0;
</script>

<script type="text/javascript"
	src="script/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript"
	src="//stx1.ideone.com/gfx2/libs/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="script/jquery.cookie.js"></script>

<!-- 커서 -->
<script type="text/javascript" src="script/jquery.ajaxmanager.js"></script>
<script type="text/javascript" src="script/jquery.textarea.js"></script>
<script type="text/javascript"
	src="//stx1.ideone.com/gfx2/libs/ace-2013-08/ace.js"
	data-ace-base="/gfx2/libs/ace-2013-08"></script>
<script type="text/javascript" src="script/common-cookie-helper.js"></script>

<!-- 모든것을 지배하는 스크립트 젠장 이거 찾느라 7시간 삽질 -->
<!-- <script type="text/javascript" src="script/common2.js"></script> -->
<!-- 필요한 것만 뽑아서 만들었다!!!!! -->
<script type="text/javascript" src="script/custom-common.js"></script>

<!-- JAVA, CSHARP ACE -->
<script src="http://ideone.com/gfx2/libs/ace-2013-08/mode-csharp.js"></script>
<script src="http://ideone.com/gfx2/libs/ace-2013-08/mode-java.js"></script>

<script type="text/javascript" src="script/cva.js"></script>

</head>
<body class="home not-responsive">
<script type="text/javascript">
$(document).ready(function() {
	
})
</script>
	<div id="_container_java">
		<!-- more option, stdin에 관련된 js -->
		<script src="script/custom-index.js"></script>
		<input type="hidden" id="site1" value="index">
		<div class="span8 code-panel">
			<!-- editor + ad -->
			<div style="border-bottom: 1px solid #ececec;">
				<div id="file_div1" class=" ace_editor ace-tm"
					style="height: 320px; display: block;">
					<textarea class="ace_text-input" wrap="off" autocapitalize="off"
						spellcheck="false"
						style="bottom: 305.6px; height: 14.4px; width: 6.6px; right: 712.4px;"></textarea>
					<div class="ace_gutter">
						<div class="ace_layer ace_gutter-layer ace_folding-enabled"
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
							<div class="ace_layer ace_text-layer" style="padding: 0px 4px;">
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_comment">/*&nbsp;package&nbsp;whatever;&nbsp;//&nbsp;don't&nbsp;place&nbsp;package&nbsp;name!&nbsp;*/</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px"></div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">import</span>&nbsp;<span
										class="ace_identifier">java</span>.<span
										class="ace_identifier">util</span>.<span
										class="ace_keyword ace_operator">*</span>;
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">import</span>&nbsp;<span
										class="ace_identifier">java</span>.<span
										class="ace_identifier">lang</span>.<span
										class="ace_keyword ace_operator">*</span>;
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">import</span>&nbsp;<span
										class="ace_identifier">java</span>.<span
										class="ace_identifier">io</span>.<span
										class="ace_keyword ace_operator">*</span>;
								</div>
								<div class="ace_line" style="height: 14.40000057220459px"></div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_comment">/*&nbsp;Name&nbsp;of&nbsp;the&nbsp;class&nbsp;has&nbsp;to&nbsp;be&nbsp;"Main"&nbsp;only&nbsp;if&nbsp;the&nbsp;class&nbsp;is&nbsp;public.&nbsp;*/</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">class</span>&nbsp;<span
										class="ace_identifier">Test</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">{</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_keyword">public</span>&nbsp;<span
										class="ace_keyword">static</span>&nbsp;<span
										class="ace_keyword">void</span>&nbsp;<span
										class="ace_identifier">main</span>&nbsp;(<span
										class="ace_support ace_function">String</span>[]&nbsp;<span
										class="ace_identifier">args</span>)&nbsp;<span
										class="ace_keyword">throws</span>&nbsp;<span
										class="ace_support ace_function">Exception</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;{</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_indent-guide">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="ace_comment">//&nbsp;your&nbsp;code&nbsp;goes&nbsp;here</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">&nbsp;&nbsp;&nbsp;&nbsp;}</div>
								<div class="ace_line" style="height: 14.40000057220459px">}</div>
							</div>
							<div class="ace_layer ace_marker-layer"></div>
							<div class="ace_layer ace_cursor-layer ace_hidden-cursors">
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
				<div id="file_parent1" style="padding: 10px; display: none;">
					<textarea name="file" id="file1" tabindex="1">
/* package whatever; // don't place package name! */
import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be &quot;Main&quot; only if the class is public. */
class Test
{
	public static void main (String[] args) throws Exception
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
class Test
{
	public static void main (String[] args) throws Exception
	{
		// your code goes here
	}
}">

			<!-- advanced config: input -->
			<div class="row visible" id="ex-input1">
				<div class="span8">
					<div class="ex-more-options-box"
						style="padding: 10px; padding-top: 6px; color: #666">
						<div style="margin-bottom: 5px">
							<i class="icon-inbox"></i> enter input (stdin)
							<div class="pull-right option-clear">
								<a href="#" class="rel-tooltip" title="Clear the input"
									onclick="$('#input1').val(''); return false;">clear</a>
							</div>
							<div class="clearfix"></div>
						</div>
						<textarea name="input" id="input1" rows="2" cols="80"></textarea>
					</div>
				</div>
			</div>

			<!-- advanced config: more options -->
			<div class="row " id="ex-more-options1">
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
								<!-- <div class="syntax-box">
									<input type="hidden" name="syntax" value="0"> <label
										for="syntax" class="checkbox"><input type="checkbox"
										name="syntax" id="syntax1" value="1" checked="checked">
										<span>syntax highlight</span></label>
								</div> -->
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="ex-more-options-box" style="padding-top: 4px">
								<!-- note -->
								<div style="margin-bottom: 5px">
									<i class="icon-pencil"></i> Output
									<!-- <div class="pull-right option-clear">
										<a href="#" class="rel-tooltip" title="Clear the note"
											onclick="$('#note1').val(''); return false;">clear</a>
									</div> -->
									<div class="clearfix"></div>
								</div>
								<textarea name="output" id="output1" rows="2" cols="80" readonly="readonly"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="g" style="text-align: center; height: 90px;">
				<!-- ideone_main_728x90_center -->
				<ins class="adsbygoogle"
					style="display: inline-block; width: 728px; height: 90px"
					data-ad-client="ca-pub-4453360425583535" data-ad-slot="4445601430"></ins>
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
			<!-- visible options + submit -->
			<div class="row">
				<div class="span8">
					<div class="footer">
						<!-- lang -->
						<input type="hidden" name="_lang" id="_lang1" value="10">
						<!-- show input -->
						<button type="button" class="btn footer-item rel-tooltip"
							data-toggle="button" title="" id="button-input1"
							data-original-title="Specify input (stdin)">
							<i class="icon-inbox"></i> stdin
						</button>
						<!-- more options -->
						<a href="#" id="button-more-options1" class=""><span
							class="more-options-less">&nbsp;options</span> </a>
						<!-- submit -->
						<div class="pull-right">
							<input type="hidden" name="run" value="1">
							<button type="submit" name="Submit" id="Submit1" tabindex="2"
								class="btn btn-success footer-item rel-tooltip"
								title="Compile the program">Compile</button>
						</div>
						<!-- Translate -->
						<div class="pull-right">
							<input type="hidden" name="translate" value="2">
							<button type="submit" name="Submit" id="Translate1" tabindex="2"
								class="btn btn-success footer-item rel-tooltip"
								title="Translate the program">Translate</button>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="_container_csharp">
		<!-- <script src="script/custom-index.js"></script> -->
		<input type="hidden" id="site2" value="index">
		<div class="span8 code-panel">
			<!-- editor + ad -->
			<div style="border-bottom: 1px solid #ececec;">
				<div id="file_div2" class=" ace_editor ace-tm"
					style="height: 320px; display: block;">
					<textarea class="ace_text-input" wrap="off" autocapitalize="off"
						spellcheck="false"
						style="bottom: 204.8px; height: 14.4px; width: 6.6px; right: 686.4px;"></textarea>
					<div class="ace_gutter">
						<div class="ace_layer ace_gutter-layer ace_folding-enabled"
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
							style="top: 100.8px; height: 14.4px;"></div>
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
									style="height: 14.40000057220459px; top: 100.80000400543213px; left: 0; right: 0;"></div>
								<div class="ace_bracket ace_start"
									style="height: 14.40000057220459px; width: 6.599999904632568px; top: 72.00000286102295px; left: 30.399999618530273px;"></div>
							</div>
							<div class="ace_layer ace_text-layer" style="padding: 0px 4px;">
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">using</span>&nbsp;<span
										class="ace_identifier">System</span><span
										class="ace_punctuation ace_operator">;</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px"></div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_keyword">public</span>&nbsp;<span
										class="ace_keyword">class</span>&nbsp;<span
										class="ace_identifier">Test</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_paren ace_lparen">{</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_keyword">public</span>&nbsp;<span
										class="ace_keyword">static</span>&nbsp;<span
										class="ace_keyword">void</span>&nbsp;<span
										class="ace_identifier">Main</span><span
										class="ace_paren ace_lparen">(</span><span
										class="ace_paren ace_rparen">)</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_paren ace_lparen">{</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_indent-guide">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
										class="ace_comment">//&nbsp;your&nbsp;code&nbsp;goes&nbsp;here</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="ace_paren ace_rparen">}</span>
								</div>
								<div class="ace_line" style="height: 14.40000057220459px">
									<span class="ace_paren ace_rparen">}</span>
								</div>
							</div>
							<div class="ace_layer ace_marker-layer"></div>
							<div class="ace_layer ace_cursor-layer ace_hidden-cursors">
								<div class="ace_cursor"
									style="left: 37px; top: 100.8px; width: 6.6px; height: 14.4px;"></div>
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
				<div id="file_parent2" style="padding: 10px; display: none;">
					<textarea name="file" id="file2" tabindex="1">using System;
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
namespace CVa
{
	public class Test
	{
		public static void Main(string[] args)
		{
			// your code goes here
		}
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
									onclick="$('#input2').val(''); return false;">clear</a>
							</div>
							<div class="clearfix"></div>
						</div>
						<textarea name="input" id="input2" rows="2" cols="80"></textarea>
					</div>
				</div>
			</div>

			<!-- advanced config: more options -->
			<div class="row " id="ex-more-options2">
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
								<!-- <div class="syntax-box">
									<input type="hidden" name="syntax" value="0"> <label
										for="syntax" class="checkbox"><input type="checkbox"
										name="syntax" id="syntax2" value="1" checked="checked">
										<span>syntax highlight</span></label>
								</div> -->
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="ex-more-options-box" style="padding-top: 4px">
								<!-- note -->
								<div style="margin-bottom: 5px">
									<i class="icon-pencil"></i> Output
									<!-- <div class="pull-right option-clear">
										<a href="#" class="rel-tooltip" title="Clear the note"
											onclick="$('#note2').val(''); return false;">clear</a>
									</div> -->
									<div class="clearfix"></div>
								</div>
								<div id=output2>
									
								</div>
								<!-- <textarea name="output2" id="output2" rows="2" cols="80" readonly="readonly"></textarea> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="g" style="text-align: center; height: 90px;">
				<!-- ideone_main_728x90_center -->
				<ins class="adsbygoogle"
					style="display: inline-block; width: 728px; height: 90px"
					data-ad-client="ca-pub-4453360425583535" data-ad-slot="4445601430"></ins>
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
			<!-- visible options + submit -->
			<div class="row">
				<div class="span8">
					<div class="footer">
						<!-- lang -->
						<input type="hidden" name="_lang" id="_lang2" value="27">
						<!-- show input -->
						<button type="button" class="btn footer-item rel-tooltip"
							data-toggle="button" title="" id="button-input2"
							data-original-title="Specify input (stdin)">
							<i class="icon-inbox"></i> stdin
						</button>
						<!-- more options -->
						<a href="#" id="button-more-options2" class=""><span
							class="more-options-less">&nbsp;options</span> </a>

						<!-- submit -->
						<div class="pull-right">
							<input type="hidden" name="run" value="1">
							<button type="submit" name="Submit" id="Submit2" tabindex="2"
								class="btn btn-success footer-item rel-tooltip"
								title="Compile the program">
								<!-- <i class="icon-cog-alt"></i>  -->
								Compile
							</button>
						</div>
						<!-- Translate -->
						<div class="pull-right">
							<input type="hidden" name="translate" value="2">
							<button type="submit" name="Submit" id="Translate2" tabindex="2"
								class="btn btn-success footer-item rel-tooltip"
								title="Translate the program">Translate</button>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
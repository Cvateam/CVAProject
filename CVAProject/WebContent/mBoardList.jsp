<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
</head>
<body>
<h2>[ 게시판 ]</h2>
<%-- 
<c:if test="${not empty loginId }" >
<p><a href="BoardServlet?action=writeForm"><img src="image/write_64.png">글쓰기</a></p>
</c:if>
 --%>

<form action="BoardServlet" method="post">
<select name="q" >
   <option value="title">제목</option>
   <option value="content">내용</option>
</select>
<input type="text" name="keyword" />
<input type="submit" value="검색" />
</form>

<!-- 이하 글 목록 출력 -->
<table>
<tr>
	<th>번호</th>
	<th style="width:220px;">제목</th>
	<th>작성일</th>
</tr>
<c:if test="${boardlist.size() == 0 }">
<tr>
	<td colspan="5">글이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="board" items="${boardlist}">

<tr>
	<td class="center">${board.boardnum}</td>
	<td class="title">
		<a href="BoardServlet?action=read&boardnum=${board.boardnum }">
		${board.title}
		</a>
	</td>
	<td>${board.inputdate}</td> 
</tr>
</c:forEach>
</table>

<div id="navigator">
<%-- <a href="BoardServlet?action=list&pg=${start-1}">◀</a> --%>

<c:forEach var="i" begin="0" end="${end-1 }"   >
	<c:if test="${start+i > end}">
		${i+1}
	</c:if>
	<c:if test="${start+i <= end}">
		<a href="BoardServlet?action=list&pg=${i+1}">${i+1}</a>
	</c:if>
</c:forEach>
<%-- <a href="BoardServlet?action=list&pg=${endPage+1}">▶</a> --%>
</div>
</body>
</html>

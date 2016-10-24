<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>Join</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css" />

<script>
function idCheckOpen() {
	window.open('idCheckForm.action','pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=240');
}

function formSubmit() {
	var form = document.getElementById('joinForm');
	var custid = document.getElementById('custid');
	var password = document.getElementById('password');
	var password = document.getElementById('password2');
	var name = document.getElementById('name');
	
	if (custid.value == '') {
		alert('ID를 입력하세요.');
		return;
	}
	if (password.value == '' || password2.value == '') {
		alert('비밀번호를 입력하세요.');
		return;
	}
	if (password.value != password2.value) {
		alert('비밀번호를 다시 확인해주세요.');
		return;
	}
	if (name.value == '') {
		alert('이름을 입력하세요.');
		return;
	}

	form.submit();
}

</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<s:if test="#session.loginId == null">
					<a href="<s:url value="/customer/loginForm.action" />">로그인</a>
					<a href="<s:url value="/customer/goJoinForm.action" />">회원가입</a>&nbsp;&nbsp;&nbsp;
				</s:if>
			</div>
		</div>	
	</div>

		<div id="contents"><!--내용-->
			<h1>회원가입<span>가입항목을 입력해 주세요</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="../img/icons/login_icon.png" class="login_icon" />
					<form id="joinForm" method="post" action="insertCustomer.action">
					<ul><!-- 회원가입 -->
						<li style="border-bottom:1px dotted #e7121c; padding-bottom:5px;"><img src="../images/ico_login.png" width="14" /> Welcome C.va</li>
						<li><input type="text" id="custid" readonly onClick="idCheckOpen()" placeholder="아이디" class="join_write" />
						<a href="#" class="id_check" onclick="idCheckOpen()">중복체크</a></li>
						<li><input type="password" id="password" placeholder="비밀번호" class="login_write" /></li>
						<li><input type="password" id="password2" placeholder="비밀번호 확인" class="login_write" /></li>
						<li><input type="text" id="name"  placeholder="이름" class="login_write" /></li>
						<li><input type="email" id="cust_email"  name="customer.email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a href="javascript:formSubmit()" class="btn_join">회원가입</a></li>
					</ul>
										
				</form>
			</div>
		</div>
</body>

</html>

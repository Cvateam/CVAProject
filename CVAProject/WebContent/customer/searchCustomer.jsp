<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css" />

<script>
	window.onload = function() {
		<s:if test="customer != null">
			<s:if test="customer.custid != null">
				alert('아이디는 : <s:property value="customer.custid" />');
				location.href="../main.action";
			</s:if>
			<s:if test="customer.password != null">
				alert('비밀번호는 : <s:property value="customer.password" />');
				location.href="../main.action";
			</s:if>
		</s:if>
	};
	
	// 아이디찾기/패스워드 찾기 폼 전환
	function viewChange(view) {
		if (view == 'id') {
			document.getElementById("viewidform").style.display= 'block';
			document.getElementById("viewpwdform").style.display= 'none'; 
		}	
		else {
			document.getElementById("viewidform").style.display= 'none';
			document.getElementById("viewpwdform").style.display= 'block'; 
		}
	}
	
	
	// 아이디 찾기
	function searchId() {
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		
		if(name.length == 0 || email.length==0) {
			alert("찾고자 하는 아이디의 이름과 이메일을 정확히 입력하세요");
			return;
		}

		document.getElementById("searchId").submit();
	}
	// 패스워드 찾기
	function searchPwd() {
		var cust_id = document.getElementById("cust_id").value;
		var cust_name = document.getElementById("cust_name").value;
		var cust_email = document.getElementById("cust_email").value;
		
		if(cust_id.length==0 || cust_name.length==0 || cust_email.length==0) {
			alert("정확한 값을 다시 입력해 주세요");
			return;
		}
		
		document.getElementById("searchPassword").submit();
	}
	
</script>
</head>

<body>
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<s:if test="#session.loginId == null">
					<a href="<s:url value="/customer/loginForm.action" />">로그인</a>
					<a href="<s:url value="/customer/goJoinForm.action" />">회원가입</a>&nbsp;&nbsp;&nbsp;
				</s:if>
				<s:else>
					<a href="<s:url value="/customer/logout.action" />">로그아웃</a>
					<a href="<s:url value="/customer/goUpdateForm.action" />">회원정보수정</a>&nbsp;&nbsp;&nbsp;
				</s:else>
			</div>
			<div id="navi">
			<a href="<s:url value="/main.action" />"><img src="../images/logo.png" width="150" /></a>
			
			</div>
			
		</div>



		<div id="contents"><!--내용-->
			<h1>고객센터<span>아이디, 패스워드 찾기</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="../images/login_icon.png" class="login_icon" />
					<s:form  id="searchId" action="searchCustomer" method="post" theme="simple">
					<ul id="viewidform" style="display:;"><!-- 아이디찾기 -->
						<li class=""><img src="../images/ico_login.png" width="14" /> Welcome C.VA</li>
						<li><a href="javascript:viewChange('id')" class="findtitle_btn tab">아이디 찾기</a>&nbsp;<a href="javascript:viewChange('pw')" class="findtitle_btn">패스워드 찾기</a></li>
						<li><input type="text" id="name"  name="customer.name" placeholder="이름" class="login_write" /></li>
						<li><input type="email" id="email" name="customer.email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a href="javascript:searchId()" class="btn_idfind">아이디 확인</a></li>
					</ul>
					</s:form>
					
					<s:form id="searchPassword" action="searchCustomer" method="post" theme="simple" >
					<ul id="viewpwdform" style="display:none;"><!-- 비밀번호찾기 -->
						<li class=""><img src="../images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="javascript:viewChange('id')" class="findtitle_btn">아이디 찾기</a>&nbsp;<a href="javascript:viewChange('pw')" class="findtitle_btn tab">패스워드 찾기</a></li>
						<li><input type="text" id="cust_id"  name="customer.custid" placeholder="아이디" class="login_write" /></li>
						<li><input type="text" id="cust_name" name="customer.name" placeholder="이름" class="login_write" /></li>
						<li><input type="email" id="cust_email"  name="customer.email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a href="javascript:searchPwd()" class="btn_idfind">비밀번호 찾기</a></li>
					</ul>
					</s:form>
			</div>
		</div>
	</div>
</body>

</html>

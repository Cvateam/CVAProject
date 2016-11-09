<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>C.VA</title>
<link rel="shortcut icon" type="image/png" href="images/faviconLogo.png">
<link
	href="//stx1.ideone.com/gfx2/libs/bootstrap/css/bootstrap-with-responsive-1200-only.min.css"
	rel="stylesheet">
<style type="text/css">
.each {
	border-style: dashed;
	padding: 0px, 0px, 200px, 0px;
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
<link href="css/converter.css" rel="stylesheet">
</head>
<body>
	<div class="navbar " id="primary-navigation">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar collapsed" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a href="/" class="brand scroll-page"><span
					style="background-image: url('images/Logomakr_1yE4r7.png');"></span></a>
				<div class="nav-collapse collapse " style="height: 0px;">
					<ul class="nav pull-right">
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
								<li class="dropdown-caret right"><span class="caret-outer"></span>
									<span class="caret-inner"></span></li>
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
												<a class="normal-link" href="/account/forgot">Can't sign
													in?</a>
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
		<h1>코딩 문제 게시판</h1>
		<div class="item">
			<s:iterator value="questiontList" status="status">
				<div class="each">
					<p>
						<s:property value="qno" />
						<s:property value="title" />
						<s:url id="readurl" value="questiondetail.action">
							<s:property value="lv" />
							<s:param name="qno" value="%{qno}" />
						</s:url>
					</p>
					<s:a href="%{readurl}">
						<img src="img/question/<s:property value='qno'/>.PNG" />
					</s:a>
				</div>
			</s:iterator>
		</div>


	</div>


</body>
</html>
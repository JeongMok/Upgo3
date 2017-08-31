<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<title>Login Board</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<!-- Jquery -->
<script type="text/javascript">
	function doLogin() {
		$('#loginForm').submit();
	}
	function onSignIn(googleUser) {

		var profile = googleUser.getBasicProfile();
		var id_token = googleUser.getAuthResponse().id_token;
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'googlelogin.action', true);
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			location.href = "home.action"
		};
		xhr.send('idtoken=' + id_token);

	}

	$(function(event) {

		//로그인 폼 전송
		$('#login').click(function(event) {
			event.preventDefault();
			var data = $("#loginForm").serialize();
			//로그인 실패 알림
			$.ajax({
				url : 'login.action',
				data : data,
				method : "POST",
				success : function(data, status, xhr) {
					if (data == 'error' || data.length == 0) {
						$('#login-alert').css({
							"display" : "block",
							"margin-top" : "5pt"
						})
						return;
					}
					$('#loginForm').submit();
				},
				error : function(xhr, status, err) {

				}
			})

		})

	})
</script>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

	<form:form action="./loginProcess" modelAttribute="member"
		id="loginForm" class="form-horizontal" method="post">
		<div class="container">
			<div class="form-group form-group-sm">
				<label class="col-sm-3 control-label" for="formGroupInputLarge">아이디</label>
				<div class="col-sm-5">
					<form:input path="mbrId" class="form-control" />
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-3 control-label" for="formGroupInputLarge">비밀번호</label>
				<div class="col-sm-5">
					<form:password path="mbrPasswd" class="form-control" />
					<div class="alert alert-danger" id="login-alert"
						style="display: none" role="alert">아이디와 비밀번호를 다시 한번 확인하세요.</div>
				</div>
			</div>
			
			<div class="form-group form-group-sm">
				<label class="col-sm-3 control-label" for="formGroupInputSmall"></label>
				<div class="col-sm-5">
					<input class="btn btn-success" type="submit" onclick="doLogin()"
						value="로그인"> <br> <br> <br> <br> <br>
					<br>
					<div>
						<h4>Social Login</h4>
					</div>
					<div class="g-signin2" data-onsuccess="onSignIn"></div>
				</div>

			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form:form>
</body>
</html>

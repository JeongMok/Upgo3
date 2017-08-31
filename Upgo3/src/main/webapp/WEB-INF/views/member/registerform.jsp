<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
	<h2>회원가입</h2>

	<!-- member or artist -->


	<!-- END -->

	<!-- registerForm -->
	<c:if test=""></c:if>
	<form:form action="signup" modelAttribute="member"
		class="form-horizontal" method="post">
		<div class="container">
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge">사용자 구분</label>
				<br>
				<form:radiobutton path="mbrUserType" value="0" />일반회원
				<form:radiobutton path="mbrUserType" value="1" />직원
				<form:radiobutton path="mbrUserType" value="2" />관리자
				</div>
				<br>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>아이디</b></label>
				<div class="col-sm-10">
					<form:input path="mbrId" placeholder="아이디는 뭐니" />
					<p>
						<form:errors path="mbrId" cssClass="error" />
					</p>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>비밀번호</b></label>
				<div class="col-sm-10">
					<form:password path="mbrPasswd" />
					<p>
						<form:errors path="mbrPasswd" cssClass="error" />
					</p>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>이름</b></label>
				<div class="col-sm-10">
					<form:input path="mbrName" placeholder="너 이름이 뭐니"/>
					<p>
						<form:errors path="mbrName" cssClass="error" />
					</p>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>핸드폰</b></label>
				<div class="col-sm-10">
					<form:input path="mbrPhone" placeholder="(-)빼고 핸드폰번호를 입력하세요."/>
					<p>
						<form:errors path="mbrPhone" cssClass="error" />
					</p>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>집어디?</b></label>
				<div class="col-sm-10">
					<form:input path="mbrAddress" placeholder="너 집어디야"/>
					<p>
						<form:errors path="mbrAddress" cssClass="error" />
					</p>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label" for="formGroupInputLarge"><b>이메일</b></label>
				<div class="col-sm-10">
					<form:input path="mbrEmail" placeholder="이메일 똑바로 입력해라" />
					<p>
						<form:errors path="mbrEmail" cssClass="error" />
					</p>
				</div>
			</div>
			<button type="submit">회원가입</button>
			<a href="/controller/home">취소</a>
		</div>
	</form:form>
	<!-- END -->
</body>
</html>

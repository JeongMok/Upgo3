<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Home</title>
<link rel="Stylesheet" href="/project/resources/styles/ordermain.css" />
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div id="added">
		<hr noshade>
		<h4>hyonvly</h4>
		<form action="searchMember.action" method="post">
		고객명 <input type="text" name="mbrName" id="mbrName" placeholder=★><br>
		연락처 <input type="text" name="mbrPhone" id="mbrPhone" placeholder=★>
		<input type="submit" id="search" value="Search-Member">
		</form>
		<table>
			<tr>
				<td>고객명자리</td>
				<td>주소자리</td>
				<td>전화번호</td>
			</tr>
		</table>
	</div>

</body>


</html>
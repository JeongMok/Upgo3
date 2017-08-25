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
$(function(){
	
	$('#search').on('click',function(event){
		event.preventDefault();
		var name = $('#mbrName').val();
		var phone = $('#mbrPhone').val();
		if(name.length==0){
			alert('이름을 입력하세요.');
			$('#mbrName').focus();
		} else if(phone.length==0){
			alert('전화번호를 입력하세요.')
			$('#mbrPhone').focus();
		} else {
			$.ajax({
				url:"searchMember.action",
				method : "POST",
				data : $('#searchForm').serialize(),
				success: function(data, status, xhr){
					$('#searchTable').load('memberTable.action', $('#searchForm').serialize());
				},
				error: function(xhr, status, err) {
					alert('11');
				}
			})
		}
	})
})
</script>
</head>

<body>
	<div id="added">
		<hr noshade>
		<h4>hyonvly</h4>
		<form id="searchForm" action="searchMember.action" method="post">
			고객명 <input type="text" name="mbrName" id="mbrName" placeholder=★><br>
			연락처 <input type="text" name="mbrPhone" id="mbrPhone" placeholder=★>
			<input type="submit" id="search" name="search" value="Search-Member">
		</form>
		<table id="searchTable">
		</table>
	</div>

</body>
</html>
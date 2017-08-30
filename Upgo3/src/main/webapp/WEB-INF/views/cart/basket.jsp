<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
</script>

<table id="marketTable"> 
	<tr>
		<td>고객명자리</td>
		<td>주소자리</td>
		<td>전화번호</td>
	</tr>
	<tr>
		<td><input id="mbrName" name="mbrName" type="button"
			value="${ member.mbrName }" onclick="sendCheckValue()"></td>
		<td><input id="mbrAddress" type="text"
			value="${ member.mbrAddress }"></td>
		<td><input id="mbrPhone" type="text" value="${ member.mbrPhone }"></td>
		<td></td>
	</tr>
</table>
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
	function openMbChk(){
		window.name = "parentForm";
		window.open("oms/searchMember.action",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}
</script>
</head>

<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<body>
	<p style="margin-left: 300px">* 최대 차량 등록은 5대 입니다 *</p>
	<div id="added">
		<hr noshade>
		<h2>고객정보</h2>
		
			<h4>주문고객</h4>  
			고객명  <input type="text" style="center" name="id" id="id"
					value= ><br> 주소  <input type="text" style="center" name="id" id="id"
					value=123 ><br> 연락처 <input type="text" style="center" name="id" id="id"
					value=123 >
			<input id="search" name="search" type="button" value="조회" onclick="openMbChk()">

		<p>
			설치고객 : <input id="typeOfCar" type="text">
			<button>조회</button>
		</p>
		<p>
			크기 : <select id="selectSize">
				<Option Selected>차량 크기 선택</Option>
				<Option>경차</Option>
				<Option>소형</Option>
				<Option>중형</Option>
				<Option>대형</Option>
				<Option>버스</Option>
				<Option>소형SUV</Option>
				<Option>SUV</Option>
			</select>
		</p>
	</div>
	<div id="list">
		<table id="myTable">
			<tr>
				<th>순번</th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>합계</th>
				<hr noshade>
			</tr>
		</table>
		<hr noshade>

	</div>

	<div id="numOfList">
		<b id="numOfCar"> 총 합계 : 0원</b> <br>
	</div>

	<div id="buttonList">
		<input id="inpark" type="button" class="btt" value="오더 확정"
			onclick="changeIn()"> </input> <input id="outpark" type="button"
			class="btt" value="견적저장" onclick="changeOut()"></input>
	</div>

</body>


</html>
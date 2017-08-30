<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// 멤버검색	
	function openMbChk() {
		window.name = "parentForm";
		window.open("oms/searchMember.action", "chkForm",
				"width=500, height=300, resizable = no, scrollbars = no");
	}
	// 제품목록
	function openProductList() {
		//window.name = "parentForm";
		window.open("oms/productList.action", "pdList",
				"width=1100, height=700, resizable=no, scrollbars = no");
	}
	//
	$(function() {
		$(document).ready(function() {
			alert("로딩 완료");
		});
		
		$('#but').click(function() {

			var count = $('tr[id^=prdtr]').length;
			var productList = [];
			var quantityList = [];
			var mbrId[];
			mbrId.= $('#mbrId');
			var ordName[] = $('#mbrName');
			var ordAddress[] = $('#mbrAddress');
			var ordPhone[] = $('mbrPhone');
			for(var i = 0; i < count; i++) {
				productList.push($('#prdtr'+i).attr("data-productcode"));
				quantityList.push($('#prdtr'+i).children('#prdQuantity').text());
			}
			
			$.ajaxSettings.traditional = true; // userId[]:aa13 -> userId:aaa
			$.ajax({
				//contentType :'application/json; charset=utf-8',
				//dataType :'json',
				type:'POST',
				url: 'oms/orderConfirm.action',
				data:{'productList':productList, 'quantityList':quantityList, 'mbrId':mbrId/* , ordName, ordAddress, ordPhone */},
				success: alert('성공')
			})
		})
	})
</script>
</head>

<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>

<body>
	<form id="submitform"
		action="oms/orderConfirm.action" method="post">
		<p style="margin-left: 300px"> ff</p>
		<div id="added">
			<hr noshade>
			<h2>고객정보</h2>

			<h4>주문고객</h4>
			고객명 <input type="text" style="" name="mbrName" id="mbrName"><br>
			주소 <input type="text" style="" name="mbrAddress" id="mbrAddress"><br>
			연락처 <input type="text" style="" name="mbrPhone" id="mbrPhone">
			<input type="hidden" id="mbrId">
			<input id="search" name="search" type="button" value="조회"
				onclick="openMbChk()">

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
			<p>
				<input type="button" value="제품 목록" id="searchProduct"
					name="searchProduct" onclick="openProductList()">
			</p>
		</div>
		<div id="list">
			<table id="myTable">
				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>합계</th>
					<hr noshade>
				</tr>
				<tbody id="myBody">
				
				</tbody>
			</table>
			<hr noshade>
		</div>
		<div id="numOfList">
			<b id="numOfCar"> 총 합계 : 0원</b> <br>
		</div>

		<div id="buttonList">
			<input id="submit" type="submit" class="btt" value="오더 확정"> <input
				id="outpark" type="button" class="btt" value="견적저장"></input>
		</div>
	</form>
		<button id="but">버튼</button>
</body>


</html>
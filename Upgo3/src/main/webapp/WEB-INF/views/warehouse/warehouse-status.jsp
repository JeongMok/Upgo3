<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/style/warehousetable.css">
<link rel="stylesheet" href="/resources/style/tabs.css">
<link rel="stylesheet" href="/resources/style/warehousestatetable.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {

		// tabs start
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
		// finish tabs

		// datepicker start(From ~ To , restrict some date)
		var dateFormat = "mm/dd/yy", 
		//Warehouse In Datepicker
		from1 = $("#warehouseInDateS").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {			
		to1.datepicker("option", "minDate", getDate(this));
		}), 
		
		to1 = $("#warehouseInDateF").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {
			from1.datepicker("option", "maxDate", getDate(this));
		});
		//
		
		//Warehouse Out Datepicker
		from2 = $("#warehouseOutDateS").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {			
		to2.datepicker("option", "minDate", getDate(this));
		}), 
		
		to2 = $("#warehouseOutDateF").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {
			from2.datepicker("option", "maxDate", getDate(this));
		});
		//
		
		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}
			return date;
		}
		// finish datepicker usage

	});
</script>
<script>
	$(function(){
		
	});
</script>
<style>

#warehousetablediv, #warehousetablediv2{
	position:relative;
	display:inline;
	width:18%;
}

#warehousestatetable, #warehousestatetable2{
    border-style: solid;
    border-width: 5px;
    font-size: 15px;
    margin: 2px;
    padding: 5px;
}

.tabletd{
    border-style: solid;
    border-width: 2px;
    font-size: 40px;
    text-align:center;
    margin: 2px;
    padding: 5px;
    width:130px;
    height:130px;    
}

#secter{
	width:20%;
	background-image:url(/resources/jpg/sector.jpg);
	position:relative;
	display:inline;
}

</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">창고 현황</a></li>
			<li><a href="#tabs-2">입고관리</a></li>
			<li><a href="#tabs-3">출고관리</a></li>
		</ul>
		<div id="tabs-1">
			<div id="warehousetablediv">
				<table id="warehousestatetable">
					<tr>
						<td class="tabletd" id="warehouse1">1</td>
						<td class="tabletd" id="warehouse2">2</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse3">3</td>
						<td class="tabletd" id="warehouse4">4</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse5">5</td>
						<td class="tabletd" id="warehouse6">6</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse7">7</td>
						<td class="tabletd" id="warehouse8">8</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse9">9</td>
						<td class="tabletd" id="warehouse10">10</td>
					</tr>
				</table>
			</div>
			<div id="secter"></div>
			<div id="warehousetablediv2">
				<table id="warehousestatetable2">
					<tr>
						<td class="tabletd" id="warehouse11">11</td>
						<td class="tabletd" id="warehouse12">12</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse13">13</td>
						<td class="tabletd" id="warehouse14">14</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse15">15</td>
						<td class="tabletd" id="warehouse16">16</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse17">17</td>
						<td class="tabletd" id="warehouse18">18</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse19">19</td>
						<td class="tabletd" id="warehouse20">20</td>
					</tr>
				</table>
			</div>
			<div>
				<table id="clickedWarehouseInfo">
					<thead>
						<tr>
							<th class="text-center">제품코드</th>
							<th class="text-center">이름</th>
							<th class="text-center">위치 수량 / 총 수량</th>
							<th class="text-center">가격</th>
							<th class="text-center">색상</th>
							<th class="text-center">규격</th>
							<th class="text-center">안전재고</th>
							<th class="text-center">설치시간</th>
							<th class="text-center">발주</th>
						</tr>
					</thead>
					<tbody>
						<c:if test = "${products ne null }">
						<c:forEach var="i" begin="0" end="${size - 1}" step="1">
						<tr>
							<td class="text-center">${products[i].prdCode}</td>
							<td class="text-center">${products[i].prdName}</td>
							<td class="text-center">${warehouselocations[i].quantity} / ${products[i].prdQuantity}</td>
							<td class="text-center">${products[i].prdPrice}</td>
							<td class="text-center">${products[i].prdColor}</td>
							<td class="text-center">${products[i].prdSize}</td>
							<td class="text-center">${products[i].prdSafeStock}</td>
							<td class="text-center">${products[i].prdInstallTime}</td>
							<td class="text-center"><input type="button" class="productorder" value="발주"></td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div id="tabs-2">
			<div>
				<p>
					Date: <input type="text" class="datepicker" id="warehouseInDateS"> ~
					Date: <input type="text" class="datepicker" id="warehouseInDateF">
					<input type="button" value="search" id="warehouseInSearch">
				</p>
				<table class="table-fill">
					<thead>
						<tr>
							<th class="text-center">입고일</th>
							<th class="text-center">제품코드</th>
							<th class="text-center">제품이름</th>
							<th class="text-center">재고수량</th>
							<th class="text-center">입고수량</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:if test = "${stores ne null }">
						<c:forEach var="i" begin="0" end="${storeSize - 1}" step="1">
						<tr>
							<td class="text-center">${stores[i].srDate}</td>
							<td class="text-center">${storeProducts[i].prdCode}</td>
							<td class="text-center">${storeProducts[i].prdName}</td>
							<td class="text-center">${storeProducts[i].prdQuantity}</td>
							<td class="text-center">${storeOrderDetails[i].odtquantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
				
			</div>
		</div>
		<div id="tabs-3">
			<div>
				<p>
					Date: <input type="text" class="datepicker" id="warehouseOutDateS"> ~
					Date: <input type="text" class="datepicker" id="warehouseOutDateF">
					<input type="button" value="search" id="warehouseOutSearch">
				</p>
				<table class="table-fill">
					<thead>
						<tr>
							<th class="text-center">출고일</th>
							<th class="text-center">제품코드</th>
							<th class="text-center">제품이름</th>
							<th class="text-center">창고위치</th>
							<th class="text-center">출고수량</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:if test = "${releases ne null }">
						<c:forEach var="i" begin="0" end="${releaseSize - 1}" step="1">
						<tr>
							<td class="text-center">${releases[i].srDate}</td>
							<td class="text-center">${releaseProducts[i].prdCode}</td>
							<td class="text-center">${releaseProducts[i].prdName}</td>
							<td class="text-center">${releaseProducts[i].prdQuantity}</td>
							<td class="text-center">${releaseOrderDetails[i].odtQuantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>
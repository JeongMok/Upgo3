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
		
		// Change Table Background Color by Warehouse Status
		var ware = ${wlTotalQuantityBywlNo};
		$("#warehousestatetable").find("td").each(function(index){			
			if(ware[index]>39){
				$(this).css("background","red");	
			}else if(ware[index]>24){
				$(this).css("background","orange");
			}else{
				$(this).css("background","green");
			}
		})
		$("#warehousestatetable2").find("td").each(function(index){			
			if(ware[index]>40){
				$(this).css("background","red");
			}else if(ware[index]>25){
				$(this).css("background","orange");
			}else{
				$(this).css("background","green");
			}
		})
		//////////////////////////////////////////////////////
		
		////////////Warehouse Status(been clicked)
		$("#warehousestatetable").on("click", "td", function() {
			var warehouseno = $(this).attr("attr");
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action",
		        data : {"warehouseno":warehouseno} ,
		        success: function(data,status,xhr){
		        	$("#clickedWarehouseInfo").load('warehouseStatus.action',{ "warehouseno" : warehouseno});
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }
		    });
		});
		$("#warehousestatetable2").on("click", "td", function(index) {
			var warehouseno = $(this).attr("attr");
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action", 
		        data : {"warehouseno":warehouseno} ,
		        success: function(data,status,xhr){
		        	$("#clickedWarehouseInfo").load('warehouseStatus.action',{ "warehouseno" : warehouseno}); 
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    }); 
		});
		////////////////////////////////////////////////////////////
		$("#warehouseInSearch").on("click",function() {
			var inDateS = $('#warehouseInDateS').val();
			var inDateF = $('#warehouseInDateF').val();
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action", 
		        success: function(data,status,xhr){
		        	$("#warehouseIn").load('warehouseInAndOut.action',{ "DateS" : inDateS, "DateF" : inDateF, "type":0}); 
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    }); 
		});
		
		$("#warehouseOutSearch").on("click",function() {
			var outDateS = $('#warehouseOutDateS').val();
			var outDateF = $('#warehouseOutDateF').val();
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action", 
		        success: function(data,status,xhr){
		        	$("#warehouseOut").load('warehouseInAndOut.action',{ "DateS" : outDateS, "DateF" : outDateF, "type":1}); 
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    }); 
		});
		
		$("#warehouseIn").on("click", "tr" ,function() {
			var clickedProduct = $(this).find(".prdCode").attr("prdCode");
			alert(clickedProduct);
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action", 
		        success: function(data,status,xhr){
		        	$("#clickedProductInfoIn").load('clickedProductInfoInInAndOut.action',{ "prdCode" : clickedProduct, "type": 0 }); 
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    }); 
		});
		
		$("#warehouseOut").on("click", "tr" ,function() {
			var clickedProduct = $(this).find(".prdCode").attr("prdCode");
			alert(clickedProduct);
			$.ajax({
		        type:"POST",
		        url:"alwaysAnswerSuccess.action", 
		        success: function(data,status,xhr){
		        	$("#clickedProductInfoOut").load('clickedProductInfoInInAndOut.action',{ "prdCode" : clickedProduct, "type": 1 }); 
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    }); 
		});
		
		
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
						<td class="tabletd" id="warehouse1" attr="1">1</td>
						<td class="tabletd" id="warehouse2" attr="2">2</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse3" attr="3">3</td>
						<td class="tabletd" id="warehouse4" attr="4">4</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse5" attr="5">5</td>
						<td class="tabletd" id="warehouse6" attr="6">6</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse7" attr="7">7</td>
						<td class="tabletd" id="warehouse8" attr="8">8</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse9" attr="9">9</td>
						<td class="tabletd" id="warehouse10" attr="10">10</td>
					</tr>
				</table>
			</div>
			<div id="secter"></div>
			<div id="warehousetablediv2">
				<table id="warehousestatetable2">
					<tr>
						<td class="tabletd" id="warehouse11" attr="11">11</td>
						<td class="tabletd" id="warehouse12" attr="12">12</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse13" attr="13">13</td>
						<td class="tabletd" id="warehouse14" attr="14">14</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse15" attr="15">15</td>
						<td class="tabletd" id="warehouse16" attr="16">16</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse17" attr="17">17</td>
						<td class="tabletd" id="warehouse18" attr="18">18</td>
					</tr>
					<tr>
						<td class="tabletd" id="warehouse19" attr="19">19</td>
						<td class="tabletd" id="warehouse20" attr="20">20</td>
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
							<td class="text-center">${warehouselocations[i].wlQuantity} / ${products[i].prdQuantity}</td>
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
				<table class="table-fill" id="warehouseIn">
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
						<tr class="storereleasedata">
							<td class="text-center" >${stores[i].srDate}</td>
							<td class="prdCode" prdCode="${storeProducts[i].prdCode}">${storeProducts[i].prdCode}</td>
							<td class="text-center" >${storeProducts[i].prdName}</td>
							<td class="text-center" >${storeProducts[i].prdQuantity}</td>
							<td class="text-center" >${storeOrderDetails[i].odtQuantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
				<table id="clickedProductInfoIn">
					<tbody>
						<c:if test = "${clickedProduct ne null }">
						<tr>
							<td class="text-center">제품 코드</td>
							<td class="text-center">${clickedProduct.prdCode}</td>
						</tr>
						<tr>
							<td class="text-center">제품 이름</td>
							<td class="text-center">${clickedProduct.prdName}</td>
						</tr>
						<tr>
							<td class="text-center">제품 가격</td>
							<td class="text-center">${clickedProduct.prdPrice}</td>
						</tr>
						<tr>
							<td class="text-center">제품 총 수량</td>
							<td class="text-center">${clickedProduct.prdQuantity}</td>
						</tr>
						<tr>
							<td class="text-center">제품 카테고리</td>
							<td class="text-center">${clickedProduct.prdCategory}</td>
						</tr>
						<tr>
							<td class="text-center">제품 색상</td>
							<td class="text-center">${clickedProduct.prdColor}</td>
						</tr>
						<tr>
							<td class="text-center">제품 사이즈</td>
							<td class="text-center">${clickedProduct.prdSize}</td>
						</tr>
						<tr>
							<td class="text-center">제품 안전재고</td>
							<td class="text-center">${clickedProduct.prdSafeStock}</td>
						</tr>
						<tr>
							<td class="text-center">제품 설치시간</td>
							<td class="text-center">${clickedProduct.prdInstallTime}</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div id="tabs-3">
			<div>
				<p>
					Date: <input type="text" class="datepicker" id="warehouseOutDateS"> ~
					Date: <input type="text" class="datepicker" id="warehouseOutDateF">
					<input type="button" value="search" id="warehouseOutSearch">
				</p>
				<table class="table-fill" id="warehouseOut">
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
							<td class="text-center" >${releases[i].srDate}</td>
							<td class="prdCode" prdCode="${releaseProducts[i].prdCode}">${releaseProducts[i].prdCode}</td>
							<td class="text-center" >${releaseProducts[i].prdName}</td>
							<td class="text-center" >${releaseProducts[i].prdQuantity}</td>
							<td class="text-center" >${releaseOrderDetails[i].odtQuantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
				<table id="clickedProductInfoOut">
					<tbody>
						<c:if test = "${clickedProduct ne null }">
						<tr>
							<td class="text-center">제품 코드</td>
							<td class="text-center">${clickedProduct.prdCode}</td>
						</tr>
						<tr>
							<td class="text-center">제품 이름</td>
							<td class="text-center">${clickedProduct.prdName}</td>
						</tr>
						<tr>
							<td class="text-center">제품 가격</td>
							<td class="text-center">${clickedProduct.prdPrice}</td>
						</tr>
						<tr>
							<td class="text-center">제품 총 수량</td>
							<td class="text-center">${clickedProduct.prdQuantity}</td>
						</tr>
						<tr>
							<td class="text-center">제품 카테고리</td>
							<td class="text-center">${clickedProduct.prdCategory}</td>
						</tr>
						<tr>
							<td class="text-center">제품 색상</td>
							<td class="text-center">${clickedProduct.prdColor}</td>
						</tr>
						<tr>
							<td class="text-center">제품 사이즈</td>
							<td class="text-center">${clickedProduct.prdSize}</td>
						</tr>
						<tr>
							<td class="text-center">제품 안전재고</td>
							<td class="text-center">${clickedProduct.prdSafeStock}</td>
						</tr>
						<tr>
							<td class="text-center">제품 설치시간</td>
							<td class="text-center">${clickedProduct.prdInstallTime}</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
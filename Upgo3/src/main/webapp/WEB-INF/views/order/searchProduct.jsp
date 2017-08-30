<%@page import="com.example.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<<<<<<< HEAD
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	
	$(function() {
		
		function subTotal(element, amountValue) {
			var price = $(element).closest("tr").find('input[name=prdPrice]');
			var priceValue = price.val();
			
			var sum = $(element).closest("tr").find('input[name=sum]');
			sum.val(priceValue * amountValue);
		}
		
		$("tr[data-productcode] input[value=' + ']").on('click', function(event) {
			var amount = $(this).closest("tr").find('input[name=amount]');
			var amountValue = amount.val();
			amount.val(++amountValue);
			
			subTotal(this, amountValue);
		});
		
		$("tr[data-productcode] input[value=' - ']").on('click', function(event) {
			var amount = $(this).closest("tr").find('input[name=amount]');
			var amountValue = amount.val();
			if (amountValue > 0) {
				amount.val(--amountValue);
				subTotal(this, amountValue);
			}	
		});
		
		$("tr[data-productcode] input[value='담기']").on('click', function(event) {
			var code = $(this).closest("tr").find('input[name=prdCode]');
			var name = $(this).closest("tr").find('input[name=prdName]');
			var amount = $(this).closest("tr").find('input[name=amount]');
			var sum = $(this).closest("tr").find('input[name=sum]');
			
			/* 제품코드 제품명 단가 수량 합계 */
			var codeValue = code.val();
			var nameValue = name.val();
			var amountValue = amount.val();
			var sumValue = sum.val();
			
			$("#prdCode", opener.document).val(codeValue);
			$("#prdName", opener.document).val(nameValue);
			$("#prdPrice", opener.document).val($("#prdPrice", document).val());
			$("#prdQuantity", opener.document).val(amountValue);
			$("#prdTotalSum", opener.documnet).val(sumValue);
			
			
		});
		
	});
=======
<body onload="init();">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	var price;
	var amount;
	function init () {
		price = document.getElementById("prdPrice").value;
		amount = document.getElementById("amount").value;
		sum = document.getElementById("sum").value = price;
		change();
	}
>>>>>>> branch 'master' of https://github.com/JeongMok/Upgo3.git

<<<<<<< HEAD
=======
	function add () {
		qt = document.getElementById("amount");
		sum = document.getElementById("sum");
		qt.value ++ ;
>>>>>>> branch 'master' of https://github.com/JeongMok/Upgo3.git

<<<<<<< HEAD
	</script>
	<table id="productTable">
=======
		sum.value = parseInt(qt.value) * price;
	}

	function del () {
		qt = document.getElementById("amount");
		sum = document.getElementById("sum"); 
			if (qt.value > 1) {
				qt.value -- ;
				sum.value = parseInt(qt.value) * price;
			};
	}

	function change () {
		qt = document.getElementById("amount");
		sum = document.getElementById("sum"); 

			if (qt.value < 0) {
				qt.value = 0;
			}
		sum.value = parseInt(qt.value) * price;
	}  
</script>t
<table id="productTable">
	<tr>
		<td>코드번호</td>
		<td>상품명</td>
		<td>가격</td>
		<td>재고 수량</td>
		<td>구매 수량</td>
		<td>합계</td>
	</tr>
	<c:forEach var="product" items="${products}">
>>>>>>> branch 'master' of https://github.com/JeongMok/Upgo3.git
		<tr>
			<td><input id="prdCode" name="prdCode" type="text" value="${ product.prdCode }" onclick="sendCheckValue()"></td>
			<td><input id="prdName" type="text" value="${ product.prdName }"></td>
			<td><input id="prdPrice" type="text" value="${ product.prdPrice }"></td>
			<td><input id="prdQuantity" type="text" value="${ product.prdQuantity }"></td>
			<td><input type="text" id = "amount" name="amount" size=5 value="0"
				onchange="change();"><input type="button" value=" + "
				onclick="add();"><input type="button" value=" - "
				onclick="del();"></td>
			<td><input type="text" id="sum" name="sum" readonly>원
			<td>
		</tr>
<<<<<<< HEAD
		<c:forEach var="product" items="${products}">
			<tr data-productcode="${product.prdCode}">
				<td><input id="prdCode" name="prdCode" type="text" value="${ product.prdCode }"></td>
				<td><input id="prdName" name="prdName" type="text" value="${ product.prdName }"></td>
				<td><input id="prdPrice" name="prdPrice" type="text" value="${ product.prdPrice }"></td>
				<td><input id="prdQuantity" name="prdQuantity" type="text" value="${ product.prdQuantity }"></td>
				<td>
					<input type="hidden" name="productId" value="${product.prdCode}"> 
					<input type="text" id="amount" name="amount" size=4 value="0"> 
					<input type="button" value=" + ">
					<input type="button" value=" - ">
				</td>
				<td><input type="text" id="sum" name="sum" readonly>원</td>
				<td><input type="button" id="save" name="save" value="담기"></td>
			</tr>
		</c:forEach>
	</table>
	<input type="text" name="totalAmount" value="0" size="3">
	<input type="text" name="totalSum" size="11" readonly>원
	<input type="hidden" value="${product.prdCode }" name="" id="duvud123">
=======
	</c:forEach>
</table>
<input type="text" name="amount" value="0" size="3"
	onchange="change();">
<input type="text" name="sum" size="11" readonly>원
>>>>>>> branch 'master' of https://github.com/JeongMok/Upgo3.git
</body>
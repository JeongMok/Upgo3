<%@page import="com.example.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body onload="init();">
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		var price;
		var amount;
		function init() {
			price = document.getElementById("prdPrice").value;
			amount = document.getElementById("amount").value;
			sum = document.getElementById("sum").value = price;
			change();
		}

		function add(element) {
		    var $btnAdd = $(element);
		    
		    var $amount = $btnAdd.closest('input[name="amount"]');
		    var $price = $btnAdd.closest('input[name="price"]');
		    var $sum = $btnAdd.closest('input[name="sum"]');
		    
		    $amount.val=$amount.val+1;
		    $sum.val(parseInt($qt.val()) * $price.val());
		}

		function del() {
			qt = document.getElementById("amount");
			sum = document.getElementById("sum");
			if (qt.value > 0) {
				qt.value--;
				sum.value = parseInt(qt.value) * price;
			}
			;
		}

		function change(element) {
		    var $amount = $btnAdd.closest('input[name="amount"]');
		    var $price = $btnAdd.closest('input[name="price"]');
		    var $sum = $btnAdd.closest('input[name="sum"]');
		    
		    
			if ($amount.value() < 0) {
				$amount.value() = 0;
			}
			$sum.value() = parseInt($amount.value() * $price());
		}
	</script>



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
        <tr>
            <td><input id="prdCode" name="prdCode" type="text"
                value="${ product.prdCode }" onclick="sendCheckValue()"></td>
            <td><input id="prdName" type="text"
                value="${ product.prdName }"></td>
            <td><input id="prdPrice" type="text" name="price"
                value="${ product.prdPrice }"></td>
            <td><input id="prdQuantity" type="text"
                value="${ product.prdQuantity }"></td>
            <td><input type="hidden" name="productId"
                value="${product.prdCode}"> <input type="text" id="amount"
                name="amount" size=5 value="0" onchange="change(this);"><input
                type="button" value=" + " onclick="add(this);"><input
                type="button" value=" - " onclick="del();"></td>
            <td><input type="text" id="sum" name="sum" readonly>원
            <td>
        </tr>
    </c:forEach>
	</table>
	<input type="text" name="amount" value="0" size="3"
		onchange="change();">
	<input type="text" name="sum" size="11" readonly>원
</body>
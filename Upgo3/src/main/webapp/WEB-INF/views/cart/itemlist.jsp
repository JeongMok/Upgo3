<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

// modal popup
$(function(){
    $("#product_Detail").click(function(){
        $('div.modal').modal({remote : 'layer.html'});
    })
})
</script>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->

<body>
	<div>LIST</div>
	<!-- Table -->
	<table class="table table-hover">
		<tr>
			<th>품 명</th>
			<th>가 격</th>
			<th>색 상</th>
			<th>잔여수량</th>
		</tr>
		<c:forEach var="product" items="${product}">
			<form>
				<input type="hidden" name="PrdCode" id="product_no" value="${product.prdCode }">
				<input type="hidden" name="PrdCategory" id="product_category" value="${product.prdCategory }">
				<input type="hidden" name="PrdSize" id="product_size" value="${product.prdSize }">
				<tr>
					<td><a href="#" id="product_Detail">${product.prdName }</a></td>
					<td>${product.prdPrice }</td>
					<td>${product.prdColor }</td>
					<td>${product.prdQuantity }</td>
				</tr>
			</form>
		</c:forEach>
	</table>
	
	<!-- modal popup -->
	<div class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	        <!-- remote ajax call이 되는영역 -->
	    </div>
	  </div>
	</div>
	<!-- /modal popup -->
	
</body>
</html>

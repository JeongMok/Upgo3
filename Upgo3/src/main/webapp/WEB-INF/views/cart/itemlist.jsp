<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

// modal popup
$(function(){
	
	// 창 띄우기
    $("a[id^=product_Detail]").click(function(){
    	
		var code = $(this).attr('data-prdNo');    	
		
    	$('.modal-title').text($(this).text());
        
        $.ajax({
			url: "productDetail.action",
			method: "POST",
			async: false,
			dataType: "JSON",
			data: $('#prdForm'+code).serialize(),	// form 데이터를 전송형식으로 변경
			success: function(data, status, xhr){
				$('#price').text("가격 : "+data.prdPrice);
				$('#color').text("색상 : "+data.prdColor);
				$('#size').text("크기 : "+data.prdSize);
				$('#modal_code').val(data.prdCode);
				$('#modal_category').val(data.prdCategory);
				$('#modal_name').val(data.prdName);
				$('#modal_quantity').val(data.prdQuantity);
				$('div.modal').modal({backdrop: 'static', keyboard: false});
			},
			error: function(xhr, status, err) {
				
				alert("안되냐");
				
			}
		})
		
		event.preventDefault();
        
    })
    
    // 수량 증가
    $("#increase").click(function() {
    	var num = parseInt($("#amount span").text());
    	num = num+1;
	 	$("#amount span").text(num);
    })
    
    // 수량 감소
    $("#decrease").click(function() {
    	if ($("#amount span").text() != "1") {
    		var num = parseInt($("#amount span").text());
        	num = num-1;
    	 	$("#amount span").text(num);	
    	} else if ($("#amount span").text() == "1") {
    		return;
    	}
    })
    
    // 장바구니 담기
    $("#addcart").click(function() {
    	alert($("#modal_quantity").val());
    	$("#amount span").text("1");
    })
    
    // 닫기 버튼
    $("#close").click(function() {
    	$("#amount span").text("1");
    })
    
})
</script>



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
			<form id="prdForm${ product.prdCode }">
				<input type="hidden" name="prdCode" id="product_no" value="${product.prdCode }">
				<input type="hidden" name="prdCategory" id="product_category" value="${product.prdCategory }">
				<input type="hidden" name="prdSize" id="product_size" value="${product.prdSize }">
				<input type="hidden" name="prdName" id="product_name" value="${product.prdName }">
				<input type="hidden" name="prdPrice" id="product_price" value="${product.prdPrice }">
				<input type="hidden" name="prdColor" id="product_color" value="${product.prdColor }">
				<input type="hidden" name="prdQuantity" id="product_quantity" value="${product.prdQuantity }">
			</form>
			<tr>
				<td><a href="#" id="product_Detail" data-prdNo='${ product.prdCode }'>${product.prdName }</a></td>
				<td>${product.prdPrice }</td>
				<td>${product.prdColor }</td>
				<td id="PrdQuantity">${product.prdQuantity }</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- modal popup -->
		<div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header" style="height: 50px;">
				  <!-- 닫기(x) 버튼 -->
				  <!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
				  <!-- header title -->
				  <div style="width: 50%; float: left">
				  <h4 class="modal-title">Header</h4>
				  </div>
				  <div id="amount" style="width: 50%; float: left">
				  	수량&nbsp;
				  	<a href="#" id="decrease">&lt;</a><span>1</span><a href="#" id="increase">&gt;</a>
				  </div>
				</div>
				<!-- body -->
				<div class="modal-body">
				    <h5 id="price"></h5>
				    <h5 id="color"></h5>
				    <h5 id="size"></h5>
				    <input type="hidden" name="prdCode" id="modal_code">
					<input type="hidden" name="prdCategory" id="modal_category">
					<input type="hidden" name="prdName" id="modal_name">
					<input type="hidden" name="prdQuantity" id="modal_quantity">
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="addcart" data-dismiss="modal">장바구니 담기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="close">닫기</button>
				</div>
		    </div>
		  </div>
		</div>
	<!-- /modal popup -->
	
</body>
</html>

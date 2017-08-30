<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
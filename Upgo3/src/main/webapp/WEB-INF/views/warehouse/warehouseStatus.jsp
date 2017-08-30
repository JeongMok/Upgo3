<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
							<td class="text-center" prdCode="${storeProducts[i].prdCode}">${stores[i].srDate}</td>
							<td class="text-center" prdCode="${storeProducts[i].prdCode}">${storeProducts[i].prdCode}</td>
							<td class="text-center" prdCode="${storeProducts[i].prdCode}">${storeProducts[i].prdName}</td>
							<td class="text-center" prdCode="${storeProducts[i].prdCode}">${storeProducts[i].prdQuantity}</td>
							<td class="text-center" prdCode="${storeProducts[i].prdCode}">${storeOrderDetails[i].odtQuantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
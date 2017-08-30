<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
							<td class="text-center" prdCode="${releaseProducts[i].prdCode}">${releases[i].srDate}</td>
							<td class="text-center" prdCode="${releaseProducts[i].prdCode}">${releaseProducts[i].prdCode}</td>
							<td class="text-center" prdCode="${releaseProducts[i].prdCode}">${releaseProducts[i].prdName}</td>
							<td class="text-center" prdCode="${releaseProducts[i].prdCode}">${releaseProducts[i].prdQuantity}</td>
							<td class="text-center" prdCode="${releaseProducts[i].prdCode}">${releaseOrderDetails[i].odtQuantity}</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
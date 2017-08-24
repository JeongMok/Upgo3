<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<body>
	<div>LIST</div>
	<!-- Table -->
	<table class="table table-hover">
		<tr>
			<th>N o</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>날 짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<c:forEach var="board" items="${board}">
				<tr>
					<td>${board.boardNo }</td>
					<td><a
						href="detail/${board.boardNo}&${board.boardWriter}">${board.boardTitle }</a></td>
					<td>${board.boardWriter }</td>
					<td>${board.boardDate }</td>
					<td>${board.boardReadCount }</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
</body>
</html>

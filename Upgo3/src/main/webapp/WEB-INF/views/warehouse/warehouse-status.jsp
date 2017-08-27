<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../resources/style/warehousetable.css">
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
		from = $("#dateS").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {			
		to.datepicker("option", "minDate", getDate(this));
		}), 
		
		to = $("#dateF").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

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

</script>
<style>
.ui-tabs-vertical {
	width: 55em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 40em;
}
.
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
			<div>
				<p>
					Date: <input type="text" class="datepicker" id="dateS"> ~
					Date: <input type="text" class="datepicker" id="dateF">
					<input type="button" value="search" id="searchinput">
				</p>
				<table class="table-fill">
					<thead>
						<tr>
							<th class="text-center">입고일</th>
							<th class="text-center">제품코드</th>
							<th class="text-center">제품이름</th>
							<th class="text-center">창고위치</th>
							<th class="text-center">입고수량</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:if test = "${warehouses ne null }">
						<c:forEach var="warehouse" items="${warehouses}">
						<c:if test = "${warehouse.type eq 0 }">
						<tr>
							<td class="text-center">${warehouse.date}</td>
							<td class="text-center">${warehouse.date}</td>
							<td class="text-center">${warehouse.date}</td>
							<td class="text-center">${warehouse.date}</td>
							<td class="text-center">${warehouse.date}</td>
						</tr>
						</c:if>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div>
			</div>
		</div>
		<div id="tabs-2">
			<h2>Content heading 2</h2>
			<p>ddus.</p>
		</div>
		<div id="tabs-3">
			<h2>Content heading 3</h2>
			<p>dddd.</p>
			<p>ddddt.</p>
		</div>
	</div>
</body>
</html>
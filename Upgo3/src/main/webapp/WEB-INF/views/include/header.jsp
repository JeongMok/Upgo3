<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<head>
<meta name="google-site-verification"
	content="jmcSA7d-dnNJUWyZJBghach5uXuiSGdvmGkD0cNDRDA" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.angularjs.org/latest/angular.min.js"></script>
</head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="93374727909-aob5oi922l48hrnkv9pl01tv0jp5rk6h.apps.googleusercontent.com">

<script type="text/javascript">
	/* $(function(event) {
		countMessage()
		//MessageBox Count
		function countMessage() {
			$.ajax({
				url : "/controller/countbell",
				success : function(data, status, xhr) {
					$('#count').text(data)
					setTimeout(function() {
						countMessage();
					}, 2000);
				},
				error : function(xhr, status, err) {

				}
			})
		} */

		//화면의 어느 부분이라도 클릭하면 호출되는 메서드 설정
		/* $(document).on('click', function(event) {
			$('#divMessage').remove();
		});

		function getTop() {
			var top = document.getElementById("message");
			var topPos = 2 + top.offsetHeight;
			while (top.tagName.toLowerCase() != "body"
					&& top.tagName.toLowerCase() != "html") {
				topPos = topPos + top.offsetTop;//offsetTop : 상위 요소와의 거리
				top = top.offsetParent; //상위 요소를 현재 요소에 대입
			}
			return topPos;
		}
		function getLeft() {
			var left = document.getElementById("message");

			var leftPos = 0;
			while (left.tagName.toLowerCase() != "body"
					&& left.tagName.toLowerCase() != "html") {
				leftPos += left.offsetLeft;//left와 left의 부모 요소 사이의 거리
				left = left.offsetParent;//left의 부모 요소
			}
			return leftPos;

		} */

		/*새로운 글 등록 확인*/
		/* $('#message').click(
				function(event) {
					$('#divMessage').remove();
					event.preventDefault();
					$.ajax({
						url : '/controller/newbell',
						method : 'GET',
						success : function(data, status, xhr) {
							if (data == "error" || data.length == 0) {
								return;
							}
							//외부박스
							var outerBox = $('<div></div>');
							outerBox.attr('id', 'divMessage');
							outerBox.css({
								"border" : 'solid 1px black',
								"background-color" : "white",
								"width" : "auto",
								"height" : 300,
								"overflow" : "scroll",
								"position" : "absolute",
								"left" : getLeft(),
								"top" : getTop(),
								"overflow-x" : "hidden"
							});
							$('body').append(outerBox);
							//내부 박스 만들기
							$.each(data, function(index, id) {
								let outBox = $('<div></div>')
								$('<a href=""></a>').css({
									"padding-left" : 5,
									"padding-top" : 2,
									"padding-bottom" : 2,
									"width" : "97%"
								}).attr('id', 'goBoard').text(
										id + "<New Board>").on(
										'mousedown',
										function(event) {
											$('#message').val($(this).text());
											$('#divMessage').css('display',
													'none');
										}).on(
										'mouseover',
										function(event) {
											$(this).css('background-color',
													'lightgray');
										}).on('mouseout', function(event) {
									$(this).css('background-color', 'white');
								}).append(outBox).appendTo(outerBox);
							});
						},
						error : function(xhr, status, err) {
							alert("실패")
						}
					})
				});
	}) */
</script>

<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
</script>
<div class="jumbotron">
	<h2>Small Project</h2>
	<ul class="nav nav-pills">
		<li role="presentation"><a href="/controller/home">메인</a></li>
		<!-- <li role="presentation"><a href="/controller/list">게시판</a></li> -->
		<c:if test="${loginmember eq null }">
			<li role="presentation"><a href="/controller/login">로그인</a></li>
			<li role="presentation"><a href="/controller/signup">회원가입</a></li>
		</c:if>
		<li role="presentation"><a href="ordermain.action">효현박</a></li>
		<li role="presentation"><a href="itemList.action">정목각</a></li>
		<c:if test="${loginmember ne null }">
			<li role="presentation"><a href="/controller/logout"
				onClick="googleOut()">로그아웃</a></li>
			<script>
				function googleOut() {
					var auth2 = gapi.auth2.getAuthInstance();
					auth2.signOut().then(function() {
						location.href = "logout";
					});
				}

				function onLoad() {
					gapi.load('auth2', function() {
						gapi.auth2.init();
					});
				}
			</script>
			<script src="https://apis.google.com/js/platform.js?onload=onLoad"
				async defer></script>
			<li role="presentation">
			<a href="newbell" id="message"
				style="color: forestgreen; font-size: 1.5em"
				class="glyphicon glyphicon-leaf"></a>
				</li>
			<li role="presentation"><span class="badge" id="count">0</span>
			</li>
		</c:if>

	</ul>
</div>


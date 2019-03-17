<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<!-- bootstrap-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!-- 애들 정의 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/kim.css" />

<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(function() {
		//마지막 스크롤 값을 저장할 lastScroll 변수
		var lastScroll = 0;
		$(window).scroll(function(event) { //스크롤이 움직일때 마다 이벤트 실행
			//현재 스크롤의 위치를 저장할 st 변수
			var st = $(this).scrollTop();
			//스크롤 상하에 따른 반응 정의
			if (st > lastScroll) {
				if ($(window).scrollTop() >= 10) { //스크롤이 아래로 200px 이상 내려갔을때 실행되는 이벤트 정의
					$('#btnTop').css('display', 'none');
					$('#btnTop').css('top', '-30px');
				}
			} else {
				//스크롤이 위로 올라갔을때 실행되는 이벤트 정의
				$('#btnTop').css('display', 'block');
			}
		});
	});
</script>
</head>

<body>
	<div id="wrap">
		<%@include file="fixsection/header.jsp"%>

		<%@include file="floatSection/production.jsp"%>

		<%@include file="fixsection/footer.jsp"%>
	</div>
</body>
</html>
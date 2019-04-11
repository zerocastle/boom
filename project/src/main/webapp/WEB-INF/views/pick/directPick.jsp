<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직플 선택하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="wrap">

	<div>====== 직플레이스 정보들 ======</div>

	<ul class="partner">
		<c:forEach items="${partnerList}" var="list">
			<li class="partnerLit">${list.company_number}<span>${list.part_name}</span>
				${list.boss_name} ${list.part_phone} ${list.zip_code} <span>${list.road_name}</span>
				<span>${list.addr}</span> ${list.detail_addr} ${list.reg_date}
			</li>
		</c:forEach>
	</ul>

	<div>
		<input id="result" type="text" />
		<button id="send">전송</button>
	</div>

</body>

<script>
	$(function() {
		var rasult = $('#result');
		$('.partnerLit').click(function() {
			var ready = $(this);
			var part_name = ready.find('span').eq(0);
			var road_name = ready.find('span').eq(1);
			var list_addr = ready.find('span').eq(2);
			
		

		})
	})
</script>

</html>
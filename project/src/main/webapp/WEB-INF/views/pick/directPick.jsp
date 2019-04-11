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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body class="wrap">

	<div>====== 직플레이스 정보들 ======</div>

	<ul class="partner">
		<c:forEach items="${partnerList}" var="list">
			<li class="partnerLit"><a href=''>${list.company_number}<span>${list.part_name}</span>
					${list.boss_name} ${list.part_phone} ${list.zip_code} <span>${list.road_name}</span>
					<span>${list.addr}</span> ${list.detail_addr}
			</a></li>
		</c:forEach>
	</ul>

	<div>
		<input id="kk" type="text" value="" style="width: 400px;"
			readonly="readonly" />
		<button id="send">전송</button>
	</div>

</body>

<script>
	$(function() {
		var result = $('#kk');

		$(".partnerLit>a").click(
				function(e) {
					e.preventDefault();
					var ready = $(this);
					var part_name = ready.find('span').eq(0);
					var road_name = part_name.next();
					var list_addr = road_name.next();

					result.val(part_name.html() + '-' + road_name.html() + '-'
							+ list_addr.html());

				});
		$('#send').click(function() {
			$(opener.document).find('#pick').val(result.val());
			window.self.close();
		})
	})
</script>

</html>
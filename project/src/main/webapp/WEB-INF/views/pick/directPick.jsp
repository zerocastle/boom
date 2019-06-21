<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직플 선택하기</title>
<style>
#info {
	display: inline-block;
	vertical-align: middle;
	width: 50%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body class="wrap">

	<div>====== 직플레이스 정보들 ======</div>

	<!-- 검색 라인-------------------- -->
	<div>
		<span><select id="choose">
				<option value="addr">지역명</option>
				<option value="name">가게명</option>
		</select> </span><input type="text" id="searchValue" placeholder="검색" />
		<button id="search">검색</button>

	</div>

	<!-- 검색 라인-------------------- -->


	<ul class="partner">
		<c:forEach items="${partnerList}" var="list">
			<li class="partnerLit"><img alt=""
				src="${pageContext.request.contextPath}/resources/${list.uploadPath}/${list.uuid}_${list.fileName}"
				style="width: 150px; height: 150px;" />
				<div id="info">
					<a href=''>${list.company_number} <span>${list.part_name}</span>
						${list.boss_name} ${list.part_phone} ${list.zip_code} <span>${list.road_name}</span>

						<span>${list.addr}</span> ${list.detail_addr}
					</a>
				</div></li>
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

		$(".partnerLit>div>a").click(
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

		// 직플 검색
		$('#search').on('click',function() {
					var keyword = $('#searchValue').val();
					var choose = $('#choose').val();

					window.location.href = "/selling/directSearch?keyword="
							+ keyword + "&choose=" + choose;

		})

	})
</script>

</html>
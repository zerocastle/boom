<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직플 선택하기</title>
<style>
.wrap {
	background-color: #F2F2F2 !important;
	padding: 5px 10px;
	font-size: 15px;
}

#info {
	display: inline-block;
	vertical-align: middle;
}

.partner {
	list-style: none;
	padding: 0;
}

.backlist {
	margin-top: 3%;
	border-radius: 10px;
	border: solid 1px #ffffff;
	background-color: white;
	-webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
}

.left_img {
	margin-left: 1.5%;
	border-radius: 20px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black !important;
	text-decoration: none !important;
}

.info_a {
	font-weight: bold;
}

.search_box {
	border: solid 1px #ffffff;
	height: 50px;
	background-color: white;
	border-radius: 5px;
	-webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
}

#choose {
	height: 27px;
	margin-top: 2.1%;
	margin-left: 5.5%;
	border-radius: 2px;
	border: solid 1px black;
}

#searchValue {
	width: 60%;
	border-radius: 2px;
	border: solid 1px black;
}

#search {
	background-color: white;
	border: solid 1px black;
	margin-left: -1.2%;
}

#searchValue:focus {
	outline: none;
}

.hi {
	display: none;
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



	<!-- 검색 라인-------------------- -->
	<div class="search_box">
		<span><select id="choose">
				<option value="addr">지역명</option>
				<option value="name">가게명</option>
		</select> </span><input type="text" id="searchValue" placeholder="검색" />
		<button id="search">검색</button>

	</div>
	<!-- 검색 라인-------------------- -->
	<ul class="partner">
		<c:forEach items="${partnerList}" var="list">
			<div class="backlist">
				<li class="partnerLit"><img alt="" class="left_img"
					src="${pageContext.request.contextPath}/resources/${list.uploadPath}/${list.uuid}_${list.fileName}"
					style="width: 100px; height: 100px;" />
					<div id="info">
						<a href='' class="info_a">

							<div>
								<span>매장:</span> <span>${list.part_name}</span>
							</div>

							<div>
								<span>성명:</span> <span>${list.boss_name} </span>
							</div>

							<div>
								<span>휴대폰번호:</span> <span>${list.part_phone}</span>
							</div>

							<div>
								<span>도로명주소:</span> <span>${list.road_name}</span>
							</div>

							<div>
								<span>상세주소:</span> <span>${list.detail_addr}</span>
							</div>

						</a>
					</div></li>
			</div>
		</c:forEach>
	</ul>

	<div class="hi">
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
               var part_name = ready.find('span').eq(1);
               var road_name = ready.find('span').eq(7);
               var list_addr = ready.find('span').eq(9);

               result.val(part_name.html() + '-' + road_name.html() + '-'
                     + list_addr.html());
                 $('#send').trigger('click');
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

<script>


</script>

</html>
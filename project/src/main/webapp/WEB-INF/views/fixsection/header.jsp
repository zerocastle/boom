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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!-- 애들 정의 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/kim.css" />

<link rel="stylesheet" type="text/css" href="/resources/css/da3.css" />

<script type="text/javascript" src="/resources/js/remote.js"></script>

<script>
   $(function() {

      var msg = '${requestScope.msg}';
      var loginDO = '${requestScope.loginDo}';
      if (msg == 'SUCCESS') {
         alert("회원 가입을 성공적으로 하였습니다.");
         self.close();
      }
      if (msg == 'SUCCESSPARTNER') {
         alert("직플레이드 등록이 완료되었습니다.");
         history.replaceState({}, null, null);
         window.close();
      }
      if (loginDO == '1') {
         alert("잘못된 접근 입니다. 로그인부터 하세요");
      }

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
      // 회원 
      $('#register').click(
            function() {
               window.open('/member/memberRegister', 'register',
                     'width=1920,height=1080');
            })
      //로그아웃
      $('#logout').click(function(e) {
         e.preventDefault();
         window.location.href = "/member/logout"
      })
      //마이페이지 제어
      var temp = null;
      $('#myPage').click(function(e) {
         temp = '<c:out value="${sessionScope.loginSession}"/>'
         if (temp) {
            e.preventDefault();
            window.location.href = "/member/myPage";
         } else {
            alert("로그인 부터 하셔야 합니다.");
            window.open('/member/login', 'login', 'width=600,height=600');
         }
      })
      // 판매하기 제어
      $("#sell").click(function(e) {
         temp = '<c:out value="${sessionScope.loginSession}"/>';
         if (temp) {
            e.preventDefault();
            window.location.href = "/selling/selling";
         } else {
            alert("로그인 부터 하셔야 합니다.");
            window.open('/member/login', 'login', 'width=600,height=600');
         }
      })

      // 체팅 목록 제어
      $('#chat').click(function(e) {
         temp = '<c:out value="${sessionScope.loginSession}"/>';
         if (temp) {
            e.preventDefault();
            window.open('/chatting/chatting', 'chatList', 'width=850,height=600');
         } else {
            alert("로그인 부터 하셔야 합니다.");
            window.open('/member/login', 'login', 'width=600,height=600');
         }
      })

      $('#productList').click(function(e) {
         e.preventDefault();
         window.location.href = "/index_productList";
      });

      /* subnav partnerRegister */
      $('#subnav :eq(2)').click(
            function(e) {
               if ("${not empty sessionScope.loginSession}" != 'false') {

                  window.open('/partner/partnerPage', 'partner',
                        'width=1920,height=1080');
               } else {
                  alert('로그인을 먼저 하셔야 합니다.');
               }
            })

      /*공지사항*/
      $('#noticeBoard').click(function(e) {
         e.preventDefault();
         alert("공지사항 이동");
         window.location.href = "/admin/noticeBoard";

      })

      //직플레이스 검색
      $('#placeSearch').click(function(e) {
         e.preventDefault();
         window.location.href = "/partner/placeSearch"
      })

      $('#warningBoard').click(function(e) {
         e.preventDefault();
         window.location.href = "/warningBoard/warningBoard"
      })

   });
</script>

</head>

<body>
	<!--d-->
	<div class="header-line">
		<div class="header">
			<div id="btnTop" class="header-1">
				<div class="header-1-div">

					<c:if test="${empty sessionScope.loginSession }">

						<a class="header-1-a" href=""
							onclick="window.open('/member/login','login','width=600,height=600')">로그인</a>
						<a class="header-1-a" href="#" id="register">회원가입</a>
					</c:if>
					<c:if test="${not empty sessionScope.loginSession }">
						<span class="header-1-a">${sessionScope.loginSession.nickname}
							환영합니다.</span>
						<a href="" class="header-1-a" id="logout">로그아웃</a>
					</c:if>
				</div>
			</div>

			<div class="header-2">
				<div class="header-2-body">
					<div class="header-logo">
						<div>
							<a class="logo" href="/"><img
								src="/resources/image/logo2.png" width="220px;" height="80px;"></a>
						</div>
					</div>

					<div class="header-search" style="padding-top: 15px;">
						<div class="input-group md-form form-sm form-2 pl-0">
							<input class="form-control my-0 py-1 red-border" type="text"
								placeholder="상품명 , 지역명 입력" aria-label="Search">
							<div class="input-group-append">
								<span class="input-group-text red lighten-3" id="basic-text1">
									<img src="/resources/image/search.png" width="15px"
									height="15px">
								</span>
							</div>
						</div>
					</div>

					<div class="header-service">
						<div class="service-btn">

							<a id="myPage" href=""
								style="font-size: 18px; margin-right: 10px;"><img
								src="/resources/image/mypage.png" style="margin-right: 5px;">마이페이지</a>
						</div>
						<div class="service-btn">
							<a href="#" id="sell"
								style="font-size: 18px; margin-right: 10px;"><img
								src="/resources/image/sell.png" style="margin-right: 5px;">판매하기</a>
						</div>
						<div class="service-btn">
							<a href="#" id="chat"
								style="font-size: 18px; margin-right: 10px;"><img
								src="/resources/image/chat.png" style="margin-right: 5px;">직톡목록</a>
						</div>
					</div>
				</div>
				<div class="header-2-body-2">
					<div class="header-categori">
						<div class="navbar navbar-toggleable-md navbar-light bg-faded"
							style="padding: 0;">
							<button class="navbar-toggler navbar-toggler-right" type="button"
								data-toggle="collapse" data-target="#navbarNavAltMarkup"
								aria-controls="navbarNavAltMarkup" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarNavAltMarkup"
								style="background-color: white; width: px;">
								<div class="navbar-nav" style="width: 200px;">
									<a class="nav-item nav-link active" href="#">Home <span
										class="sr-only">(current)</span></a> <a class="nav-item nav-link"
										href="#">남성의류</a> <a class="nav-item nav-link" href="#">여성의류</a>
									<a class="nav-item nav-link" href="#">전자제품</a> <a
										class="nav-item nav-link" href="#">가구/인테리어</a> <a
										class="nav-item nav-link" href="#">유아용품</a> <a
										class="nav-item nav-link" href="#">스포츠/레저</a> <a
										class="nav-item nav-link" href="#">게임/취미</a> <a
										class="nav-item nav-link" href="#">뷰티/미용</a> <a
										class="nav-item nav-link" href="#">생활/가공품</a> <a
										class="nav-item nav-link" href="#">반려동물용품</a> <a
										class="nav-item nav-link" href="#">도서/티켓/음반</a> <a
										class="nav-item nav-link" href="#">기타/잡화</a>
								</div>
							</div>
						</div>
					</div>

					<div class="header-zicplus-btn" id="subnav">
						<div class="zicplus-btn">
							<a href="#">함께하는 직플파트너</a>
						</div>
						<div class="zicplus-btn">
							<a href="#">직플파트너 등록하기</a>
						</div>
						<div class="zicplus-btn" id="placeSearch">
							<a href="#" id="DirectSearch">직플레이스 검색</a>
						</div>
						<div class="zicplus-btn">
							<a href="#" id="noticeBoard">공지사항</a>
						</div>
						<div class="zicplus-btn">
							<a href="#" id="warningBoard">신고사항</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<div style="margin-top: 220px;">
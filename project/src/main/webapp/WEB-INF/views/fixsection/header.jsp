<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<!--d-->
	<div class="header-line">
		<div class="header">
			<div id="btnTop" class="header-1">
				<div class="header-1-div">
				<c:if test="${empty sessionScope.loginSession }">
					<a class="header-1-a" href="" onclick="window.open('member/login','login','width=600,height=600')">로그인</a> 
					<a class="header-1-a"
						href="#">회원가입</a>
				</c:if>
				<c:if test="${sessionScope.loginSession }">
				<a class="header-1-a" href="myPage/page.jsp">${sessionScope.loginSession } 환영합니다.</a> 
				</c:if>
				</div>
			</div>

			<div class="header-2">
				<div class="header-2-body">
					<div class="header-logo">
						<div>
							<a class="logo" href="#"><img src="logo2.png" width="220px;"
								height="80px;"></a>
						</div>
					</div>

					<div class="header-search" style="padding-top: 15px;">
						<div class="input-group md-form form-sm form-2 pl-0">
							<input class="form-control my-0 py-1 red-border" type="text"
								placeholder="상품명 , 지역명 입력" aria-label="Search">
							<div class="input-group-append">
								<span class="input-group-text red lighten-3" id="basic-text1">
									<i class="fas fa-search text-grey" aria-hidden="true"><img
										src="search.png" width="15px" height="15px"></i>
								</span>
							</div>
						</div>
					</div>

					<div class="header-service">
						<div class="service-btn">
							<a href="#" style="font-size: 18px; margin-right: 10px;"><img
								src="mypage.png" style="margin-right: 5px;">마이페이지</a>
						</div>
						<div class="service-btn">
							<a href="#" style="font-size: 18px; margin-right: 10px;"><img
								src="sell.png" style="margin-right: 5px;">판매하기</a>
						</div>
						<div class="service-btn">
							<a href="#" style="font-size: 18px; margin-right: 10px;"><img
								src="chat.png" style="margin-right: 5px;">채팅목록</a>
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

					<div class="header-zicplus-btn">
						<div class="zicplus-btn">
							<a href="#">함께하는 직플파트너</a>
						</div>
						<div class="zicplus-btn">
							<a href="#">직플파트너 등록하기</a>
						</div>
						<div class="zicplus-btn">
							<a href="#">직플레이스 검색</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="banner">
			<!-- <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active" data-interval="10000">
                        <img src="290282777.jpg" class="d-block w-100" alt="" height="300px">
                      </div>
                      <div class="carousel-item" data-interval="2000">
                        <img src="306843239.png" class="d-block w-100" alt="..." height="300px">
                      </div>
                      <div class="carousel-item">
                        <img src="309885615.jpg" class="d-block w-100" alt="..." height="300px">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div> -->
			<div id="carouselExampleInterval" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div>
						<img src="290282777.jpg" class="d-block w-100" alt=""
							height="300px">
					</div>
					<div class="carousel-item" data-interval="2000">
						<img src="306843239.png" class="d-block w-100" alt="..."
							height="300px">
					</div>
					<div class="carousel-item">
						<img src="309885615.jpg" class="d-block w-100" alt="..."
							height="300px">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleInterval"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleInterval"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="main-categori" style="background: yellowgreen;"></div>
	</div>


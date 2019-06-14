<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>직거래 플러스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Minimal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- <link href="/resources/css2/bootstrap.min.css" rel='stylesheet' type='text/css' /> -->
<!-- Custom Theme files -->
<!-- <link href="/resources/css2/style.css" rel='stylesheet' type='text/css' /> -->
<link href="/resources/css2/font-awesome.css" rel="stylesheet" />

<script src="/resources/js/jquery.min.js"> </script>
<script src="/resources/js/bootstrap.min.js"> </script>
    <!-- REQUIRED CSS: BOOTSTRAP, METISMENU, PERFECT-SCROLLBAR  -->
    <link rel="stylesheet" href="/resources/css/vendor.min.css">

    <link rel="stylesheet" href="/resources/plugins/swiper.min.css">
    <link rel="stylesheet" href="/resources/plugins/noty.css">
    <!-- Mimity CSS  -->
    <link rel="stylesheet" href="/resources/css/style.min.css">
    
    <!-- Mimity CSS  -->

<style>
article,
aside,
figcaption,
figure,
footer,
header,
hgroup,
main,
nav,
section {
  /* display: block; */
}
.col-12{
margin: auto;
}
</style>

    <!-- Top bar -->
    <div class="topbar">
      <div class="container d-flex">

        <!-- social media -->
        <nav class="nav">
          <a class="nav-link pr-2 pl-0" href="https://ko-kr.facebook.com/" target="_black"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg></a>
          <a class="nav-link px-2" href="https://twitter.com/?lang=ko" target="_black"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg></a>
          <a class="nav-link px-2" href="https://www.instagram.com/?hl=ko" target="_black"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.5" y2="6.5"></line></svg></i></a>
        </nav>

        <!-- language -->
        <nav class="nav nav-lang ml-auto"> <!-- push it to the right -->
        </nav>

        <!-- User dropdown -->
        <ul class="nav">
          <li class="nav-item dropdown dropdown-hover">
          
          <c:if test="${empty sessionScope.loginSession }">
          	<div style="display: inline-block;">
				<a class="nav-link" href="#"  data-toggle="modal" data-target="#modalLogin">로그인</a>
			</div>
			
			<div style="display: inline-block;">
				<a class="nav-link" href="#" data-toggle="modal" data-target="#modalRegister">회원가입</a>
			</div>
		 </c:if>
		<c:if test="${not empty sessionScope.loginSession }">
			<%-- <span class="header-1-a">${sessionScope.loginSession.nickname}
				환영합니다.</span>
			<a href="" class="header-1-a" id="logout">로그아웃</a> --%>
		<ul class="nav">
          <li class="nav-item dropdown dropdown-hover">
            <a class="nav-link dropdown-toggle pr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
              ${sessionScope.loginSession.nickname}
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <div class="media p-2 align-items-center mb-2">
                <div class="mr-2 size50x50">
                <c:if test="${sessionScope.loginSession.fileName eq null}">
                <img src="/resources/image/봄봄1.jpg" alt="user" class="img-thumbnail rounded-circle mr-2 size50x50">
                </c:if>
                 <c:if test="${sessionScope.loginSession.fileName != null}">
                <img src="${pageContext.request.contextPath}/resources/${sessionScope.loginSession.uploadPath }/${sessionScope.loginSession.uuid }_${sessionScope.loginSession.fileName }" alt="user" class="img-thumbnail rounded-circle mr-2 size50x50">
                </c:if>
                
                </div>
                <div class="media-body">
                  <strong class="sessionNick">${sessionScope.loginSession.nickname}</strong>
                  <div class="small">${sessionScope.loginSession.email}</div>
                  <div class="small">
                  	<c:if test="${sessionScope.loginSession.partner_signal eq 0}">
                  		일반 회원
                  	</c:if>
                  	<c:if test="${sessionScope.loginSession.partner_signal != 0}">
                  		직플파트너 회원
                  	</c:if>
                  </div>
                </div>
              </div>
              <a id="myPage2" href="#" class="dropdown-item has-icon has-badge">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg></i>
              	마이페이지
              </a>
              <a id="sell2" href="/selling/selling" class="dropdown-item has-icon has-badge">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
              	판매하기 
              </a>
              <a id="chat" href="#" onclick="window.open('/chatting/chatting', 'chatList',
				'width=450,height=600');" class="dropdown-item has-icon has-badge">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
              	직톡목록
              </a>
              <div class="dropdown-divider"></div>
              <a href="/member/logout"  id="logout" class="dropdown-item has-icon text-danger"><i data-feather="log-out"></i>Logout</a>
            </div>
          </li>
        </ul>
		</c:if>
          
  
          </li>
        </ul>
        <!-- /User dropdown -->
        

      </div><!-- /.container -->
    </div>
    <!-- /Top bar -->


    <!--Header -->
    <header>
      <div class="container">

        <!-- Sidebar toggler -->
        <a class="nav-link nav-icon ml-ni nav-toggler mr-3 d-flex d-lg-none" href="#" data-toggle="modal" data-target="#menuModal"><i data-feather="menu"></i></a>

        <!-- Logo -->
        <a class="nav-link nav-logo" href="/"><img src="https://mimity-fashion56.netlify.com/img/logo.svg" alt="Mimity"> <strong>직거래 PLUS</strong></a>

        <!-- Main navigation -->
        <ul class="nav nav-main ml-auto d-none d-lg-flex"> <!-- hidden on md -->
          <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
          <li class="nav-item dropdown dropdown-hover">
            <a class="nav-link dropdown-toggle forwardable" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
              카테고리 <i data-feather="chevron-down"></i>
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/production/index_productList?cate_code=man&order=asc">남성의류</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=woman&order=asc">여성의류</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=elect&order=asc">전자제품</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=furniture&order=asc">가구/인테리어</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=baby&order=asc">유아용품</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=sport&order=asc">스포츠/레저</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=hobby&order=asc">게임/취미</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=beauty&order=asc">뷰티/미용</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=life&order=asc">생활/가공품</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=animal&order=asc">반려동물용품</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=book&order=asc">도서/티켓/음반</a>
              <a class="dropdown-item" href="/production/index_productList?cate_code=else&order=asc">기타/잡화</a>
            </div>
          </li>
          <li class="nav-item dropdown dropdown-hover">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
             	직플레이스 <i data-feather="chevron-down"></i>
            </a>
            <div class="dropdown-menu">
            <c:if test="${not empty sessionScope.loginSession }">
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalPartnerRegister">직플파트너 등록</a>
            </c:if> 
              <a id="placeSearch" class="dropdown-item" href="#">직플레이스 찾기</a>
              <a class="dropdown-item" href="#">함께하는 직플파트너</a>
            </div>
          </li>
          <li class="nav-item dropdown dropdown-hover">
            <a id="noticeBoard" class="nav-link dropdown-toggle forwardable" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
              공지사항
            </a>
          </li>
          <li class="nav-item dropdown dropdown-hover">
            <a id="warningBoard" class="nav-link dropdown-toggle forwardable" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
              신고게시판
            </a>
          </li>
        </ul>
        <!-- /Main navigation -->

        <!-- Search form -->
		<form class="form-inline form-search ml-auto mr-0 mr-sm-1 d-none d-sm-flex">
	        <div class="input-group input-group-search">
	            <select class="choose">
	                <option value="place">지역명</option>
	                <option value="pName">상품명</option>
	              </select>
	          <div class="input-group-prepend">
	            <button class="btn btn-light d-flex d-sm-none search-toggle" type="button"><i data-feather="chevron-left"></i></button>
	          </div>
	          <input type="text" class="form-control border-0 bg-light input-search" placeholder="상품명 , 지역명 입력" aria-label="Search" >
	          <div class="input-group-append">
	            <button class="btn btn-light input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button>
	          </div>
	        </div>
      	</form>
        <!-- /Search form -->

        <ul class="nav ml-auto ml-sm-0">
          <!-- Search form toggler -->
          <li class="nav-item d-block d-sm-none ml-2 ml-lg-0"><a class="nav-link nav-icon search-toggle" href="#"><i data-feather="search"></i></a></li>
        </ul>

      </div><!-- /.container -->
    </header>
   
    <!-- /Header -->

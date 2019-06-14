<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Footer -->
<div class="footer">
	<div style="text-align: center;">
		<h6 class="bold">Download The App</h6>
		<a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img
					src="https://mimity-fashion56.netlify.com/img/app/google-play.svg"
					alt="Google Play Logo" height="30">
				<div class="media-body">
					<small>Get it on</small>
					<h5>Google Play</h5>
				</div>
			</div>
		</a> <a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img src="https://mimity-fashion56.netlify.com/img/app/apple.svg"
					alt="Apple Logo" height="30">
				<div class="media-body">
					<small>Download on the</small>
					<h5>App Store</h5>
				</div>
			</div>
		</a> <a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img src="https://mimity-fashion56.netlify.com/img/app/windows.svg"
					alt="Windows Logo" height="30">
				<div class="media-body">
					<small>Get it from</small>
					<h5>Microsoft Store</h5>
				</div>
			</div>
		</a>
	</div>
</div>
<div class="copyright">Copyright © 2019 직거래 플러스</div>
<!-- /Footer -->

<!--Menu Modal -->
<div class="modal modal-left modal-menu" id="menuModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header shadow">
				<a class="h5 mb-0 d-flex align-items-center" href="#"> <img
					src="https://mimity-fashion56.netlify.com/img/logo.svg"  alt="Mimity" class="mr-3"> <strong>직거래PLUS</strong>
				</a>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body shadow">
				<ul class="menu" id="menu">
					<li class="no-sub mm-active"><a href="/"><i data-feather="home"></i> Home</a></li>
					<li><a href="#" class="has-arrow"><i data-feather="shopping-bag"></i>카테고리</a>
						<ul>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=man&order=asc">남성의류</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=woman&order=asc">여성의류</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=elect&order=asc">전자제품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=furniture&order=asc">가구/인테리어</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=baby&order=asc">유아용품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=sport&order=asc">스포츠/레저</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=hobby&order=asc">게임/취미</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=beauty&order=asc">뷰티/미용</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=life&order=asc">생활/가공품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=animal&order=asc">반려동물용품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=book&order=asc">도서/티켓/음반</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=else&order=asc">기타/잡화</a></li>
						</ul>
					</li>
					<li><a href="#" class="has-arrow"><i data-feather="rss"></i>직플레이스</a>
						<ul>
							<c:if test="${not empty sessionScope.loginSession }">
				             <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalPartnerRegister">직플파트너 등록</a><li>
				            </c:if> 
							<li><a id="placeSearch2" class="dropdown-item" href="#">직플레이스 찾기</a></li>
							<li><a class="dropdown-item" href="#">함께하는 직플파트너</a></li>
						</ul></li>
					<li class="no-sub"><a href="#" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12" y2="16"></line></svg>공지사항</a></li>
					<li class="no-sub"><a href="#" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12" y2="17"></line></svg>신고게시판</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- /Menu Modal -->

<script src="/resources/plugins/swiper.min.js"></script>
<script src="/resources/plugins/bootstrap.bundle.min.js"></script>
<script src="/resources/plugins/jquery.countdown.min.js"></script>
<script src="/resources/plugins/metisMenu.min.js"></script>
<script src="/resources/plugins/feather.min.js"></script>
<script src="/resources/plugins/noty.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar.min.js"></script>
<script src="/resources/js/script.min.js"></script>
<!-- <script src="/resources/customJs/recentProduct.js"></script> -->

<script>
	$(function() {

		App.atcDemo() // Add to Cart Demo
		App.atwDemo() // Add to Wishlist Demo
		App.homeSlider('#home-slider')
		App.dealsSlider('#deals-slider')
		App.colorOption()

		// example countdown, 6 hours from now for flash deals
		var countdown = new Date()
		countdown.setHours(countdown.getHours() + 6)
		$('#flash-deals-countdown').countdown(countdown, function(event) {
			$(this).text(event.strftime('%H:%M:%S'))
		})

	})
</script>
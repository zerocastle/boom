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
<link href="/resources/css2/bootstrap.min.css" rel='stylesheet'
	type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css2/style.css" rel='stylesheet' type='text/css' />
<link href="/resources/css2/font-awesome.css" rel="stylesheet" />
<script src="/resources/js/jquery.min.js"> </script>
<script src="/resources/js/bootstrap.min.js"> </script>

<!-- Mainly scripts -->
<script src="/resources/js/jquery.metisMenu.js"></script>
<script src="/resources/js/jquery.slimscroll.min.js"></script>
<!-- Custom and plugin javascript -->
<link href="/resources/css2/custom.css" rel="stylesheet">
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/screenfull.js"></script>

<!-- 무빙 -->
<script src="/resources/selljs/sellMove.js"></script>


<script>
		$(function () {
			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);
			if (!screenfull.enabled) {
				return false;
			}
			$('#toggle').click(function () {
				screenfull.toggle($('#container')[0]);
			});
		});
	</script>

<style>
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean')
	;
body {
	font-family: 'Noto Sans KR', sans-serif, "맑은 고딕";
}
.line-header {
	display: inline-block;
	margin: 1em;
	margin-left: 9.4em;
	font-size: 18px;
}
.line-head {
	border-bottom: 1px solid black;
}
.line-content {
	/* border-bottom: 1px solid black; */
	margin-top: 1em;
	height: 80%;
}
.contents-header {
	background: #fff;
	display: block;
	margin: 0em 1em;
	padding: 1em;
	border: 1px solid #ebeff6;
	border-color: #ebeff6;
	border-radius: 4px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}
</style>


</head>

<body>
	<div id="wrapper">
		<!----->
		<nav class="navbar-default navbar-static-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>
					<a class="navbar-brand" href="/" style="font-size: 24px;">직거래플러스</a>
				</h1>
			</div>
			<div class="border-bottom">




				<div class="clearfix"></div>

				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">

							<li><a href="/" class=" hvr-bounce-to-right"><i
									class="fa fa-home nav_icon "></i><span class="nav-label">HOME</span>
							</a></li>

							<li><a href="selling" class="hvr-bounce-to-right"><i
									class="fa fa-cart-arrow-down nav_icon"></i> <span
									class="nav-label">상품등록</span></a></li>
							<li><a id="sellProductManager" href=""
								class=" hvr-bounce-to-right"><i
									class="fa fa-shopping-cart nav_icon"></i> <span
									class="nav-label">상품관리</span> </a></li>

							<li><a id="chatList" href="#" class=" hvr-bounce-to-right"><i
									class="fa fa-comments nav_icon"></i> <span class="nav-label">채팅목록</span>
							</a></li>
							<li><a href="#" class=" hvr-bounce-to-right"><i
									class="fa fa-desktop nav_icon"></i> <span class="nav-label">내역확인</span><span
									class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a id="purchaseList" href="#" class=" hvr-bounce-to-right"> <i
											class="fa fa-plus nav_icon"></i>구매내역보기
									</a></li>
									<li><a id="sellList" href="#" class=" hvr-bounce-to-right"><i
											class="fa fa-minus nav_icon"></i>판매내역보기</a></li>
								</ul></li>


							<!--직플레이스-->
							<li><a href="#" class="hvr-bounce-to-right"><i
									class="fa fa-crosshairs nav_icon"></i> <span class="nav-label">직플레이스</span><span
									class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="#" class=" hvr-bounce-to-right"><i
											class="fa fa-info-circle nav_icon"></i> 나의 직플레이스 정보</a></li>
									<li><a href="#" class=" hvr-bounce-to-right"><i
											class="fa fa-check-square-o nav_icon"></i>맡은 내역보기</a></li>
								</ul></li>

							<li><a id="memberOut" href="#" class=" hvr-bounce-to-right"><i
									class="fa fa-flag nav_icon"></i> <span class="nav-label">탈퇴하기</span>
							</a></li>
						</ul>
					</div>
				</div>
		</nav>
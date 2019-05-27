<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />

<style>
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.other {
	/* border:1px solid black; */
	width: 100%;
	height: 900px;
}

.left-layout {
	/* border: 1px solid black; */
	width: 300px;
	height: 800px;
	vertical-align: middle;
	/* 	border: 1px solid red; */
	display: inline-block;
}

.right-layout {
	/*	border: 1px solid black;
 	position:relative;
	bottom: 500px;
	left: 350px; */
	margin-left: 20px;
	width: 880px;
	height: 850px;
	display: inline-block;
	vertical-align: middle;
}

.review {
	
}

.other-info {
	border: 1px solid #6d767f;
	margin-top: 45px;
	height: 400px;
}

.other-profile1 {
	/* border-bottom: 1px solid black; */
	height: 150px;
	text-align: center;
	vertical-align: middle;
}

.other-profile2 {
	/* border: 1px solid black; */
	height: 250px;
}

.other-profile2-left {
	border-right: 1px solid #6d767f;
	width: 80px;
	height: 30px;
	text-align: right;
	display: inline-block;
	vertical-align: middle;
	padding-right: 5px;
}

.other-profile2-right {
	margin-left: 5px;
	height: 30px;
	text-align: left;
	display: inline-block;
	vertical-align: middle;
}

.margin-class {
	margin: 10px;
}

.other-nickname {
	font-size: 24px;
	font-family: 'S-CoreDream-3Light';
	font-weight: 500;
	text-align: center;
	border-top: 0.1px solid #6d767f;
	border-bottom: 0.1px solid #6d767f;
	margin: 0;
}

.profile-nickname {
	width: 30px;
	height: 30px;
	margin-right: 2px;
}

.foo {
	width: 200px;
	height: 80px;
	top: 0;
	left: 0;
}

.other-manner-top {
	text-align: center;
}

.other-manner-bottom {
	text-align: center;
}

.line {
	border-top: 0.1px solid #6d767f;
}

.product-title-line {
	border-bottom: 0.1px solid #6d767f;
	font-size: 32px;
}

.btn {
	padding: 0.6rem 5.633rem;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #777;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.star123 {
	position: relative;
	top: 45px;
	left: 135px;
}

.jikpro {
	position: relative;
	top: 45px;
	color: gray;
	font-weight: bold;
	font-size: 20px;
	left: 168px;
}

.fa-plus {
	position: relative;
	left: 147px;
	top: 55px;
	z-index: 2;
	font-size: 17px;
	color: white;
}

.jiksee {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484
		), color-stop(1, #848484));
	background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
	background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
	background: -o-linear-gradient(top, #848484 5%, #848484 100%);
	background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
	background: linear-gradient(to bottom, #848484 5%, #848484 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
		endColorstr='#848484', GradientType=0);
	background-color: #848484;
	/* -moz-border-radius: 6px;
         -webkit-border-radius: 6px;
         border-radius: 6px; */
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 4px 8px;
	text-decoration: none;
	position: relative;
	top: 55px;
	left: 115px;
	width: 120px;
	height: 40px;
}

.jiksee:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484
		), color-stop(1, #848484));
	background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
	background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
	background: -o-linear-gradient(top, #848484 5%, #848484 100%);
	background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
	background: linear-gradient(to bottom, #848484 5%, #848484 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
		endColorstr='#848484', GradientType=0);
	background-color: #848484;
}

.contentsDiv {
	height: 300px;
	border: 1px solid black;
}

.container {
	margin: 0 auto;
	width: 750px;
	/* background: #444753; */
	border-radius: 5px;
}

.people-list {
	width: 260px;
	float: left;
}

.people-list .search {
	padding: 20px;
}

.people-list input {
	border-radius: 3px;
	border: none;
	padding: 14px;
	color: white;
	width: 90%;
	font-size: 14px;
}

.people-list .fa-search {
	position: relative;
	left: -25px;
}

.people-list ul {
	padding: 20px;
	height: 770px;
}

.people-list ul li {
	padding-bottom: 20px;
}

.people-list img {
	float: left;
}

.people-list .about {
	float: left;
	margin-top: 8px;
}

.people-list .about {
	padding-left: 8px;
}

.people-list .status {
	color: #92959E;
}

.chat {
	float: left;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	color: #434651;
}

.chat .chat-header {
	padding: 20px;
	border-bottom: 2px solid white;
}

.chat .chat-header img {
	float: left;
}

.chat .chat-header .chat-about {
	float: left;
	padding-left: 10px;
	margin-top: 6px;
}

.chat .chat-header .chat-with {
	font-weight: bold;
	font-size: 16px;
}

.chat .chat-header .chat-num-messages {
	color: #92959E;
}

.chat .chat-header .fa-star {
	float: right;
	color: #D8DADF;
	font-size: 20px;
	margin-top: 12px;
}

.chat .chat-history .message-data-time {
	color: #a8aab1;
	position: relative;
	left: 45px;
	bottom: 7px;
	border-bottom: 1px solid #a8aab1;
}

.chat .chat-history .message {
	color: black;
	padding: 14px 14px;
	line-height: 26px;
	font-size: 15px;
	border-radius: 7px;
	margin-bottom: 30px;
	width: 600px;
	position: relative;
}

.chat .chat-history .message:after {
	bottom: 100%;
	left: 48px;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: orangered;
	border-width: 10px;
	margin-left: -10px;
}

.chat .chat-history .my-message {
	/* background: #86BB71; */
	border: 2.5px solid orangered;
}

.chat .chat-history .other-message {
	background: #94C2ED;
}

.chat .chat-history .other-message:after {
	border-bottom-color: #94C2ED;
	left: 93%;
}

.chat .chat-message {
	padding: 30px;
}

.chat .chat-message textarea {
	width: 100%;
	border: none;
	padding: 10px 20px;
	font: 14px/22px "Lato", Arial, sans-serif;
	margin-bottom: 10px;
	border-radius: 5px;
	resize: none;
}

.chat .chat-message .fa-file-o, .chat .chat-message .fa-file-image-o {
	font-size: 16px;
	color: gray;
	cursor: pointer;
}

.chat .chat-message button {
	float: right;
	color: #94C2ED;
	font-size: 16px;
	text-transform: uppercase;
	border: none;
	cursor: pointer;
	font-weight: bold;
}

.chat .chat-message button:hover {
	color: #75b1e8;
}

.online, .offline, .me {
	margin-right: 3px;
	font-size: 10px;
	position: relative;
	bottom: 7px;
}

.online {
	color: orange;
}

.offline {
	color: #E38968;
}

.me {
	color: #94C2ED;
}

.align-left {
	text-align: left;
}

.align-right {
	text-align: right;
}

.float-right {
	float: right;
}

.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

.review-user {
	font-size: 40px;
}

.replyerSpan {
	font-size: 22px;
	position: relative;
	bottom: 5px;
	left: 10px;
}

.reviewDiv {
	/* 	border : 1px solid black; */
	
}

.imgDiv {
	border: 1px solid black;
	height: 180px;
	width: 200px;
	display: inline-block;
	vertical-align: middle;
}

.contentsReview {
	height: 180px;
	display: inline-block;
	vertical-align: middle;
	line-height: 2.5;
}

.replyer {
	font-size: 20px;
}

.startpoint {
	
}

.divReply {
	font-size: 20px;
}

.starpoint {
	/* border: 1px solid black; */
	position: relative;
	left: 30px;
	bottom: 10px;
}

.starImg {
	width: 100px;
	height: 20px;
}

.message {
	font-size: 10px;
}

#page {
	position: relative;
	top: 800px;
	right: 300px;
}
</style>
<script>
	function fn_movePage(val) {
		jQuery("input[name=pageNo]").val(val);
		jQuery("form[name=frm]").attr("method", "get");
		jQuery("form[name=frm]").attr("action", "").submit();
	}
</script>

<script>

$(document).ready(function() {
	var searchNick = $('#searchNick').val();

	$('#searchBtn').click(function(e) {
		e.preventDefault();
		window.location.href = "/member/review/"+$('#searchNick').val();
	});
	

	// 매너 게이지
	var manner = ${other.manner};
	   function startFoo(){
	      var opts = {
	              angle: 0.15, // The span of the gauge arc
	              lineWidth: 0.44, // The line thickness
	              radiusScale: 1, // Relative radius
	              pointer: {
	                length: 0.51, // // Relative to gauge radius
	                strokeWidth: 0.077, // The thickness
	                color: '#000000' // Fill color
	              },
	              limitMax: false,     // If false, max value increases automatically if value > maxValue
	              limitMin: false,     // If true, the min value of the gauge will be fixed
	              colorStart: '#f70000',   // Colors
	              colorStop: '#f70000',    // just experiment with them
	              strokeColor: '#E0E0E0',  // to see which ones work best for you
	              generateGradient: true,
	              highDpiSupport: true,     // High resolution support
	              
	            };
	            var target = document.getElementById('foo'); // your canvas element
	            var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
	            gauge.maxValue = 100; // set max gauge value
	            gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
	            gauge.animationSpeed = 49; // set animation speed (32 is default value)
	            gauge.set(manner); // set actual value
	   }
	   
	   startFoo();
});

</script>
<div class="other">
	<div class="left-layout">
		<div class="other-info">
			<div class="other-profile1">이미지 (보류)</div>
			<div class="other-profile2">
				<div class="other-nickname">
					<img class="profile-nickname" src="/resources/image/profile.png">
					<span id="nickname">${other.nickname }</span>
				</div>
				<div class="margin-class">
					<div class="other-profile2-left">이메일</div>
					<div class="other-profile2-right">${other.email }</div>
				</div>
				<div class="margin-class">
					<div class="other-profile2-left">소개글</div>
					<div class="other-profile2-right">${other.intro }</div>
				</div>
				<div class="line">
					<div class="other-manner-top">매너게이지</div>
					<div class="other-manner-bottom">
						<canvas id="foo" class="foo"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="review">
			<input id="searchNick" type="text" value="닉네임 검색" /> <input
				id="searchBtn" type="button" value="검색" />
		</div>
	</div>
	<div class="right-layout">
		<div class="product-title-line">상점 후기</div>
		<div>
			<form name="frm">
				<input type="hidden" name="pageNo" />
				<!-- //페이지 번호 -->

				<c:forEach var="reviews" items="${resultList }">
					<div class="reviewDiv">
						<div class="chat">
							<div class="chat-history">
								<ul>
									<li>
										<div class="message-data">
											<span class="message-data-name"> <i
												class="fa fa-circle online"></i> <i
												class="review-user fas fa-user-circle"></i> <span
												class="replyerSpan">${reviews.replyer }</span>
											</span> <span class="starpoint"> <c:if
													test="${reviews.starpoint == 0 }">
													<img class="starImg" src="/resources/image/star0.png">
												</c:if> <c:if test="${reviews.starpoint == 1 }">
													<img class="starImg" src="/resources/image/star1.png">
												</c:if> <c:if test="${reviews.starpoint == 2 }">
													<img class="starImg" src="/resources/image/star2.png">
												</c:if> <c:if test="${reviews.starpoint == 3 }">
													<img class="starImg" src="/resources/image/star3.png">
												</c:if> <c:if test="${reviews.starpoint == 4 }">
													<img class="starImg" src="/resources/image/star4.png">
												</c:if> <c:if test="${reviews.starpoint == 5 }">
													<img class="starImg" src="/resources/image/star5.png">
												</c:if>
											</span> <span class="message-data-time">${reviews.create_date }</span>
										</div>
										<div class="message my-message">${reviews.reply }</div>
									</li>
								</ul>
							</div>
							<!-- end chat-history -->
						</div>
						<!-- end chat -->
					</div>
				</c:forEach>
				<div id="page">
					<c:if test="${pageVO.pageNo != 0}">
						<c:if test="${pageVO.pageNo > pageVO.pageBlock}">
							<a href="javascript:fn_movePage(${pageVO.firstPageNo})"
								style="text-decoration: none;">[첫 페이지]</a>
						</c:if>
						<c:if test="${pageVO.pageNo != 1}">
							<a href="javascript:fn_movePage(${pageVO.prevPageNo})"
								style="text-decoration: none;">[이전]</a>
						</c:if>
						<span> <c:forEach var="i" begin="${pageVO.startPageNo}"
								end="${pageVO.endPageNo}" step="1">
								<c:choose>
									<c:when test="${i eq pageVO.pageNo}">
										<a href="javascript:fn_movePage(${i})"
											style="text-decoration: none;"> <font
											style="font-weight: bold;">${i}</font>

										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:fn_movePage(${i})"
											style="text-decoration: none;">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</span>
						<c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
							<a href="javascript:fn_movePage(${pageVO.nextPageNo})"
								style="text-decoration: none;">[다음]</a>
						</c:if>
						<c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
							<a href="javascript:fn_movePage(${pageVO.finalPageNo})"
								style="text-decoration: none;">[마지막 페이지]</a>
						</c:if>
					</c:if>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
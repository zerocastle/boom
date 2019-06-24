<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
 <link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css">
<!-- <link rel="stylesheet" type="text/css"
	href="/resources/css/review.css"> -->
<style>
.page-link {
	display: inline-block;
	color: #ffffff;
	background-color: #606ddd;
}
</style>


<script>
$(document).ready(function(){
	
	var data = $('#nick').text();
	console.log(data);
	$('#profileLink').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myPage/"+ data;
	});

	$('#myProduct').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myProduct/" +$('#nick').text();
	});

	$('#pick').click(function(e){
		e.preventDefault();
		window.location.href = "/member/pickInfo/"+$('#nick').text();
	});
	
	$('#review').click(function(e){
		e.preventDefault();
		window.location.href = "/member/review/"+$('#nick').text();
	});
	
	$('#buyList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/purchaseList/" + $('#nick').text();
	});
	
	$('#sellList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/sellList/" + $('#nick').text();
	});
	
	// 매너 게이지
	var manner = ${member.manner};
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

function fn_movePage(val) {
	jQuery("input[name=pageNo]").val(val);
	jQuery("form[name=frm]").attr("method", "get");
	jQuery("form[name=frm]").attr("action", "").submit();
}
</script>


<!-- Main Content -->
<div class="container my-3">
	<div class="row">

		<div class="col-md-4 col-lg-3">
			<div class="card">
				<div class="card-body text-center">
					<img src="${pageContext.request.contextPath}/resources/${member.uploadPath }/${member.uuid }_${member.fileName }" width="100" height="100" alt="User"
						class="rounded-circle mb-3">
					<h5 id="nick" class="bold mb-0">${member.nickname }</h5>
					<small class="counter">${member.email }</small>
					<hr>
					<div class="roboto-condensed bold" data-toggle="tooltip"
						title="매너 점수는 ${member.manner }입니다.
						평가 총인원은  ${member.manner_pick}명입니다.">
						<canvas id="foo" class="foo"></canvas>
					</div>
				</div>
				<div class="list-group list-group-flush">
					<a href="#" id="profileLink"
						class="list-group-item list-group-item-action"><i
						data-feather="user" class="mr-3"></i>프로필</a> <a
						href="#" id="myProduct"
						class="list-group-item has-badge list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>내 상품<span
						class="badge rounded badge-primary">${proCount }</span></a> <a
						href="#" id="pick"
						class="list-group-item has-badge list-group-item-action"> <i
						data-feather="heart" class="mr-3"></i>찜목록<span
						class="badge rounded badge-primary">${like }</span></a> <a href="#"
						id="review"
						class="list-group-item has-badge list-group-item-action active">
						<i data-feather="edit-3" class="mr-3"></i>리뷰<span
						class="badge rounded badge-primary">${pv }</span>
					</a> <a href="#" id="buyList" class="list-group-item list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>구매내역
					</a> <a href="#" id="sellList" class="list-group-item list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>판매내역
					</a> <a href="#"
						class="list-group-item list-group-item-action text-danger logout">
						<i data-feather="log-out" class="mr-3"></i> Logout
					</a>
				</div>
			</div>
		</div>

		<div class="col mt-3 mt-md-0">
			<div class="card">
				<div class="card-body">
					<h3>리뷰</h3>
					<hr>
					<form name="frm">
						<input type="hidden" name="pageNo" />
						<div class="table-responsive">
							<table class="table table-hover" data-addclass-on-xs="table-sm">
								<thead class="thead-light">
									<tr>
										<th scope="col">닉네임</th>
										<th scope="col">댓글</th>
										<th scope="col" class="text-right">등록날짜</th>
										<th scope="col" class="text-center">평점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="reviews" items="${resultList }">
										<tr>
											<th scope="row"><a href="account-order-detail.html">${reviews.replyer }</a></th>
											<td>${reviews.reply }</td>
											<td class="text-right">${reviews.create_date }</td>
											<td class="text-center"><span
												class="badge badge-warning rounded"><c:if
														test="${reviews.starpoint == 0 }">
														<img class="starImg" src="/resources/image/star0.png"
															style="width: 100px; height: 20px;">
													</c:if> <c:if test="${reviews.starpoint == 1 }">
														<img class="starImg" src="/resources/image/star1.png"
															style="width: 100px; height: 20px;">
													</c:if> <c:if test="${reviews.starpoint == 2 }">
														<img class="starImg" src="/resources/image/star2.png"
															style="width: 100px; height: 20px;">
													</c:if> <c:if test="${reviews.starpoint == 3 }">
														<img class="starImg" src="/resources/image/star3.png"
															style="width: 100px; height: 20px;">
													</c:if> <c:if test="${reviews.starpoint == 4 }">
														<img class="starImg" src="/resources/image/star4.png"
															style="width: 100px; height: 20px;">
													</c:if> <c:if test="${reviews.starpoint == 5 }">
														<img class="starImg" src="/resources/image/star5.png"
															style="width: 100px; height: 20px;">
													</c:if></span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
<div id="page" class="pull-center" style="text-align: center">
<ul class="pagination justify-content-center">
		<c:if test="${pageVO.pageNo != 0}">
			<c:if test="${pageVO.pageNo > pageVO.pageBlock}">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.firstPageNo})"
					style="text-decoration: none;">첫 페이지</a>
			</c:if>
			<c:if test="${pageVO.pageNo != 1}">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.prevPageNo})"
					style="text-decoration: none;"><</a>
			</c:if>
			<span> <c:forEach var="i" begin="${pageVO.startPageNo}"
					end="${pageVO.endPageNo}" step="1">
					<c:choose>
						<c:when test="${i eq pageVO.pageNo}">
							<a class="page-link" href="javascript:fn_movePage(${i})"
								style="text-decoration: none;"> <font
								style="font-weight: bold;">${i}</font>

							</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="javascript:fn_movePage(${i})"
								style="text-decoration: none;">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</span>
			<c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.nextPageNo})"
					style="text-decoration: none;">></a>
			</c:if>
			<c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.finalPageNo})"
					style="text-decoration: none;">마지막 페이지</a>
			</c:if>
		</c:if>
		</ul>
	</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- /Main Content -->

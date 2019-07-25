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

<script>
$(document).ready(function(){
	$('#inProd').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd/" + $('#nick').text();
	});
});
</script>

<script>
$(document).ready(function(){
	$('#inProd2').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd2/" + $('#nick').text();
	});
});
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
						class="list-group-item has-badge list-group-item-action">
						<i data-feather="edit-3" class="mr-3"></i>리뷰<span
						class="badge rounded badge-primary">${pv }</span>
					</a> <a href="#" id="buyList" class="list-group-item list-group-item-action active"> <i
						data-feather="shopping-bag" class="mr-3"></i>구매내역
					</a> <a href="#" id="sellList" class="list-group-item list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>판매내역
					</a> 
					
					<!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 입고 상품</a>
						</c:if>
						
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd2" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 목록</a>
						</c:if>
						<!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
					
					<a href="#"
						class="list-group-item list-group-item-action text-danger logout">
						<i data-feather="log-out" class="mr-3"></i> Logout
					</a>
				</div>
			</div>
		</div>

		<div class="col mt-3 mt-md-0">
			<div class="card">
				<div class="card-body">
					<h3>구매 내역</h3>
					<hr>
             <div class="table-responsive">
                <table class="table table-hover" data-addclass-on-xs="table-sm">
                  <thead class="thead-light">
                    <tr>
                      <th scope="col">가맹점코드</th>
                      <th scope="col">상품번호</th>
                      <th scope="col">카테고리</th>
                      <th scope="col">상품 이름</th>
                      <th scope="col">상품 상태</th>
                      <th scope="col">상품 가격</th>
                      <th scope="col">판매자</th>
                      <th scope="col" class="text-right">결제시간</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${paymentList}" var="list">
                    <tr>
                      <th scope="row"><span class="badge badge-warning rounded">${list.imp_uid}</span></th>
                      <td class="text-right">${list.pro_num}</td>
                      <td>${list.cate_code}</td>
                      <td>${list.title }</td>
                      <td>${list.quality}</td>
                      <td>${list.price}</td>
                      <td>${list.buyer_name}</td>
                      <td class="text-right">${list.create_date}</td>
                    </tr>
                   </c:forEach>
                  </tbody>
                </table>
              </div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- /Main Content -->

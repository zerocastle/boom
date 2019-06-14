<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css">

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
	
	$('#updateBtn').click(function(e){

		e.preventDefault();

		var query = {
			nickname : $('#nickname').val(),
			phone : $('#phone').val(),
			email : $('#email').val(),
			acc_name : $('#acc_name').val(),
			acc_num : $('#acc_num').val(),
			intro : $('#intro').val()
		}

		$.ajax({
			type : 'post',
			url : 'myPage',
			data : JSON.stringify(query),
			dataType : 'json',
			contentType : "application/json;charset=UTF-8",
			async : false,
			success : function(data) {
				var a = data;

				window.location.reload();
			},
			error : function() {
				alert("Error");
			}
		});
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
						title="매너 점수는 ${member.manner }입니다.">
						<canvas id="foo" class="foo"></canvas>
					</div>
				</div>
				<div class="list-group list-group-flush">
					<a href="/member/myPage"
						class="list-group-item list-group-item-action active"><i
						data-feather="user" class="mr-3"></i>프로필</a>
						 <a href="/member/myProduct" class="list-group-item has-badge list-group-item-action">
						 <i data-feather="shopping-bag" class="mr-3"></i>내 상품<span class="badge rounded badge-primary">${proCount }</span></a>
						 <a href="#" id="pick" class="list-group-item has-badge list-group-item-action">
						 <i data-feather="heart" class="mr-3"></i>찜목록<span class="badge rounded badge-primary">${like }</span></a> 
						 <a href="#" id="review" class="list-group-item has-badge list-group-item-action">
						 <i data-feather="edit-3" class="mr-3"></i>리뷰<span class="badge rounded badge-primary">${pv }</span></a> 
						 <a href="#" id="buyList" class="list-group-item list-group-item-action">
						 <i data-feather="shopping-bag" class="mr-3"></i>구매내역</a> 
						 <a href="#" id="sellList" class="list-group-item list-group-item-action">
						 <i data-feather="shopping-bag" class="mr-3"></i>판매내역</a> 
						 <a href="#" class="list-group-item list-group-item-action text-danger logout">
						 <i data-feather="log-out" class="mr-3"></i> Logout</a>
				</div>
			</div>
		</div>

		<div class="col mt-3 mt-md-0">
			<div class="card">
				<div class="card-body">
					<h3>My Profile</h3>
					<hr>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="nickname"
									value="${member.nickname }" readonly>
							</div>
							<div class="form-group col-sm-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email"
									value="${member.email }">
							</div>
							<div class="form-group col-sm-6">
								<label for="phone">휴대폰</label> <input type="number"
									class="form-control" id="phone" value="${member.phone }">
							</div>
							<div class="form-group col-sm-6">
								<label for="acc_name">은행명</label> 
									<select class="form-control">
									<option id="acc_name" selected>${member.acc_name }</option>
									<option value="NH농협">NH농협</option>
									<option value="KB국민">KB국민은행</option>
									<option value="신한">신한은행</option>
									<option value="우리">우리은행</option>
									<option value="하나">KEB하나은행</option>
									<option value="IBK기업">IBK기업은행</option>
									<option value="외환">외환은행</option>
									<option value="SC제일">SC제일은행</option>
									<option value="씨티">씨티은행</option>
									<option value="KDB산업">KDB산업은행</option>
									<option value="새마을">새마을금고</option>
									<option value="대구">대구은행</option>
									<option value="광주">광주은행</option>
									<option value="우체국">우체국</option>
									<option value="신협">신협중앙회</option>
									<option value="전북">전북은행</option>
									<option value="경남">경남은행</option>
									<option value="부산">부산은행</option>
									<option value="수협">수협중앙회</option>
									<option value="제주">제주은행</option>
									<option value="저축은행">상호저축은행</option>
									<option value="산림조합">산림조합중앙회</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<label for="acc_num">계좌번호</label> <input type="number"
									class="form-control" id="acc_num"
									value="${member.acc_num }">
							</div>
							<div class="form-group col-sm-6">
								<label for="intro">소개글</label> <input
									type="text" class="form-control" id="intro"
									value="${member.intro }">
							</div>
							<div class="form-group col-12">
								<button type="button" id="updateBtn" class="btn btn-primary">UPDATE PROFILE</button>
							</div>
						</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /Main Content -->

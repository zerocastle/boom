<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css">

<script>
$(document).ready(function(){
	
	var data = $('#nickname').text();
	console.log(data);
	
	 var jack = ${member.manner};
	 function startFoo() {
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
	       gauge.set(jack); // set actual value
	    }
	    startFoo();
	
	$('#reviewBtn').click(function(e){
		e.preventDefault();
		window.location.href = "/member/review/"+$('#nickname').text();
	});
	
	$('#updateBtn').click(function(e){

		$('#phone1').css('display','none');
		$('#phone2').css('display','inline-block')
		$('#email1').css('display','none');
		$('#email2').css('display','inline-block')
		$('#acc_name1').css('display','none');
		$('#acc_name2').css('display','block');
		$('#acc_num1').css('display','none');
		$('#acc_num2').css('display','block');
		$('#intro1').css('display','none');
		$('#intro2').css('display','block');
		$('.introDiv').css('height','120px');
		$('.updateDiv2').css('display','block');
		$('.updateDiv').css('display','none');
		
		$('#phone').val($.trim($('#phone1').text()));
		$('#email').val($.trim($('#email1').text()));
		$('#acc_name').text($('#acc_name1').text());
		$('#acc_num').val($.trim($('#acc_num1').text()));
		$('#intro').val($.trim($('#intro1').text()));
	});
	
	$('#updateBtn2').click(function(){
		$('#nickname2').css('display','none');
		$('#nickname').css('display','inline-block');
		$('#phone2').css('display','none');
		$('#phone1').css('display','inline-block')
		$('#email2').css('display','none');
		$('#email1').css('display','inline-block')
		$('#acc_name2').css('display','none');
		$('#acc_name1').css('display','block');
		$('#acc_num2').css('display','none');
		$('#acc_num1').css('display','block');
		$('#intro2').css('display','none');
		$('#intro1').css('display','block');
		$('.introDiv').css('height','0px');
		$('.updateDiv').css('display','block');
		$('.updateDiv2').css('display','none');
		
		var query = {
			nickname : 	$('#nickname').text(),
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
			success : function(data){
				var a = data;
				
				alert('업데이트 성공');
				
				$('#phone1').text(a.phone);
				$('#email1').text(a.email);
				$('#acc_name1').text(a.acc_name);
				$('#acc_num1').text(a.acc_num);
				$('#intro1').text(a.intro);
			},
			error: function(){
	            alert("Error");
	        }
		});
	});
});
</script>

<div class="other">
	<div class="left-layout">
		<div class="other-info">
			<div class="other-profile1">이미지 (보류)</div>
			<div class="other-profile2">
				<div class="other-nickname">
					<img class="profile-nickname" src="/resources/image/profile.png">
					<span id="nickname">${member.nickname }</span>
				</div>

				<div class="margin-class">
					<div class="other-profile2-left">휴대폰</div>
					<div class="other-profile2-right">
						<div id="phone1">${member.phone }</div>
						<div id="phone2">
							<input class="infoInput" id="phone" name="phone" type="text">
						</div>
					</div>
				</div>

				<div class="margin-class">
					<div class="other-profile2-left">이메일</div>
					<div class="other-profile2-right">
						<div id="email1">${member.email }</div>
						<div id="email2">
							<input class="infoInput" id="email" name="eamil" type="text">
						</div>
					</div>
				</div>

				<div class="margin-class">
					<div class="other-profile2-left">은행명</div>
					<div class="other-profile2-right">
						<div id="acc_name1">${member.acc_name }</div>
						<div id="acc_name2">
							<select class="dropdown__select">
								<option id="acc_name" selected></option>
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
					</div>
				</div>

				<div class="margin-class">
					<div class="other-profile2-left">계좌번호</div>
					<div class="other-profile2-right">
						<div id="acc_num1">${member.acc_num }</div>
						<div id="acc_num2">
							<input class="infoInput" id="acc_num" name="acc_num" type="text">
						</div>
					</div>
				</div>


				<div class="margin-class">
					<div class="introDiv">
						<div class="other-profile2-left ">소개글</div>
					</div>
					<div class="introDiv">
						<div class="other-profile2-right">
							<div id="intro1">${member.intro }</div>
							<div id="intro2">
								<textarea id="intro" name="intro"></textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="margin-class">

					<div class="updateDiv">
						<input id="updateBtn" type="button" value="프로필 수정하기">
					</div>
					<div class="updateDiv2">
						<input id="updateBtn2" type="submit" value="프로필 수정완료">
					</div>
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
			<button type="button" id="reviewBtn" class="btn btn-primary">
				상점 후기 보기 <span class="badge badge-light">${pv }</span>
			</button>
		</div>
	</div>

	<div class="right-layout">
		<div class="product-title-line">상품목록</div>
		<!-- product-info -->
		<div id="mypage-1" class="page">
			<ul class="category-product-list">
				<li><a href="#" id="productNext">
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>

							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>
				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

			</ul>
		</div>
		<!-- product-info end -->
	</div>
</div>

<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
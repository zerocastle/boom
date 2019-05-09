<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
   href="/resources/css/productList.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/review.css">

<script>
$(document).ready(function(){
	
	var data = $('#nickname').text();
	console.log(data);
	
	$('#reviewBtn').click(function(e){
		e.preventDefault();
		window.location.href = "/member/review/"+'${data}'
	});
	
<<<<<<< HEAD
	var searchNick = $('#searchNick').val();

	$('#searchBtn').click(function(e) {
		e.preventDefault();
		window.location.href = "/member/review/"+$('#searchNick').val();
	});
	
	var jack = ${other.manner};
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
=======

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
	   
>>>>>>> refs/remotes/origin/boom-jh
	   startFoo();
});
</script>

<div class="other">
	<div class="left-layout">
		<div class="other-info">
			<div class="other-profile1">
				이미지 (보류)
			</div>
			<div class="other-profile2">
					<div class="other-nickname">
						<img class="profile-nickname"src="/resources/image/profile.png">
						<span id="nickname">${other.nickname }</span>
					</div>
				<div class="margin-class">
					<div class="other-profile2-left">
					이메일
					</div>
					<div class="other-profile2-right">
						${other.email }
					</div>
				</div>
				<div class="margin-class">
					<div class="other-profile2-left">
					소개글
					</div>
					<div class="other-profile2-right">
						${other.intro }
					</div>
				</div>
				<div class="line">
					<div class="other-manner-top">
						매너게이지
					</div>
					<div class="other-manner-bottom">
		         			<canvas id="foo" class="foo"></canvas>
		      		</div>
		      	</div>
			</div>
		</div>
		<div class="review">
			<button type="button" id="reviewBtn" class="btn btn-primary">
    		상점 후기 보기
    		 <span class="badge badge-light">${pv }</span>
 		    </button>
		</div>
	</div>
	<div class="right-layout">
		<div class="product-title-line">
			상품목록
		</div>
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
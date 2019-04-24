<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
   integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">   
<link rel="stylesheet" type="text/css" href="/resources/css/productView.css" />
<script src="resources/customJs/productView.js"></script>

<script>
$(document).ready(function(){
 	$('.nick').click(function(e){  

		 var query = { nick : $('.nick').text()};
			console.log(query);
			window.location.href="/member/other/"+$('.nick').text();
			/* $.ajax({
			type : 'post',
			url: '/member/other',
	        data: query,
	        dataType : 'json', 
	        contentType : "application/json;charset=UTF-8",
	        success: function(data){
	        	console.log(data);
	     		alert("success");
	     		window.location.href = "/member/other/"+data; 
	        },
	        error: function(){
	            alert("error");
	            
	        } */
		//});  
 		/* e.preventDefault();
		window.location.href = "/member/other";  */
	});
});
</script>

           <div id="floatMenu">
          <span class="kjim">최근찜한상품</span>
          <span><i class="fas fa-heart"></i></span>
          <input type="text" name="num" value="0" class="num" readonly/>
          <div class="top1"><button class="top2" onclick="goTop()">TOP</button></div>
        </div>
 
				<div class="shCMSshop">
					
					<div class="shopView">
						<div class="viewHeader">
							<!-- 상품이미지 -->
							<div class="productImg">
								<div class="mainImg">
									<img src="main.jpg" alt="">
								</div>
								<ul class="subImg">
									<li><img src="sub01.jpg" alt="서브 이미지1"></li>
									<li><img src="sub02.jpg" alt="서브 이미지2"></li>
									<li><img src="sub01.jpg" alt="서브 이미지3"></li>
									<li><img src="sub01.jpg" alt="서브 이미지4"></li>
								</ul>
							</div>
							<!-- 상품 설명 -->
							<div class="productInfo">
								<h1>나이키 에어포스</h1>
								<div class="price">
									<span class="sale-price">35,000원</span>
								</div>
								<div class="manufact">상품상태 <span>미사용(새물품)</span></div>
								<div class="categori">교환여부 <span>교환 불가능</span></div>
								<div class="origin">거래지역 <span>대구 광역시 북구 복현동 1동</span></div>
								<div class="race"> 직플레이스 <span> #복현 1동 다이소</span></div>

								<div class="manner">
									<span>
										<i class="fas fa-user-circle"></i>
									</span>
									<div>
										<label class="nick">tom</label>
									</div>

									<div>
										<label class="adrs">북구 복현1동</label>
									</div>
								
									<div>
										<canvas id="foo" height="120px" width="200px" class="foo" ></canvas>
								
										</div>
								
								
								
								</div>
								<div class="btn">
									<button class="djim" id="jimclick">찜</button>
									<button class="djim1">직톡하기</button>
								</div>
							</div>
						</div>
						<!-- 하단의 탭부분 시작 -->
						<div class="viewBody">
							<ul class="contentNav">
								<li class="active"><a href="">상품 정보</a></li>
							<li><a href="">상품 댓글<span>(<span class="count">20</span>)</span></a></li>
							</ul>
							<!-- 탭부분 끝 -->
							<!-- 상품정보 -->
							<div class="info">
								<div>
									<span class="infoo">상품정보</span>

									<hr style="margin-top: 50px; border-color: gray">

									<div class="cont">
										<div class="username">
											<label>샘오취리</label>
										</div>

										<div class="account">
											<label class="ac">나이키 공홈에서 산 정품입니다. <br>한번도 신지 않았습니다.<br>쿨거래 합니다 </label>

										</div>
									</div>

										<div class="user" style="z-index: 1; position: relative;">
											<div style="display: inline-block; z-index: 2; position: relative;">
											<span>
												<i class="fas fa-user-circle" style="top:15px;"></i>
											</span>
											</div>
											<div style="display: inline-block; z-index: 3; position: relative;">
											<!-- <div class="nick1"> -->
												<div>
												<label>샘 해밍턴</label>
											</div>
											<!-- <div class="adrs1"> -->
												<div style="display: inline-block; z-index: 4; position: relative;">
												<label>대구 북구 복현1동</label>
											</div>
										</div>

										<!--shit-->
										<div >
											<canvas id="foo2" height="90px" width="150px" class="foo2" ></canvas>
										</div>
										</div>
									
								</div>
								
								<div class="box">
								
									 <div class="box1">
								<label>직플레이스 선정</label>
								
									</div>
							
								<div class="box2">
									<label>#복현동 다이소<br>
										   #복현동 봄봄</label>
									
								
								</div>
							
							</div>
							
							</div>
							</div>
							</div>
							</div>

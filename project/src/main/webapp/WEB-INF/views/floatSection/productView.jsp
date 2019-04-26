<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
   integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">   
<link rel="stylesheet" type="text/css" href="/resources/css/productView.css" />
<script src="/resources/customJs/productView.js"></script>

<script>
// 상대방 계정 접근
$(document).ready(function(){
 	$('.nick').click(function(e){  

		 var query = { nick : $('.nick').text()};
			console.log(query);
			window.location.href="/member/other/"+$('.nick').text();
	});
 	
 	var result = ${requestScope.productView};
 	console.log(result);
 	
 	// 오른쪽 상품 정보
 	var title = $('.productInfo').children().first();
 	var price = title.next();
 	var p_quality = price.next();
 	var add = p_quality.next();
 	var pick = add.next();
 	
 	title.html(result[0].ProMemberJoinDTO.title);
 	price.find("span").html(comma(result[0].ProMemberJoinDTO.price) + "원");
 	p_quality.find("span").html(result[0].ProMemberJoinDTO.p_quality);
 	add.find("span").html(result[0].ProMemberJoinDTO.addr);
 	pick.find("span").html(result[0].ProMemberJoinDTO.place_pick);
 	
 	// 이미지 
 	var realPath = "${pageContext.request.contextPath}/resources/";
 	
 	var target = $('.productImg') // 이미지 처음 타겟
 	var mainImg = target.children().first().find('img'); // 이미지 메인타겟
 	mainImg.width(500).height(500);
 	var subImg = target.find('ul'); // 이미지 서브 타겟
 	var imgLength = result[0].Production_uploadVO.length; // 이미지 갯수
	
 	var j = 0;
   	 for(var i = 0; i < imgLength ; i++){
   		
 		if(result[0].Production_uploadVO[i].rep == 1){
 			 mainImg.attr('src',realPath+
 					 result[0].Production_uploadVO[i].uploadPath +'/'+ 
 					 result[0].Production_uploadVO[i].uuid+'_'+
 					 result[0].Production_uploadVO[i].fileName
 					 );
 			 j++;
 		}else{
 			var temp = subImg.children().eq(i - j).find("img");
 			temp.width(85).height(85);
 	 		temp.attr('src',realPath+
 					 result[0].Production_uploadVO[i].uploadPath +'/s_'+ 
 					 result[0].Production_uploadVO[i].uuid+'_'+
 					 result[0].Production_uploadVO[i].fileName
 					 );
 		}
 	
 		
 	}    
 	
 	
	// 콤마찍기 정규 표현식
	function comma(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
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
									<img src="http://placehold.it/500x500" alt=""/>
								</div>
								<ul class="subImg">
									
									<li><img src="http://placehold.it/85x85" alt="서브이미지1" /></li>
									<li><img src="http://placehold.it/85x85" alt="서브이미지2" /></li>
									<li><img src="http://placehold.it/85x85" alt="서브이미지3" /></li>
									<li><img src="http://placehold.it/85x85" alt="서브이미지4" /></li>
								
								</ul>
							</div>
							<!-- 상품 설명 -->
							<div class="productInfo">
								<h1>나이키 에어포스</h1>
								<div class="price">
									<span class="sale-price">35,000원</span>
								</div>
								<div class="manufact" style="color:#000000;">상품상태 :  <span>미사용(새물품)</span></div>
								<!-- <div class="categori">교환여부 <span>교환 불가능</span></div> --> <!-- 없애 -->
								<div class="origin">거래지역 :  <span>대구 광역시 북구 복현동 1동</span></div>
								<div class="race"> 직플레이스 :  <span> #복현 1동 다이소</span></div>
								
								<!-- 매너 게이지 !!! -->
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
								<!-- 매너게이지 부분 영역 끝 -->
								
								<div class="btn">
									<button class="djim" id="jimclick">찜</button>
									<button class="djim1">연락하기</button>
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
							
							<!-- 상품정보 끝나는 시점 -->
							
							</div>
							</div>
							</div>

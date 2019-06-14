<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
	integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/css/productView.css" />

<style>
	.zip-img{
		margin-top : 10px;
		border: 1px solid black;
		height: 270px;
	}
	.addrlocation{
		position: relative;
		border: 0.5px solid black;
		bottom: 400px;
		left:150px;
		padding:10px;
		background-color: white;
		font-size: 18px;
		font-weight: 700;
	}
	#memImg{
		width: 100px;
		height: 100px;
		border-radius: 50%;
		margin-left: 15px;
		margin-top: 8px;
	}
	.imgLine{
	 	display: inline-block;
	}
	.mannerLine{
		display: inline-block;
	}
</style>

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
 	
 	 $('#doChat').click(function(){
 		 var temp = "${sessionScope.loginSession.m_num}";
 		 if(temp == ""){
 			 alert("로그인을 먼저 해주세요");
 			 return ;
 		 }
 		var session;
		var m_num = result[0].ProMemberJoinDTO.m_num;
		var pro_num = result[0].ProMemberJoinDTO.pro_num;
		console.log(result[0].ProMemberJoinDTO);
		if(m_num == temp){
			alert('해당 판매글을 작성한 판매자 계정입니다, 채팅을 진행 할 수 없습니다.');
		}
		else{
			window.open('/chatting/doChat?m_num='+m_num+'&pro_num='+pro_num, 'doChat', 'width=850,height=600');
		}
	}); 
 	
 	 $('#pickClick').click(function(){
 		 var temp = "${sessionScope.loginSession.m_num}";
 		 if(temp == ""){
 			 alert("로그인을 먼저 해주세요");
 			 return ;
 		 }
	 	if(m_num == temp){
				alert('작성자의 판매상품으로 찜목록에 추가할 수 없습니다.');
				return false;
		}
 		 var pro_num = result[0].ProMemberJoinDTO.pro_num;
 		 
 		 $.ajax({
 			type : 'post',
 			url : '/member/insertPick',
 			data :  JSON.stringify({
 				pro_num : pro_num,
 			}),
 			contentType : "application/json;charset=UTF-8",
 			async : false,
 			success : function(data){
 				console.log(data);
 				if(data == 0){
 					alert('찜목록에 추가했습니다.');
 				}else{
 					alert('이미 찜목록에 추가되어있습니다.');
 				}
 			},
 			error : function(error){
 				console.log(error)
 			}
 		 });
 	 });
 	 
 	// 오른쪽 상품 정보
 	var title = $('.productInfo').children().first();
 	var price = title.next();
 	var p_quality = price.next();
 	var add = p_quality.next();
 	var pick = add.next();
 	var uuid = result[0].ProMemberJoinDTO.uuid;
 	console.log(uuid);
 	var filename = result[0].ProMemberJoinDTO.fileName;
 	console.log(filename);
 	var uploadPath = result[0].ProMemberJoinDTO.uploadPath;
 	console.log(uploadPath);
 	
 	title.html(result[0].ProMemberJoinDTO.title);
 	price.find("span").html(comma(result[0].ProMemberJoinDTO.price) + "원");
 	p_quality.find("span").html(result[0].ProMemberJoinDTO.p_quality);
 	add.find("span").html(result[0].ProMemberJoinDTO.addr);
 	pick.find("span").html(result[0].ProMemberJoinDTO.place_pick);
 	$('.addrlocation').html($('.zic-addr').text());
 	$('#memImg').attr("src","${pageContext.request.contextPath}/resources/"+uploadPath+"/"+uuid+"_"+filename);
 	// 이미지 
 	var realPath = "${pageContext.request.contextPath}/resources/";
 	
 	var target = $('.productImg') // 이미지 처음 타겟
 	var mainImg = target.children().first().find('img'); // 이미지 메인타겟
 	mainImg.width(400).height(400);
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
 					 result[0].Production_uploadVO[i].uploadPath +'/'+ 
 					 result[0].Production_uploadVO[i].uuid+'_'+
 					 result[0].Production_uploadVO[i].fileName
 					 );
 		}
 	
 		
 	}
   	 
   	 // 서브 이미지 누를때마다 사진 바꿈
   	$('.subImg img').mouseover(function(){
   		var mainImageConst = $('.mainImg > img').attr('src');
   		var temp = $(this).attr('src');
   		$('.mainImg > img').attr('src',temp);
   		
   		$('.subImg img').mouseout(function(){
   			$('.mainImg > img').attr('src',mainImageConst);
   		})
   	})
   	//상품정보 ~!!!
   	var contentInfo = $('.account');
   	
   	contentInfo.html(result[0].ProMemberJoinDTO.content);
 	
 	
	// 콤마찍기 정규 표현식
	function comma(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 직플레이스 선정
	var pick = $('.box2');
	pick.html("<label># " + result[0].ProMemberJoinDTO.place_pick + "</label>");
	
	// 맴버
	var member = $('.nick').html(result[0].ProMemberJoinDTO.nickname);
	var intro = $('.adrs').html(""+result[0].ProMemberJoinDTO.intro);
	if(result[0].ProMemberJoinDTO.intro == ""){
		 $('.adrs').html("소개글이 없습니다.");
	}
	
	$('#searchg').click(function(e){
		e.preventDefault();
		window.location.href = "/partner/placeSearch"
	});
	
	// 매너 게이지
	var manner = result[0].ProMemberJoinDTO.manner;
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
<div class="container mt-3">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="shCMSshop">

					<div class="shopView">
						<div class="viewHeader">
							<!-- 상품이미지 -->
							<div class="productImg">
								<div class="mainImg">
									<img src="http://placehold.it/400x400" alt="" />
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
								<h2>나이키 에어포스</h2>
								<div class="price">
									<span class="sale-price">35,000원</span>
								</div>
								<div class="manufact" style="color: #000000;">
									상품상태 : <span>미사용(새물품)</span>
								</div>
								<!-- <div class="categori">교환여부 <span>교환 불가능</span></div> -->
								<!-- 없애 -->
								<div class="origin">
									거래지역 : <span class="zic-addr">대구 광역시 북구 복현동 1동</span>
								</div>
								<div class="race">
									직플레이스 : <span> #복현 1동 다이소</span>
								</div>

								<!-- 매너 게이지 !!! -->
								<div class="manner">
									<div class="imgLine">
										<img id="memImg" src="">
									</div>
									<div class="nickLine">
										<label class="nick">tom</label>
									</div>

									<div class="addrLine">
										<label class="adrs">북구 복현1동</label>
									</div>

									<div class="mannerLine">
										<canvas id="foo" height="120px" width="200px" class="foo"></canvas>

									</div>
								</div>
								<!-- 매너게이지 부분 영역 끝 -->

								<div class="btn">
									<button class="djim" id="pickClick">찜</button>
									<button class="djim1" id="doChat">직톡하기</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card-header bg-white border-bottom flex-center p-0 mt-3">
		<ul class="nav nav-pills card-header-pills main-nav-pills"
			role="tablist">
			<li class="nav-item"><a class="nav-link active" id="description"
				data-toggle="tab" href="#description-content" role="tab"
				aria-controls="description-content" aria-selected="true">상품 정보</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="reviews"
				data-toggle="tab" href="#review-content" role="tab"
				aria-controls="review-content" aria-selected="false">거래 위치</a>
			</li>
		</ul>
	</div>
	<div class="tab-content">
  <div class="card-body tab-pane fade show active" id="description-content" role="tabpanel" aria-labelledby="description">
                       <div class="detail_comment">
                       		<p class="info-title">-상품정보 상세설명-</p>
                       		<p class="account"></p>
                       </div>
                      </div>
		<div class="card-body tab-pane fade" id="review-content"
			role="tabpanel" aria-labelledby="reviews">
			<div class="row gutters-3 justify-content-center">
				<!-- <div class="col-11 col-sm-6 col-md-4 col-lg-3">
					<h5 class="bold roboto-condensed rating">
						직플레이스 정보
					</h5>
					<div class="list-group">
						<div class="zip-img">
						
						</div>
					</div>
					<div class="text-center mt-1">
						<button id="searchg" class="btn btn-primary btn-block rounded-pill"
							data-toggle="modal" data-target="#reviewModal">다른 직플레이스 찾기</button>
					</div>
				</div> -->
				<div class="col-md-8 col-lg-9 mt-5 mt-md-0">
					<div class="media">
						<div id="map" style="width:1172px; height:400px;"></div>
						</div>
					</div>
					<!-- <div class="addrlocation"><div> -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Related Products -->

<!-- /Main Content -->
<script>
naver.maps.Service.geocode({
    query: $('.zic-addr').text()
}, function(status, response) {
    if (status !== naver.maps.Service.Status.OK) {
        return alert('Something wrong!');
    }

    var result = response.v2, // 검색 결과의 컨테이너
        items = result.addresses; // 검색 결과의 배열
		console.log(items);
        
        console.log(items[0].x);
    // do Something
    
        var mapOptions = {
        	    center: new naver.maps.LatLng(items[0].y, items[0].x),
        	    zoom: 9
        	};

        	var map = new naver.maps.Map('map', mapOptions);
});


</script>
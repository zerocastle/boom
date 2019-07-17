<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="/resources/customJs/recentProduct.js"></script>
<script src="/resources/customJs/remote.js"></script>
  <link rel="stylesheet" href="/resources/plugins/swiper.min.css">
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<style>
.pro-title-span {
	display: inline-block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 120px;
	height: 20px;
}

.swiper-container {
	width: 100%;
	height: 421px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.slideshow-container {
	position: relative;
	margin: auto;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
	
}

.dot1 {
    position: relative;
    bottom: 35px;
    text-align: center;
}
.dot {
height: 15px;
width: 15px;
margin: 0 2px;
background-color: #bbb;
border-radius: 50%;
display: inline-block;
transition: background-color 0.6s ease;
position: relative;

}
.img1{
width:100%;
height:400px;
}

</style>
<!-- 인덱스 사진들 -->

<script>
	$(function() {
		var production = ${requestScope.productions};
		var realPath = "${pageContext.request.contextPath}/resources/";
		var target = $("#forTest"); // 남성의류
		var target2 = $("#forTest2"); //여성의류
		var target3 = $("#forTest3"); // 전자제품
		var target4 = $("#forTest4"); // 가구/인테리어
		var target5 = $("#forTest5"); // 유야아용품
		var target6 = $("#forTest6"); // 스포츠/레저
		var target7 = $("#forTest7"); //게임/취미
		var target8 = $("#forTest8"); // 뷰티/미용
		var target9 = $("#forTest9"); // 생활 /가공품
		var target10 = $("#forTest10");//반려동물
		var target11 = $("#forTest11"); // 도서/티켓/음반
		var target12 = $("#forTest12"); //기타/잡화
		var counter = 0;
		var counter2 = 0;
		var counter3 = 0;
		var counter4 = 0;
		var counter5 = 0;
		var counter6 = 0;
		var counter7 = 0;
		var counter8 = 0;
		var counter9 = 0;
		var counter10 = 0;
		var counter11 = 0;
		var counter12 = 0;
		for (var i = 0; i < production.length; i++) {
			var cate_code = production[i].cate_code;
			switch (cate_code) {
			case "man": {
				var path = realPath + production[i].path;
				var img = $('#target').children().eq(counter).find('img');
				var imgStyle = img.width('160px').height('160px').css('max-width','100%');
				var title = $('#target').children().eq(counter).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter++;
				break;
			}
			case "woman": {
				var path = realPath + production[i].path;
				var img = $('#target2').children().eq(counter2).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target2').children().eq(counter2).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter2++;
				break;
			}
			case "elect": {
				var path = realPath + production[i].path;
				var img = $('#target3').children().eq(counter3).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target3').children().eq(counter3).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter3++;
				break;
			}
			case "furniture": {
				var path = realPath + production[i].path;
				var img = $('#target4').children().eq(counter4).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target4').children().eq(counter4).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter4++;
				break;
			}
			case "baby": {
				var path = realPath + production[i].path;
				var img = $('#target5').children().eq(counter5).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target5').children().eq(counter5).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter5++;
				break;
			}
			case "sport": {
				var path = realPath + production[i].path;
				var img = $('#target6').children().eq(counter6).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target6').children().eq(counter6).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter6++;
				break;
			}
			case "hobby": {
				var path = realPath + production[i].path;
				var img = $('#target7').children().eq(counter7).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target7').children().eq(counter7).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter7++;
				break;
			}
			case "beauty": {
				var path = realPath + production[i].path;
				var img = $('#target8').children().eq(counter8).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target8').children().eq(counter8).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter8++;
				break;
			}
			case "life": {
				var path = realPath + production[i].path;
				var img = $('#target9').children().eq(counter9).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target9').children().eq(counter9).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter9++;
				break;
			}
			case "animal": {
				var path = realPath + production[i].path;
				var img = $('#target10').children().eq(counter10).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target10').children().eq(counter10).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter10++;
				break;
			}
			case "book": {
				var path = realPath + production[i].path;
				var img = $('#target11').children().eq(counter11).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target11').children().eq(counter11).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter11++;
				break;
			}
			case "else": {
				var path = realPath + production[i].path;
				var img = $('#target12').children().eq(counter12).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = $('#target12').children().eq(counter12).find('.card-title');
				var placeImage = title.siblings('span') //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
					.attr('class','badge badge-success')
					.html("직플거래");
				} else
					placeImage
					.attr('class','badge badge-warning')
					.html("직거래");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : <span class='h5'>" + commaPrice + "</span> 원"); // 가격
				var pro_num = price.next().next().html(production[i].pro_num); // 상품 번호
				title.html(production[i].title ); //타이틀
				img.attr('src', path);
				counter12++;
				break;
			}
			} // 스위치 끝나는 시점
		} // 포문 끝나는 시점
		for ( var i in production) {
			console.log(production[i]);
			var pro_num = production[i].pro_num;
			var title = production[i].title;
			var price = production[i].price;
			var cate_code = production[i].cate_code;
			var place_signal = production[i].place_signal;
			var state_msg = production[i].state_msg;
			var test = comma(price);
			console.log("콤바 변환 : " + test);
			//console.log(childN);
			//console.log(target.children(production[i]).html()); 
		}
		// 콤마찍기 정규 표현식
		function comma(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		// 상품 클릭시 발생 이벤트
		$('.card-body')
				.click(
						function() {
							var init = $(this).children().children().last().text();
							console.log(init);
							if (init == "") {
								alert("해당 상품이 없습니다.");
								return;
							}
							/* alert($(this).children().children().children().attr('src')); */
							/* var cal = length - 8;
							var result = init.html().substr(8, (8 + cal)); */
						 	var pattern = /\\/g;
	/* 				
							setCookiePlus('recentView', init+','+$(this).children().children().children().attr('src').toString().replace(pattern,"/"),window.location.reload()); 
							console.log($(this).children().children().children().attr('src').replace(pattern,"/"));
							console.log($(this).children().children().children().attr('src').toString().replace(pattern,"/"));
							alert('d'); */
							window.location.href = "/production/index_productView?pro_num="
									+ init; 
						})

		// 상품 카테고리를 눌렀을때
		$('.cus')
				.click(
						function(e) {
							e.preventDefault();
							var cate_code = $(this).attr('data-cate');
							window.location.href = "/production/index_productList?cate_code="
									+ cate_code + "&order=asc";

						})
	})
</script>
<!-- 위치기반 배너 보이기 -->
<script>
 	$(function(){
 		
 		var array = new Array();
 		var resultArray = new Array();

 		
 		//배열에 대한 객체
 		var object = function(distance,object){
 				this.distance = distance,
 				this.object = object,
 				
 				this.signal = function(){
 					window.alert(this.distance + "<=>"+ this.object);
 				};
 				
 		};
 		
 		// 내 정보 전송하고 값 가공해서 프로미스처리
 		var getPartner = function(lat,lon){
 			
 			return new Promise(function(resolve,reject){
 			
 			$.get('/getPartner',function(data){
 				console.log(lat + "나야 나" + lon);
 				console.log(data);
 				var distent = getDistanceFromLatLonInKm(lat,lon,data[0].lag,data[0].lng);
 				console.log("거리는 : " + distent);
 				for(var i = 0; i < data.length; i++){
 					var temp = getDistanceFromLatLonInKm(lat,lon,data[i].lag,data[i].lng);
 					array.push(temp);
 					var myObject = new object(temp,data[i]);
 					resultArray.push(myObject);
 				}
 				
 				console.log(resultArray);
 				
 				console.log(resultArray[0].distance);
 				
 				  for(var i = 0; i < resultArray.length; i++){
 					for(var j = 0; j < (resultArray.length -1) -i; j++ ){
 						if(resultArray[j].distance > resultArray[j+1].distance){
 							var temp = resultArray[j + 1];
 							resultArray[j + 1]= resultArray[j];
 							resultArray[j] = temp;
 						}
 					}
 				}  
 				console.log(resultArray);
 				if(resultArray){
 					resolve(resultArray);
 				}else{
 					reject(new Error("Request is failed"));
 				}
 				
 			});
 			
 			});
 			
 		};

 		navigator.geolocation.getCurrentPosition(function(position) {

 			console.log(position);
 			getGPS(position.coords);
 		});
 		
 		// 값뿌려 봅시다.
 		var getGPS = function(position){
 			var realPath = "${pageContext.request.contextPath}/resources/";
 			console.log(realPath);
 			var lat = position.latitude;
 			var lon = position.longitude;
 			getPartner(lat,lon).then(function(data){
 	 			console.log("promise 도착");
 	 			console.log(data);
 	 			
 	 			var swiperWrapper = $('.swiper-wrapper');
 	 			/* console.log(swiperWrapper.length); */
 	 			
 	 			for(var i = 0; i < 5; i++){
 	 				/* swiperWrapper.eq(i++); */
 	 				var name = realPath + data[i].object.uploadPath + "\\" + data[i].object.uuid + "_"+data[i].object.fileName;
 	 				swiperWrapper.append("<div class='swiper-slide banner'> <img src='"+name+"'/' class='img1'> </div> ");
 	 				
 	 			}
 	 	
 	 		});
 			
 		}
 		
 		// 위도 경도 차이 구하기
 		function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
 		    function deg2rad(deg) {
 		        return deg * (Math.PI/180)
 		    }

 		    var R = 6371; // Radius of the earth in km
 		    var dLat = deg2rad(lat2-lat1);  // deg2rad below
 		    var dLon = deg2rad(lng2-lng1);
 		    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
 		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
 		    var d = R * c; // Distance in km
 		    return d;
 		}
 		
 	})
	

    </script>

<!-- Main Content -->

<!-- Home slider -->
<div class="swiper-container">

	<div class="swiper-wrapper">
		
<!-- 		<div class="swiper-slide"> -->
<!-- 			<img src="/resources/봄봄3.jpg" /> -->
<!-- 		</div> -->

<!-- 		<div class="swiper-slide"> -->
<!-- 			<img src="/resources/star0.png" /> -->
<!-- 		</div>  -->
	

		

      

		<!-- <div class="swiper-slide banner">
			<img class="img1" src="">
		</div>

		<div class="swiper-slide banner">
			<img class="img2" src="">
		</div>


		<div class="swiper-slide banner">
			<img class="img3" src="">
		</div>


		<div class="swiper-slide banner">
			<img class="img4" src="">
		</div>

		<div class="swiper-slide banner">
			<img class="img5" src="">
		</div> -->




	</div>

</div>

<!-- <div class="swiper-container" id="home-slider"> -->
<!-- 	<div class="swiper-wrapper bannerWrapper"> -->

<!-- 		<!-- 1 배너 -->

<!-- 		<div class="swiper-slide banner" -->
<!-- 			data-cover="/resources/image/banner/1.png" data-xs-height="220px" -->
<!-- 			data-sm-height="350px" data-md-height="400px" data-lg-height="430px" -->
<!-- 			data-xl-height="460px"></div> -->
<!-- 		<!-- 2 배너 -->

<!-- 		<div class="swiper-slide banner" data-cover="/resources/image/banner/2.png" -->
<!-- 			data-xs-height="220px" data-sm-height="350px" data-md-height="400px" -->
<!-- 			data-lg-height="430px" data-xl-height="460px"></div> -->
<!-- 		<!-- 3 배너 -->

<!-- 		<div class="swiper-slide banner" data-cover="/resources/image/banner/3.png" -->
<!-- 			data-xs-height="220px" data-sm-height="350px" data-md-height="400px" -->
<!-- 			data-lg-height="430px" data-xl-height="460px"></div> -->
<!-- 		<!-- 4 배너 -->

<!-- 		<div class="swiper-slide banner" data-cover="/resources/image/banner/4.png" -->
<!-- 			data-xs-height="220px" data-sm-height="350px" data-md-height="400px" -->
<!-- 			data-lg-height="430px" data-xl-height="460px"></div> -->
<!-- 		<!-- 5 배너 -->

<!-- 		<div class="swiper-slide banner" data-cover="/resources/image/banner/5.png" -->
<!-- 			data-xs-height="220px" data-sm-height="350px" data-md-height="400px" -->
<!-- 			data-lg-height="430px" data-xl-height="460px"></div> -->

<!-- 	</div> -->
<!-- 	<div class="swiper-pagination"></div> -->
<!-- 	<div class="swiper-button-prev autohide"> -->
<!-- 		<i data-feather="chevron-left"></i> -->
<!-- 	</div> -->
<!-- 	<div class="swiper-button-next autohide"> -->
<!-- 		<i data-feather="chevron-right"></i> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- /Home slider -->

<div>
	<h4 class="bold text-center mt-gutter">카테고리 최신상품</h4>
</div>

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="man">남성의류</h4>
	<!-- Featured Products -->
	<div id="target" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="woman">여성의류</h4>
	<!-- Featured Products -->
	<div id="target2" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="elect">전자제품</h4>
	<!-- Featured Products -->
	<div id="target3" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="furniture">가구인테리어</h4>
	<!-- Featured Products -->
	<div id="target4" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="baby">유아용품</h4>
	<!-- Featured Products -->
	<div id="target5" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="sport">스포츠레저</h4>
	<!-- Featured Products -->
	<div id="target6" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="hobby">게임/취미</h4>
	<!-- Featured Products -->
	<div id="target7" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="beauty">뷰티미용</h4>
	<!-- Featured Products -->
	<div id="target8" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="life">생활/가공품</h4>
	<!-- Featured Products -->
	<div id="target9" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="animal">반려동물</h4>
	<!-- Featured Products -->
	<div id="target10"
		class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="book">도서/티켓/음반</h4>
	<!-- Featured Products -->
	<div id="target11"
		class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Featured Products -->

<div class="container mt-3">
	<h4 class="bold text-center mt-gutter cus" data-cate="else">기타/잡화</h4>
	<!-- Featured Products -->
	<div id="target12"
		class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>

		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
		<div class="card card-product">
			<div class="card-body">
				<div
					class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/160x160" alt="img" width="160px;"
						height="160px;"></a> <a href="#" class="card-title">상품없음</a>
					<div class="price">
						<span class="h5"></span>
					</div>
					<span class="badge badge-success"></span>
					<div class="hidenNo"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/plugins/swiper.min.js"></script>
<script>
          var swiper = new Swiper('.swiper-container');
</script>
<!-- /Featured Products -->

<!-- /Main Content -->

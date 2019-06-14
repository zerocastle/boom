<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="/resources/customJs/recentProduct.js"></script>
<script src="/resources/customJs/remote.js"></script>
<style>
.pro-title-span {
	display: inline-block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 120px;
	height: 20px;
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
  <!-- Main Content -->

    <!-- Home slider -->
    <div class="swiper-container" id="home-slider">
      <div class="swiper-wrapper">

        <div class="swiper-slide" data-cover="/resources/image/banner/banner1.png" data-xs-height="220px" data-sm-height="350px" data-md-height="400px" data-lg-height="430px" data-xl-height="460px">
      <!--     <div class="swiper-overlay right">
            <div class="text-center">
              <p class="display-4 animated textOne" data-animate="fadeDown"><span class="cop-name"></p>
              <a href="https://www.vr-jamong.com/" target="_black" class="btn btn-primary rounded-pill animated" data-animate="fadeUp" data-addclass-on-xs="btn-sm">바로가기</a>
            </div>
          </div> -->
        </div>

        <div class="swiper-slide" data-cover="/resources/image/banner/jamong.png" data-xs-height="220px" data-sm-height="350px" data-md-height="400px" data-lg-height="430px" data-xl-height="460px">
          <!-- <div class="swiper-overlay left">
            <div class="text-center">
              <h1 class="bg-white text-dark d-inline-block p-1 animated" data-animate="fadeDown"></h1>
              <p class="display-4 animated textOne" data-animate="fadeDown"><span class="cop-name">JAMONG</span>!<br/>직플파트너와 <span class="cop-name">함께</span>하다!</p>
              <a href="https://www.vr-jamong.com/" class="btn btn-warning rounded-pill animated gogo" data-animate="fadeUp" data-addclass-on-xs="btn-sm"><span>바로 가기</span></a>
            </div>
          </div> -->
        </div>

      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-prev autohide"><i data-feather="chevron-left"></i></div>
      <div class="swiper-button-next autohide"><i data-feather="chevron-right"></i></div>
    </div>
    <!-- /Home slider -->

	<div><h4 class="bold text-center mt-gutter">카테고리 최신상품</h4></div>

    <div class="container mt-3">
      <h4 class="bold text-center mt-gutter cus" data-cate="man">남성의류</h4>
      <!-- Featured Products -->
      <div id="target" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
        <div class="card card-product">
          <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
      <div id="target10" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
        <div class="card card-product">
          <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
      <div id="target11" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
        <div class="card card-product">
          <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
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
      <div id="target12" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
        <div class="card card-product">
          <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
		 <div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        <div class="card card-product">
<div class="card-body">
	          <div class="btn btn-sm rounded-pill btn-outline-primary btn-block atc-demo">
	            <a href="#"><img class="card-img-top" src="http://placehold.it/160x160" alt="img" width="160px;" height="160px;"></a>
	            <a href="#" class="card-title">상품없음</a>
	            <div class="price"><span class="h5"></span></div>
	            <span class="badge badge-success"></span>
	            <div class="hidenNo"></div>
	          </div>
          </div>
        </div>
        </div>
      </div>
      <!-- /Featured Products -->
      

    <!-- /Main Content -->

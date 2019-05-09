<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">


<!-- 인덱스 사진들 -->

<div id="floatMenu">
   <span class="kjim">최근찜한상품</span> <span><i class="fas fa-heart"></i></span>
   <input type="text" name="num" value="0" class="num" readonly />
   <div id="floater">
      <span class="pro-pro">최근본상품</span>
      <hr class="dott" style="color:black;">
      <div id="recentBanner">
         <div class="recentView" id="recentView"></div>
      </div>
   </div>
   
   <div class="top1">
      <button class="top2" onclick="goTop()">TOP</button>
   </div>
</div>



<div id="carouselExampleInterval" class="carousel slide"
	data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active" data-interval="10000">
			<img src="/resources/image/banner/banner_1.webp"
				class="d-block w-100" alt="" height="300px">
		</div>
		<div class="carousel-item" data-interval="2000">
			<img src="/resources/image/banner/banner_2.jpg" class="d-block w-100"
				alt="..." height="300px">
		</div>
		<div class="carousel-item">
			<img src="/resources/image/banner/3.jpg" class="d-block w-100"
				alt="..." height="300px">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleInterval"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleInterval"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
</div>
<div class="main-categori">

	<div id="ThumbnailCarousel" class="carousel slide col-xs-12"
		data-ride="carousel">
		<a class="carousel-control-prev" href="#ThumbnailCarousel"
			role="button" data-slide="prev" style="background-color: black;">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#ThumbnailCarousel"
			role="button" data-slide="next" style="background-color: black;">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>

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
				var img = target.children().eq(counter).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter++;
				break;
			}
			case "woman": {
				var path = realPath + production[i].path;
				var img = target2.children().eq(counter2).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter2++;
				break;
			}
			case "elect": {
				var path = realPath + production[i].path;
				var img = target3.children().eq(counter3).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter3++;
				break;
			}
			case "furniture": {
				var path = realPath + production[i].path;
				var img = target4.children().eq(counter4).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter4++;
				break;
			}
			case "baby": {
				var path = realPath + production[i].path;
				var img = target5.children().eq(counter5).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter5++;
				break;
			}
			case "sport": {
				var path = realPath + production[i].path;
				var img = target6.children().eq(counter6).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter6++;
				break;
			}
			case "hobby": {
				var path = realPath + production[i].path;
				var img = target7.children().eq(counter7).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter6++;
				break;
			}
			case "beauty": {
				var path = realPath + production[i].path;
				var img = target8.children().eq(counter8).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter8++;
				break;
			}
			case "life": {
				var path = realPath + production[i].path;
				var img = target9.children().eq(counter9).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter9++;
				break;
			}
			case "animal": {
				var path = realPath + production[i].path;
				var img = target10.children().eq(counter10).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter10++;
				break;
			}
			case "book": {
				var path = realPath + production[i].path;
				var img = target11.children().eq(counter11).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
				img.attr('src', path);
				counter11++;
				break;
			}
			case "else": {
				var path = realPath + production[i].path;
				var img = target12.children().eq(counter12).find('img');
				var imgStyle = img.width('160px').height('160px');
				var title = img.siblings('div').first();
				var placeImage = title.siblings('div').last(); //직플레이스 정보 이미지 들어갈 부분
				console.log(placeImage);
				if (production[i].place_signal == 1) {
					placeImage
							.html("<img src='/resources/image/place_signal/11.png' height='20'/>");
				} else
					placeImage
							.html("<img src='/resources/image/place_signal/22.png' height='20'/>");
				var commaPrice = comma(production[i].price);
				var price = title.next().html("가격 : " + commaPrice + " 원"); // 가격
				var pro_num = price.next().html(
						"상품 번호 : " + production[i].pro_num); // 상품 번호
				title.html("제목 : <span style='color:#FE2E2E; font:bold;'>"
						+ production[i].title + "</span>"); //타이틀
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
		$('.img-fluid')
				.click(
						function() {
							var init = $(this);
							var parent = init.parent();
							var target = parent.children().eq(4);
							var sendData = target.html();
							var length = sendData.length;
							if (length == 0) {
								alert("해당 상품이 없습니다.");
								return;
							}
							var cal = length - 8;
							var result = sendData.substr(8, (8 + cal));
							var pattern = /\\/g;
						
							setCookiePlus('recentView', result+','+$(this).attr("src").toString().replace(pattern,"/"),window.location.reload());

							window.location.href = "/production/index_productView?pro_num="
									+ result;
						})

		// 상품 카테고리를 눌렀을때
		$('.productList')
				.click(
						function(e) {
							e.preventDefault();
							var cate_code = $(this).attr('data-cate');
							window.location.href = "/production/index_productList?cate_code="
									+ cate_code;

						})
	})
</script>

<!-- 메인 프로덕트 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="man">남성의류</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 여성의류 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="woman">여성의류</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest2" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 전자제품 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="elect">전자제품</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest3" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 가구/인테리어 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="furniture">가구/인테리어</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest4" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>

<!-- 유아용품 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="baby">유아용품</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest5" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 스포츠/레저 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="sport">스포츠/레저</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest6" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>

<!-- 게임/취미 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="hobby">게임/취미</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest7" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>



<!-- 뷰티/미용 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="beauty">뷰티/미용</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest8" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 생활/가공품 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="life">생활/가공품</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest9" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 반려동물 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="animal">반려동물</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest10" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>



<!-- 도서/티켓/음반 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="book">도서/티켓/음반</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest11" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>


<!-- 기타/잡화 -->
<div class="main-product">
	<a class="productList" href="#" data-cate="else">기타/잡화</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">

					<div class="row" id="forTest12" style="padding-left: 15px;">
						<div class="aaa" id="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image"
								class="img-fluid img-thumbnail"><br />
							<div></div>
							<div></div>
							<div style="display: none;"></div>
							<div style="text-align: center;"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

</div>
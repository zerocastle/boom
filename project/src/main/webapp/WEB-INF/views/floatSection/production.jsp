<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">



<div id="floatMenu">
	<span class="kjim">최근찜한상품</span> <span><i class="fas fa-heart"></i></span>
	<input type="text" name="num" value="0" class="num" readonly />
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
			<img src="http://placehold.it/1236x300" class="d-block w-100"
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
		console.log("리얼 패스 : " + realPath);
		var target = $("#forTest");
		var childN = target.children().length;
		console.log(production);
		for (var a = 0; a < production.length; a++) {
			var path = realPath + production[a].path;
			console.log(path);
			var img = target.children().eq(a).find('img');
			var imgStyle = img.width('160px').height('160px');
			
			var title = img.siblings('div').first();
			var price = title.next().html("가격 : "+production[a].price + " 원"); // 가격
			var pro_num = price.next().html("상품 번호 : " + production[a].pro_num); // 상품 번호
			
			title.html("제목 : " + production[a].title); //타이틀
			img.attr('src', path);
		}
		for ( var i in production) {
			console.log(production[i]);
			var pro_num = production[i].pro_num;
			var title = production[i].title;
			var price = production[i].price;
			var cate_code = production[i].cate_code;

			console.log(childN);
		
			console.log(target.children(production[i]).html());

		}

	})
</script>

<!-- 메인 프로덕트 -->
<div class="main-product">
	<a id="productList" href="#">상품1</a>
	<div class="main-product-div">
		<div id="productNo1" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
				
					<div class="row" id="forTest" style="padding-left:15px;">
						<div class="aaa" id="aaa">
							<img src="" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="aaa">
							<img src="http://placehold.it/160x160" alt="Image" class="img-fluid img-thumbnail" ><br/>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>







</div>
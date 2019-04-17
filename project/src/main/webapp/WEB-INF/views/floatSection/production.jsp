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
		var childN=target.children().length;
		console.log(production);
		for(var a=0;a<production.length;a++) {
			var path = realPath + production[a].path;
			console.log(path);
			target.children().eq(a).find('img').attr('src',path);
		}
		for ( var i in production) {
			console.log(production[i]);
			/* var path = realPath + production[i].path; */
			var pro_num = production[i].pro_num;
			var title = production[i].title;
			var price = production[i].price;
			var cate_code = production[i].cate_code;
			
			console.log(childN);
			//for (var j = 0; j <= target.length; j++) {
				//var temp = target[j];
				//console.log(temp);
				//var imgTemp = temp.();
				//var img = imgTemp.attr('src',path);
				/* var imgTemp.first(); */
				/* img.attr('src', path); */
			//}
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
					<div class="row" id="forTest">
						<div class="aaa" id="aaa">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="aaa">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="aaa">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="aaa">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo1" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo1" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>





<div class="main-product">
	상품2
	<div class="main-product-div">
		<div id="productNo2" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo2" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo2" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품3
	<div class="main-product-div">
		<div id="productNo3" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="${pageContext.request.contextPath}/resources/"
								alt="Image" class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo3" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo3" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품4
	<div class="main-product-div">
		<div id="productNo4" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo4" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo4" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품5
	<div class="main-product-div">
		<div id="productNo5" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo5" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo5" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품6
	<div class="main-product-div">
		<div id="productNo26" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo6" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo6" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품7
	<div class="main-product-div">
		<div id="productNo7" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#productNo7" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo7" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
<div class="main-product">
	상품8
	<div class="main-product-div">
		<div id="productNo8" class="carousel slide col-xs-12"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3 col-sm-6">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-md-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
						<div class="col-sm-3">
							<img src="http://placehold.it/250x150" alt="Image"
								class="img-fluid img-thumbnail">
						</div>
					</div>
				</div>
			</div>



			<a class="carousel-control-prev" href="#productNo8" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#productNo8" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>

	</div>
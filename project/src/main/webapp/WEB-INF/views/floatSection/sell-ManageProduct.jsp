<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.pro-div {
	width: 100%;
	height: 62px;
	border-bottom: 1px solid black;
	margin-top: 5px;
	line-height: 3;
	font-weight: bold;
	font-size: 20px;
}

.pro-div1 {
	width: 100%;
	height: 62px;
	margin-top: 5px;
	line-height: 3;
}

.pro-title {
	margin-left: 110px;
	text-align: center;
	width: 200px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-img {
	margin-left: 70px;
	width: 200px;
	text-align: center;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-status {
	width: 200px;
	margin-left: 70px;
	text-align: center;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-price {
	width: 200px;
	text-align: center;
	margin-left: 70px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-category {
	width: 200px;
	text-align: center;
	margin-left: 70px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-title1 {
	margin-left: 110px;
	text-align: center;
	width: 200px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-img1 {
	margin-left: 70px;
	width: 200px;
	text-align: center;
	height: 100px;
	display: inline-block;
	vertical-align: middle;
}

.pro-status1 {
	width: 200px;
	margin-left: 70px;
	text-align: center;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-price1 {
	width: 200px;
	text-align: center;
	margin-left: 70px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.pro-category1 {
	width: 200px;
	text-align: center;
	margin-left: 70px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
}

.line-footer {
	position: relative;
	top: 500px;
}
</style>
<script>

	$(function(){
		var productList = ${requestScope.productList};
		var realPath = "${pageContext.request.contextPath}/resources/";
		var state_msg;
		console.log(productList);
		
		var content = $('#content');
		var first = content.children().first();
		console.log(first);
		var picture = first.next();
		var state = picture.next();
		var price = state.next();
		var cate_code = price.next();
		if(productList[0].state_msg == null){
			state_msg = "거래중";
		}else{
			state_msg = "거래완료";
		}
		
		first.html(productList[0].title);
		picture.html("<img src='"+realPath + productList[0].path +"' width='100' height='100'/>");
		state.html(state_msg);
		price.html(comma(productList[0].price));
		cate_code.html(productList[0].cate_code);
		
		// 콤마찍기 정규 표현식
		function comma(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
	})
	
</script>
<div id="page-wrapper" class="gray-bg dashbard-1">
	<div class="content-main">

		<!--banner-->
		<div class="contents-header">
			<h1 class=>상품관리</h1>
		</div>
		<!--//banner-->

		<!--grid-->
		<div class="grid-system">
			<div class="horz-grid" style="height: 720px;">
				<!-- content -  head -->
				<div class="pro-div">
					<div class="pro-title">제목</div>
					<div class="pro-img">대표사진</div>
					<div class="pro-status">상태</div>
					<div class="pro-price">가격</div>
					<div class="pro-category">카테고리</div>
					<!-- <div class="line-header"></div> -->
				</div>

				<!-- 값 뿌리는거 -->
				<div class="pro-div1" id="content">
					<div class="pro-title1">test</div>
					<div class="pro-img1">test</div>
					<div class="pro-status1">test</div>
					<div class="pro-price1">test</div>
					<div class="pro-category1">test</div>
					<button class='button'>삭제</button>
				</div>

				<!-- content -->
				<div class="line-footer">
					<div style="width: 13%; margin: auto; height: auto;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//grid-->
<!---->

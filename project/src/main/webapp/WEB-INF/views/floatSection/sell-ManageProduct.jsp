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
	$(function() {
		var productList = ${requestScope.productList};
		var realPath = "${pageContext.request.contextPath}/resources/";
		console.log(productList);

		var perPage = 6; // 화면에 보여줄 상품 갯수
		var content = $('#content').children(); // 돔트리 반환 값 36
		var counterTest = content.length; //36
		console.log(content);
		console.log("counter : " + counterTest);
		var counter = 0;
		var state_msg;

		for (var j = 0; j < productList.length; j++) {
			if (productList[j].state_msg == null) {
				state_msg = "거래중";
			} else {
				state_msg = "거래완료";
			}
			content.eq(counter++).html(productList[j].title);
			content.eq(counter++).html("<img class='proImg' src='"+realPath + productList[j].path +"' width='80' height='80' alt='"+productList[j].pro_num+"'/>");
			content.eq(counter++).html(state_msg);
			content.eq(counter++).html(comma(productList[j].price) + "원");
			content.eq(counter++).html(productList[j].cate_code);
			content.eq(counter -1).after("<button class='button'>삭제</button>");

		}

		// 콤마찍기 정규 표현식
		function comma(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		// 페이징 처리
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

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
					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

					<div class="pro-title1"></div>
					<div class="pro-img1"></div>
					<div class="pro-status1"></div>
					<div class="pro-price1"></div>
					<div class="pro-category1"></div>
					<!--button class='button'>삭제</button-->

				</div>

				<!-- content -->
				<div class="line-footer">
					<div style="width: 13%; margin: auto; height: auto;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item previous"><a class="page-link"
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item next"><a class="page-link"
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
						</ul>

						<!-- 페이징 끝나는 시점 -->
						<!-- 전송할 페이지 정보 -->
						<form id="actionForm" action="/selling/sell_productManage"
							method="get">
							<input type="hidden" name="pageNum"
								value='${pageMaker.cri.pageNum}' /> <input type="hidden"
								name="amount" value='${pageMaker.cri.amount}' />
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	$('.proImg').on('click', function(e){//동적생성이미지
		var alt = $(this).attr("alt");//alt값 가져오기
	    alert(alt);
		window.location.href = '/production/index_productView?pro_num='+alt;
	});
});
</script>
<!--//grid-->
<!---->

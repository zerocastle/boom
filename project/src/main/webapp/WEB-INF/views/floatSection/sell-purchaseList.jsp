<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/pruchaseList.css" />

<style>
ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}
</style>
<div id="page-wrapper" class="gray-bg dashbard-1">
	<div class="content-main">

		<!-- contents 시작 -->
		<div class="banner">
			<h1 class=>구매내역</h1>
		</div>
		<!--//banner-->

		<!--grid-->
		<div class="grid-system">
			<div class="horz-grid" style="height: 720px;">
				<!-- content -  head -->
				<ul style="display: inline-block;">
					<li>상인아이디</li>
					<li>가맹점코드</li>
					<li>상품카테고리</li>
					<li>상품이름</li>
					<li>상품번호</li>
					<li>상품가격</li>
					<li>결제시간</li>
				</ul>
				<!-- content -->
				<div class="buy-line-content"></div>
				<div class="line-footer">
					<div style="width: 13%; margin: auto; height: auto;">
						<ul class="pagination" style="margin: auto;">
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
<!-- contents 종료 -->
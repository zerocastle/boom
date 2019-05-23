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


				<table border="1">
					<thead>
						<tr>
							<th>가맹점코드</th>
							<th>상품번호</th>
							<th>카테고리</th>
							<th>상품 이름</th>
							<th>상품 상태</th>
							<th>상품 가격</th>
							<th>판매자</th>
							<th>결제시간</th>
							<th>상세보기</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${paymentList}" var="list">
							<tr>
								<td><c:out value="${list.imp_uid}" /></td>
								<td><c:out value="${list.pro_num}" /></td>
								<td><c:out value="${list.cate_code}" /></td>
								<td><c:out value="${list.title }" /></td>
								<td><c:out value="${list.quality}" /></td>
								<td><c:out value="${list.price}" /></td>
								<td><c:out value="${list.buyer_name}" /></td>
								<td><c:out value="${list.create_date}" /></td>
								<td><button>보기</button></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
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
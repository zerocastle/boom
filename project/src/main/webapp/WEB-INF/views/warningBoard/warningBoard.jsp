<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>
</head>
<jsp:include page="../fixsection/header.jsp"></jsp:include>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신고 게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<!-- 검색 폼... -->
	<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/warningBoard/warningBoard"
				method='get'>
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="J"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>신고분류</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
						or 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
						or 작성자</option>
					<option value="TWC"
						<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
						or 내용 or 작성자</option>
				</select> <input type='text' name='keyword'
					value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='btn btn-default'>Search</button>
			</form>
		</div>
	</div>
	<!-- 본격 게시판 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">

					<button id='regBtn' type="button" class="btn btn-primary">글쓰기</button>
				</div>

				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>신고분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.wa_num}" /></td>
								<td><c:out value="${board.wa_type}" /></td>
								<td><a
									href='/warningBoard/get?wa_num=<c:out value="${board.wa_num}"/>'><c:out
											value="${board.title}" /><b>[  <c:out value="${board.replycnt}" />  ]</b></a></td>
								<!-- rest 방식으로 처리 할기위한 척도 이다. -->
								<td><c:out value="익명" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.create_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.update_date}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class='pull-center'>
					<ul class="pagination justify-content-center">


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
				</div>
				<!--  end Pagination -->

				<!-- 전송할 페이지 정보 -->
				<form id="actionForm" action="/warningBoard/warningBoard"
					method="get">
					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}' /> 
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}' /> 
					<input type="hidden" name="type" value='${pageMaker.cri.type}' />
					<input type="hidden" name="keyword" value='${pageMaker.cri.keyword}' />
				</form>


			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>



</body>
<script>
	$(function() {
		var result = '<c:out value="${result}"/>';

	
		history.replaceState({}, null, null);

		$("#regBtn").on("click", function(e) {
			
			if(!"${sessionScope.loginSession}"){
				alert("로그인하시고 사용이 가능 합니다.");
				e.preventDefault();
			}else{

			self.location = "/warningBoard/register";
			}

		});
		// 페이징 넘기기
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		/*검색 script 처리*/
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {

			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();

		});

	})
</script>
</html>
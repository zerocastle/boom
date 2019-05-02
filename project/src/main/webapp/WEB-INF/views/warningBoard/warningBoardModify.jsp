<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<jsp:include page="../fixsection/header.jsp"></jsp:include>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">수정하기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">수정하기</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/warningBoard/modify" method="post">

					<%-- <input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'>  --%>


					<div class="form-group">
						<label>순번</label> <input class="form-control" name="wa_num"
							value='<c:out value="${board.wa_num }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>'>
					</div>
					
					<div class="form-group">
						<label>신고 분류를 선택</label>
						<select name="wa_type">
							<option value="${board.wa_type}">${board.wa_type}</option>
							<option value="메크로">메크로</option>
							<option value="무분별한광고">무분별한광고</option>
							<option value="욕설">욕설</option>
						</select>
					</div>

					<div class="form-group">
						<label>content</label>
						<textarea class="form-control" rows="3" name='content'><c:out
								value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='m_num'
							value='<c:out value="${board.m_num}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>등록일</label> <input class="form-control" name='create_date'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.create_date}" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>수정일</label> <input class="form-control"
							name='update_date'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.update_date}" />'
							readonly="readonly">
					</div>



					<button type="submit" data-oper='modify' class="btn btn-default">수정하기</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제하기</button>
					<button type="submit" data-oper='list' class="btn btn-info">돌아가기</button>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/warningBoard/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/warningBoard/warningBoard").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			formObj.submit();
		});

	});
</script>
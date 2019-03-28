<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/resources/css2/bootstrap.css">

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">관리자 공지사항 게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Page
					<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
						New Board</button>
				</div>

				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.no_num}" /></td>
								<td><a href='/board/get?bno=<c:out value="${board.no_num}"/>'><c:out
											value="${board.title}" /></a></td>
								<td><c:out value="${board.admin_id}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.create_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.update_date}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- Modal  추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>

</body>
<script>
	$(function() {
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {

			self.location = "/board/register";

		});
	})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<jsp:include page="../fixsection/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
</div>
<!-- /.col-lg-12 -->
<div class="panel-body">

	<div class="form-group">
		<label>순번</label> <input class="form-control" name='wa_num'
			value='<c:out value="${board.wa_num }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>제목</label> <input class="form-control" name='title'
			value='<c:out value="${board.title }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>타입</label> <input class="form-control" name='type'
			value='<c:out value="${board.wa_type }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>content</label>
		<textarea class="form-control" rows="3" name='content'
			readonly="readonly"><c:out value="${board.content}" /></textarea>
	</div>
	<c:set var="m_num" value="${board.m_num}" />

	<div class="form-group">
		<c:if test="${sessionScope.loginSession2.m_num eq m_num}">
			<label>글쓴이</label>
			<input class="form-control" name='m_num'
				value='<c:out value="${board.m_num }"/>' readonly="readonly">
		</c:if>


		<c:if test="${sessionScope.loginSession2.m_num eq m_num}">
			<button data-oper='modify' class="btn btn-info">수정</button>
		</c:if>
		<button data-oper='list' class="btn btn-info">돌아가기</button>



	</div>


	<form id='operForm' action="/warningBoard/modify" method="get">
		<input type='hidden' id=wa_num name='wa_num'
			value='<c:out value="${board.wa_num}"/>'>
	</form>

	<!-- 댓글 영역 -->
	<div class='row'>

		<div class="col-lg-12">

			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<br /> <i class="fa fa-comments fa-fw"></i>========== Reply
					===========
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<ul class="chat" id="here">
						<!-- start reply -->
						<li class="left clearfix" data-rno='12'>
							<div>
								<div class="header">
									<strong class="primary-font"></strong> <small> <!--아이디  -->
										class="pull-right text-muted"></small> <!--  날짜 -->
								</div>
								<p></p> <!-- 컨텐츠 -->
							</div>

						</li>

						<!--end reply-->
					</ul>
					<!--./ end ul-->
				</div>
			</div>
			<!-- ./ end row-->
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">댓글 작성하기</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>댓글</label> <input class="form-control" name='reply'
								placeholder='댓글을 입력하세요'>
						</div>
						<div class="form-group">
							<label>댓글자</label> <input class="form-control" name='replyer'
								value='${sessionScope.loginSession}' readonly="readonly" />
						</div>

					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button"
							class="btn btn-primary">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>

		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal">댓글작성</button>



	</div>
	<script type="text/javascript" src="/resources/customJs/reply.js"></script>

	<script>
		$(function() {

			var wa_numValue = '<c:out value="${board.wa_num}"/>';
			var replyUL = $(".chat");

			showList(1); // 테스트용

			function showList(page) {

				console.log("show list " + page);

				replyService
						.getList(
								{
									wa_num : wa_numValue,
									page : 1
								},
								function(list) {
									var str = "";
									for (var i = 0, len = list.length || 0; i < len; i++) {
										console.log(list[i]);

										str += "<li class='left clearfix' data-rno='"+list[i].reply_num+"'>";
										str += "  <div><div class='header'><strong class='primary-font'>["
												+ list[i].reply_num
												+ "] "
												+ list[i].replyer + "</strong>";
										str += "    <small class='pull-right text-muted'>"
												+ replyService
														.displayTime(list[i].create_date)
												+ "</small></div>";
										str += "    <p>" + list[i].reply
												+ "</p></div></li>";

									}
									replyUL.html(str);
								});

			}//end showList

			// 여기서 부터 모달 댓글 입력 하기 자바스크립트 영역
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("input[name='replyer']");
			/* var modalInputReplyDate = modal.find("input[name='replyDate']"); */

			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#modalCloseBtn").on("click", function(e) {

				modal.modal('hide');
			});

			$("#addReplyBtn").on("click", function(e) {

				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();

				modalRegisterBtn.show();

				$(".modal").modal("show");

			});
			
	
			modalRegisterBtn.on("click", function(e) {
				var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					wa_num : wa_numValue
				};

				replyService.add(reply, function(result) {
					alert(result);
					modal.find("input").val("");
					modal.modal("hide");
					
					showList(1); //갱신이 안되는 문제를 해결한다. 첫페이지로 돌아가는 함수를 작동시킨것이다.
				});

			});

		});
	</script>


	<script type="text/javascript">
		$(document).ready(function() {

			var operForm = $("#operForm");

			$("button[data-oper='modify']").on("click", function(e) {

				e.preventDefault();
				operForm.attr("action", "/warningBoard/modify").submit();

			});

			$("button[data-oper='list']").on("click", function(e) {

				operForm.find("#bno").remove();
				operForm.attr("action", "/warningBoard/warningBoard")
				operForm.submit();

			});
		});
	</script>
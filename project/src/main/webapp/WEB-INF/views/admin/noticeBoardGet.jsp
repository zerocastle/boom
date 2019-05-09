<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<jsp:include page="../fixsection/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
</div>
<!-- /.col-lg-12 -->
<div class="panel-body">

	<div class="form-group">
		<label>Bno</label> <input class="form-control" name='no_num'
			value='<c:out value="${board.no_num }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>Title</label> <input class="form-control" name='title'
			value='<c:out value="${board.title }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>Text area</label>
		<textarea class="form-control" rows="3" name='content'
			readonly="readonly"><c:out value="${board.content}" /></textarea>
	</div>

	<div class="form-group">
		<label>Writer</label> <input class="form-control" name='admin_id'
			value='<c:out value="${board.admin_id }"/>' readonly="readonly">
	</div>

	<button data-oper='modify' class="btn btn-default">Modify</button>
	<button data-oper='list' class="btn btn-info">List</button>

	<form id='operForm' action="/admin/modify" method="get">
		<input type='hidden' id='no_num' name='no_num'
			value='<c:out value="${board.no_num}"/>'>
	</form>


</div>
<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			if("${sessionScope.loginSession.nickname}"!='admin'){
				alert("관리자 계정이 아닙니다.");
			}else{
				operForm.attr("action", "/admin/modify").submit();
			}
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/admin/noticeBoard")
			operForm.submit();

		});
	});
</script>
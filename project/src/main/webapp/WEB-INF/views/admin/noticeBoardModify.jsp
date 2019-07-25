<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<jsp:include page="../fixsection/header.jsp"></jsp:include>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">Board Modify</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <div class="panel-heading">Board Modify</div>
         <!-- /.panel-heading -->
         <div class="panel-body">

            <form role="form" action="/admin/modify" method="post">

               <%-- <input type='hidden' name='pageNum'
                  value='<c:out value="${cri.pageNum }"/>'> <input
                  type='hidden' name='amount'
                  value='<c:out value="${cri.amount }"/>'> <input
                  type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
               <input type='hidden' name='keyword'
                  value='<c:out value="${cri.keyword }"/>'> --%>


               <div class="form-group">
                  <label>Bno</label> <input class="form-control" name="no_num"
                     value='<c:out value="${board.no_num }"/>' readonly="readonly">
               </div>

               <div class="form-group">
                  <label>Title</label> <input class="form-control" name='title'
                     value='<c:out value="${board.title }"/>'>
               </div>

               <div class="form-group">
                  <label>Text area</label>
                  <textarea class="form-control" rows="3" name='content'><c:out
                        value="${board.content}" /></textarea>
               </div>

               <div class="form-group">
                  <label>Writer</label> <input class="form-control" name='admin_id'
                     value='<c:out value="${board.admin_id}"/>' readonly="readonly">
               </div>

               <div class="form-group">
                  <label>RegDate</label> <input class="form-control" name='regDate'
                     value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.create_date}" />'
                     readonly="readonly">
               </div>

               <div class="form-group">
                  <label>Update Date</label> <input class="form-control"
                     name='updateDate'
                     value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.update_date}" />'
                     readonly="readonly">
               </div>



               <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
               <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
               <button type="submit" data-oper='list' class="btn btn-info">List</button>
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
            formObj.attr("action", "/admin/remove");

         } else if (operation === 'list') {
            //move to list
            formObj.attr("action", "/admin/noticeBoard").attr("method", "get");

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

         formObj[0].submit();
      });

   });
</script>
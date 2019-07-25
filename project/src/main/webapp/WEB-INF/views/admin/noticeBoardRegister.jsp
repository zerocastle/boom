<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<jsp:include page="../fixsection/header.jsp"></jsp:include>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">등록하기</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <div class="panel-heading">Board Register</div>
         <!-- /.panel-heading -->
         <div class="panel-body">

            <form role="form" action="/admin/noticeRegister" method="post">
               <div class="form-group">
                  <label>Title</label> <input class="form-control" name='title' id='title'>
               </div>

               <div class="form-group">
                  <label>Text area</label>
                  <textarea class="form-control" rows="3" name='content' id='content'></textarea>
               </div>

               <div class="form-group">
                  <label>Writer</label> <input class="form-control" name='admin_id' value='${sessionScope.loginSession.nickname}' readonly>
               </div>
               <button type="button" class="btn btn-default" id='save'>저장</button>
               <button type="reset" class="btn btn-default">Reset Button</button>
               <button class="btn btn-defaul" id="list">리스트로 가기</button>
            </form>

         </div>
         <!--  end panel-body -->

      </div>
      <!--  end panel-body -->
   </div>
   <!-- end panel -->
</div>
<script>
   $(function() {
      $('#save').click(function(e){
         if(($('#title').val()=='') || ($('#content').val()=='')){
            e.preventDefault();
            alert('빈칸이 없어야 합니다.');
            return false;
         }else{
            $('form')[0].submit();            
         } 
      });
      $('#list').click(function(e) {
         e.preventDefault();
         window.location.href = "/admin/noticeBoard";
      })
   })
</script>
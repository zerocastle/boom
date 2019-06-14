<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <link rel="stylesheet" href="/resources/css2/bootstrap.css"> -->

<jsp:include page="../fixsection/sell-header.jsp"></jsp:include>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">작성하기</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <div class="panel-heading">작성하기</div>
         <!-- /.panel-heading -->
         <div class="panel-body">

            <form id="WarnReg" role="form" action="/warningBoard/register" method="post">
               <div class="form-group">
                  <label>제목</label> <input class="form-control" name='title' id='title'>
               </div>
               <div class="form-group">
                  <label>신고 분류를 선택</label> <select name="wa_type">
                     <option value="사기">사기</option>
                     <option value="메크로">메크로</option>
                     <option value="무분별한광고">무분별한광고</option>
                     <option value="욕설">욕설</option>
                  </select>
               </div>

               <div class="form-group">
                  <label>content</label>
                  <textarea class="form-control" rows="3" name='content' id='content'></textarea>
               </div>

               <div class="form-group">
                  <label>작성자</label> <input type="hidden" class="form-control" name='m_num' value="${sessionScope.loginSession.m_num }"  />
                  <input value="${sessionScope.loginSession.nickname}" readonly/>
                  
               </div>
               <button type="button" class="btn btn-default" id='save'>저장</button>
               <button type="reset" class="btn btn-default">초기화</button>
               <button class="btn btn-defaul" id="list5">리스트로 가기</button>
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
            $('#WarnReg')[0].submit();            
         } 
      });
      $('#list5').click(function(e) {
         e.preventDefault();
         window.location.href = "/warningBoard/warningBoard";
      })
   })
</script>

<jsp:include page="../fixsection/sell-footer.jsp"></jsp:include>
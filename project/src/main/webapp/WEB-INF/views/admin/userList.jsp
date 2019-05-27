<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="/resources/admin/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/admin/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="/resources/admin/sb-admin.css" rel="stylesheet">
  
<style>
.dataTables_length{
display:none;
}

</style>
</head>



<body>
<div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>닉네임</th>
                    <th>휴대폰번호</th>
                    <th>비밀번호</th>
                    <th>이메일</th>
                    <th>신고누적횟수</th>
                    <th>계좌번호</th>
                    <th>은행명</th>
                    
                  </tr>
                </thead>
               
                <tbody>
                 <c:forEach var="list1" items="${list1}"  varStatus="status">  
                  <tr>
                    <td>${list1.nickname}</td>
                    <td>${list1.phone}</td>
                    <td>${list1.m_password}</td>
                    <td>${list1.email}</td>
                    <td>${list1.warning}</td>
                    <td>${list1.acc_num}</td>
                    <td>${list1.acc_name}</td>
                    
                 
                  </tr>
                  </c:forEach>
                </tbody>
             
              </table>
            </div>
</body>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>


<script src="/resources/js/jquery.easing.min.js"></script>


<script src="/resources/js/Chart.min.js"></script>
<script src="/resources/js/jquery.dataTables.js"></script>
<script src="/resources/js/dataTables.bootstrap4.js"></script>

<script src="/resources/js/sb-admin.min.js"></script>


<script src="/resources/js/datatables-demo.js"></script>
<script src="/resources/js/chart-area-demo.js"></script>


</html>
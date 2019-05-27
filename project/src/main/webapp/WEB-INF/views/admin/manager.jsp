<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <title>Document</title>
<!--         합쳐지고 최소화된 최신 CSS -->
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->

<!--         부가적인 테마 -->
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<!--         합쳐지고 최소화된 최신 자바스크립트 -->
<!--         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  
<link href="/resources/admin/all.min.css" rel="stylesheet" type="text/css">
<link href="/resources/admin/dataTables.bootstrap4.css" rel="stylesheet">
<link href="/resources/admin/sb-admin.css" rel="stylesheet">
  

  
  
</head>


<style>
        .table-striped {
                margin-left: auto;
                margin-right: auto;
                width: 100%;
                margin-top: 20px;
        }

        .buy_money {
                display: inline-block;
                vertical-align: middle;
                margin-left: 193px;
        }

        .buy_money>span {
                font-weight: bold;
        }

        .in_money {
                font-weight: bold;
        }

        .in_money {
                display: inline-block;
                vertical-align: middle;
                float: right;
                margin-right: 193px;
        }

        #myChart {
                width: 60% !important;

        }
        
                #chartdiv {
                width: 100%;
                height: 500px;
                }

        .dataTables_filter{
        display:none!important;
        }
        
        .dataTables_length{
        display:none!important;
        }
        
</style>



<body>
     <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

     <a class="navbar-brand mr-1" href="index.html"></a>

     <div>
      <i class="fas fa-bars"></i>
     </div>

    <!-- Navbar Search -->
    <!-- <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form> -->

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <!-- <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
      <!-- <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
      <!-- <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li> -->
    </ul>

  </nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link">
          <i class="fas fa-tags"></i>
          <span>구매정보</span>
        </a>
      </li>
      <li class="nav-item" id="userlist">
        <a class="nav-link">
          <i class="fas fa-users"></i>
          <span>회원관리</span>
        </a>
        </li>
        
        <!-- <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div> -->

      <!-- <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>-->
      
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
            <i class="fas fa-exclamation-triangle"></i>
          <span>공지사항</span></a>
      </li> 
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a>구매정보</a>
          </li> 
        </ol>
  
        <div class="buy_money">
                <span>나간금액: </span>
                <input type="text" readonly>
        </div>
        <div class="in_money">
                <span>들어온 금액: </span>
                <input type="text" readonly>
        </div>

 <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
           </div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>



<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">

<div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        
                <thead>
                        <tr>
                                <th>결제코드</th>
                                <th>상점코드</th>
                                <th>거래장소</th>
                                <th>카테고리</th>
                                <th>카드이름</th>
                                <th>카드결제코드</th>
                                <th>상품 상태</th>
                                <th>상품제목</th>
                                <th>에스크로</th>
                                <th>결제수단</th>
                                <th>구매자</th>
                                <th>판매자</th>
                                <th>결제일</th>
                                <th>상품가격</th>
                                <th>상품번호</th>
                        </tr>
                </thead>

                <tbody>
                    <c:forEach var="list" items="${list}"  varStatus="status">  
                        <tr>
                        <td>${list.merchant_uid}</td>
                          <td>${list.imp_uid}</td>
                          <td>${list.place_pick}</td>
                          <td>${list.cate_code}</td>
                          <td>${list.card_name}</td>
                          <td>${list.pg_tid}</td>
                          <td>${list.quality}</td>
                          <td>${list.title}</td>
                          <td>${list.ascrow}</td>
                          <td>${list.pay_method}</td>
                          <td>${list.buyer_name}</td>
                          <td>${list.seller_name}</td>
                          <td>${list.create_date}</td>
                          <td>${list.price}</td>
                          <td>${list.pro_num}</td>
                           </tr>        
               </c:forEach>
                </tbody>
        </table>
        
        </div>
        
       </div>
          
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <!-- <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer> -->

    </div>
    <!-- /.content-wrapper -->

  </div>  
        
    <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>    
        
        
        
        
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>


<script src="/resources/js/jquery.easing.min.js"></script>


<script src="/resources/js/Chart.min.js"></script>
<script src="/resources/js/jquery.dataTables.js"></script>
<script src="/resources/js/dataTables.bootstrap4.js"></script>

<script src="/resources/js/sb-admin.min.js"></script>


<script src="/resources/js/datatables-demo.js"></script>
<script src="/resources/js/chart-area-demo.js"></script> 
   
      
  <script>
$('#userlist').click(function(e){
   e.preventDefault();
   window.location.href = "/admin/getList1/";
});
</script>
     

      






</body>

</html>
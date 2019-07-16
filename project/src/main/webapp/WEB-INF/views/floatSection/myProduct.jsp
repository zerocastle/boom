<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css">

<style>
.page-link {
	display: inline-block;
	color: #ffffff;
	background-color: #606ddd;
}

.grid-gap-3{
	grid-gap : 0;
}
#delbtn{
	text-align: right;
}
</style>


<script>
$(document).ready(function(){
	
	var data = $('#nick').text();
	console.log(data);
	$('#profileLink').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myPage/"+ data;
	});

	$('#myProduct').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myProduct/" +$('#nick').text();
	});
	
	$('#pick').click(function(e){
		e.preventDefault();
		window.location.href = "/member/pickInfo/"+$('#nick').text();
	});

	$('#review').click(function(e){
		e.preventDefault();
		window.location.href = "/member/review/"+$('#nick').text();
	});
	
	$('#buyList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/purchaseList/" + $('#nick').text();
	});
	
	$('#sellList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/sellList/" + $('#nick').text();
	});
	
	
	// 매너 게이지
	var manner = ${member.manner};
	   function startFoo(){
	      var opts = {
	              angle: 0.15, // The span of the gauge arc
	              lineWidth: 0.44, // The line thickness
	              radiusScale: 1, // Relative radius
	              pointer: {
	                length: 0.51, // // Relative to gauge radius
	                strokeWidth: 0.077, // The thickness
	                color: '#000000' // Fill color
	              },
	              limitMax: false,     // If false, max value increases automatically if value > maxValue
	              limitMin: false,     // If true, the min value of the gauge will be fixed
	              colorStart: '#f70000',   // Colors
	              colorStop: '#f70000',    // just experiment with them
	              strokeColor: '#E0E0E0',  // to see which ones work best for you
	              generateGradient: true,
	              highDpiSupport: true,     // High resolution support
	              
	            };
	            var target = document.getElementById('foo'); // your canvas element
	            var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
	            gauge.maxValue = 100; // set max gauge value
	            gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
	            gauge.animationSpeed = 49; // set animation speed (32 is default value)
	            gauge.set(manner); // set actual value
	   }
	   
	   startFoo();
});
</script>
<script>
$(function() {
	var list = ${requestScope.resultList};
	console.log(list);

	function getParameterByName(name, url) {
		if (!url)
			url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
				.exec(url);
		return results[2];
	}

	var productionLength = list.length;
	var realPath = "${pageContext.request.contextPath}/resources/";

	// 값 담기위한 작업
	var array = new Array();
	var test;
	var pattern = /\\/g;
	// 쿼리 스트링 가져오는 정규 표현식

	//돌려 돌려
	for (var i = 0; i < productionLength; i++) {
		for (var j = 0; j < productionLength; j++) {
			var temp = list[j].uploadPath;
			var pickImage = list[j].place_signal;
			if (list[j].place_signal == 1) {
				pickImage = '<span class="badge-success">직플거래</span>';
			} else {
				pickImage = '<span class="badge badge-warning">직거래</span>';
			}

			var str = "<li><a href='#' class='productNext'>"
					+ "<div class='product'>" + "<div class='product-img'>"
					+ "<img id='"
					+ j
					+ "' src='"
					+ realPath
					+ list[j].uploadpath
					+ "/"
					+ list[j].uuid
					+ "_"
					+ list[j].filename
					+ "' width=194 height=194 style='padding:10px;'>"
					+ "</div>"
					+ "<div class='product-title'>제목 : "
					+ list[j].title
					+ "</div>"
					+ "<div class='product-info'>"
					+ "<div class='product-price'>가격 : "
					+ comma(list[j].price)
					+ " 원</div>"
					+ "</div>"
					+ "<div class='product-pick'>"
					+ pickImage
					+ "</div>"
					+ "<div class='product-location'>"
					+ "<div class='icon location-md'>"
					+ "<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-map-pin'><path d='M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z'></path><circle cx='12' cy='10' r='3'></circle></svg>"
					+ list[j].addr
					+ ""
					+ "</div>"
					+ "</div>"
					+ "</div>"
					+ "</a></label><input type = 'checkbox' class = 'delbtn2' id = 'delbtn2' value = '"+ list[j].pro_num +"'></li>"
					+ "<input type='hidden' value='"
					+ list[j].pro_num + "' class='pro_num' />";
			array.push(str);
		}
		$('#pro').append(array[i]);
	}
	//콤마찍기 정규 표현식
	function comma(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 상품 상세보기
	$('.productNext').click(
			function(e) {
				e.preventDefault();
				console.log($(this).parent());
				window.location.href = "/production/index_productView?pro_num="
						+ $(this).parent().next().val();
			});

});
</script>
<script>
$(document).ready(function(){
	$('#delbtn').click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			var pro = new Array();
			
			$("input[class='delbtn2']:checked").each(function(i, obj){
				var hihi = {"p_num" : $(obj).val()};
				pro.push(hihi);
				alert("첫번째" + pro.length);
				console.log(pro);
			});
			
			if(confirm("시발")){
				return false;
			}
			else{
				alert("두번째");
				alert(pro);
				var result = 1;
				/* var checkArr = json.stringify(checkArr); */
				$.ajax({
					url : "/member/prodelete",
					type : "post",
					contentType : 'application/json',
					data : JSON.stringify(pro),
					success : function(){
						result = 0; 
						alert("세번째");
						window.location.href = "/member/myProduct/" + "${sessionScope.loginSession.nickname}";
					},error : function(){
						alert("에러발생");
					}
				});
			}
		}
	});
});
</script>
<script>
$(document).ready(function(){
	$('#inProd').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd/" + $('#nick').text();
	});
});
</script>

<script>
$(document).ready(function(){
	$('#inProd2').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd2/" + $('#nick').text();
	});
});
</script>
<!-- Main Content -->
<div class="container my-3">
	<div class="row">

		<div class="col-md-4 col-lg-3">
			<div class="card">
				<div class="card-body text-center">
					<img src="${pageContext.request.contextPath}/resources/${member.uploadPath }/${member.uuid }_${member.fileName }" width="100" height="100" alt="User"
						class="rounded-circle mb-3">
					<h5 id="nick" class="bold mb-0">${member.nickname }</h5>
					<small class="counter">${member.email }</small>
					<hr>
					<div class="roboto-condensed bold" data-toggle="tooltip"
						title="매너 점수는 ${member.manner }입니다.
						평가 총인원은  ${member.manner_pick}명입니다.">
						<canvas id="foo" class="foo"></canvas>
					</div>
				</div>
				<div class="list-group list-group-flush">
					<a href="#" id="profileLink" 
						class="list-group-item list-group-item-action"><i
						data-feather="user" class="mr-3"></i>프로필</a>
						 <a href="#" id="myProduct" class="list-group-item has-badge list-group-item-action  active">
						 <i data-feather="shopping-bag" class="mr-3"></i>내 상품<span class="badge rounded badge-primary">${proCount }</span></a>
						 <a href="#" id="pick" class="list-group-item has-badge list-group-item-action">
						 <i data-feather="heart" class="mr-3"></i>찜목록<span class="badge rounded badge-primary">${like }</span></a> 
						 <a href="#" id="review" class="list-group-item has-badge list-group-item-action">
						 <i data-feather="edit-3" class="mr-3"></i>리뷰<span class="badge rounded badge-primary">${pv }</span></a> 
						 <a href="#" id="buyList" class="list-group-item list-group-item-action">
						 <i data-feather="shopping-bag" class="mr-3"></i>구매내역</a> 
						 <a href="#" id="sellList" class="list-group-item list-group-item-action">
						 <i data-feather="shopping-bag" class="mr-3"></i>판매내역</a> 
						 
						 
						 <!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 입고 상품</a>
						</c:if>
						
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd2" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 내역</a>
						</c:if>
						<!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
						 
						 
						 
						 <a href="#" class="list-group-item list-group-item-action text-danger logout">
						 <i data-feather="log-out" class="mr-3"></i> Logout</a>
				</div>
			</div>
		</div>

		<div class="col mt-3 mt-md-0">
			<div class="card">
				<div class="card-body">
					<h3>내 상품</h3>
					<hr>
					<form name="pagingForm">
					<input type="hidden" name="pageNo" />
					<div id="pro" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
                       
                    </div>
                    <div id="page" class="pull-center" style="text-align: center">
<ul class="pagination justify-content-center">
		<c:if test="${pageVO.pageNo != 0}">
			<c:if test="${pageVO.pageNo > pageVO.pageBlock}">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.firstPageNo})"
					style="text-decoration: none;">첫 페이지</a>
			</c:if>
			<c:if test="${pageVO.pageNo != 1}">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.prevPageNo})"
					style="text-decoration: none;"><</a>
			</c:if>
			<span> <c:forEach var="i" begin="${pageVO.startPageNo}"
					end="${pageVO.endPageNo}" step="1">
					<c:choose>
						<c:when test="${i eq pageVO.pageNo}">
							<a class="page-link" href="javascript:fn_movePage(${i})"
								style="text-decoration: none;"> <font
								style="font-weight: bold;">${i}</font>

							</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="javascript:fn_movePage(${i})"
								style="text-decoration: none;">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<input type = "button" id = "delbtn" value = "삭제">
			</span>
			<c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.nextPageNo})"
					style="text-decoration: none;">></a>
			</c:if>
			<c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
				<a class="page-link" href="javascript:fn_movePage(${pageVO.finalPageNo})"
					style="text-decoration: none;">마지막 페이지</a>
			</c:if>
		</c:if>
		</ul>
	</div>
	</form>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /Main Content -->
<script src="/resources/customJs/mypage-info2.js"></script>
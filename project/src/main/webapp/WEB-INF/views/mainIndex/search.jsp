<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../fixsection/header.jsp"%>
<script>
	$(function(){
		var list = ${requestScope.production};
		console.log(list);
		

		
		//상품 변경하기
		var productionLength = list.length;
		var realPath = "${pageContext.request.contextPath}/resources/";
		
		
		// 값 담기위한 작업
		var array = new Array();
		var test;
		var pattern = /\\/g;
		//돌려 돌려
		for(var i = 0; i < productionLength; i++){
			for(var j = 0; j < productionLength; j++){ 
				var temp = list[j].uploadPath.toString();
				var pickImage = list[j].place_signal;
				if(list[j].place_signal == 1){
					pickImage = '<br /><div><img src="/resources/image/place_signal/11.png" height="20" /></div>';
				}else{
					pickImage = '<br /><div><img src="/resources/image/place_signal/22.png" height="20" /></div>';
				}
					
				var str = "<li><a href='#' class='productNext' onclick="+"setCookiePlus('recentView','"+list[j].pro_num+","+realPath+temp.toString().replace(pattern,'/')+"/"+list[j].uuid+"_"+list[j].fileName+"',window.location.reload())"+">"
					+ "<div class='product'>"
					+"<div class='product-img'>"
					+	"<img id='"+j+"' src='"+realPath+list[j].uploadPath+"/"+list[j].uuid+"_"+list[j].fileName+"' width=194 height=194>"
					+"</div>"
					+ "<div class='product-title'>제목 : "+list[j].title+"</div>"
					+ "<div class='product-info'>"
					+	"<div class='product-price'>가격 : "+comma(list[j].price)+" 원</div>"
					+	pickImage
					+	"<div class='product-update-time'>"
					+	"</div>"
					+"</div>"
					+"<div class='product-location'>"
					+	"<div class='icon location-md'>"
					+		"<i class='fa fa-map-marker-alt'></i>"+" "+list[j].addr+""
					+	"</div>"
					+"</div>"
					+"</div>"
					+"</a></li>" 
					+"<input type='hidden' value='"+list[j].pro_num+"' class='pro_num' />";
					array.push(str);
			}
			$('.category-product-list').append(array[i]);
			console.log(i);
		}
		
		
		
		// 상품 상세보기
		$('.productNext').click(function(e){
			e.preventDefault();
			console.log($(this).parent());
			window.location.href="/production/index_productView?pro_num="+$(this).parent().next().val(); 
		});
		
		// 콤마찍기 정규 표현식
		function comma(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 페이징 넘기기
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		
		
	})	
</script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

<div id="floatMenu">
   <span class="kjim">최근찜한상품</span> <span><i class="fas fa-heart"></i></span>
   <input type="text" name="num" value="0" class="num" readonly />
   <div id="floater">
      <span class="pro-pro">최근본상품</span>
      <hr class="dott" style="color:black;">
      <div id="recentBanner">
         <div class="recentView" id="recentView"></div>
      </div>
   </div>
   
   <div class="top1">
      <button class="top2" onclick="goTop()">TOP</button>
   </div>
</div>



<div class="main">
	<!-- 상품보이는 라인 -->
	<div class="main-productList">
		<h3 style="margin-left: 1em;">검색 결과</h3>
		<!-- 상품 4개 -->
		<div>
			<ul class="category-product-list">
				<!-- 애들 들어올자리 -->
			</ul>
		</div>
	</div>
</div>



<div class='pull-center'>
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item previous"><a class="page-link"
				href="${pageMaker.startPage -1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class="page-item ${pageMaker.cri3.pageNum == num ? "active":""} ">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="page-item next"><a class="page-link"
				href="${pageMaker.endPage +1 }">Next</a></li>
		</c:if>
	</ul>
</div>

<!-- 전송할 페이지 정보 -->
<form id="actionForm" action="/search"
	method="get">
	<input type="hidden" name="pageNum" value='${pageMaker.cri3.pageNum}' />
	<input type="hidden" name="amount" value='${pageMaker.cri3.amount}' />
	<input type="hidden" name="type" value='${ pageMaker.cri3.type}' />
	<input type="hidden" name="keyword" value='${pageMaker.cri3.keyword }'/>
</form>
<!--  end Pagination -->

<!--           </div> -->
<!-- contents 내용 파트 끝-->
<%@include file="../fixsection/footer.jsp"%>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function(){
		var list = ${requestScope.production};
		console.log(list);
		var input_cate;
		var cate=$('#field1');
		var orderDom = $('#field2');
		// 쿼리 스트링 가져오는 정규 표현식
		function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    return results[2];
		}
		
		//쿼리 스트링 값 들고 오기
		var cate_code = getParameterByName('cate_code');
		var realOrder = getParameterByName('order');
		$('#actionForm>input:eq(3)').val(realOrder);
		console.log(realOrder);
		cate.val(cate_code);
		orderDom.val(realOrder);
		// 히든에다가 갑 넣기
		$('#actionForm>input:eq(2)').val(cate_code);
		
		// 상품 제목을 바꿔주기 위한 작업 
	 	switch(cate_code){
			
		case "man":
			input_cate="남성의류";
			break;
		case "woman":
			input_cate="여성의류";
			break;
		case "elect":
			input_cate="전자제품";
			break;
		case "furniture":
			input_cate="가구/인테리어";
			break;
		case "baby":
			input_cate="유아용품";
			break;
		case "sport":
			input_cate="스포츠/레저";
			break;
		case "hobby":
			input_cate="게임/취미";
			break;
		case "beauty":
			input_cate="뷰티/미용";
			break;
		case "life":
			input_cate="생활/가공품";
			break;
		case "animal":
			input_cate="반려/동물";
			break;
		case "book":
			input_cate="도서/티켓/음반";
			break;
		case "else":
			input_cate="기타/잡화";
			break;
		
		}
		
		
		// 상품 대제목 변경
		$('.main-productList>h3').html(input_cate);
		
		//상품 변경하기
		var productionLength = list.length;
		var realPath = "${pageContext.request.contextPath}/resources/";
		
		
		// 값 담기위한 작업
		var array = new Array();

		//돌려 돌려
		for(var i = 0; i < productionLength; i++){
			for(var j = 0; j < productionLength; j++){
				var str = "<li><a href='#' class='productNext'>"
					+ "<div class='product'>"
					+"<div class='product-img'>"
					+	"<img src='"+realPath+list[j].uploadPath+"/"+list[j].uuid+"_"+list[j].fileName+"' width=194 height=194>"
					+"</div>"
					+ "<div class='product-title'>제목 : "+list[j].title+"</div>"
					+ "<div class='product-info'>"
					+	"<div class='product-price'>가격 : "+comma(list[j].price)+" 원</div>"
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
		}
		
		//상품 카테고리별 바꿔주기
		console.log($('#field1').val());
		
		$('#field1').change(function(){
			window.location.href="/production/index_productList?cate_code="+$('#field1').val()+"&order=asc";
		});
		
		
		// 가격 별로 바꿔주기
		$('#field2').change(function(){
			var dom = $('#actionForm>input:eq(3)');
			console.log(dom);
			if(dom.val() == null || dom.val() == 'desc'){
				dom.val('asc');
			}else
				dom.val('desc');
			$('#actionForm').submit();
			
		});
		
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
	<div class="top1">
		<button class="top2" onclick="goTop()">TOP</button>
	</div>
</div>



<div class="main">
	<div class="productList-div1">
		<i class="fa fa-home nav_icon"
			style="width: 30px; margin: 0; padding: 0.2em; color: black; margin-left: 1.5em;"></i><span>홈</span>
		<i class="fa fa-caret-right nav_icon"
			style="padding: 0.2em; color: black; width: 0;"></i>

		<!-- 드롭다운 -->
		<div class="col-sm-3"
			style="display: inline-block; margin: 0; padding: 0; width: 150px;">
			<select class="input form-control pdi-spacing-02" id="field1"
				name="prof1">
				<option value="woman">여성의류</option>
				<option value="man">남성의류</option>
				<option value="elect">전자제품</option>
				<option value="furniture">가구/인테리어</option>
				<option value="baby">유아용품</option>
				<option value="sport">스포츠/레저</option>
				<option value="hobby">게임/취미</option>
				<option value="beauty">뷰티/미용</option>
				<option value="life">생활/가공품</option>
				<option value="animal">반려동물용품</option>
				<option value="book">도서/티켓/음반</option>
				<option value="ele">기타/잡화</option>
			</select>
		</div>

		<!-- 상품 정렬 -->
		<div class="col-sm-3"
			style="display: inline-block; margin: 0; padding: 0; width: 150px;">
			<select class="input form-control pdi-spacing-02" id="field2"
				name="order">
				<option value="asc">낮은 가격 순</option>
				<option value="desc">높은 가격 순</option>
			</select>
		</div>

	</div>

	<!-- 상품보이는 라인 -->
	<div class="main-productList">
		<h3 style="margin-left: 1em;">여성의류</h3>
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
<form id="actionForm" action="/production/index_productList" method="get">
	<input type="hidden" name="pageNum" value='${pageMaker.cri3.pageNum}' />
	<input type="hidden" name="amount" value='${pageMaker.cri3.amount}' />
	<input type="hidden" name="cate_code" value=""/>
	<input type="hidden" name="order" value=""/>
</form>
<!--  end Pagination -->

<!--           </div> -->
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function(){
		var list = ${requestScope.production};
		console.log(list);
		var input_cate;
		var cate=$('#field1'); // 필드값 1 바꿔주기
		var order=$('#field2'); // 필드값 2 바꿔주기
		// 쿼리 스트링 가져오는 정규 표현식
		function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    return results[2];
		}
		
		//쿼리 스트링 값 들고 오기
		var cate_code = getParameterByName('cate_code');
		cate.val(cate_code);
		
		// 히든에다가 갑 넣기
		$('#actionForm>input:eq(2)').val(cate_code);
		
		// 상품 제목을 바꿔주기 위한 작업 
	 	switch(cate_code){
			
		case "man":
			input_cate="남성의류";
			break;
		case "woman":
			input_cate="여성의류";
			break;
		case "elect":
			input_cate="전자제품";
			break;
		case "furniture":
			input_cate="가구/인테리어";
			break;
		case "baby":
			input_cate="유아용품";
			break;
		case "sport":
			input_cate="스포츠/레저";
			break;
		case "hobby":
			input_cate="게임/취미";
			break;
		case "beauty":
			input_cate="뷰티/미용";
			break;
		case "life":
			input_cate="생활/가공품";
			break;
		case "animal":
			input_cate="반려/동물";
			break;
		case "book":
			input_cate="도서/티켓/음반";
			break;
		case "else":
			input_cate="기타/잡화";
			break;
		
		}
		
		
		// 상품 대제목 변경
		$('.main-productList>h3').html(input_cate);
		
		//상품 변경하기
		var productionLength = list.length;
		var realPath = "${pageContext.request.contextPath}/resources/";
		
		
		// 값 담기위한 작업
		var array = new Array();

		//돌려 돌려
		for(var i = 0; i < productionLength; i++){
			for(var j = 0; j < productionLength; j++){
				var str = "<li><a href='#' class='productNext'>"
					+ "<div class='product'>"
					+"<div class='product-img'>"
					+	"<img src='"+realPath+list[j].uploadPath+"/"+list[j].uuid+"_"+list[j].fileName+"' width=194 height=194>"
					+"</div>"
					+ "<div class='product-title'>제목 : "+list[j].title+"</div>"
					+ "<div class='product-info'>"
					+	"<div class='product-price'>가격 : "+comma(list[j].price)+" 원</div>"
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
		}
		
		//상품 카테고리별 바꿔주기
		console.log($('#field1').val());
		
		$('#field1').change(function(){
			//alert("test");
			window.location.href="/production/index_productList?cate_code="+$('#field1').val();
		});
		
		// 상품 가격 순 정렬
		$('#field2').change(function(){
			alert("바꿔준다");
		
			$('#actionForm>input:eq(3)').val("desc");
			$('#field2').val("desc");	
			$('#actionForm').submit();
			

		})
		
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
	<div class="top1">
		<button class="top2" onclick="goTop()">TOP</button>
	</div>
</div>



<div class="main">
	<div class="productList-div1">
		<i class="fa fa-home nav_icon"
			style="width: 30px; margin: 0; padding: 0.2em; color: black; margin-left: 1.5em;"></i><span>홈</span>
		<i class="fa fa-caret-right nav_icon"
			style="padding: 0.2em; color: black; width: 0;"></i>

		<!-- 드롭다운 -->
		<div class="col-sm-3"
			style="display: inline-block; margin: 0; padding: 0; width: 150px;">
			<select class="input form-control pdi-spacing-02" id="field1"
				name="prof1">
				<option value="woman">여성의류</option>
				<option value="man">남성의류</option>
				<option value="elect">전자제품</option>
				<option value="furniture">가구/인테리어</option>
				<option value="baby">유아용품</option>
				<option value="sport">스포츠/레저</option>
				<option value="hobby">게임/취미</option>
				<option value="beauty">뷰티/미용</option>
				<option value="life">생활/가공품</option>
				<option value="animal">반려동물용품</option>
				<option value="book">도서/티켓/음반</option>
				<option value="ele">기타/잡화</option>
			</select>
		</div>

		<!-- 상품 정렬 -->
		<div class="col-sm-3"
			style="display: inline-block; margin: 0; padding: 0; width: 150px;">
			<select class="input form-control pdi-spacing-02" id="field2"
				name="order">
				<option value="asc">낮은 가격 순</option>
				<option value="desc">높은 가격 순</option>
			</select>
		</div>

	</div>

	<!-- 상품보이는 라인 -->
	<div class="main-productList">
		<h3 style="margin-left: 1em;">여성의류</h3>
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
<form id="actionForm" action="/production/index_productList" method="get">
	<input type="hidden" name="pageNum" value='${pageMaker.cri3.pageNum}' />
	<input type="hidden" name="amount" value='${pageMaker.cri3.amount}' />
	<input type="hidden" name="cate_code" value=""/>
	<input type="hidden" name="order" value=""/>
</form>
<!--  end Pagination -->

<!--           </div> -->
>>>>>>> e7193a11751c00f900d7d957fe02f69b03caf554
<!-- contents 내용 파트 끝-->
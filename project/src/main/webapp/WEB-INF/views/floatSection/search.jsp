<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style>
	li {
		list-style:none;
	}
	</style>
<script>
	$(function(){
		var list = ${requestScope.production};
		console.log(list);
		var cate = ${requestScope.cate};
		console.log(cate);
		console.log(cate[0].MAN);
		
		$('.man').html("("+cate[0].MAN+")");
		$('.woman').html("("+cate[0].WOMAN+")");
		$('.elect').html("("+cate[0].ELECT+")");
		$('.furniture').html("("+cate[0].FURNITURE+")");
		$('.baby').html("("+cate[0].BABY+")");
		$('.sport').html("("+cate[0].SPORT+")");
		$('.hobby').html("("+cate[0].HOBBY+")");
		$('.beauty').html("("+cate[0].BEAUTY+")");
		$('.life').html("("+cate[0].LIFE+")");
		$('.animal').html("("+cate[0].ANIMAL+")");
		$('.book').html("("+cate[0].BOOK+")");
		$('.e').html("("+cate[0].E+")");

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
		            pickImage = '<span class="badge-success">직플거래</span>';
		        }else{
		            pickImage = '<span class="badge badge-warning">직거래</span>';
		        }
		            
				var str = "<li><a href='#' class='productNext' onclick="+"setCookiePlus('recentView','"+list[j].pro_num+","+realPath+temp.toString().replace(pattern,'/')+"/"+list[j].uuid+"_"+list[j].fileName+"',window.location.reload())"+">"
				+ "<div class='product'>"
				+"<div class='product-img'>"
				+	"<img id='"+j+"' src='"+realPath+list[j].uploadPath+"/"+list[j].uuid+"_"+list[j].fileName+"' width=194 height=194 style='padding:10px;'>"
				+"</div>"
				+ "<div class='product-title'>제목 : "+list[j].title+"</div>"
				+ "<div class='product-info'>"
				+	"<div class='product-price'>가격 : "+comma(list[j].price)+" 원</div>"
				+"</div>"
				+	"<div class='product-pick'>"+pickImage+"</div>"
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
		    $('#target').append(array[i]);
		    console.log(i);
		}
		
		//상품 카테고리별 바꿔주기
		console.log($('#field1').val());
		
		$('.cus').click(function(e){
				e.preventDefault();
				var cate_code = $(this).attr('data-cate');
				window.location.href = "/production/index_productList?cate_code="+cate_code+"&order=asc";
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
			actionForm[0].submit();
		});
	})	
</script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
  <!-- Main Content -->
    <div class="container mt-3 mb-3">
        <div class="row gutters-3">

            <!-- Shop Filters -->
            <div class="col-lg-3 col-md-4">
                <div class="accordion accordion-caret accordion-sidebar d-none d-md-block">
                    <div class="card">
                        <div class="card-header">
                            <a href="#filter-categories" data-toggle="collapse" aria-expanded="true"
                                aria-controls="filter-categories" role="button" class="h6">
                                CATEGORIES
                            </a>
                        </div>
                        <div id="filter-categories" class="collapse show">
                            <div class="card-body">
                                <ul class="list-tree">
                                    <li>
                                        <a href="#" class="has-arrow">품목별
                                            <ul>
                                                <li><a href="#" class="cus" data-cate="man">남성의류 <small
                                                            class="counter man">(10)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="woman">여성의류 <small
                                                            class="counter woman">(30)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="elect">전자제품 <small
                                                            class="counter elect">(25)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="furniture">가구인테리어 <small
                                                            class="counter furniture">(45)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="baby">유아용품 <small
                                                            class="counter baby">(95)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="sport">스포츠레저 <small
                                                            class="counter sport">(97)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="hobby">게임/취미 <small
                                                            class="counter hobby">(40)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="beauty">뷰티/미용 <small
                                                            class="counter beauty">(30)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="life">생활/가공품 <small
                                                            class="counter life">(25)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="animal">반려동물 <small
                                                            class="counter animal">(45)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="book">도서/티켓/음반 <small
                                                            class="counter book">(95)</small></a></li>
                                                <li><a href="#" class="cus" data-cate="else">기타/잡화 <small
                                                            class="counter e">(97)</small></a></li>
                                            </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <!-- /Shop Filters -->

            <div class="col-lg-9 col-md-8">

                <!-- Shop Toolbar -->
                <div class="card mb-3">
                    <div class="card-body d-flex justify-content-end align-items-center py-2">
                        <button class="btn btn-sm btn-outline-primary rounded-pill d-block d-md-none mr-auto"
                            data-toggle="modal" data-target="#filterModal"><i data-feather="filter"></i> Filter</button>
                        <ol class="breadcrumb d-none d-md-flex p-0 mb-0 mr-auto">
                            <li class="breadcrumb-item"><a href="#">검색 결과</a></li>
                        </ol>
                    </div>
                </div>
                <!-- /Shop Toolbar -->

                <!-- Shop List -->
                <div class="container mt-3">
                    <!-- Featured Products -->
                    <div id="target" class="grid grid-gap-3 grid-col-2 grid-col-md-4 my-3">
                       
                    </div>
                </div>
                <!-- /Featured Products -->
                <!-- /Shop List -->

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
        </div>
        
    </div>
    <!-- /Main Content -->
    
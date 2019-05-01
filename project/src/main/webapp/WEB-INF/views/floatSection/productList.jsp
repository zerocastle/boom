<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function(){
		var list = ${requestScope.production};
		console.log(list);
		var input_cate;
		var cate=$('#field1');
		
		// 쿼리 스트링 가져오는 정규 표현식
		function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    return results[2];
		}
		
		var cate_code = getParameterByName('cate_code');
		
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
		cate.val(input_cate);
		
		// 상품 대제목 변견
		$('.main-productList>h3').html(input_cate);
		
		//상품 변경하기
		var productionLength = list.length;
		var realPath = "${pageContext.request.contextPath}/resources/";
		
		
		var array = new Array();

			
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
					+"</a></li>" ;
					array.push(str);
			}
			$('.category-product-list').append(array[i]);
		}
		
		
		// 콤마찍기 정규 표현식
		function comma(num) {
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
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
				<option>여성의류</option>
				<option>남성의류</option>
				<option>전자제품</option>
				<option>가구/인테리어</option>
				<option>유아용품</option>
				<option>스포츠/레저</option>
				<option>게임/취미</option>
				<option>뷰티/미용</option>
				<option>생활/가공품</option>
				<option>반려동물용품</option>
				<option>도서/티켓/음반</option>
				<option>기타/잡화</option>
			</select>
		</div>

	</div>

	<!-- 상품보이는 라인 -->
	<div class="main-productList">
		<h3 style="margin-left: 1em;">여성의류</h3>
		<!-- 상품 4개 -->
		<div>
			<ul class="category-product-list">
				<!-- <li><a href="#" id="productNext">
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>
				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>
				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>

				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li>
				<li><a>
						<div class="product">
							<div class="product-img">
								<img src="http://placehold.it/194x194">
							</div>
							<div class="product-title">제목</div>
							<div class="product-info">
								<div class="product-price">가격</div>
								<div class="product-update-time">
									<div class="time">업데이트 ex)3분전</div>
								</div>
							</div>
							<div class="product-location">
								<div class="icon location-md">
									<i class="fa fa-map-marker-alt"></i>지역명
								</div>
							</div>
						</div>
				</a></li> -->
			</ul>
		</div>
	</div>
</div>
<!--           </div> -->
<!-- contents 내용 파트 끝-->
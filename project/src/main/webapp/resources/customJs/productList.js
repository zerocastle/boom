$(function() {
	var list = $
	{
		requestScope.production
	}
	;
	console.log(list);
	var input_cate;
	var cate = $('#field1');
	var orderDom = $('#field2');
	// 쿼리 스트링 가져오는 정규 표현식
	function getParameterByName(name, url) {
		if (!url)
			url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
				.exec(url);
		return results[2];
	}

	// 쿼리 스트링 값 들고 오기
	var cate_code = getParameterByName('cate_code');
	var realOrder = getParameterByName('order');
	$('#actionForm>input:eq(3)').val(realOrder);
	console.log(realOrder);
	cate.val(cate_code);
	orderDom.val(realOrder);
	// 히든에다가 갑 넣기
	$('#actionForm>input:eq(2)').val(cate_code);

	// 상품 제목을 바꿔주기 위한 작업
	switch (cate_code) {

	case "man":
		input_cate = "남성의류";
		break;
	case "woman":
		input_cate = "여성의류";
		break;
	case "elect":
		input_cate = "전자제품";
		break;
	case "furniture":
		input_cate = "가구/인테리어";
		break;
	case "baby":
		input_cate = "유아용품";
		break;
	case "sport":
		input_cate = "스포츠/레저";
		break;
	case "hobby":
		input_cate = "게임/취미";
		break;
	case "beauty":
		input_cate = "뷰티/미용";
		break;
	case "life":
		input_cate = "생활/가공품";
		break;
	case "animal":
		input_cate = "반려/동물";
		break;
	case "book":
		input_cate = "도서/티켓/음반";
		break;
	case "else":
		input_cate = "기타/잡화";
		break;

	}

	// 상품 대제목 변경
	$('.main-productList>h3').html(input_cate);

	// 상품 변경하기
	var productionLength = list.length;
	var realPath = "${pageContext.request.contextPath}/resources/";

	// 값 담기위한 작업
	var array = new Array();
	var test;
	var pattern = /\\/g;
	// 돌려 돌려
	for (var i = 0; i < productionLength; i++) {
		for (var j = 0; j < productionLength; j++) {
			var temp = list[j].uploadPath.toString();
			var pickImage = list[j].place_signal;
			if (list[j].place_signal == 1) {
				pickImage = '<br /><div><img src="/resources/image/place_signal/11.png" height="20" /></div>';
			} else {
				pickImage = '<br /><div><img src="/resources/image/place_signal/22.png" height="20" /></div>';
			}

			var str = "<li><a href='#' class='productNext' onclick="
					+ "setCookiePlus('recentView','"
					+ list[j].pro_num
					+ ","
					+ realPath
					+ temp.toString().replace(pattern, '/')
					+ "/"
					+ list[j].uuid
					+ "_"
					+ list[j].fileName
					+ "',window.location.reload())"
					+ ">"
					+ "<div class='product'>"
					+ "<div class='product-img'>"
					+ "<img id='"
					+ j
					+ "' src='"
					+ realPath
					+ list[j].uploadPath
					+ "/"
					+ list[j].uuid
					+ "_"
					+ list[j].fileName
					+ "' width=194 height=194>"
					+ "</div>"
					+ "<div class='product-title'>제목 : "
					+ list[j].title
					+ "</div>"
					+ "<div class='product-info'>"
					+ "<div class='product-price'>가격 : "
					+ comma(list[j].price)
					+ " 원</div>"
					+ pickImage
					+ "<div class='product-update-time'>"
					+ "</div>"
					+ "</div>"
					+ "<div class='product-location'>"
					+ "<div class='icon location-md'>"
					+ "<i class='fa fa-map-marker-alt'></i>"
					+ " "
					+ list[j].addr
					+ ""
					+ "</div>"
					+ "</div>"
					+ "</div>"
					+ "</a></li>"
					+ "<input type='hidden' value='"
					+ list[j].pro_num + "' class='pro_num' />";
			array.push(str);
		}
		$('.category-product-list').append(array[i]);
		console.log(i);
	}

	// 상품 카테고리별 바꿔주기
	console.log($('#field1').val());

	$('#field1')
			.change(
					function() {
						window.location.href = "/production/index_productList?cate_code="
								+ $('#field1').val() + "&order=asc";
					});

	// 가격 별로 바꿔주기
	$('#field2').change(function() {
		var dom = $('#actionForm>input:eq(3)');
		console.log(dom);
		if (dom.val() == null || dom.val() == 'desc') {
			dom.val('asc');
		} else
			dom.val('desc');
		$('#actionForm').submit();

	});

	// 상품 상세보기
	$('.productNext').click(
			function(e) {
				e.preventDefault();
				console.log($(this).parent());
				window.location.href = "/production/index_productView?pro_num="
						+ $(this).parent().next().val();
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
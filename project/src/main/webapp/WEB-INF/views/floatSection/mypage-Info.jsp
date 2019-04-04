<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
	integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
	integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y"
	crossorigin="anonymous">


<div class="sell">
	<div class="le">

		<span> <i class="fas fa-user-circle"></i>
		</span> <span class="sa"> 샘 오취리 </span>

		<div>
			<canvas id="foo" class="foo"></canvas>
		</div>



	</div>
	<div class="ri">
		<span class="sa1"> 샘오취리 </span>
		<button class="su">닉네임 수정</button>

		<div class="tx" id="t">
			<span class="nisu" id="n">소개글을 작성해주세요</span>
			<div class="mm">
				<textarea class="ct" id="c"></textarea>
				<button class="hi" id="h">확인</button>
			</div>
		</div>

		<button class="bsu" id="bb">소개글 수정</button>

	</div>

</div>


<div class="sell2">

	<!-- 상품 -->
	<div class="pro">

		<button id="btn1" class="pro1">상품</button>

	</div>


	<!-- 상점문의 -->
	<div class="sh">

		<button id="btn2" class="sh1">상점문의</button>

	</div>

	<!-- 찜 -->
	<div class="basket">
		<button id="btn3"  class="basket1">찜</button>
	</div>

	<!-- 상점 후기 -->
	<div class="review">
		<button id="btn4" class="review1">상점 후기</button>
	</div>

	<!-- 동네 직플 정보 -->
	<div class="jik">
		<button id="btn5" class="jik1">동네 직플 정보</button>
	</div>
</div>

<!-- product-info -->
<div id="mypage-1" class="page">

	<span class="pro2">상품</span>
	<hr>
	<span class="more">전체</span>

	<ul class="category-product-list">
		<li><a href="#" id="productNext">
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
		</a></li>
	</ul>













</div>
<!-- product-info end -->

<!-- 상점문의 start -->
<div id="mypage-2" class="shop">

	<div>
		<span class="shop1">상점문의</span>
	</div>



	<div class="a1">
		<div class="b1">
			<textarea id="content" name="content" class="content" rows="5"
				cols="40" maxlength="100" placeholder="댓글 내용을 입력해주세요"></textarea>
		</div>
		<div class="c1">
			<span id="counter" class="span">###</span>
			<div class="d1">
				<button class="dd">
					<span class="ddd">등록</span>
				</button>
				<sapn>
				<i class="fas fa-pencil-alt"></i></sapn>
			</div>
		</div>
	</div>


	<div class="i">
		<i class="fas fa-user-circle"
			style="font-size: 45px; color: gray; position: relative; left: 13px; top: 50px;"></i>


		<div class="r12">


			<div class="n12">
				<span>닉네임</span>
			</div>

			<div class="dd12">
				<span>문의글입니다.</span>
			</div>

			<div class="com12">
				<i class="far fa-comment-dots" style="color: gray;"></i>
				<button style="border: none; background-color: white;">답글달기</button>
			</div>

			<div class="de1">
				<i class="far fa-trash-alt" style="color: gray"></i>
				<button style="border: none; background-color: white;">삭제하기</button>
			</div>

		</div>

	</div>



</div>
<!-- 상점문의 end -->

<!-- 찜 start -->
<div id="mypage-3" class="jjim">

	<div>
		<span class="jjim1">찜</span>
		<hr>
	</div>

	<div>
		<input type="checkbox" class="check"><span class="check1">선택삭제</span>
	</div>

	<div class="jimpro">

		<div class="jimimg">
			<img src="http://placehold.it/155x148">
		</div>


		<div class="jimcont">

			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="proname1">상품명</span><input type="checkbox" class="prock">
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="proprice">10,000원</span>
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="protime">3시간전</span>
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="promap">대구 광역시 북구 복현1동</span>
			</div>
		</div>
	</div>

	<div class="jimpro">

		<div class="jimimg">
			<img src="http://placehold.it/155x148">
		</div>


		<div class="jimcont">
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="proname1">상품명</span><input type="checkbox" class="prock">
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="proprice">10,000원</span>
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="protime">3시간전</span>
			</div>
			<div style="margin-top: 5px; margin-left: 2px;">
				<span class="promap">대구 광역시 북구 복현1동</span>
			</div>
		</div>

	</div>
</div>
<!-- 찜 end -->

<!-- 상점후기 start -->
<div id="mypage-4" class="rev">
	<div>
		<span class="rev1">후기</span>
		<hr>
	</div>

	<div class="i">
		<i class="fas fa-user-circle"
			style="font-size: 45px; color: gray; position: relative; left: 13px; top: 50px;"></i>


		<div class="r1">


			<div class="n1">
				<span>닉네임</span>
			</div>

			<div class="star">
				<p class="star_rating">
					<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a> <a
						href="#">★</a> <a href="#">★</a>
				</p>
			</div>

			<div class="proname">
				<span>상품명</span>

			</div>

			<div class="dd1">
				<span>친절하고 좋았습니다.</span>
			</div>
			<div class="de0">
				<i class="fas fa-ban" style="color: gray;"></i>
				<button style="border: none; background-color: white;">신고하기</button>
			</div>




		</div>

	</div>
</div>
<!-- 상점후기 end -->

<!-- 동네 직플 정보 start -->
<div id="mypage-5" class="page">

	<span class="pro2">직플레이스 1</span>
	<hr>


	<div class="jikinfo1">
		<img class="img" src="C:\Users\bon300-6\Desktop\새 폴더 (3)\4.jpg">

		<div class="jikname">
			<span>카페 봄봄</span>
		</div>

		<div class="star123">
			<p class="star_rating">
				<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a> <a
					href="#">★</a> <a href="#">★</a>
			</p>
		</div>

		<div class="jikpro">
			<span>상품 2</span>
		</div>

		<div>
			<i class="fas fa-plus"></i>
			<button id="view1" class="jiksee">상세보기</button>
		</div>
	</div>

	<div class="jikinfo2">
		<img class="img" src="C:\Users\bon300-6\Desktop\새 폴더 (3)\3.jpg">

		<div class="jikname1">
			<span>복현동 다이소</span>
		</div>

		<div class="star123">
			<p class="star_rating">
				<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a> <a
					href="#">★</a> <a href="#">★</a>
			</p>
		</div>

		<div class="jikpro">
			<span>상품 1</span>
		</div>

		<div>
			<i class="fas fa-plus"></i>
			<button class="jiksee">상세보기</button>
		</div>
	</div>

	<div class="jikinfo3">

		<img class="img" src="C:\Users\bon300-6\Desktop\새 폴더 (3)\2.jpg">

		<div class="jikname2">
			<span>김파사</span>
		</div>

		<div class="star123">
			<p class="star_rating">
				<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a> <a
					href="#">★</a> <a href="#">★</a>
			</p>
		</div>

		<div class="jikpro">
			<span>상품 5</span>
		</div>

		<div>
			<i class="fas fa-plus"></i>
			<button class="jiksee">상세보기</button>
		</div>



	</div>





	<hr>




</div>
<!-- 동네 직플 정보 end -->

</div>
</div>

<script>
$(document).ready(function(){
	$('#mypage-2').css('display','none');
	$('#mypage-3').css('display','none');
	$('#mypage-4').css('display','none');
	$('#mypage-5').css('display','none');
	$('#btn1').click(function(){
		$('#mypage-2').css('display','none');
		$('#mypage-3').css('display','none');
		$('#mypage-4').css('display','none');
		$('#mypage-5').css('display','none');
		$('#mypage-1').css('display','block');
	})
		$('#btn2').click(function(){
		$('#mypage-1').css('display','none');
		$('#mypage-3').css('display','none');
		$('#mypage-4').css('display','none');
		$('#mypage-5').css('display','none');
		$('#mypage-2').css('display','block');
	})
		$('#btn3').click(function(){
		$('#mypage-1').css('display','none');
		$('#mypage-2').css('display','none');
		$('#mypage-4').css('display','none');
		$('#mypage-5').css('display','none');
		$('#mypage-3').css('display','block');
	})
		$('#btn4').click(function(){
		$('#mypage-1').css('display','none');
		$('#mypage-2').css('display','none');
		$('#mypage-3').css('display','none');
		$('#mypage-5').css('display','none');
		$('#mypage-4').css('display','block');
	})
		$('#btn5').click(function(){
		$('#mypage-1').css('display','none');
		$('#mypage-2').css('display','none');
		$('#mypage-3').css('display','none');
		$('#mypage-4').css('display','none');
		$('#mypage-5').css('display','block');
	})
	
	$('#view1').click(function(){
		window.open('/partner/InfoPlace','window_name','width=550,height=850,location=no,status=no,scrollbars=yes');
	});
});
</script>
<script src="/resources/customJs/mypage-info.js"> </script>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>

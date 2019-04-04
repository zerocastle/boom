<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <script src="../../js/member/member.js?ver=1"></script>
    <link href="../../css/member/member.css?ver=1" type="text/css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/da.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/solid.css"
	integrity="sha384-r/k8YTFqmlOaqRkZuSiE9trsrDXkh07mRaoGBMoDcmA58OHILZPsk29i2BsFng1B"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/regular.css"
	integrity="sha384-IG162Tfx2WTn//TRUi9ahZHsz47lNKzYOp0b6Vv8qltVlPkub2yj9TVwzNck6GEF"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/brands.css"
	integrity="sha384-BKw0P+CQz9xmby+uplDwp82Py8x1xtYPK3ORn/ZSoe6Dk3ETP59WCDnX+fI1XCKK"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/fontawesome.css"
	integrity="sha384-4aon80D8rXCGx9ayDt85LbyUHeMWd3UiBaWliBlJ53yzm9hqN21A+o1pqoyK04h+"
	crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=571aae4fec40d0283f32c39801431185&libraries=services"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("road_name").value = roadAddr;
				document.getElementById("addr").value = data.jibunAddress;

				var geocoder = new daum.maps.services.Geocoder();

				geocoder.addressSearch(
						document.getElementById('road_name').value, function(
								result, status) {
							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);
							var x = coords.getLat(); // 위도
							var y = coords.getLng(); // 경도

							document.getElementById('lag').value = x;
							document.getElementById('lng').value = y;
						});

			}
		}).open();
	}
</script>


</head>

<body>
	<div class="container">

		<div class="main">
			<h4>직플레이스 등록</h4>
			<div>
				<form role="form" id="form" action="/partner/partnerRegister"
					method="post">
					<fieldset>
						<div>
							<label for="store"></label> <input type="text" id="part_name"
								name="part_name" placeholder="점포명을 정확히 입력해주세요" required>
							<span class="store"> <i class="fas fa-store"></i>
							</span>
						</div>



						<div>
							<label for="owner"></label> <input type="text" maxlength="10"
								id="company_number" name="company_number"
								placeholder="사업자등록번호-10자리의 숫자" required> <span
								class="owner"> <i class="far fa-list-alt"></i>
							</span>
						</div>


						<div>
							<label for="name"></label> <input type="text" id="boss_name"
								name="boss_name" placeholder="대표자 성명을 입력해주세요" required>
							<span class="name"> <i class="fas fa-user"></i>
							</span>

						</div>

						<div>
							<label for="phone"></label><input type="text" id="part_phone"
								name="part_phone" maxlength="11" placeholder="휴대폰번호*숫자만허용"
								required> <span class="phone"> <i
								class="fas fa-mobile-alt"></i>
							</span>
						</div>

						<div>
							<label for="home"></label> <input type="text" id="zip_code"
								name="zip_code" placeholder="우편번호" required> <input
								type="text" id="road_name" name="road_name" placeholder="도로명주소"
								required> <input type="text" id="addr" name="addr"
								placeholder="지번주소" required> <input type="text"
								id="detail_addr" name="detail_addr" placeholder="상세주소">
							<span class="home"> <i class="fas fa-home"></i>
							</span>

						</div>


						<input id="submit" type="submit" value="등록하기"> <input
							type="button" class="adrs" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="hidden" id="lag"
							name="lag" /> <input type="hidden" id="lng" name="lng" />
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			var target = $('#form')
			$('#submit').click(function(e) {
				console.log(target);
				target.submit();
				alert("가입완료");

				$.ajax({
					url : "/partner/partnerPage",
					success : function(data) {
						window.close();
					}
				})

			});

		})
	</script>
</body>
</html>
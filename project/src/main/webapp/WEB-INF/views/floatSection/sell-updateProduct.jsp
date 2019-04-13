<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/resources/css/da2.css" rel='stylesheet' type='text/css' />
<!-- <link rel="stylesheet" type="text/css" href="C:\Users\bon300-6\Desktop\객체지향 프로그래밍\style.css"> -->
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

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

<!--  style 끝 -->


<div id="page-wrapper" class="gray-bg dashbard-1">
	<div class="content-main">

		<!--banner-->
		<div class="banner">
			<h1>상품등록</h1>
		</div>
		<!--//banner-->

		<!--grid-->
		<div class="grid-system">
			<!---->
			<div style="height: 740px;">

				<div class="aa">
					<h1 class="h1">이미지 등록</h1>
					<div class="file_input">

						<div class="wrapper">
							<div class="body">
								<div class="uploadDiv">
									<input type="file" name="uploadFile" multiple>

								</div>

								<div class="uploadResult">
									<ul>
										
									</ul>
								</div>


							</div>
							<!-- end body -->


						</div>


					</div>


				</div>

				<div class="bb">
					<h1 class="h2">상품등록</h1>
					<form id="proRegi" method="post" enctype="multipart/form-data"
						role="form" action="/selling/uploadProduct">
						<div style="margin-bottom: 5px;">
							<label class="a">카테고리:</label> <select id="group"
								name="cate_code" class="group">
								<option value="man">남성의류</option>
								<option value="woman">여성의류</option>
								<option value="elect">전자제품</option>
								<option value="furniture">가구/인테리어</option>
								<option value="babay">유아용품</option>
								<option value="sport">스포츠/레저</option>
								<option value="hobby">게임/취미</option>
								<option value="beauty">뷰티/미용</option>
								<option value="life">생활/가공품</option>
								<option value="animal">반려동물용품</option>
								<option value="book">도서/티켓/음반</option>
								<option value="else">기타/잡화</option>
							</select>
						</div>

						<div style="margin-bottom: 5px;">
							<label class="b">상태:</label> <select id="p_quality"
								name="p_quality" class="state">
								<option value="중고">중고</option>
								<option value="중고+하자">중고+하자(하자가 있는 중고)</option>
								<option value="새물품">새물품(미사용)</option>
								<option value="새것+하자">새것+하자(새것이고 하자가 있음)</option>
								<option value="거의새것">거의새것(새것이고 하자가 없음</option>
							</select>
						</div>

						<div style="margin-bottom: 5px;">
							<label class="c">제목:</label> <input type="text" id="title"
								name="title" class="title" placeholder="최대(40자)" maxlength="40" />
						</div>


						<div style="margin-bottom: 5px;">
							<label class="d">가격:</label> <input type="text" id="price"
								name="price" class="price" placeholder="10000(가격은 숫자로 만 입력)" />
							<input type="checkbox" id="change" name="change" class="change">
							<label class="z">교환가능</label>
						</div>



						<div class="wrap">설명:</div>
						<textarea id="content" name="content" class="content" rows="5"
							cols="40" maxlength="2000"></textarea>
						<span id="counter" class="span">###</span>

						<div class="sell-addr">
							<input type="text" id="sample4_jibunAddress" name="addr" /> <span
								class="ch-addr">거래지역:</span> <input type="button" class="adrs"
								onclick="sample4_execDaumPostcode()" value="거래지역선택">
						</div>




						<div>
							<label class="f">직플선택:</label> <input type="text" id="pick"
								name="place_pick" class="pick" readonly="readonly" value="" />
							<button class="find">선택</button>
						</div>


						<input type="submit" id="goods_reg" class="reg" value="물품등록" /> 
						<input type="hidden" name="m_num" id="m_num" value='<c:out value="${sessionScope.loginSession2.m_num }"></c:out>' />
					</form>

				</div>
			</div>

		</div>
	</div>
</div>

</div>
<!--//grid-->
<!---->

<!-- 거래 지역 선택  직플 땡겨오기-->
<script>
	$(function() {
		$('.find').click(function(e) {
			e.preventDefault();
			window.open('directPick', 'directPick', 'width=500,height=700');
		})
	})
</script>


<script>
	$(function() {

		// 상품 이미지 업로드 부분
		var formObj = $("form[role='form']");
		$("#goods_reg")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							console.log("submit clicked");
							var str = "";
							$(".uploadResult ul li")
									.each(
											function(i, obj) {
												var jobj = $(obj);
												console.dir(jobj);
												console.log(jobj
														.data("filename"));
												
												str += "<input type='hidden' name='uploadVOList["
														+ i
														+ "].uuid' value='"
														+ jobj.data("uuid")
														+ "'>";
												str += "<input type='hidden' name='uploadVOList["
														+ i
														+ "].uploadPath' value='"
														+ jobj.data("uploadpath")
														+ "'>";
												str += "<input type='hidden' name='uploadVOList["
														+ i
														+ "].fileName' value='"
														+ jobj.data("filename")
														+ "'>";
												str += "<input type='hidden' name='uploadVOList["
														+ i
														+ "].fileType' value='"
														+ jobj.data("filetype")
														+ "'>";
											})
											alert("상품을 등록 했습니다.");
							 formObj.append(str).submit();  

						});

		// 파일 업로드를 위한 스크립트
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			return true;
			// 올리는 파일 사이즈 크기를 제한
			if (regex.test(fileName)) {
				alert("해당 파일을 올릴수 없다");
				return false;
			}
			return true;
		}

		var cloneObj = $(".uploadDiv").clone(); //아무 것도 들어 있지 않는 것을 클론 해놓는디.

		$("input[type='file']").change(function(e) {
			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files; // 첫번째 태그 들고온거에 파일을 files에 넣어준다.
			console.log(files);

			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
					// 함수 적용 해서  체크 해보고 반환값이 true 가 아니면 return false;

				}
				formData.append("uploadFile", files[i]); //폼 데이터에 uploadFile 네임값 즉 input 태그를 여러개 formdata에 붙친다.
			}

			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {

					console.log(result);
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html()); // 업로드하고 안에 엘리먼트에 빈 인풋테그를 붙친다. 

				}
			});
		})

		var uploadResult = $(".uploadResult ul"); //결과가 들어갈 부분
		function showUploadedFile(uploadResultArr) {

			var str = "";

			$(uploadResultArr)
					.each(
							function(i, obj) {

								if (!obj.fileType) {

									var realPath = "${pageContext.request.contextPath}/resources/";
									var uuid = "/s_" + obj.uuid;
									var uploadPath = obj.uploadPath;
									var fileName = "_" + obj.fileName;
									var temp = obj.temp + "/";

									var fileCallPath = encodeURIComponent(realPath
											+ uploadPath + uuid + fileName);
									var fileTempCallPath = encodeURIComponent(temp
											+ uploadPath + uuid + fileName);

									str += "<li><div><a href='/download?fileName="
											+ fileTempCallPath
											+ "'>"
											+ "<img src='/resources/image/attach.png'>"
											+ obj.fileName
											+ "</a>"
											+ "<span data-file=\'"+fileTempCallPath+"\' data-type='file'> x </span>"
											+ "<div></li>"

								} else {

									var realPath = "${pageContext.request.contextPath}/resources/";
									var uuid = "/s_" + obj.uuid;
									var uploadPath = obj.uploadPath;
									var fileName = "_" + obj.fileName;
									var temp = obj.temp + "/";

									var fileCallPath = encodeURIComponent(realPath
											+ uploadPath + uuid + fileName);
									var fileTempCallPath = encodeURIComponent(temp
											+ uploadPath + uuid + fileName);
									str += "<li data-uuid='"+obj.uuid+"' data-uploadPath='"+obj.uploadPath+"' data-fileName='"+obj.fileName+"' data-fileType='"+obj.fileType+"'>"
											+ "<img src='"+realPath+uploadPath+uuid+fileName+"'/>"
											+ "<span data-file=\'"+fileTempCallPath+"\' data-type='image'> x </span>"
											+ "</li>";
								}
								
							});

			uploadResult.append(str);
		}

		// 프리뷰 삭제를 위한 작업이다.
		$(".uploadResult").on("click", "span", function(e) {

			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			var removeTarget = $(this).parent();

			$.ajax({
				url : '/deleteFile',
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					removeTarget.remove();
				}
			}); //$.ajax

		});

	})
</script>

<script>
	// <글자수 입력 제한>

	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			// $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/2000');
		});
		$('#content').keyup();
	});
</script>

<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
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
						//                  document.getElementById('sample4_postcode').value = data.zonecode;
						//                  document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							/* document.getElementById("sample4_extraAddress").value = extraRoadAddr; */
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							/* guideTextBox.innerHTML = ''; */
						/* 	guideTextBox.style.display = 'none'; */
						}

					}
				}).open();
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

						
							</div>


						</div>


					</div>


				</div>

				<div class="bb">
					<h1 class="h2">상품등록</h1>
					<form id="proRegi" method="post" enctype="multipart/form-data">
						<div style="margin-bottom: 5px;">
							<label class="a">카테고리:</label> <select id="group" name="group"
								class="group">
								<option value="카테고리">---카테고리를 선택해주세요---</option>
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
							<label class="b">상태:</label> <select id="state" name="state"
								class="state">
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
							<input type="text" id="sample4_jibunAddress"> <span
								class="ch-addr">거래지역:</span> <input type="button" class="adrs"
								onclick="sample4_execDaumPostcode()" value="거래지역선택">
						</div>




						<div>
							<label class="f">직플선택:</label> <input type="text" id="pick"
								name="pick" class="pick" readonly="readonly" value="" />
							<button class="find">선택</button>
						</div>


						<input type="submit" id="goods_reg" class="reg" value="물품등록" />


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
	//임의의 file object영역
	var files = {};
	var previewIndex = 0;

	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {
		if (input[0].files) {
			//파일 선택이 여러개였을 시의 대응
			for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
				var file = input[0].files[fileIndex];

				if (validation(file.name))
					continue;

				var reader = new FileReader();
				reader.onload = function(img) {
					//div id="preview" 내에 동적코드추가.
					//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
					var imgNum = previewIndex++;
					$("#preview")
							.append(
									"<div class=\"preview-box\" value=\"" + imgNum + "\">"
											+ "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
											+ "<a class=\"det\" href=\"#\" value=\""
											+ imgNum
											+ "\" onclick=\"deletePreview(this)\">"
											+ "삭제" + "</a>" + "</div>");
					files[imgNum] = file;
				};
				reader.readAsDataURL(file);
			}
		} else
			alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	}

	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
		var imgNum = obj.attributes['value'].value;
		delete files[imgNum];
		$("#preview .preview-box[value=" + imgNum + "]").remove();
		/* resizeHeight(); */
	}

	//client-side validation
	//always server-side validation required
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
			alert('jpg, gif, png 확장자만 업로드 가능합니다.');
			return true;
		} else {
			return false;
		}
	}

	$(document).ready(function() {

		var cloneObj = $("#attach").clone();
		//submit 등록. 실제로 submit type은 아니다.
		$('#test').on('click', function() {
			var formData = new FormData();
			var inputFile = $("input[name='filedata']");
			var files = inputFile[0].files;
			console.log(files);
			
			for(var i = 0; i < files.length; i++){
				formData.append("uploadFile",files[i]);
			}

		/* 	for (var index = 0; index < Object.keys(files).length; index++) {
				//formData 공간에 files라는 이름으로 파일을 추가한다.
				//동일명으로 계속 추가할 수 있다.
				formData.append('files', files[index]);
			}
 */
			//ajax 통신으로 multipart form을 전송한다.
			$.ajax({
				enctype: "multipart/form-data",
				type : 'POST',
				processData : false,
				contentType : false,
				url : '/uploadAjaxAction',
				dataType : 'JSON',
				data : formData,
				success : function(result) {
					//이 부분을 수정해서 다양한 행동을 할 수 있으며,
					//여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
					//-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
					if (result === -1) {
						alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
						// 이후 동작 ...
					} else if (result === -2) {
						alert('파일이 10MB를 초과하였습니다.');
						// 이후 동작 ...
					} else {
						alert('이미지 업로드 성공');
						// 이후 동작 ...
						$("#attach").html(cloneObj.html());
					}
				}
			//전송실패에대한 핸들링은 고려하지 않음
			});
		});
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		});
	});
</script>








<script>
	$(document).ready(function() {

		/////////////////////////////////////////

	});
	var input;
	function openFile(event) {
		input = event.target;
		var reader = new FileReader();
		reader.onload = function() {
			var dataURL = reader.result;
			$(input).next().children('img').attr('src', dataURL);
			$(input).next().children('img').css('display', 'block');
		}
		reader.readAsDataURL(input.files[0]);
	};

	var list = [];
	var ruru = 0;
	function addColor() {
		var num = ruru++;
		var src;
		var list = $('#colorPick')[0].files;
		var reader = new FileReader();
		reader.readAsDataURL(list[0]);
		reader.onload = function() {
			src = this.result;
			var color = $('#goods_color').val();
			var count = $('#goods_count').val();
			var div = '<div class="colorImgBox" id="colorBox' + num + '"><img class="colorImg" src="' + src + '"/><span>'
					+ color
					+ ' X'
					+ count
					+ '개<span>'
					+ '<span class="xBtn"><a href="#" onclick="removeBox(event)"><img ' + 'src="https://www.etudehouse.com/kr/ko/web_resource/front/images/common/ico_close2.png"/></a></span>'
					+ '<input type="hidden" name="optList[' + num + '].goods_count" value="' + count + '"/><input type="hidden"' + ' name="optList[' + num + '].goods_color" value="' + color + '"/></div>';

			$('#colorAddBox').append(div);
			var ele = document.getElementById("colorPick");
			var cl = ele.cloneNode(true);
			cl.removeAttribute("id");
			cl.setAttribute("name", "optList[" + num + "].goods_color_file");
			$(cl).addClass('hiddenBox');

			$('#colorBox' + num).append(cl);
		}
	} //end addColor
	function removeBox(event) {
		$(event.target).parents('.colorImgBox').remove();
		event.preventDefault();
	}

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
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
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
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}

					}
				}).open();
	}
</script>









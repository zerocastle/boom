<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="/resources/css/da2.css" rel='stylesheet' type='text/css' />

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
						<img class="outputView" src="http://placehold.it/500x250" />
						<div class="wrapper">
							<div class="body">

								<div id="attach">
									<label class="waves-effect waves-teal btn-flat"
										for="uploadInputBox">이미지등록</label> <input id="uploadInputBox"
										style="display: none" class="but" type="file" name="filedata"
										multiple />
								</div>


								<div id="preview" class="content1"></div>


								<form id="uploadForm" style="display: none;">
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
								<option value="남성의류">남성의류</option>
								<option value="여성의류">여성의류</option>
								<option value="전자제품">전자제품</option>
								<option value="가구/인테리어">가구/인테리어</option>
								<option value="유아용품">유아용품</option>
								<option value="스포츠/레저">스포츠/레저</option>
								<option value="게임/취미">게임/취미</option>
								<option value="뷰티/미용">뷰티/미용</option>
								<option value="생활/가공품">생활/가공품</option>
								<option value="반려동물용품">반려동물용품</option>
								<option value="도서/티켓/음반">도서/티켓/음반</option>
								<option value="기타/잡화">기타/잡화</option>
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
							<lbael class="z">교환가능</lbael>
						</div>



						<div class="wrap">설명:</div>
						<textarea id="content" name="content" class="content" rows="5"
							cols="40" maxlength="2000"></textarea>
						<span id="counter" class="span">###</span>




						<!--                         <div style="margin-bottom:5px;"> -->
						<!--                            <label class="e">수량:</label> -->
						<!--                            <input type="text" id="count" name="count" class="count"> -->
						<!--                         </div> -->



						<div>
							<label class="f">직플선택:</label> <input type="text" id="pick"
								name="pick" class="pick">
							<button class="find">찾기</button>
						</div>

						<input type="submit" id="goods_reg" class="reg" value="물품등록" />


					</form>

				</div>
			</div>

		</div>
	</div>
</div>

<!-- 주소 들어가는 부분 -->

<div>
	<label for="home"></label> <input type="text" id="zip_code"
		name="zip_code" placeholder="우편번호" required> <input
		type="text" id="road_name" name="road_name" placeholder="도로명주소"
		required> <input type="text" id="addr" name="addr"
		placeholder="지번주소" required> <input type="text"
		id="detail_addr" name="detail_addr" placeholder="상세주소"> <span
		class="home"> <i class="fas fa-home"></i>
	</span>

</div>


</div>
<!--//grid-->
<!---->


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
               reader.onload = function (img) {
                  //div id="preview" 내에 동적코드추가.
                  //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                  var imgNum = previewIndex++;
                  $("#preview")
                     .append(
                        "<div class=\"preview-box\" value=\"" + imgNum + "\">"
                        + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                        + "<p>"
                        + "</p>"
                        + "<a href=\"#\" value=\""
                        + imgNum
                        + "\" onclick=\"deletePreview(this)\">"
                        + "<br>"
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
         resizeHeight();
      }

      //client-side validation
      //always server-side validation required
      function validation(fileName) {
         fileName = fileName + "";
         var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
         var fileNameExtension = fileName.toLowerCase().substring(
            fileNameExtensionIndex, fileName.length);
         if (!((fileNameExtension === 'jpg')
            || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
            return true;
         } else {
            return false;
         }
      }

      $(document).ready(function () {
         //submit 등록. 실제로 submit type은 아니다.
         $('.submit a').on('click', function () {
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);

            for (var index = 0; index < Object.keys(files).length; index++) {
               //formData 공간에 files라는 이름으로 파일을 추가한다.
               //동일명으로 계속 추가할 수 있다.
               formData.append('files', files[index]);
            }

            //ajax 통신으로 multipart form을 전송한다.
            $.ajax({
               type: 'POST',
               enctype: 'multipart/form-data',
               processData: false,
               contentType: false,
               cache: false,
               timeout: 600000,
               url: '/imageupload',
               dataType: 'JSON',
               data: formData,
               success: function (result) {
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
                  }
               }
               //전송실패에대한 핸들링은 고려하지 않음
            });
         });
         // <input type=file> 태그 기능 구현
         $('#attach input[type=file]').change(function () {
            addPreview($(this)); //preview form 추가하기
         });
      });
   </script>








<script>
      $(document).ready(function () {


         /////////////////////////////////////////

      });
      var input;
      function openFile(event) {
         input = event.target;
         var reader = new FileReader();
         reader.onload = function () {
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
         reader.onload = function () {
            src = this.result;
            var color = $('#goods_color').val();
            var count = $('#goods_count').val();
            var div = '<div class="colorImgBox" id="colorBox' + num + '"><img class="colorImg" src="' + src + '"/><span>' + color + ' X' + count + '개<span>'
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
        $('#content').keyup(function (e){
            var content = $(this).val();
            // $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
            $('#counter').html(content.length + '/2000');
        });
        $('#content').keyup();
  });


   </script>

<!-- 다음 -->

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


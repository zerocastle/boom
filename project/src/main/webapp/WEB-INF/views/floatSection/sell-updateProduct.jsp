<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/da2.css" rel='stylesheet' type='text/css' />

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/resources/customJs/sell-updateProduct.js"></script>

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

								<!-- 대표사진 -->
								<div class="representaion"></div>
								<!-- 대표사진 끝 -->

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


						<input type="submit" id="goods_reg" class="reg" value="물품등록" /> <input
							type="hidden" name="m_num" id="m_num"
							value='<c:out value="${sessionScope.loginSession.m_num }"></c:out>' />
					</form>

				</div>
			</div>

		</div>
	</div>
</div>

</div>
<!--//grid-->
<!---->


<script>
	$(function() {

		// 상품 이미지 업로드 부분
		var formObj = $("form[role='form']");
		// 전송 버튼
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
														+ jobj
																.data("uploadpath")
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
											+ "<span data-file=\'"+fileTempCallPath+"\' data-type='image'> x </span> <button class='hi'>대표 사진 정하기</button>"
											+ "</li>";
								}

							});

			uploadResult.append(str);
			// 대표 사진 정하기
			$(".hi").click(function() {
				var choice = $(this).parent();
				var targetTemp = choice.find("img").clone();
				var target = targetTemp;
				var result = $(".representaion");
				result.empty();
				result.append(target);

			})
		}

		// 프리뷰 삭제를 위한 작업이다.
		$(".uploadResult").on("click", "span", function(e) {
			var target = $(this).siblings().first().attr('src');
			console.log(target);
			var target2 = $(".representaion");
			var pare = target2.find('img').attr('src');
			console.log(pare);
			if (target == pare) {
				target2.empty();
			}
			//이미지 비교 삭제
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




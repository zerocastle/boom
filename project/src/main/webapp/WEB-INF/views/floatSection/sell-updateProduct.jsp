<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/da2.css" rel='stylesheet' type='text/css' />

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/resources/customJs/sell-updateProduct.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!--   <link rel="stylesheet" type="text/css"  -->
<!--     href="http://demo.joshadmin.com/assets/css/lib.css">  -->

 
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
   integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
   crossorigin="anonymous">
   
<!-- <link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/vendors/jasny-bootstrap/css/jasny-bootstrap.css">
<link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/vendors/iCheck/css/minimal/blue.css">
<link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/vendors/select2/css/select2.min.css">
<link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/vendors/select2/css/select2-bootstrap.css">
<link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/vendors/datetimepicker/css/bootstrap-datetimepicker.min.css">
 -->
<link rel="stylesheet" type="text/css"
   href="http://demo.joshadmin.com/assets/css/frontend/user_account.css">


<style>
.uploadResult ul li>span {
   position: relative;
   z-index: 5;
   bottom: 63px;
   right:20px;
   font-weight: bold;
    font-size: 17px;
    color:black;
cursor: pointer;
   }
   
.uploadPicture {
   width: 170px;
   height: 170px;
}

.uploadPicture {
   width: 170px;
   height: 170px;
}

.uploadResult {
   /* background-color: gray; */
   
}

.uploadResult ul {
   flex-flow: row;
   justify-content: center;
   align-items: center;
   padding: 0;
}

.uploadResult ul li {
   display: inline-block;
   list-style: none;
   margin-top:-25%;
}

.uploadResult ul li img {
   width: 150px;
   height: 153px;
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

.picture, .picture1, .picture2, .picture3, .picture4 {
   background:url(http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg);
   background-size: cover;
}

.picture{
   width: 150px;
   height: 150px;
   background-color: #999999;
   color: #FFFFFF;
   display: inline-block;
   overflow: hidden;
   transition: all 0.2s;
   -webkit-transition: all 0.2s;
}
.pic{
margin-left:1.1%;
}
.pic1{
margin-left:1.2%;
}


.file_choice{
width:150px !important;
height:150px !important;
cursor: pointer !important;
}





</style>



<!-- /content -->
<div class="pro_top">
   <img src="https://mimity-fashion56.netlify.com/img/logo.svg"
      style="width: 3.5%" alt="Mimity">
   <div>상품등록하기</div>
</div>


<div class="pro_con">
   <div class="uploadDiv">
      <div class="filebox">
         <label>사진등록:</label> 
         <input type="file"name="uploadFile" id="ex_file" multiple> 
      </div>


   </div>
   <!--  업로드 result -->
   <div class="momo uploadResult">
      
      <div class="picture">
      <div class="filebox">
         <label for="ex_file" class="file_choice"></label> <input type="file"
            name="uploadFile" id="ex_file" multiple>
      </div>
      </div>

      <div class="picture pic">
      <div class="filebox">
         <label for="ex_file" class="file_choice"></label> <input type="file"
            name="uploadFile" id="ex_file" multiple>
      </div>
      </div>

      <div class="picture pic1">
      <div class="filebox">
         <label for="ex_file" class="file_choice"></label> <input type="file"
            name="uploadFile" id="ex_file" multiple>
      </div>
      </div>
      
      <div class="picture pic">
      <div class="filebox">
         <label for="ex_file" class="file_choice"></label> <input type="file"
            name="uploadFile" id="ex_file" multiple>
      </div>
      </div>

      <div class="picture pic">
      <div class="filebox">
         <label for="ex_file" class="file_choice"></label> <input type="file"
            name="uploadFile" id="ex_file" multiple>
      </div>
      </div>

      <ul>

      </ul>
   </div>

   <!-- ==================== ========================-->


   <!-- <div class="body"> -->

   <!-- 대표사진 -->
   <div style="display: none;" class="representaion"></div>
   <!-- 대표사진 끝 -->

   <!-- </div> -->
   <!-- end body -->


   <form id="proRegi" method="post" enctype="multipart/form-data"
      role="form" action="/selling/uploadProduct">


      <div class="form-group ">
         <div class="row">
            <div class="labels">
               <label class="control-label"> 카테고리: <span class='require'></span>
               </label>
            </div>
            <div class="col-lg-10 col-12">
               <div class="input-group input-group-append srvselect">
                  <span class="input-group-text"> <i class="fas fa-bars"
                     data-name="user" data-size="16" data-loop="true" data-c="#418bca"
                     data-hc="#418bca"></i>
                  </span> <select id="u-name" class="form-control"
                     value="CHOPARD PARFUMS -" name="cate_code">
                     <option value="man">남성의류</option>
                     <option value="woman">여성의류</option>
                     <option value="elect">전자제품</option>
                     <option value="furniture">가구/인테리어</option>
                     <option value="baby">유아용품</option>
                     <option value="sport">스포츠/레저</option>
                     <option value="hobby">게임/취미</option>
                     <option value="beauty">뷰티/미용</option>
                     <option value="life">생활/가공품</option>
                     <option value="animal">반려동물용품</option>
                     <option value="book">도서/티켓/음반</option>
                     <option value="else">기타/잡화</option>
                  </select>

               </div>
               <span class="help-block"></span>
            </div>

         </div>
      </div>

      <div class="form-group ">
         <div class="row">

            <label class="control-label"> 상태: <span class='require'></span>
            </label>


            <div class="col-lg-10 col-12">
               <div class="input-group input-group-append">
                  <span class="input-group-text"> <i
                     class="far fa-check-circle" data-name="user" data-size="16"
                     data-loop="true" data-c="#418bca" data-hc="#418bca"></i>
                  </span> <select id="u-name" class="form-control" value="DEMO"
                     name="p_quality">
                     <option value="중고">중고</option>
                     <option value="중고+하자">중고+하자(하자가 있는 중고)</option>
                     <option value="새물품">새물품(미사용)</option>
                     <option value="새것+하자">새것+하자(새것이고 하자가 있음)</option>
                     <option value="거의새것">거의새것(새것이고 하자가 없음</option>
                  </select>



               </div>
               <span class="help-block"></span>
            </div>
         </div>
      </div>

      <div class="form-group ">
         <div class="row">

            <label class="control-label"> 제목: <span class='require'></span>
            </label>

            <div class="col-lg-10 col-12">
               <div class="input-group input-group-append">
                  <span class="input-group-text"> <i class="fas fa-heading"
                     data-name="mail" data-size="16" data-loop="true" data-c="#418bca"
                     data-hc="#418bca"></i>
                  </span> <input type="text" placeholder="최대(40자)" id="title" name="title"
                     class="form-control">
               </div>
               <span class="help-block"></span>
            </div>

         </div>
      </div>

      <div class="form-group ">
         <div class="row">

            <label class="control-label"> 가격: <span class='require'></span>
            </label>


            <div class="col-lg-10 col-12">
               <div class="input-group input-group-append">
                  <span class="input-group-text"> <i
                     class="fas fa-dollar-sign" data-name="key" data-size="16"
                     data-loop="true" data-c="#418bca" data-hc="#418bca"></i>
                  </span> <input type="text" name="price" placeholder="10000(가격은 숫자로 만 입력)"
                     id="price" class="form-control">
               </div>
               <span class="help-block"></span>
            </div>
         </div>
      </div>


      <div class="form-group ">
         <div class="row">


            <label class="control-label"> 설명: </label>

            <div class="col-lg-10 col-12">
               <textarea rows="5" cols="30" class="form-control resize_vertical"
                  id="content" maxlength="2000" name="content"></textarea>
               <div class="sp">
                  <span id="counter" class="span">###</span>
               </div>
            </div>
            <span class="help-block"></span>
         </div>
      </div>


      <div class="form-group ">
         <div class="row">
            <div class="labels">
               <label class="control-label" for="state">거래지역:</label>

            </div>
            <div class="col-lg-10 col-12 col-md-12 col-sm-12 ">
               <div class="input-group input-group-append">
                  <span class="input-group-text"> <i
                     class="fas fa-map-marked-alt" data-name="plus-alt" data-size="16"
                     data-loop="true" data-c="#418bca" data-hc="#418bca"></i>
                  </span> <input type="text" placeholder=" " id="addr"
                     class="form-control" name="addr" value="" /> <input
                     type="button" class="adrs" onclick="sample4_execDaumPostcode()"
                     value="거래지역선택">

               </div>
            </div>
            <span class="help-block"></span>
         </div>
      </div>

      <div class="form-group ">
         <div class="row">
            <div class="labels">
               <label class=" control-label" for="postal">직플선택:</label>
            </div>

            <div class="col-lg-10 col-12">
               <div class="input-group input-group-append">
                  <span class="input-group-text"> <i class="fas fa-store"
                     data-name="plus-alt" data-size="16" data-loop="true"
                     data-c="#418bca" data-hc="#418bca"></i>

                  </span> <input type="text" placeholder=" " id="pick" class="form-control"
                     name="place_pick" value="" />
                  <button class="find">선택</button>
               </div>
               <span class="help-block"></span>
            </div>
         </div>

      </div>

      <div class="pro_but">
         <a href="/"><div class="pro_cancel">취소</div></a>
         <input type="submit" id="goods_reg" class="reg" value="등록완료" / ><input
            type="hidden" name="m_num" id="m_num"
            value='<c:out value="${sessionScope.loginSession.m_num }"></c:out>' />
      </div>
   </form>
</div>


<!-- /content -->


<script>
   $(function() {
      let check = [ '|대표사진| ', '|제목| ', '|설명| ', '|가격| ', '|거래지역| ' ];//미작성된 부분 알려주기 위해. 작성이 된다면 작성된 부분은 ''으로 변경됨.

      // 상품 이미지 업로드 부분
      var formObj = $("form[role='form']");
      // 전송 버튼
      $("#goods_reg")
            .on(
                  "click",
                  function(e) {
                     let check = [ '|대표사진| ', '|제목| ', '|설명| ', '|가격| ',
                           '|거래지역| ' ];//미작성된 부분 알려주기 위해. 작성이 된다면 작성된 부분은 ''으로 변경됨.
                     e.preventDefault();
                     console.log("submit clicked");
                     var check_msg = '';
                     check = [ '|대표사진| ', '|제목| ', '|설명| ', '|가격| ',
                           '|거래지역| ' ];
                     if ($('.representaion img').length != 0) {
                        check[0] = '';
                     }
                     if ($('#title').val() != '') {//제목이 있다면 에러메시지 없앤다.
                        check[1] = '';
                     }
                     if ($('#content').val() != '') {//내용이 있다면 에러메시지 없앤다.
                        check[2] = '';
                     }
                     if ($('#price').val() != '') {//가격이 있다면 에러메시지 없앤다.
                        check[3] = '';
                     }
                     if ($('#sample4_jibunAddress').val() != '') {//주소가 있다면 에러메시지 없앤다.
                        check[4] = '';
                     }

                     for (var i = 0; i < check.length; i++) {//에러메시지들을 통합한다.
                        check_msg += check[i];
                     }
                     console.log(check_msg);
                     if (check_msg != '') {//만약 에러메시지가 남아있다면
                        alert('다음 요소들을 작성해 주시길 바랍니다. \n ' + check_msg);//에러메시지 보여주기.

                        return false;
                     }

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

                                    var rep = $(".representaion");
                                    var img = rep.find('img');
                                    var src = img.attr('src');
                                    console.log("대표사진 쪽 사진 src : "
                                          + src);
                                    //===========================================================
                                    var pare = $(".uploadResult ul");
                                    var imgs = pare.find('img');

                                    var pareSrc = $(imgs[i]).attr(
                                          'src');
                                    console.log("헬로 : " + pareSrc);

                                    if (src == pareSrc) {
                                       str += "<input type='hidden' name='uploadVOList["+i+"].rep' value='1'>";
                                    } else
                                       str += "<input type='hidden' name='uploadVOList["+i+"].rep' value='0'>";

                                    console.log("결과 str : " + str);

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
      $(".uploadDiv")
            .on(
                  'change',
                  'input[type="file"]',
                  function(e) {
                     if (parseInt($("input[name='uploadFile']")[0].files.length) > 5) {
                        alert('이미지는 최대 5장 등록가능합니다.');
                        $("input[name='uploadFile']").wrap('<form>')
                              .closest('form').get(0).reset(); //<input type='file'>에 담긴 파일정보 리셋.
                        return false;
                     }
                     var formData = new FormData();

                     var inputFile = $("input[name='uploadFile']");

                     var files = inputFile[0].files; // 첫번째 태그 들고온거에 파일을 files에 넣어준다.
                     console.log(files);
                     console.log(files.length);

                     for (var i = 0; i < files.length; i++) {
                        if (!checkExtension(files[i].name,
                              files[i].size)) {
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
                           inputFile[0].value = '';
                           if ($('.uploadResult ul li').length > 5) {
                              alert('사진 업로드는 최대 5장까지 가능합니다');
                              location.reload();
                           }

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
                                 + "</div></li>"

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
                                 + "<span data-file=\'"+fileTempCallPath+"\' data-type='image'> x </span> <div><button class='hi'>대표사진 선택</button></div>"
                                 + "</li>";  
                        }

                     });

         
         uploadResult.append(str);
         // 대표 사진 정하기 속성명,속성값
         $(".hi").click(
               function() {
                  check[0] = '';
                  /* var banner = $(this).parent().parent().prepend('<div class="capteen">대표사진</div>'); */
                  var choice = $(this).parent().parent();
                  console.log(choice);
                  var targetTemp = choice.find("img").clone();
                  var target = targetTemp;
                  var result = $(".representaion");
                  result.attr("data-rep", "1");
                  result.empty();
                  result.append(target);

                  if ($(this).find('.capteen').text() != '대표이미지') {
                     $('.uploadResult > ul >li')
                           .each(
                                 function(index, data) {
                                    console.log("============");
                                    console.log(data);
                                    console.log(index);
                                    console.log("============");
                                    var length = index
                                    var text = $(data).children()
                                          .first().text();

                                    console.log(text);
                                    console.log($(data).children()
                                          .first());
                                    $(data).children().first().removeAttr('class')
                                          .empty();

                                 });
                     $(this).parent().parent().prepend(
                           '<div class="capteen">대표이미지</div>');

                  }

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

<script>
$(function() {
	$(".pro_cancel").click(function() {
	      
	   location.href='production.jsp'; 
	      
	});
});
      
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="cordova.js"></script>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <script
            src="https://code.jquery.com/jquery-3.4.0.min.js"
            integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script><!-- 팝업창 스크립트  -->

    <script>
        var objDiv = document.getElementsByClassName("contents-line");
        objDiv.scrollTop = objDiv.scrollHeight;
    </script>

    <style>
  .img-responsive{
    width:50px;
    height:50px;
    float: right;
    }

        * {
            margin: 0;
            padding: 0;
        }

        /*
body{
    background-color: #E6E6E6;
    width: 100%;
    height: 100%;
} */


.modal.modal-center {
text-align: center;
}

@media screen and (min-width: 768px) { 
.modal.modal-center:before {
  display: inline-block;
  vertical-align: middle;
  content: " ";
  height: 100%;
}
}
.modal-dialog.modal-center {
display: inline-block;
vertical-align: middle; 
}
.modal-content{
overflow:hidden;
width: 105%;
height: 68%;
}
#myModal {
z-index: 100;
width: 95%;
height: 100%;
}

#daumIframe { 
padding-top : 3px;
padding-left : 3px;
margin-top : 3px;
margin-left:-20px;
border : 0;
width:210vw;
height: 110vh;
transform: scale(0.80, 0.80); 
-moz-transform-origin: top left;  
-webkit-transform-origin: top left; 
-o-transform-origin: top left; 
-ms-transform-origin: top left; 
transform-origin: top left; 
}



        html,
        body {
            background-color: #E6E6E6;
            height: 100%;
            overflow: hidden
        }

        #wrap {
            height: 100%;
            margin: 1px;
        }

        .header-line {

            border-bottom: 1px solid 0.5px#FAFAFA;
            width: 100%;
            height: 6%;

            background-color: white;
        }

        /* .contents{
    height : 100%;
    border:  1px solid black;
} */

        .contents-line {
            height: 100%;


        }

        .footer-line {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 8%;
            background: white;
            border-top: 1px solid 0.5px #FAFAFA;

        }


        .addrDiv {
            display: inline-block;
            width: 5%;
            height: 25px;
            margin-top: 10px;
            margin-left: 20px;
            font-weight: bold;
            font-size: 16px;
            vertical-align: middle;
            color: gray;

        }

        .proup-name {
            display: inline-block;
            vertical-align: middle;
            margin-top: 5px;
            font-weight: bold;
        }


        a {
            text-decoration: none;

        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
            color: gray;


        }
        .hr1 {
            margin-top: 8px;
            border: 0.9px solid gray;
            width: 250px;
            position: relative;
            left: 10px;
            top: 6px;
        }

        .hr2{
            border: 0.9px solid gray;
            width:383px;
            margin-left:10px;
            margin-bottom:8px;
        }





      .pro_sucess{
         display: inline-block;
            vertical-align: middle;
         margin-top:10px;
         margin-right: 25px;
         float: right;

      }


    .proup-name {
            display: inline-block;
            vertical-align: middle;
            margin-top: 5px;
            font-weight: bold;
        }
      .pro_sucess > span{
         font-weight: bold;
         font-size: 17px;

      }

      .img_up{
         width:99%;
         height: 100px;
            background-color: white;
            border-radius: 8px;
            height: 720px;
            margin: auto;
            margin-top: 3px;



      }

      .img_but{
         width: 100%;
         height: 100px;


      }
        .main-photo{
            border: solid 1px black;
            height: 85px;
            width: 85px;
            margin-left: 10px;
            margin-top:10px;
            display: inline-block;
            vertical-align: middle;
        }
        .fa-camera{
            color:gray;
            font-size: 25px;
            margin-left: 29px;
            margin-top: 20px;
        }

        .photo-number{
            font-weight: bold;
            margin-left: 24px;
        }
        #preview .preview-box:first-child img{
            width: 85px;
            height: 85px;

}
#preview .preview-box img{
  width: 85px;
  height: 85px;
}

.content1{

    display: inline-block;
    vertical-align: middle;
    height: 100px;
    width:270px;
    white-space:nowrap;
    overflow-x: auto;

}
.preview-box {
      display: inline-block;
        vertical-align: middle;
        margin-left:5px;
        margin-top:14px;
      }


.proo_name{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 40px;
    width: 95%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: 15px;
    font-size: 16px;
    font-weight: bold;
    text-indent: 0.3em;

}

.catae_select{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 40px;
    width: 95%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: 15px;
    font-size: 16px;
    font-weight: bold;
    text-indent: 0.3em;
}

.price_pro{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 40px;
    width: 95%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: -15px;
    font-size: 16px;
    font-weight: bold;
    text-indent: 0.3em;
}


.addres{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 40px;
    width: 70%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: 15px;
}

.pick{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 40px;
    width: 70%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: 15px;
}

input::placeholder{
    font-size:16px;
    font-weight: bold;
    position: relative;
    left: 5px;
    top: 2px;
}

textarea::placeholder{
    font-size:16px;
    font-weight: bold;
    position: relative;
    left: 5px;
    top: 5px;
}

.fa-chevron-down{
    position: relative;
    left: 365px;
    bottom: 30px;
    font-size: 20px;
    color: gray;
}

.select-pop{
    width:380px;
    height: 450px;
    border-radius: 5px;
    background-color: #FAFAFA;
    margin-left:10px;
    margin-top: -35px;
    z-index: 3;
    position: relative;
    display: none;

}

.select-pop>div{
    font-size:17px;
    font-weight: bold;
    margin-left: 5px;
    margin-top: 15px;

}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
 .adrs {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484
      ), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
   endColorstr='#848484', GradientType=0);
   background-color: #848484;
   -moz-border-radius: 6px;
   -webkit-border-radius: 6px;
   border-radius: 5px;
   border: 1px solid #dcdcdc;
   display: inline-block;
   cursor: pointer;
   color: #ffffff;
   font-family: Arial;
   font-size: 14px;
   font-weight: bold;
   padding:12px 2px;
   text-decoration: none;
   position: relative;
    top:1px;

}

.adrs:hover {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
      endColorstr='#848484', GradientType=0);
   background-color: #848484;
}

.find {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484
      ), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
   endColorstr='#848484', GradientType=0);
   background-color: #848484;
   -moz-border-radius: 6px;
   -webkit-border-radius: 6px;
   border-radius: 5px;
   border: 1px solid #dcdcdc;
   display: inline-block;
   cursor: pointer;
   color: #ffffff;
   font-family: Arial;
   font-size: 14px;
   font-weight: bold;
   padding:12px 17.5px;
   text-decoration: none;
   position: relative;
    top:1px;

}

.find:hover {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
      endColorstr='#848484', GradientType=0);
   background-color: #848484;
}

.background{
position:fixed;
top:0px;
left:0px;
width:100%;
height:100%;
}

.con{
    background-color: #E6E6E6;
    border: solid 1px gray;
    height: 80px;
    width: 95%;
    margin: auto;
    border-radius: 3px;
    margin-left:10px;
    margin-top: 15px;
    resize: none;
    overflow-x: hidden;
    font-size: 16px;
    font-weight: bold;
    text-indent: 0.3em;

}
.success{
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484
      ), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
   endColorstr='#848484', GradientType=0);
   background-color: #848484;
   -moz-border-radius: 6px;
   -webkit-border-radius: 6px;
   border-radius: 5px;
   border: 1px solid #dcdcdc;
   display: inline-block;
   cursor: pointer;
   color: #ffffff;
   font-family: Arial;
   font-size: 16px;
   font-weight: bold;
   padding:15px 165px;
   text-decoration: none;
    margin-top: 150px;
    margin-left: 5px;

}

.success:hover {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #848484), color-stop(1, #848484));
   background: -moz-linear-gradient(top, #848484 5%, #848484 100%);
   background: -webkit-linear-gradient(top, #848484 5%, #848484 100%);
   background: -o-linear-gradient(top, #848484 5%, #848484 100%);
   background: -ms-linear-gradient(top, #848484 5%, #848484 100%);
   background: linear-gradient(to bottom, #848484 5%, #848484 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#848484',
      endColorstr='#848484', GradientType=0);
   background-color: #848484;
}

    </style>
</head>
<body>
<div id="wrap">
    <div class="background">
        <div class="header-line">
            <div class="addrDiv">
                <a href="#" class="fas fa-arrow-left" onclick="history.back(-1); return false;"></a>
            </div>
            <div class="proup-name">
                <span>
                   상품 등록하기
                </span>
            </div>
           
            <div class="pro_sucess">

            </div>
        </div>
        <div class="contents-line">
            <div class="img_up">
                <div class="img_but">
                    <label for="uploadInputBox">
                        <div class="main-photo" id="attach">
                            <input id="uploadInputBox"style="display:none" class="but" type="file" name="filedata" multiple />
                            <i class="fas fa-camera"></i>
                            <label class="photo-number">0/5</label>
                        </div>
                    </label>
                    <div id="preview" class="content1"></div>
                </div>


                <div class="product_name">

                    <div class="product">
                        <input type="text" class="proo_name" placeholder="상품명 입력">
                    </div>

                    <div >
                        <input type="text" class="catae_select" id="catae" placeholder="카테고리 선택" readonly>  <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="select-pop" id="pop">
                        <div class="man"style="margin-bottom:10px;">남성의류</div>
                        <div class="girl"style="margin-bottom:10px;"><span>여성의류</span></div>
                        <div class="Electronic_products"style="margin-bottom:10px;"><span>전자제품</span></div>
                        <div class="furniture"style="margin-bottom:10px;"><span>가구/인테리어</span></div>
                        <div class="Baby"style="margin-bottom:10px;"><span>유아용품</span></div>
                        <div class="sports"style="margin-bottom:10px;"><span>스포츠/레저</span></div>
                        <div class="game"style="margin-bottom:10px;"><span>게임/취미</span></div>
                        <div class="beauty"style="margin-bottom:10px;"><span>뷰티/미용</span></div>
                        <div class="life"style="margin-bottom:10px;"><span>생활/가공품</span></div>
                        <div class="animal"style="margin-bottom:10px;"><span>반려동물용품</span></div>
                        <div class="book"style="margin-bottom:10px;"><span>도서/티켓/음반</span></div>
                        <div class="stuff"style="margin-bottom:10px;"><span>기타/잡화</span></div>
                    </div>

                    <div>
                        <input type="number" class="price_pro" placeholder="가격입력">
                    </div>


                    <div>
                        <textarea class="con" placeholder="내용입력"></textarea>



                    </div>

                    <div class="sell-addr">
                        <input type="text" id="sample_addr" class="addres" >
                        <input type="button"  class="adrs" id="adrs" value="거래지역 선택">
                    </div>


                    <div>
                        <input type="text" id="pick" name="pick" class="pick">
                        <button class="find">직플선택</button>
                    </div>




                </div>

                <input type="submit" class="success" value="등록완료">
            </div>


            <div id="myModal" class='bPop'>
                <div class="bPop modal-content">
                  <iframe src="http://39.127.7.47:3000/api/daumJuso"id='daumIframe' style='display:none;'></iframe>
                </div>
    
        </div>


        </div>
    </div>
</div>
</div>

</body>


<script>
      //임의의 file object영역
      var files = {};
      var previewIndex = 0;

      // image preview 기능 구현
      // input = file object[]



      function addPreview(input) {
          console.log(input);
          console.log(input[0].files);
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
                        + imgNum
                        + "</div>");
                  files[imgNum] = file;
               };
               reader.readAsDataURL(file);

            }
         } else
            alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
            var n = $( ".preview-box" ).length+1;
             $( ".photo-number" ).text(n+"/5");
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
            || (fileNameExtension === 'gif') || (fileNameExtension === 'png')|| (fileNameExtension === 'hwp'))) {

            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
            return true;
         } else {
            return false;
         }
      }

      $(document).ready(function () {
         //submit 등록. 실제로 submit type은 아니다.
         $('.success').on('click', function () {
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
               url: 'http://39.127.7.47:8080/uploadAjaxAction',
               dataType: 'JSON',
               data: formData,
               success: function (result) {
                  //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                  //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                  //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                  /**if (result === -1) {
                     alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                     // 이후 동작 ...
                  } else if (result === -2) {
                     alert('파일이 10MB를 초과하였습니다.');
                     // 이후 동작 ...
                  } else {
                     alert('이미지 업로드 성공');
                     // 이후 동작 ...
                  }**/
                  if ($('.uploadResult ul li').length > 5) {
                              alert('사진 업로드는 최대 5장까지 가능합니다');
                              location.reload();
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



  </script>

<script>
 $(document).ready(function(){
    $("#catae").click(function(){
        $("#pop").toggle();

    })

 })
  </script>


<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="http://t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script>
        // 우편번호 찾기 화면을 넣을 element
        var element_layer = document.getElementById('layer');

        function closeDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_layer.style.display = 'none';
        }

        function sample2_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
    //                     document.getElementById("sample2_extraAddress").value = extraAddr;

                    } else {
    //                     document.getElementById("sample2_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
    //                 document.getElementById('sample2_postcode').value = data.zonecode;
                       document.getElementById("sample4_jibunAddress").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
    //                document.getElementById("sample2_detailAddress").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_layer.style.display = 'none';
                },
                width : '100%',
                height : '100%',
                maxSuggestItems : 5
            }).embed(element_layer);

            // iframe을 넣은 element를 보이게 한다.
            element_layer.style.display = 'block';

            // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
            initLayerPosition();
        }

        // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
        // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
        // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
        function initLayerPosition(){
            var width = 400; //우편번호서비스가 들어갈 element의 width
            var height = 400; //우편번호서비스가 들어갈 element의 height
            var borderWidth = 5; //샘플에서 사용하는 border의 두께

            // 위에서 선언한 값들을 실제 element에 넣는다.
            element_layer.style.width = width + 'px';
            element_layer.style.height = height + 'px';
            element_layer.style.border = borderWidth + 'px solid';
            // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
            element_layer.style.left = 1+ 'px';
            element_layer.style.top = 360+ 'px';
        }
    </script> -->

<script>
 $(function(){
$(".background").css('height',window.innerHeight);

});
</script>

<script>

$(document).ready(function(){
    $('.man').click(function(){
        $('#catae').val($('.man').text());
        $('#pop').hide();
    });

    $('.girl').click(function(){
        $('#catae').val($('.girl').text());
        $('#pop').hide();
    });

    $('.Electronic_products').click(function(){
        $('#catae').val($('.Electronic_products').text());
        $('#pop').hide();
    });

    $('.furniture').click(function(){
        $('#catae').val($('.furniture').text());
        $('#pop').hide();
    });

    $('.Baby').click(function(){
        $('#catae').val($('.Baby').text());
        $('#pop').hide();
    });

    $('.sports').click(function(){
        $('#catae').val($('.sports').text());
        $('#pop').hide();
    });

    $('.game').click(function(){
        $('#catae').val($('.game').text());
        $('#pop').hide();
    });

    $('.beauty').click(function(){
        $('#catae').val($('.beauty').text());
        $('#pop').hide();
    });

    $('.life').click(function(){
        $('#catae').val($('.life').text());
        $('#pop').hide();
    });

    $('.animal').click(function(){
        $('#catae').val($('.animal').text());
        $('#pop').hide();
    });

    $('.book').click(function(){
        $('#catae').val($('.book').text());
        $('#pop').hide();
    });

    $('.stuff').click(function(){
        $('#catae').val($('.stuff').text());
        $('#pop').hide();
    });
});



</script>



<script>
$(document).ready(function(){
  $('#adrs').click(function(){
    document.getElementById('daumIframe').src += '';
    $('#myModal').bPopup({
      modalClose: true,
      positionStyle:'fixed',
      position: [10, 100]
    },function(){
      $('#daumIframe').css('display','block');
      var setInter = setInterval(function() {
          $.ajax({
              url: 'http://39.127.7.47:3000/api/daumJuso/mobile',
              type : 'get',
              success : function(data){
                if(data){
                    $('#myModal').bPopup().close();    
                    $('#sample_addr').val(data);
                    $('#daumIframe').css('display','none');                 
                      clearInterval(setInter);
                  }else {
                      console.log(data + 'ㅎㅎ 안찍혔지?');
                  }
              }, error : function(err){
                  console.log(err);
              }
          });
      },1000);
    });
  });
});
  </script> 

<script>

/*** 업로드된 이미지 배열과
    입력된 텍스트값들을 서버로 전달한다.
****/

</script>

<script>
/***
대표이미지 선정하기.
이때 대표이미지는 별도의 값으로 지정된다.

***/
</script>



</html>
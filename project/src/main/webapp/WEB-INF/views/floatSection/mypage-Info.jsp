<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<script>
   $(document).ready(function(){
      $('#memberUpdate').click(function(){// memberUpdate 만들어야함
            //input Line 숨김
            $('.su').css("display","inline-block");
            $('.bsu').css("display","inline-block");
            $('.mysu').css("display","inline-block");
            $('.myem').css("display","inline-block");
            $('.myju').css("display","inline-block");
            $('#myba').css("display","inline-block");
            $('.mm').css("display","inline-block");
            // 버튼
            $('#memberUpdate').css("display","none");
            $('#updateComplete').css("display","inline-block");
            // 기존 span 숨김
         /*    $('.sa1').css('display','none'); */
            $('.mynum').css('display','none');
            $('.mycom').css('display', 'none');
            $('.mybname1').css('display', 'none');
            $('.mybanum1').css('display','none');
            $('.nisu').css('display','none');
            //input value 값 올려놓음
         /*    var name = $('.sa1').text();
            console.log(name);
            $('.su').val(name); */
            
            var phone = $('.mynum').text();
            console.log("phone"+phone);
            $('.mysu').val(phone);
            
            var email = $('.mycom').text();
            console.log(email);
            $('.myem').val(email);
            
            //은행
             var acc_name = $('.mybname1').text();
            console.log(acc_name);
            $('#acc_name').text(acc_name);
            
            var acc_num = $('.mybanum1').text();
            console.log(acc_num);
            $('.myju').val(acc_num);
            
            var text = $('.nisu').text();
            console.log(text);
            $('#c').val(text);
      });
      
      $('#updateComplete').click(function(){ // updateComplete 만들어야함
         $('.su').css("display","none");
         $('.bsu').css("display","none");
         $('.mysu').css("display","none");
         $('.myem').css("display","none");
         $('.myju').css("display","none");
         $('#myba').css("display","none");
         $('.mm').css("display","none");
         // 버튼
         $('#memberUpdate').css("display","inline-block");
         $('#updateComplete').css("display","none");
         // 기존 span 숨김
         $('.sa1').css('display','inline-block');
         $('.mynum').css('display','inline-block');
         $('.mycom').css('display', 'inline-block');
         $('.mybname1').css('display', 'inline-block');
         $('.mybanum1').css('display','inline-block');
         $('.nisu').css('display','inline-block');
         
          var query = {
        		   nickname: $('.sa1').text(),
                   phone: $('.mysu').val(),
                   email: $('.myem').val(),
                   acc_name: $('#myba').val(),
                   acc_num: $('.myju').val(),
                   intro: $('#c').val()
                   
           };
          console.log(query);
           $.ajax({
               type: "post",
               url: "myPage",
               data: JSON.stringify(query),
               dataType : 'json',
               contentType : "application/json;charset=UTF-8",
               success: function(data){
            	 /*  console.log(data); */
            	  var a = data;
            	  /* console.log(a.phone);
            	  console.log(a.email);
            	  console.log(a.acc_name);
            	  console.log(a.acc_num);
            	  console.log(a.intro);  */
            	  alert('업데이트');
            	  $('.mynum').text(a.phone);
            	  $('.mycom').text(a.email);
            	  $('.mybname1').text(a.acc_name);
            	  $('.mybanum1').text(a.acc_num);
            	  $('.nisu').text(a.intro);
               },
               error: function(){
                   alert("simpleWithObject err");
               }
           });
      });
   });
</script>

<div class="sell">
   <div class="le">

      <span> <i class="fas fa-user-circle"></i>
      </span> <span class="sa">${member.nickname}</span>
      <div>
         <canvas id="foo" class="foo"></canvas>
      </div>



   </div>
   <div class="ri">
   
      
      
      <div class="mynick">
      <span class="sa1">${member.nickname}</span>
   <!--    <input type="text" class="su"/> -->
      
        </div>



      <div class="tx" id="t">
         <span class="nisu" id="n">${member.intro }</span>
         <div class="mm">
            <textarea class="ct" id="c"></textarea>
            <button class="hi" id="h">확인</button>
         </div>
      </div>

      
      <div class="myphone">
      <span class="myph">휴대폰 번호:</span>
      <span class="mynum">${member.phone}</span>
     <input type="text" class="mysu"/>
      <hr style="border-color:gray;  height:1px;width:850px;  background: gray; ">
      </div>

      
      <div class="myemail">
      <span class="mymail">E-Mail:</span>
      <span class="mycom">${member.email}</span>
      <input type="text" class="myem"/>
      <hr style="border-color:gray;  height:1px;width:850px;  background: gray; ">
      </div>
      
      <div class="mybank">
      <span class="mybname">은행명:</span>
      <span class="mybname1">${member.acc_name}</span>
       <select class="dropdown__select" id="myba" name="myba">
                <option id="acc_name" selected></option>
                <option value="NH농협">NH농협</option>
                <option value="KB국민">KB국민은행</option>
                <option value="신한">신한은행</option>
                <option value="우리">우리은행</option>
                <option value="하나">KEB하나은행</option>
                <option value="IBK기업">IBK기업은행</option>
                <option value="외환">외환은행</option>
                <option value="SC제일">SC제일은행</option>
                <option value="씨티">씨티은행</option>
                <option value="KDB산업">KDB산업은행</option>
                <option value="새마을">새마을금고</option>
                <option value="대구">대구은행</option>
                <option value="광주">광주은행</option>
                <option value="우체국">우체국</option>
                <option value="신협">신협중앙회</option>
                <option value="전북">전북은행</option>
                <option value="경남">경남은행</option>
                <option value="부산">부산은행</option>
                <option value="수협">수협중앙회</option>
                <option value="제주">제주은행</option>
                <option value="저축은행">상호저축은행</option>
                <option value="산림조합">산림조합중앙회</option>
                <option value="케이뱅크">케이뱅크</option>
                <option value="카카오뱅크">카카오뱅크</option>
              </select>
      <span class="mybanum">계좌번호:</span>
      <span class="mybanum1">${member.acc_num}</span>
      <input type="text" class="myju">
      <hr style="border-color:gray;  height:1px;width:850px;  background: gray; ">
      </div>
         <button id="updateComplete">수정완료</button>
        <button id="memberUpdate">수정하기</button>
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
   <hr style="border-color:gray;  height:1px; background: gray; ">
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
      <hr style="border-color:gray;  height:1px; background: gray; ">
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
      <hr style="border-color:gray;  height:1px;  background: gray; ">
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
   <hr style="border-color:gray;  height:1px; background: gray; ">


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
<script src="/resources/customJs/mypage-info.js"></script>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
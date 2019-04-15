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


<div class="sell">
   <div class="le">

      <span> <i class="fas fa-user-circle"></i>
      </span> <span class="sa">${other.nickname }</span>
      <div>
         <canvas id="foo" class="foo"></canvas>
      </div>



   </div>
   <div class="ri">
   
      
      
      <div class="mynick">
      <span class="sa1">${other.nickname }</span>
   <!--    <input type="text" class="su"/> -->
      
        </div>



      <div class="tx" id="t">
         <span class="nisu" id="n">${other.intro }</span>
         // 여기도 화면처리 필요
         <div class="mm">
            <textarea class="ct" id="c"></textarea>
            <button class="hi" id="h">확인</button>
         </div>
      </div>
    
      <div class="myemail">
      <span class="mymail">E-Mail:</span>
      <span class="mycom">${other.email}</span>
      <input type="text" class="myem"/>
      <hr style="border-color:gray;  height:1px;width:850px;  background: gray; ">
      </div>
      
      </div>
   </div>
</div>
<div class="contentsDiv">
	view 처리 필요
</div>
<script src="/resources/customJs/mypage-info.js"></script>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
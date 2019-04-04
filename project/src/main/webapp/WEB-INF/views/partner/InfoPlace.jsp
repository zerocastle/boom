<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">  
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
   body, html{
       padding: 0;
       margin: 0;
      background-color: #D8D8D8;
   }
 
   
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;

}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
  position: relative;
 
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}


.img1{
    width: 550px;
    height: 300px;
}


.img2{
    width: 550px;
    height: 300px;
}


.img3{
    width: 550px;
    height: 300px;
}
   
.dot1{
position: relative;
left: 235px;
bottom: 45px;
}
   

.bom{
  font-size:25px; 
   font-weight:bold; 
  color:#777;
position: relative;
bottom: 30px;
left: 218px;

}  

.dong{
  font-size:12px; 
   font-weight:bold; 
  color:#777;
  position: relative;
  bottom: 25px;
  left: 232px; 
}

hr{
  width: 520px;
  position: relative;
  bottom: 15px;
}


.pho{
display: inline-block;
width: 170px;
height: 100px;
vertical-align: middle;
}



.come{
  display: inline-block;
  width: 170px;
  height: 100px;
vertical-align: middle;
}



.heart{
  display: inline-block;
  width: 170px;
  height: 100px;
  vertical-align: middle;
}


.fa-phone{
position: relative;
font-size: 35px;
color:#BDBDBD;
left: 70px;
bottom: 10px;
}


.fa-comment{
  position: relative;
  font-size: 35px;
  color: #BDBDBD;
  left: 75px;
  bottom: 12px;
}

.fa-heart{
  position: relative;
  font-size: 35px;
  color: #BDBDBD;
  left: 80px;
  bottom: 12px;
 
}


.pname{
  font-size:20px; 
   font-weight:bold; 
  color:gray;
  position: relative;
  top: 25px;
  left: 6px;
}


.cname{
  font-size:20px; 
   font-weight:bold; 
  color:gray;
  position: relative;
  top: 25px;
  left: 12px;
}


.hname{
  font-size:20px; 
   font-weight:bold; 
  color:gray;
  position: relative;
  top: 25px;
  left: 37px;
}


.intro{
 
  height: 120px;
  /* border: solid 1px black; */
  margin-left: 14px;
  position: relative;
  bottom: 25px;
  display: inline-block;
  vertical-align: middle;
}


.tit{
  font-size:20px; 
  font-weight:bold; 
  position: relative;
   top: 40px; 
}

.top{
  background-color: white;
  height: 500px;
}


.bottom{
  background-color: white;
  height: 500px;
  margin-top: 15px;
}

.ccoo{
  width: 450px;
  height: 120px;
  
     display: inline-block;
  vertical-align: middle;
  position: relative;
 top: 16px;
  left: 10px;
}

.map{
  margin-top: 20px;
  height: 250px;
     
}




    </style>

</head>
<body>
      <div class="top">
        <div class="slideshow-container">
                <div class="mySlides fade">
                 
                      <img class="img1" src="/resources/image/봄봄1.jpg" >
             
                    </div>

                    <div class="mySlides fade">
                    
                      <img class="img2" src="/resources/image/봄봄2.jpg">

                    </div>
                    
                    <div class="mySlides fade">
                     
                      <img class="img3" src="/resources/image/봄봄3.jpg">
                      
                    </div>
                    </div>
                    <br>
                    
                    <div class="dot1">
                      <span class="dot"></span> 
                      <span class="dot"></span> 
                      <span class="dot"></span> 
                    </div>                 
                <div>
              <span class="bom">카페봄봄</span><br>
              <sapn class="dong">복현동,카페</sapn>
                </div>
              <hr>

                  <div class="pho">
                  <i class="fas fa-phone"></i>
                    <span class="pname">전화하기</span>
                  </div>



                  <div class="come">
                  <i class="fas fa-comment"></i>
                  <span class="cname">문의하기</span>
                  </div>


                    <div class="heart">
                    <i class="fas fa-heart"></i>
                    <span class="hname">관심</span>
                    </div>
                  </div>
                    
                  
                  <div class="bottom">

                  <div class="intro">
                    <span class="tit">소개</span>
                    </div>

                    <div class="ccoo">
                    <span>Take-Out 전문 브랜드 Café 봄봄
                        Cahe 봄봄은 take-out 전문 카페로 출발하였습니다.
                      대학가에서 차별화 된 메뉴와 운영시스템으로 많은 학생들의 사랑을 받았습니다.
                      take-out시장이 커지면서 café 봄봄은 대학가를 넘어 중심가 주택가 곳곳에서 한층더 성장했습니다.
                    </span>
                    </div>  

                    <div class="map">
                        <div id="staticMap" style="width:100%;height:240px;"></div>
                       <script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=571aae4fec40d0283f32c39801431185&libraries=services"></script>
                        <script>
                        var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
                        staticMapOption = { 
                            center: new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
                            level: 3 // 이미지 지도의 확대 레벨
                        };

                    // 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
                    var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
                        </script>
                    </div>

                      














                  </div>




</body>


<script>
        var slideIndex = 0;
        showSlides();
        
        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
               slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
        </script>
        
</html>
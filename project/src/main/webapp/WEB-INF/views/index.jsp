<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>


    
    <!-- bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean');

        body {
            font-family: 'Noto Sans KR', sans-serif, "맑은 고딕";
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* 레이아웃 */
        #wrap {
            width: 100%;
            /* height: auto; */
            /* margin: auto; */

        }

        .header-line{
            border-bottom: 1px solid black; 
            width: 100%;
            /* position: fixed; */
        }

        .header {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */

            width: 1242px;
            margin: auto;
            height: auto;
            border: 1px solid #bcbcbc;
        }

        .header-1 {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */
            /* width: 1242px; 밑에 구분하기위해 실제로는 1242 */
            width: 1238px;
            margin: 1px;
            height: 40px;
            border: 1px solid #bcbcbc;
        }

        .header-2 {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */
            /* width: 1242px; 밑에 구분하기위해 실제로는 1242 */
            position: fixed;
            width: 1242px;
            margin: auto;
            height: 170px;
            border: 1px solid #bcbcbc;
            background-color: white;
        }

        .main {
            width: 1242px;
            margin: auto;
            margin-top: 100px;
            height: auto;
            border: 1px solid #bcbcbc;
        }

        .banner {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */
            /* width: 1242px; 밑에 구분하기위해 실제로는 1242 */
            width: 1238px;
            margin: auto;
            margin-top: 100px;
            height: 300px;
            border: 1px solid #bcbcbc;
        }

        .main-categori {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */
            /* width: 1242px; 밑에 구분하기위해 실제로는 1242 */
            width: 1238px;
            margin: 1px;
            margin-top: 30px;
            height: 50px;
            border: 1px solid #bcbcbc;
        }

        .main-product {
            /* 기존 쇼핑몰 해상도 1242px 2208px 9 : 16 */
            /* width: 1242px; 밑에 구분하기위해 실제로는 1242 */
            width: 1238px;
            margin: 1px;
            height: 300px;
            border: 1px solid #bcbcbc;
        }

        .footer {
            width: 1242px;
            margin: auto;
            margin-top: 10px;
            height: 80px;
            border: 1px solid #bcbcbc;
            background-color: black;
        }

        /* header */
        .header-1-div {
            position: relative;
            float: right;
            display: table;
            height: 100%;
        }

        .header-1-a {
            position: relative;
            padding: 0 15px;
            display: table-cell;
            vertical-align: middle;
            height: 100%;
            line-height: 18px;
        }

        .header-2-body {
            height: 120px;
            padding-top: 22px;
            border: 1px solid #bcbcbc;
        }

        .header-logo {
            float: left;
            display: inline-block;
            width: 220px;
            margin-left: 15px;
            margin-right: 80px;
            height: 64px;
            /* border: 1px solid black; */
        }

        .logo {
            /* background-image: url("logo.png"); */
            /* width: 195px;
            height: 58px; */
        }

        .header-search {
            width: 500px;
            height: 64px;
            margin-right: 30px;
            display: inline-block;
            /* border: 1px solid black; */
        }

        .header-service {
            padding-left: 10px;
            display: inline;
            /* border: 1px solid black; */
        }

        .header-2-body-2 {
            height: 50px;
            padding-top: 1px;
            border: 1px solid #bcbcbc;
        }

        .header-categori {
            float: left;
            display: inline-block;
            width: 55px;
            margin-left: 15px;
            margin-right: 30px;
            height: 45px;
            /* border: 1px solid black; */
        }

        .header-zicplus-btn {
            width: auto;
            height: 45px;
            display: inline-block;

        }

        .zicplus-btn {
            display: inline-block;
            margin: auto;
            margin-right: 15px;
            vertical-align: -10px;
           
            /* border: 1px solid black; */
        }

        .service-btn {
            display: inline-block;
        }

        /* product */
        .main-product-div {
            margin: 20px;
            width: 1195px;
            height: 240px;
            border: 1px solid #bcbcbc;
        }

        .main-product-div2 {
            display: inline-block;
            margin: 10px;
            margin-left: 17.5px;
            margin-right: 17.5px;
            width: 200px;
            height: 220px;
            border: 1px solid #bcbcbc;
        }

        .input-group.md-form.form-sm.form-1 input {
            border: 1px solid #bdbdbd;
            border-top-right-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .input-group.md-form.form-sm.form-2 input {
            border: 1px solid #bdbdbd;
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }

        .input-group.md-form.form-sm.form-2 input.red-border {
            border: 1px solid #ef9a9a;
        }

        .input-group.md-form.form-sm.form-2 input.lime-border {
            border: 1px solid #cddc39;
        }

        .input-group.md-form.form-sm.form-2 input.amber-border {
            border: 1px solid #ffca28;
        }






        /* menu */
    </style>


    <script>
        $(function () {
            //마지막 스크롤 값을 저장할 lastScroll 변수
            var lastScroll = 0;
            $(window).scroll(function (event) { //스크롤이 움직일때 마다 이벤트 실행
                //현재 스크롤의 위치를 저장할 st 변수
                var st = $(this).scrollTop();
                //스크롤 상하에 따른 반응 정의
                if (st > lastScroll) {
                    if ($(window).scrollTop() >= 10) { //스크롤이 아래로 200px 이상 내려갔을때 실행되는 이벤트 정의
                        $('#btnTop').css('display', 'none');
                        $('#btnTop').css('top', '-30px');
                    }
                } else {
                    //스크롤이 위로 올라갔을때 실행되는 이벤트 정의
                    $('#btnTop').css('display', 'block');
                }
            });
        });
    </script>


</head>

<body>
    <div id="wrap">
                     <!--d-->
                     <div class="header-line">
        <div class="header">
            <div id="btnTop" class="header-1">
                <div class="header-1-div">
                    <a class="header-1-a" href="#">로그인</a>
                    <a class="header-1-a" href="#">회원가입</a>
                </div>
            </div>
            
            <div class="header-2">
                <div class="header-2-body">
                    <div class="header-logo">
                        <div>
                            <a class="logo" href="#"><img src="logo2.png" width="220px;" height="80px;"></a>
                        </div>
                    </div>

                    <div class="header-search" style="padding-top: 15px;">
                        <div class="input-group md-form form-sm form-2 pl-0">
                            <input class="form-control my-0 py-1 red-border" type="text" placeholder="상품명 , 지역명 입력"
                                aria-label="Search">
                            <div class="input-group-append">
                                <span class="input-group-text red lighten-3" id="basic-text1">
                                    <i class="fas fa-search text-grey" aria-hidden="true"><img src="search.png"
                                            width="15px" height="15px"></i></span>
                            </div>
                        </div>
                    </div>
                
                    <div class="header-service">
                        <div class="service-btn">
                            <a href="#" style="font-size: 18px; margin-right: 10px;"><img src="mypage.png"
                                    style="margin-right: 5px;">마이페이지</a>
                        </div>
                        <div class="service-btn">
                            <a href="#" style="font-size: 18px; margin-right: 10px;"><img src="sell.png"
                                    style="margin-right: 5px;">판매하기</a>
                        </div>
                        <div class="service-btn">
                            <a href="#" style="font-size: 18px; margin-right: 10px;"><img src="chat.png"
                                    style="margin-right: 5px;">채팅목록</a>
                        </div>
                    </div>
                </div>
                <div class="header-2-body-2">
                    <div class="header-categori">
                        <div class="navbar navbar-toggleable-md navbar-light bg-faded" style="padding: 0;">
                            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                              <span class="navbar-toggler-icon"></span>
                            </button>
                            
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup" style="background-color: white; width: px;"> 
                              <div class="navbar-nav" style="width: 200px;">
                                <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                                <a class="nav-item nav-link" href="#">남성의류</a>
                                <a class="nav-item nav-link" href="#">여성의류</a>
                                <a class="nav-item nav-link" href="#">전자제품</a>
                                <a class="nav-item nav-link" href="#">가구/인테리어</a>
                                <a class="nav-item nav-link" href="#">유아용품</a>
                                <a class="nav-item nav-link" href="#">스포츠/레저</a>
                                <a class="nav-item nav-link" href="#">게임/취미</a>
                                <a class="nav-item nav-link" href="#">뷰티/미용</a>
                                <a class="nav-item nav-link" href="#">생활/가공품</a>
                                <a class="nav-item nav-link" href="#">반려동물용품</a>
                                <a class="nav-item nav-link" href="#">도서/티켓/음반</a>
                                <a class="nav-item nav-link" href="#">기타/잡화</a>
                              </div>
                            </div>
                        </div>
                    </div>

                    <div class="header-zicplus-btn">
                        <div class="zicplus-btn">
                            <a href="#">함께하는 직플파트너</a>
                        </div>
                        <div class="zicplus-btn">
                            <a href="#">직플파트너 등록하기</a>
                        </div>
                        <div class="zicplus-btn">
                            <a href="#">직플레이스 검색</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="main">
            <div class="banner">
                <!-- <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active" data-interval="10000">
                        <img src="290282777.jpg" class="d-block w-100" alt="" height="300px">
                      </div>
                      <div class="carousel-item" data-interval="2000">
                        <img src="306843239.png" class="d-block w-100" alt="..." height="300px">
                      </div>
                      <div class="carousel-item">
                        <img src="309885615.jpg" class="d-block w-100" alt="..." height="300px">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div> -->
                  <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div>
                        <img src="290282777.jpg" class="d-block w-100" alt="" height="300px">
                      </div>
                      <div class="carousel-item" data-interval="2000">
                        <img src="306843239.png" class="d-block w-100" alt="..." height="300px">
                      </div>
                      <div class="carousel-item">
                        <img src="309885615.jpg" class="d-block w-100" alt="..." height="300px">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
            </div>
            <div class="main-categori" style="background: yellowgreen;">

            </div>
            <div class="main-product">
                상품1
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품2
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품3
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품4
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품5
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품6
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품7
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
            <div class="main-product">
                상품8
                <div class="main-product-div">
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                    <div class="main-product-div2">

                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <p style="text-align: center; color: white"> footer </p>
        </div>
    </div>

</body>

</html>
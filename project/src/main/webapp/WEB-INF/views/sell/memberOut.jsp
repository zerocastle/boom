<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<style>
  @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean');

  body {
      font-family: 'Noto Sans KR', sans-serif, "맑은 고딕";
    }


    *{
        margin:  0;
        padding:  0;
    }
    .exit-wrap{
        width: 100%;
       
    }
    .exit-line{
        margin: auto;
        height: auto;
        width: 1242px;
        
    }
    .exit-header{
        margin-top: 150px;
        margin-left: 25%;
        width: 50%;
        height: 175px;
        border: 1px solid black;
    }
    .exit-contents{
        height: 200px;
        border: 1px solid black;
        font-size: 28px;
    }

    .optionList{
        font-size: 14px;
    }
</style>

<script>
$(function() {
	$('#home').click(function(e){
		e.preventDefault();
		window.location.href = "/";
	});

});
</script>

</head>

<body>
    <div class="exit-wrap">
        <div class="exit-line">
            <div class="exit-header">
                <a id="home" href="#">로고</a>
            </div>
            <div class="exit-contents">
                <div style="margin-top: 100px;">
                    <p>서비스에 만족을 드리지 못해 대단히 죄송합니다.<br>
                    보다 좋은 서비스로 다음에 다시 뵐수 있도록 최선을 다하겠습니다.</p>
                </div>
            </div>
            <div class="exit-contents">
                <div>
                    <select class="form-control select2" style="height: 65px; font-size: 24px;">
                            <option class="optionList">찾는물품이없다.</option> 
                            <option class="optionList">질문2</option> 
                            <option class="optionList">질문3</option> 
                            <option class="optionList">질문4</option> 
                            <option class="optionList">질문5</option> 
                            <option class="optionList">질문6 ... </option> 
                    </select>
                </div>

                <div style="margin-top: 30px;">

                        <button type="button" class="btn btn-danger" style="width: 100%; height: 50px;">탈퇴</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
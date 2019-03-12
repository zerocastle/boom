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
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
img {
    padding : 15px;
}
.bigdiv {
    border-top: 2px solid gray;
    border-bottom: 2px solid gray;
}
#prof {
    margin-top : 5%;
}
#prof_img {
    display: block;
    text-align: center;
    margin: 0 auto;
}
#prof_textbox{
    
    background-color: wheat;
}
http://localhost/hello/ag/img/moongirl.png
#prof_textbox{
    height: 70%;
}

#prof_textbox_top{
    margin-left:15px;
}

#prof_textbox_bot{
    margin-top:90px;
    margin-left:15px;
}

.jbtn{
    width:100%;
}

#prof_textbox_btn {
	margin-bottom : 25px;
}

#mypage_tap {
    margin-top : 15px;
}
</style>
<body>
    <div id="prof" class="container ">
        <div class="row">
            <div id="prof_img" class="col-sm-4 bigdiv">
                <img id="prof_img" src="img/profile.png" alt="이미지못읽었어">
                <p id="prof_name_label">img이름</p>
            </div>
            <div id="prof_content" class="col-sm bigdiv" >
                
                <div id="prof_name_input">
                    <p id="prof_name_p">btn이름<button type="button" class="btn btn-info btn-xs" id="prof_name_btn">상점명 수정</button></p>
                    <!-- 버튼클릭시 $("#prof_name_input").html() 값을 <input type="text" id="rename"> 으로 변경한다.
                      -->
                </div>

                <div id="prof_textbox">
                    <div id="prof_textbox_top">
                        소개글
                    </div>
                    <div id="prof_textbox_bot">
                            <button type="button" class="btn btn-info btn-xs" id="prof_textbox_btn">소개글 수정</button>    
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
$(document).ready(function(){
	
	
	$(".tap-btn").click(function(event){
		var ll = $(event.target);
		alert(ll.val());
		
		
		
	});
	
	
});



</script>
    <div id="mypage_tap" class="container bigdiv">
            <div class="jbtn btn-group mr-2" role="group" >
                    <input onclick="location.href='/web/1tap';" type="button" value="상품" type="button" class="tap-btn btn btn-secondary" />
                    <input onclick="location.href='/web/2tap';" type="button" value="상점문의" type="button" class="tap-btn btn btn-dark"/>
                    <input onclick="location.href='/web/3tap';" type="button" value="찜" class="tap-btn btn btn-secondary"/>
                    <input onclick="location.href='/web/4tap';" type="button" value="상점후기" class="tap-btn btn btn-dark"/>
                    <input onclick="location.href='/web/5tap';" type="button" value="직플정보" class="tap-btn btn btn-secondary"/>
            </div>
        <div id="incl-jack">
        <c:set var="tappage" value="my1.jsp" />
        <jsp:include page="${tappage}" flush="false"/>
        </div>
        
    </div>

</body>
</html>
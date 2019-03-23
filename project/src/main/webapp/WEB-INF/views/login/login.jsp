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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "맑은 고딕";
	font-size: 0.75em;
	color: #333;
}

h2 {
	margin-top: 10px;
}

#login-form {
	width: 400px;
	margin: 100px auto;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 30px;
	padding-top: 5px;
}

/* #login-form input, #login-form label{
    display : block;
} */

/* #login-form label {
    margin-top : 10px;
} */
#login-form input {
	padding: 15px;
	width: 80%;
	margin: 0 auto;
}

#login-btn, #join-btn {
	border: 1px solid #000000;
	padding: 15px;
	width: 80%;
	margin: auto;
}
</style>
<script>
	$(document).ready(
			function() {

				$("form").submit(function(e) {
					return false;
				});
				$('#login-btn').click(function(e) {
					/* e.preventDefault(); */
					var query = JSON.stringify({
						nickname : $('#nickname').val(),
						m_password : $('#m_password').val()
					});
					$.ajax({
						type : 'POST',
						url : "login",
						data : query,
						dataType : 'json',
						contentType : "application/json;charset=UTF-8",
						success : function(data) {
							console.log(data);
							if (data.error != "fail") {
								alert(data.nickname + "님 환영 합니다.");

								opener.location.reload(); // opener 새로고침 
								window.close();
							} else
								alert("로그인 실패");
						}
					})
				})
				$('#join-btn').click(
						function() {
							window.close();
							window.open('memberRegister', 'register',
									'width=1920,height=1080');
						})
			})
</script>
</head>
<body>

	<form id="login-form" align="center" onsubmit="return false;">
		<div class="loginform">
			<h2 align="center">로그인</h2>
			<div class="phono">
				<input id="nickname" name="nickname" type="text" placeholder="닉네임"
					required><br>
			</div>
			<br />
			<div class="paswd">
				<input id="m_password" name="m_password" type="password"
					placeholder="비밀번호" required><br>
			</div>
			<br />
			<div class="save" align="center">
				<input type="checkbox" id="phone" style="width: 15px;"> <label
					for="phone">휴대폰번호 저장</label> <input type="checkbox" id="keep"
					style="width: 15px;"> <label for="keep">로그인상태 유지</label>
			</div>
			<br />
			<button id="login-btn" type="submit" value="login">로그인</button>
		</div>

		<label for="no user">아직 회원이 아니신가요??</label></br>
		<button id="join-btn" type="submit" value="join">회원가입</button>
	</form>

</body>
</html>
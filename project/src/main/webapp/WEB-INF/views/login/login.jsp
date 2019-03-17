<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/WebContent/WEB-INF/style.css">
<meta charset="UTF-8">
<title>Log in</title>
</head>
<body>
	<h1 align = "center">로그인</h1>
	<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">휴대폰 번호</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="휴대폰 번호(숫자만 허용)">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="비밀번호">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> 휴대폰번호 저장
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> 로그인상태 유지
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default" id = "loginbutton">로그인</button>
    </div>
  </div>
</form>

<form class="form-horizontal">
<h4 align = "center">아직 회원이 아니신가요?</h4>
<div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default" id = "joinbutton">회원가입</button>
    </div>
</form>

</body>
</html>
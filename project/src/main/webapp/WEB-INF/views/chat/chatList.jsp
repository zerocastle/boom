<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../shareContent/basic.jsp"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="UTF-8">
<title>Document</title>
</head>
<body>
<script>
$(document).ready(function() {
   var nickname = '${sessionScope.loginSession.nickname}';
<<<<<<< Updated upstream
   window.location.href="http://39.127.7.51:3000/jackchat?nickname=" +nickname; 
=======
   window.location.href="http://15.164.188.135:3000/jackchat?nickname=" +nickname; 
>>>>>>> Stashed changes
});
</script>

</body>
</html>





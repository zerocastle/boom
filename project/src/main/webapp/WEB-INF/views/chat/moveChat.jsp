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
	var pro_num = ${requestScope.pro_num};
	var m_num = ${requestScope.m_num};
	window.location.href="http://39.127.7.47:3000/doChat2?m_num="+m_num+"&pro_num="+pro_num;
});
</script>
</body>
</html>






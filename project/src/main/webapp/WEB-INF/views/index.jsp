<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
		var msg = '${requestScope.msg}'
		if (msg == 'SUCCESS') {
			alert("회원 가입을 성공적으로 하였습니다.");
		}
		if (msg =='SUCCESSPARTNER'){
			alert("직플레이드 등록이 완료되었습니다.");
			window.close();
		}
		
</script>

		<%@include file="fixsection/header.jsp"%>

		<%@include file="floatSection/production.jsp"%>

		<%@include file="fixsection/footer.jsp"%>

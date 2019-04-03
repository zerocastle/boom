<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<%@include file="fixsection/header.jsp"%>

		<%@include file="floatSection/production.jsp"%>

		<%@include file="fixsection/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
		var msg = '${requestScope.msg}';
		var	loginDO = '${requestScope.loginDo}';
		if (msg == 'SUCCESS') {
			alert("회원 가입을 성공적으로 하였습니다.");
			self.close();
		}
		if (msg =='SUCCESSPARTNER'){
			alert("직플레이드 등록이 완료되었습니다.");
			history.replaceState({}, null, null);
			window.close();
		}
		if(loginDO == '1'){
			alert("잘못된 접근 입니다. 로그인부터 하세요");
		}
		
</script>

		<%@include file="fixsection/header.jsp"%>

		<%@include file="floatSection/production.jsp"%>

		<%@include file="fixsection/footer.jsp"%>

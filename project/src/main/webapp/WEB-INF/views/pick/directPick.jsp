<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직플 선택하기</title>
</head>
<body class="wrap">

	<ul class="partner">
		<c:forEach items="${partnerList}" var="list">
			<li><span><c:out value="${list.company_number}" /> </span> <span><c:out
						value="${list.part_name}" /> </span> <span><c:out
						value="${list.boss_name}" /> </span> <span><c:out
						value="${list.part_phone}" /> </span> <span><c:out
						value="${list.zip_code}" /> </span> <span><c:out
						value="${list.road_name}" /> </span> <span><c:out
						value="${list.addr}" /> </span> <span><c:out
						value="${list.detail_addr}" /> </span> <span><c:out
						value="${list.reg_date}" /> </span></li>
		</c:forEach>
	</ul>

</body>
</html>
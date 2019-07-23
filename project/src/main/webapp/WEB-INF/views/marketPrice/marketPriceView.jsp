<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maerketPrice측정</title>
</head>
<body>
	<!-- <div style="display:none;"> -->
	<div>
		<table id="marketPrice" border="1">
			<!-- <tr>
				<th>상품명</th>
				<th>가격</th>
				<th>날짜</th>
			</tr> -->
			<c:forEach var="var" items="${ marketPriceView}">
				<tr>
					<td>${var.title }</td>
					<td>${var.price }</td>
					<td>${var.create_date }</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>
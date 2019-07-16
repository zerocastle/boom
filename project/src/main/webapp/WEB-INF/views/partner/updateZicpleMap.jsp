<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../floatSection/updateZicpleMap2.jsp" %>

<script>
	$(document).ready(function(){
/**		$(document).on('click', '.selectPlace', function(e){
			
			var data = $(e.target).val();
			console.log(data);
			$.ajax({
				url : '/updatePlacePick',
				data : data,
				type : 'post',
				success : function(result){
					console.log('히히 성공');
					console.log(result);
				},
				error : function (err){
					console.log('히히 실패');
					console.log(err);
				}
			})
			
		})
		*/
		
	});
</script>
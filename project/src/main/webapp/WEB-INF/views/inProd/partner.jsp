<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" href="/resources/css/partner.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/productList.css" />
 <link rel="stylesheet" type="text/css"
	href="/resources/css/mypage-info.css">
<style>
.page-link {
	display: inline-block;
	color: #ffffff;
	background-color: #606ddd;
}
</style>


<script>
$(document).ready(function(){
	
	var data = $('#nick').text();
	console.log(data);

	$('#profileLink').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myPage/"+ data;
	});

	$('#myProduct').click(function(e){
		e.preventDefault();
		window.location.href = "/member/myProduct/" +$('#nick').text();
	});

	$('#pick').click(function(e){
		e.preventDefault();
		window.location.href = "/member/pickInfo/"+$('#nick').text();
	});
	
	$('#review').click(function(e){
		e.preventDefault();
		window.location.href = "/member/review/"+$('#nick').text();
	});
	
	$('#buyList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/purchaseList/" + $('#nick').text();
	});
	
	$('#sellList').click(function(e){
		e.preventDefault();
		window.location.href = "/member/sellList/" + $('#nick').text();
	});
	
	$('#inProd').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd/" + $('#nick').text();
	});
	$('#inProd2').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd2/" + $('#nick').text();
	});
	
	// 매너 게이지
	var manner = ${member.manner};
	   function startFoo(){
	      var opts = {
	              angle: 0.15, // The span of the gauge arc
	              lineWidth: 0.44, // The line thickness
	              radiusScale: 1, // Relative radius
	              pointer: {
	                length: 0.51, // // Relative to gauge radius
	                strokeWidth: 0.077, // The thickness
	                color: '#000000' // Fill color
	              },
	              limitMax: false,     // If false, max value increases automatically if value > maxValue
	              limitMin: false,     // If true, the min value of the gauge will be fixed
	              colorStart: '#f70000',   // Colors
	              colorStop: '#f70000',    // just experiment with them
	              strokeColor: '#E0E0E0',  // to see which ones work best for you
	              generateGradient: true,
	              highDpiSupport: true,     // High resolution support
	              
	            };
	            var target = document.getElementById('foo'); // your canvas element
	            var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
	            gauge.maxValue = 100; // set max gauge value
	            gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
	            gauge.animationSpeed = 49; // set animation speed (32 is default value)
	            gauge.set(manner); // set actual value
	   }
	   
	   startFoo();
});

function fn_movePage(val) {
	jQuery("input[name=pageNo]").val(val);
	jQuery("form[name=frm]").attr("method", "post");
	jQuery("form[name=frm]").attr("action", "").submit();
}
$('#partname').click(function(){
	e.preventDefault();
	window.location.href = "/member/partname";
});
$("#imgInp").change(function() {
	readURL(this); // 변화될떄 현제 url 정보를 들고옴  
	console.log(this);
});


</script>
<script>
$(document).ready(function(){
	$('#inProd').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd/" + $('#nick').text();
	});
	
	$('#placeList').change(function(){
		$('tbody').empty();
		$.ajax({
			type : 'get',
			url : 'inProdList/' + $('#placeList').val(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: 'text',
			success : function(data) {
				var json = JSON.parse(data);
				console.log(json);
				
				for(var  i = 0 ; i < json.length; i++){
					
					
					var str = '<tr class="inProducts_tr">'+
								'<td class="text-right"><img src="/resources/'+json[i].UPLOADPATH+'/'+json[i].UUID+'_'+json[i].FILENAME+'" width="100" height="100" alt="User" class="rounded-circle mb-3"></td>'+
								'<td>'+json[i].MERCHANT_UID+'</td>'+
								'<td>'+json[i].TITLE+'</td>'+
								'<td>'+json[i].CATE_CODE+'</td>'+
								'<td>'+json[i].QUALITY+'</td>'+
								'<td>'+json[i].SELLER_NAME+'</td>'+
								'<td>'+json[i].BUYER_NAME+'</td>'+
								'<td>'+json[i].PRICE+'</td>'+
							   '</tr>';
								
					$('tbody').append(str);
					var str = '';
					/*
					<tr class="inProducts_tr">
                      <th scope="row"><span class="badge badge-warning rounded"></span></th>
                      <td class="text-right"><img src="${pageContext.request.contextPath}/resources/${items.uploadPath }/${items.uuid }_${items.fileName }" width="100" height="100" alt="User"
						class="rounded-circle mb-3"></td>
                      <td>${items.merchant_uid }</td>
                      <td>${items.title }</td>
                      <td>${items.buyer_name }</td>
                      <td>${items.seller_name }</td>
                      <td>${items.price }</td>
                      <td class="text-right"></td>
                    </tr>
					*/
				}
			},
			error : function(err) {
				alert("Error" + err);
				console.log(err);
			}
		});
	});
	$("#uptbtn").click(function(){
		var part_name = $("#part_name").val();
		var company_number = $("#company_number").val();
		var boss_name = $("#boss_name").val();
		var part_phone = $("#part_phone").val();
		var zip_code = $("#zip_code").val();
		var addr = $("#addr").val();
		var road_name = $("#road_name").val();
		var detail_addr = $("#detail_addr").val();
		var query = JSON.stringify({part_name : part_name, company_number : company_number, boss_name : boss_name, 
				part_phone : part_phone, zip_code : zip_code, addr : addr, road_name : road_name, detail_addr : detail_addr});
		console.log(query);
		 $.ajax({
			type : 'POST',
            url : "update",
            data : query,
            dataType : 'json',
            contentType : "application/json;charset=UTF-8",
            success : function(data){            	            	
            	window.location.href = '/member/inProd2/'+$("#nickname").val();
            }
		});  
	});
});
//$(document).ready(function(){
//$('#uptbtn').click(function(){
//	window.location.href="/member/update/"	
//});
//});
</script>

 <script>
$(document).ready(function(){
	$('#inProd').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd/" + $('#nick').text();
	});
});
</script>

<script>
$(document).ready(function(){
	$('#inProd2').click(function(e){
		e.preventDefault();
		window.location.href = "/member/inProd2/" + $('#nick').text();
	});
});
</script>
 
 <input type="hidden" id="nickname" value = "${sessionScope.loginSession.nickname}">
<!-- Main Content -->
<div class="container my-3">
	<div class="row">

		<div class="col-md-4 col-lg-3">
			<div class="card">
				<div class="card-body text-center">
					<img src="${pageContext.request.contextPath}/resources/${member.uploadPath }/${member.uuid }_${member.fileName }" width="100" height="100" alt="User"
						class="rounded-circle mb-3">
					<h5 id="nick" class="bold mb-0">${member.nickname }</h5>
					<small class="counter">${member.email }</small>
					<hr>
					<div class="roboto-condensed bold" data-toggle="tooltip"
						title="매너 점수는 ${member.manner }입니다.
						평가 총인원은  ${member.manner_pick}명입니다.">
						<canvas id="foo" class="foo"></canvas>
					</div>
				</div>
				<div class="list-group list-group-flush">
					<a href="#" id="profileLink"
						class="list-group-item list-group-item-action"><i
						data-feather="user" class="mr-3"></i>프로필</a> <a
						href="#" id="myProduct"
						class="list-group-item has-badge list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>내 상품<span
						class="badge rounded badge-primary">${proCount }</span></a> <a
						href="#" id="pick"
						class="list-group-item has-badge list-group-item-action"> <i
						data-feather="heart" class="mr-3"></i>찜목록<span
						class="badge rounded badge-primary">${like }</span></a> <a href="#"
						id="review"
						class="list-group-item has-badge list-group-item-action">
						<i data-feather="edit-3" class="mr-3"></i>리뷰<span
						class="badge rounded badge-primary">${pv }</span>
					</a> <a href="#" id="buyList" class="list-group-item list-group-item-action"> <i
						data-feather="shopping-bag" class="mr-3"></i>구매내역
					</a> <a href="#" id="sellList" class="list-group-item list-group-item-action "> <i
						data-feather="shopping-bag" class="mr-3"></i>판매내역
					</a> 
					<!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 입고 상품</a>
						</c:if>
						
						<c:if test="${1 <= sessionScope.loginSession.partner_signal }">
							<a href="#" id="inProd2" class="list-group-item list-group-item-action">
							<i data-feather="log-out" class="mr-3"></i> 직플레이스 내역</a>
						</c:if>
						<!-- 직플레이스가 하나라도 있으면 해당 메뉴를 한개 출력한다. -->
					
					
					<a href="#"
						class="list-group-item list-group-item-action text-danger logout">
						<i data-feather="log-out" class="mr-3"></i> Logout
					</a>
				</div>
			</div>
		</div>

<!-- <div class="container"> -->

      <div class="main">
         <h3>직플레이스 내역</h3>
         <hr>
         <div>
            <form role="form" id="form" action="/member/update" method="post">
               <fieldset>
               <input type='file' id="imgInp" name="uploadFile"
									class="form-control" style="width: 200px; margin: auto;" /> <img
									id="foo" class="form-control"
									src="/resources/image/no_image.png" alt="사진을 선택"
									style="width: 200px; height: 200px; margin: auto;" />
                  <div>
                     <label for="store">점포명</label> <input type="text" id="part_name"
                        name="part_name" value = "${partner.part_name }" placeholder="점포명을 정확히 입력해주세요" required>
                     <span class="store"> <i class="fas fa-store"></i>
                     </span>
                  </div>



                  <div>
                     <label for="owner">사업자등록번호</label> <input type="text" maxlength="10"
                        id="company_number" name="company_number" value = "${partner.company_number }" 
                        placeholder="사업자등록번호-10자리의 숫자" required readonly> <span
                        class="owner"> <i class="far fa-list-alt"></i>
                     </span>
                  </div>


                  <div>
                     <label for="name">대표</label> <input type="text" id="boss_name"
                        name="boss_name" value = "${partner.boss_name }" placeholder="대표자 성명을 입력해주세요" required>
                     <span class="name"> <i class="fas fa-user"></i>
                     </span>

                  </div>

                  <div>
                     <label for="phone">휴대폰번호</label><input type="text" id="part_phone"
                        name="part_phone" maxlength="11" value = "${partner.part_phone }" placeholder="휴대폰번호*숫자만허용"
                        required> <span class="phone"> <i
                        class="fas fa-mobile-alt"></i>
                     </span>
                  </div>

                  <div>
                     <label for="home">우편번호</label> <input type="text" id="zip_code"
                        name="zip_code" value = "${partner.zip_code }" placeholder="우편번호" required> <input
                        type="text" id="road_name" value = "${partner.road_name }" name="road_name" placeholder="도로명주소"
                        required><br/> <input type="text" id="addr" value = "${partner.addr }" name="addr"
                        placeholder="지번주소" required> <input type="text"
                        id="detail_addr" name="detail_addr" value = "${partner.detail_addr }" placeholder="상세주소">
                     <span class="home"> <i class="fas fa-home"></i>
                     </span>

                  </div>


                   <input type="button" class="adrs" onclick="sample4_execDaumPostcode()"
                     value="우편번호 찾기"><br> <input type="hidden" id="lag"
                     name="lag" /> <input type="hidden" id="lng" name="lng" /><br />
                     
                     <input type="submit" class="uptbtn" id="uptbtn" value="수정하기">
               </fieldset>
            </form>
         </div>
      </div>
   </div>
   </div>

<!-- </div> -->
<!-- /Main Content -->

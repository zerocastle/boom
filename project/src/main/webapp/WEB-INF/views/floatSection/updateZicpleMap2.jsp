<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>으휴</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden; width: 206px;text-overflow: ellipsis;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    <!
    .info .link {color: #5085BB;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="map" style="width:100%;height:100vh;"></div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=571aae4fec40d0283f32c39801431185&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(34.777777, 126.570667), // 지도의 중심좌표
    level: 13 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
<c:forEach var="list" items="${list}" varStatus="status">
//마커를 표시할 위치입니다 
var position${status.count} =  new kakao.maps.LatLng(${list.lag},${list.lng});

//마커를 생성합니다
var marker${status.count} = new kakao.maps.Marker({
position: position${status.count},
clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
});

//아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
//마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
//marker.setClickable(true);

//마커를 지도에 표시합니다.
marker${status.count}.setMap(map);
//마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다

var iwContent${status.count} = '' + 
'    <div class="info">' + 
'        <div class="title">' + 
'            ${list.part_name}' + 
'            ' + 
'        </div>' + 
'        <div class="body">' + 
'            <div class="img">' +
'                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="jibun ellipsis road">${list.road_name}</div>' + 
'                <div class="jibun ellipsis jibun">${list.addr}</div>' + 
'                <div><button data-cNum="${list.company_number}" data-jibun="${list.addr}" data-road="${list.road_name}" data-name="${list.part_name}" class="selectPlace" value="${list.part_name}-${list.road_name}-${list.addr}">선택하기</div>' + 
'            </div>' + 
'        </div>' + 
'    </div>' +     //part_name || '-' || road_name || '-' || addr
'', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwRemoveable${status.count} = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

//인포윈도우를 생성합니다
var infowindow${status.count} = new kakao.maps.InfoWindow({
content : iwContent${status.count},
removable : iwRemoveable${status.count}
});

//마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker${status.count}, 'click', function() {
  // 마커 위에 인포윈도우를 표시합니다
  infowindow${status.count}.open(map, marker${status.count});  
});
</c:forEach>


$(document).ready(function(){
	$(document).on('click','.selectPlace',function(e){
		var company_num = $(e.target).val();
		var part_name = $(e.target).data('name');
		var road = $(e.target).data('road');
		var jibun = $(e.target).data('jibun');
		console.log(company_num);
		var json = {
				'road' : road,
				'jibun' : jibun,
				'part_name' : part_name,
				'fullString' : company_num
		}; 
		
		window.parent.postMessage(json, '*');
	})
});
</script>
</body>
</html>
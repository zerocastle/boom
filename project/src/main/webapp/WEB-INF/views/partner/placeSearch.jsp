<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* 줌 인 아웃 */
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}   

/* customer css */
.search-header{
	width: 100%;
	height: 120px;
}
</style>
</head>


<body>

	<div class="search-header">
	header part
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=571aae4fec40d0283f32c39801431185&libraries=services"></script>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 840px"></div>
	  <!-- 지도타입 컨트롤 div 입니다 -->
    <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<input type="text" value="" placeholder="시/군/구 /동/읍/면 입력"
						id="keyword" size="15">
					<button id="search">검색</button>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
			<div id="result"></div>
		</div>
	</div>
<script>

var data = '${list}';

/* 	console.log(data.trim());
var a = data.trim(); */

var places = JSON.parse(data);
console.log(places);

alert(places[1].road_name);

$(function(){
	$.ajax({
		type: "GET",
		url : "/partner/placeSearch",
		success : function(data){

/* 				alert("성공"); */
		}
	});
});

	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(35.89868067224691, 128.61690414094156), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
<c:forEach var="list" items="${list}">
{
    content: '<div>"${list.part_name}"</div>', 
    latlng: new daum.maps.LatLng('${list.lag}', '${list.lng}')
},
</c:forEach>
];

for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new daum.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

$('#search').click(function(){
   var keyword = $('#keyword').val();

   //주소로 좌표를 검색합니다
   geocoder.addressSearch(keyword, function(result, status) {
   
       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {

     		
           var coords = new daum.maps.LatLng(result[0].y, result[0].x);
       	
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);

    		if(keyword != ""){
             	var newArr = [];

             	for(var i= 0, l = places.length; i< l; i++){
             	    if(places[i].addr.match(keyword) || places[i].road_name.match(keyword)){
             			newArr.push(places[i]);
             		}
             	}
             	console.log(newArr);
             	alert("newArr"+newArr);
             	displayPlaces(newArr);
         	}
         	else{
         		displayPlaces(data);
         	}
           
           displayPagination(pagination);
       } 
   });    
});
/*  	var index = [];
 	
 	for(var i; i<places.leagth; i++){
 		index[i] = 0;
 	}
 	 */
 	 
/*  	var newArr = [];

 	for(var i= 0, l = places.length; i< l; i++){
 	    if(places[i].addr.match('복현동')){
 			newArr.push(places[i]);
 		}
 	}
 	console.log(newArr);
 	alert("newArr"+newArr); */

 	 
 	
 // 검색 결과 목록과 마커를 표출하는 함수입니다
 	function displayPlaces(places) {
 		alert(places);
 		console.log(places);
 	    var listEl = document.getElementById('placesList'), 
 	    menuEl = document.getElementById('menu_wrap'),
 	    fragment = document.createDocumentFragment(), 
 	    bounds = new daum.maps.LatLngBounds(), 
 	    listStr = '';
 	    console.log(listEl);
 	    // 검색 결과 목록에 추가된 항목들을 제거합니다
 	    removeAllChildNods(listEl);
 	   	console.log(listEl);
		
 	   
 	  	var newArr = [];
 	    for ( var i=0; i<places.length; i++ ) {
 	       	
/*  	 	    if(places[i].addr.match(document.getElementById('keyword').value)){
 	 			newArr.push(places[i]);
 	 			console.log("newArr 제발.."+newArr);
 	 		}
 	 	 	 */
 	
 	    	itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

 	        fragment.appendChild(itemEl);
 	    }
 	    
 	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
 	    listEl.appendChild(fragment);
 	    menuEl.scrollTop = 0;
 	}

 
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		console.log(index);
		console.log(places);

			
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.part_name + '</h5>';
		console.log(places.part_name);
	    if (places.road_name) {
	        itemStr += '    <span>' + places.road_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.addr  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.addr  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.part_phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';
	    return el;
		
	} 

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
/* 	daum.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;

		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';

		var resultDiv = document.getElementById('result'); 
		resultDiv.innerHTML = message;
		alert(message);
		}); */
</script>
</body>
</html>
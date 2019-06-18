<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/* 줌 인 css */
.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 16px;
	right: 17px;
	overflow: hidden;
	margin: 0;
	padding: 0;
	z-index: 2;
	font-size: 12px;
	width: 150px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 8;
	font-size: 12px;
}

.custom_typecontrol span {
	display: block;
	width: 74px;
	float: left;
	text-align: center;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
	font-size: 8px;
	line-height: 15px;
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
	line-height: 30px;
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 17px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 2;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 13px;
	padding: 14px 0;
	padding-right: 1px;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.home {
	border-bottom: 1px solid black;
	height: 150px;
}

/* 선의 거리 css */
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

.map-img{
	display : inline-block;
	border: 1px solid black;
	width: 100px;
	height: 100px;
	vertical-align: middle;
}
.map-img-line {
	display : inline-block;
	border:  1px solid black;
	width: 240px;
	height: 100px;
	vertical-align: middle;
}

#placesList {
	padding-inline-start : 0;
	margin-block-start : 0;
	margin-block-end : 0;
}

li {
	list-style: none;
}

.imgDiv{
	width: 100px;
	height: 100px;
	vertical-align: middle;
	display: inline-block;
}

.imgSize{
	width: 100px;
	height: 100px;
}
.info {
	display: inline-block;
	vertical-align: middle;
	height: 100px;
	padding: 10px;
}
.item{
	margin-top: 5px;
	margin-bottom: 5px;
}
.partName{
	font-weight: 600;
}

.jibun gray{
	padding-left: 19px;
}

.option {
	border-radius : 0;
}
.option-line{
	position: relative;
	bottom: 776px;
	left: 16.4px;
	z-index: 3;
}

#search {
	display: flex;
	align-items: center;
	padding: 0.375rem 0.75rem;
	margin-bottom: 0;
	font-size: 0.875rem;
	font-weight: 400;
	line-height: 1.5;
	text-align: center;
	white-space: nowrap;
	background-color: #f8f9fa;
	border-color: #f8f9fa;
	vertical-align: middle;
	border: 1px solid transparent;
	transition : color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out
}
</style>

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=571aae4fec40d0283f32c39801431185&libraries=services"></script>
    <!-- Main Content -->
    <div class="container my-3">
      <div class="row">

        <div class="col">
          <div class="card">
            <div class="card-body" lang="zxx">
				<div id="map" style="width: 100%; height: 760px;" ></div>
				<!-- 지도타입 컨트롤 -->
				<div class="custom_typecontrol radius_border">
					<span id="btnRoadmap" class="selected_btn"
						onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
						class="btn" onclick="setMapType('skyview')">스카이뷰</span>
				</div>
				<!-- 지도 확대 축소 -->
				<div class="custom_zoomcontrol radius_border">
					<span onclick="zoomIn()"> <img
						src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
						alt="확대"></span> <span onclick="zoomOut()"> <img
						src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
						alt="축소"></span>
				</div>
            </div>
          </div>
          <div class="form-inline form-search ml-auto mr-0 mr-sm-1 d-none d-sm-flex option-line">
			        <div class="input-group input-group-search option">
			          <div class="input-group-prepend">
			            <button class="btn btn-light d-flex d-sm-none search-toggle" type="button"><i data-feather="chevron-left"></i></button>
			          </div>
			          <input type="text" id="keyword" class="form-control border-0 bg-light input-search" placeholder="시/군/구 /동/읍/면 입력" aria-label="Search" >
			          <div class="input-group-append">
			            <button id="search"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button>
			          </div>
			        </div>
			      </div>
        </div>
		
        <!-- Blog Sidebar -->
        <div class="col-md-4 col-lg-4 mt-3 mt-md-0">
          <div class="card">
            <div class="card-header bg-white border-bottom bold roboto-condensed">
              <h5 class="bold mb-0"><span class="text-primary">직플레이스 </span>검색 결과</h5>
            </div>
            <div class="card-body">

              <div class="row">
                <div class="col-12 col-sm-6 col-md-12">
                  <div class="card card-blog shadow-none">
                 <div id="menu_wrap" class="List">
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
                  </div>
                </div>
            </div>
          </div>

        </div>
        <!-- /Blog Sidebar -->

      </div>
    </div>
   </div>
    <!-- /Main Content -->
    
	<script>

var data = ${list};

/*    console.log(data.trim());
var a = data.trim(); */

var places = data;
console.log(places);
/* 
alert(places[1].road_name); */

$(function(){
   $.ajax({
      type: "GET",
      url : "/partner/placeSearch",
      success : function(data){

/*             alert("성공"); */
      }
   });
});

   
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(35.89868067224691, 128.61690414094156), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
<c:forEach var="list" items="${list}">
{
    content: '<div>${list.part_name}<br>${list.road_name}<br>${list.addr}<br>${list.part_phone}</div>', 
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
console.log(marker);

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new daum.maps.InfoWindow({
    content: positions[i].content, // 인포윈도우에 표시할 내용
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
   if (!keyword.replace(/^\s+|\s+$/g, '')) {
       alert('키워드를 입력해주세요!');
       return false;
   }
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
             /*    alert("newArr"+newArr); */
                displayPlaces(newArr);
                displayPagination(pagination);
            }
            else{
               displayPlaces(data);
               displayPagination(pagination);
            }
       } 
   });    
});
/*     var index = [];
    
    for(var i; i<places.leagth; i++){
       index[i] = 0;
    }
     */
     
/*     var newArr = [];

    for(var i= 0, l = places.length; i< l; i++){
        if(places[i].addr.match('복현동')){
          newArr.push(places[i]);
       }
    }
    console.log(newArr);
    alert("newArr"+newArr); */

    
 // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {
      /*  alert(places); */
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
      
          
       
         
        for ( var i=0; i<places.length; i++ ) {
              
/*             if(places[i].addr.match(document.getElementById('keyword').value)){
              newArr.push(places[i]);
              console.log("newArr 제발.."+newArr);
           }
             */
    
           itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
           console.log(itemEl);
           (function(latlng, title) {
           itemEl.onclick =  function () {
              console.log(latlng);
              map.setCenter(latlng);
              }
           })(positions[i].latlng, places[i].part_name);
      /*     $(document).ready(function(){
          $('markerbg marker_'+i+1).click(function(){
             var a = $('.item').val();
             alert(a);
               map.setCenter(marker.getPosition()); 
              makeOverListener(map, marker, infowindow); 
           });
       });*/
       fragment.appendChild(itemEl);
        }
        
        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
    }

    
    function displayInfowindow(marker, title) {
       console.log(marker); // 이상한값
       console.log(title); // 자몽 , 영전대
        var content = '<div style="padding:5px;z-index:1;>' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(marker);
    }
 
   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, places) {
      console.log(index);
      console.log(places);
      console.log(JSON.stringify(places));

         
       var el = document.createElement('li'),
       itemStr ='<div class="imgDiv"><img class="imgSize" src="${pageContext.request.contextPath}/resources/'+places.uploadPath+'/'+places.uuid+'_'+places.fileName+'" style="width:100px; height:100px;"></div>' +'<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info">' +
                   '   <span class="partName"><i class="far fa-hand-point-right"></i> ' + places.part_name + '</span>';
      console.log(places.part_name);
       if (places.road_name) {
           itemStr += '   <br> <span class="road"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg> ' + places.road_name + '</span>' +
                       '   <br><span class="jibun gray">' +  places.addr  + '</span>';
       } else {
           itemStr += '    <br><span>' +  places.addr  + '</span>'; 
       }
                    
         itemStr += '<br><span class="tel"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smartphone"><rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect><line x1="12" y1="18" x2="12" y2="18"></line></svg>' + places.part_phone  + '</span></div>';           
       el.innerHTML = itemStr;
       el.className = 'item';
       el.id = "i"+(index+1);
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
   
/*    daum.maps.event.addListener(map, 'click', function(mouseEvent) {

      // 클릭한 위도, 경도 정보를 가져옵니다 
      var latlng = mouseEvent.latLng;

      var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
      message += '경도는 ' + latlng.getLng() + ' 입니다';

      var resultDiv = document.getElementById('result'); 
      resultDiv.innerHTML = message;
      alert(message);
      }); */
      
      
      var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
      var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
      var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
      var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
      var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

      // 지도에 클릭 이벤트를 등록합니다
      // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
      daum.maps.event.addListener(map, 'click', function(mouseEvent) {

          // 마우스로 클릭한 위치입니다 
          var clickPosition = mouseEvent.latLng;

          // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
          if (!drawingFlag) {

              // 상태를 true로, 선이 그리고있는 상태로 변경합니다
              drawingFlag = true;
              
              // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
              deleteClickLine();
              
              // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
              deleteDistnce();

              // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
              deleteCircleDot();
          
              // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
              clickLine = new daum.maps.Polyline({
                  map: map, // 선을 표시할 지도입니다 
                  path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                  strokeWeight: 3, // 선의 두께입니다 
                  strokeColor: '#db4040', // 선의 색깔입니다
                  strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                  strokeStyle: 'solid' // 선의 스타일입니다
              });
              
              // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
              moveLine = new daum.maps.Polyline({
                  strokeWeight: 3, // 선의 두께입니다 
                  strokeColor: '#db4040', // 선의 색깔입니다
                  strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                  strokeStyle: 'solid' // 선의 스타일입니다    
              });
          
              // 클릭한 지점에 대한 정보를 지도에 표시합니다
              displayCircleDot(clickPosition, 0);

                  
          } else { // 선이 그려지고 있는 상태이면

              // 그려지고 있는 선의 좌표 배열을 얻어옵니다
              var path = clickLine.getPath();

              // 좌표 배열에 클릭한 위치를 추가합니다
              path.push(clickPosition);
              
              // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
              clickLine.setPath(path);

              var distance = Math.round(clickLine.getLength());
              displayCircleDot(clickPosition, distance);
          }
      });
          
      // 지도에 마우스무브 이벤트를 등록합니다
      // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
      daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

          // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
          if (drawingFlag){
              
              // 마우스 커서의 현재 위치를 얻어옵니다 
              var mousePosition = mouseEvent.latLng; 

              // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
              var path = clickLine.getPath();
              
              // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
              var movepath = [path[path.length-1], mousePosition];
              moveLine.setPath(movepath);    
              moveLine.setMap(map);
              
              var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                  content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
              
              // 거리정보를 지도에 표시합니다
              showDistance(content, mousePosition);   
          }             
      });                 

      // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
      // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
      daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

          // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
          if (drawingFlag) {
              
              // 마우스무브로 그려진 선은 지도에서 제거합니다
              moveLine.setMap(null);
              moveLine = null;  
              
              // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
              var path = clickLine.getPath();
          
              // 선을 구성하는 좌표의 개수가 2개 이상이면
              if (path.length > 1) {

                  // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
                  if (dots[dots.length-1].distance) {
                      dots[dots.length-1].distance.setMap(null);
                      dots[dots.length-1].distance = null;    
                  }

                  var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                      content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                      
                  // 그려진 선의 거리정보를 지도에 표시합니다
                  showDistance(content, path[path.length-1]);  
                   
              } else {

                  // 선을 구성하는 좌표의 개수가 1개 이하이면 
                  // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
                  deleteClickLine();
                  deleteCircleDot(); 
                  deleteDistnce();

              }
              
              // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
              drawingFlag = false;          
          }  
      });    

      // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
      function deleteClickLine() {
          if (clickLine) {
              clickLine.setMap(null);    
              clickLine = null;        
          }
      }

      // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
      // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
      function showDistance(content, position) {
          
          if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
              
              // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
              distanceOverlay.setPosition(position);
              distanceOverlay.setContent(content);
              
          } else { // 커스텀 오버레이가 생성되지 않은 상태이면
              
              // 커스텀 오버레이를 생성하고 지도에 표시합니다
              distanceOverlay = new daum.maps.CustomOverlay({
                  map: map, // 커스텀오버레이를 표시할 지도입니다
                  content: content,  // 커스텀오버레이에 표시할 내용입니다
                  position: position, // 커스텀오버레이를 표시할 위치입니다.
                  xAnchor: 0,
                  yAnchor: 0,
                  zIndex: 3  
              });      
          }
      }

      // 그려지고 있는 선의 총거리 정보와 
      // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
      function deleteDistnce () {
          if (distanceOverlay) {
              distanceOverlay.setMap(null);
              distanceOverlay = null;
          }
      }

      // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
      // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
      function displayCircleDot(position, distance) {

          // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
          var circleOverlay = new daum.maps.CustomOverlay({
              content: '<span class="dot"></span>',
              position: position,
              zIndex: 1
          });

          // 지도에 표시합니다
          circleOverlay.setMap(map);

          if (distance > 0) {
              // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
              var distanceOverlay = new daum.maps.CustomOverlay({
                  content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                  position: position,
                  yAnchor: 1,
                  zIndex: 2
              });

              // 지도에 표시합니다
              distanceOverlay.setMap(map);
          }

          // 배열에 추가합니다
          dots.push({circle:circleOverlay, distance: distanceOverlay});
      }

      // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
      function deleteCircleDot() {
          var i;

          for ( i = 0; i < dots.length; i++ ){
              if (dots[i].circle) { 
                  dots[i].circle.setMap(null);
              }

              if (dots[i].distance) {
                  dots[i].distance.setMap(null);
              }
          }

          dots = [];
      }

      // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
      // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
      // HTML Content를 만들어 리턴하는 함수입니다
      function getTimeHTML(distance) {

          // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
          var walkkTime = distance / 67 | 0;
          var walkHour = '', walkMin = '';

          // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
          if (walkkTime > 60) {
              walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
          }
          walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

          // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
          var bycicleTime = distance / 227 | 0;
          var bycicleHour = '', bycicleMin = '';

          // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
          if (bycicleTime > 60) {
              bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
          }
          bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

          // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
          var content = '<ul class="dotOverlay distanceInfo">';
          content += '    <li>';
          content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
          content += '    </li>';
          content += '    <li>';
          content += '        <span class="label">도보</span>' + walkHour + walkMin;
          content += '    </li>';
          content += '    <li>';
          content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
          content += '    </li>';
          content += '</ul>'

          return content;
      }

</script>
    
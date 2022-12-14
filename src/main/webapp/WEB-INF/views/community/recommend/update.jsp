<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../../layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0fa965ef2afc1eb7b03b2c26751de05b&libraries=services,clusterer,drawing"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("#uptForms").submit();
		
	})
	
	
	$("#place").on("keydown",function(e){
        if(e.keyCode == 13) {
        	e.preventDefault();
        }
    });

	
	
	if( ${empty rboardfile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		
		$("#originFile").toggleClass("through")
	})
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>


<style type="text/css">

#originFile, #newFile {
	display: none;
}

.through {
	text-decoration: line-through;
}

#deleteFile {
	font-weight: bold;
	color: red;
	cursor: pointer;
}

#place { width: 95%; }
#btnSear{ 
	position: relative;
    float: right;
    top: -34px; 
}

.btn_wrap { margin-bottom: 30px; }

#btnUpdate{
	width: 57px;
    height: 37px;
    border-radius: 10px;
    font-size: 17px;
    border: none;
    background-color: #6bacce;
    color: #fff;
}

#cancel{
	width: 57px;
    height: 37px;
    border-radius: 10px;
    font-size: 17px;
    border: none;
    background-color: #f84720;
    color: #fff;
}

</style>


<div class="container">

<h1>글수정</h1>
<hr>

<form action="/community/recommend/updateConn" id="uptForms" method="post" enctype="multipart/form-data">


<input type="hidden" name="rno" value="${param.rno }">

<div class="form-group">
	<label for="userid">작성자</label>
	<input type="text" id="userid" value="${userid}" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control" value="${updateBoard.title }">
</div>

<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="content">${updateBoard.content }</textarea>
</div>


<!-- 지도 -->
<div class="form-group">
	<label for="title">장소 추가하기</label>
	<input type="text" id="place" name="place" class="form-control" value="${updateBoard.planame }">
	<button type="button" onclick="getKeyword()" class="btn btn-default" id="btnSear">검색</button>
	<div id="map" style="width:100%;height:350px; top: -25px;"></div>
</div>
<input type="hidden" id="address" name="address" value="" /><input type="hidden" id="planame" name="planame" value="" />
<!-- 지도 -->


<div class="form-group">

	<div id="fileBox">

		<div id="originFile">
			<a href="/community/recommend/download?fileNo=${rboardfile.rFileno }">${rboardfile.originName }</a>
			<span id="deleteFile">X</span>
		</div>

		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
		</div>

	</div>

</div>

<div class="text-center btn_wrap">
	<button id="btnUpdate">수정</button>
	<input type="reset" id="cancel" value="취소">
</div>
</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>



<script type="text/javascript">

var _marker;	//전역변수
var _info;		//전역변수	

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('${updateBoard.address}', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });

	    _marker = marker;
	    
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	     var infowindow = new kakao.maps.InfoWindow({
	        content: '<div class="markerTxt" style="width:150px;text-align:center;padding:6px 0;">' + `${updateBoard.planame}` + '</div>'
	    });
	    
	     _info = infowindow;
	     
	    infowindow.open(map, marker); 

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
});
//-------------------------------------------------------------------------------------------------------

//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드 가져오기
function getKeyword() {
	_marker.setMap(null); //원래 마커 삭제
	_info.setMap(null);
	//$(".markerTxt").parent().parent().remove(); //원래 마커말풍선 삭제
	ps.keywordSearch($('#place').val(), placesSearchCB); //키워드 가져오기
}


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
        
        var ad = place.address_name;
        var pn = place.place_name;
        console.log("pn : ", pn);
        
        $('#address').attr('value', ad);
        $('#planame').attr('value', pn);
    });
}
</script>



</div><!-- .container end -->


<c:import url="../../layout/footer.jsp" />
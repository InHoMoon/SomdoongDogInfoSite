<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0fa965ef2afc1eb7b03b2c26751de05b&libraries=services,clusterer,drawing"></script>

<c:import url="../../layout/header.jsp" />

<style type="text/css">

.all {
	padding: 57px 91px 0px;
    margin: 0 auto;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
}

/* 제목, 작성자, 작성일, 조회수 영역 */
.title_area {
	margin: 0 0 7px;
    padding-bottom: 15px;
    border-bottom: 1px solid #efefef;
}

/* 작성자, 작성일, 조회수 */
.post_info{
	font-size: 13px;
    color: #a7a7a7;
}

/* 수정, 삭제 */
.up-delete{
	display: inline-block;
    float: right;
}

/* 작성자, 작성일, 조회수 사이에 있는 | 표시 */
.text_bar{
	margin: 0 9px 0 9px;
	display: inline-block;
    width: 1px;
    height: 9px;
    background-color: #ebebeb;
}

/* 첨부파일 영역 */
.file-area{
	display: inline-block;
    float: right;
    font-size: 13px;
}

/* 글 내용 */
.view_area{
	color: #5c5c5c;
    word-wrap: break-word;
    margin-top: 30px;
    margin-bottom: 30px;
}


/* 목록버튼 */
.btnList{
    width: 80px;
    height: 32px;
    padding: 0;
    border: 1px solid rgba(185,185,185,5);
    border-radius: 16px;
    line-height: 30px;
    color: inherit;
    box-sizing: border-box;
    background: none;
}


/* 컨텐츠 아래로 여백주기 */
.clear{ 
	margin-top: 30px;
    margin-bottom: 100px;
    border-bottom: 1px solid #efefef;
}


.like img {
    width: 20px;
    height: 20px;
    position: relative;
}

#loc {
	font-size: 20px;
    font-weight: bold;
    position: relative;
    top: 2px;
}

</style>



<div class="all">

	<div class="title_area">
			
			<span class="post_info" style="font-size: 12px;">식당추천</span>
			<h3 style="margin-top: 8px;">${rboard.title }</h3>
			
			<span class="post_info">${rboard.userid }</span>
			<span class="text_bar"></span>
			<span class="post_info"><fmt:formatDate value="${rboard.writeDate }" pattern="yyyy.MM.dd HH:mm"/></span>
			<span class="text_bar"></span>
			<span class="post_info">조회 ${rboard.hit }</span>
			<span class="text_bar"></span>
			<span class="like"><img class="heart" src="/resources/img/empty_heart.png"></span>
			
			<c:if test="${userid eq rboard.userid }">
				<span class="up-delete">
					<a href="/community/recommend/update?rno=${rboard.rno }" id="update">수정</a>
					<span class="text_bar"></span>
					<a href="/community/recommend/delete?rno=${rboard.rno }" style="color: #f84720;">삭제</a>
				</span>
			</c:if>
		
	</div> <!-- title_area -->
	
	<div class="file-area">
		<c:if test="${not empty rboardFile }">
		<span><img src="/resources/img/download.png" style="width: 15px; height: 17px;"></span>
			<a href="/community/recommend/download?rFileno=${rboardFile.rFileno }">${rboardFile.originName }</a>
		</c:if>
	</div> <!-- file=area -->
	
	<div style="padding-bottom: 30px;"></div>
	
	<div class="view_area">
		<div class="view">
				<c:if test="${not empty rboardFile }">
				<img src="/upload/${rboardFile.storedName }" style="width: 40%; height: auto;">
				</c:if>
				<p>${rboard.content }</p>
		</div>
	</div> <!-- view_area -->


	<!-- 지도 -->
	<c:if test="${not empty rboard.address }">
		<div><img src="/resources/img/location.png" style="width: 35px; height: auto;"><span id="loc">위치</span></div>
		<div id="map" style="width:100%;height:350px;"></div>
	</c:if>
	
<div class="clear"></div>


</div> <!-- all -->


<c:import url="../../layout/footer.jsp" />


<script type="text/javascript">
$(document).ready(function(){
	
	
	//변수선언
	var findLike = ${findLike}
	
	if(findLike > 0){
		console.log("already like....");
		$(".heart").prop("src", "/resources/img/heart.png");
	} else {
		console.log("you can like this post!")
		$(".heart").prop("src", "/resources/img/empty_heart.png");
	}
	
	$(".heart").click(function(){
		
		if(${empty userid}){
			alert("로그인 후 이용해주세요");
			return;
		}
		
		$.ajax({
			url : "/community/recommend/like"
			, type : "post"
// 			, data : { "rno" : ${rboard.rno}, "userid" : `${rboard.userid}` }
			, data : { "rno" : ${rboard.rno}, "userid" : `${userid}` }
			, success : function(data){
				if(data == 1){
					$(".heart").prop("src", "/resources/img/heart.png");
				} else if(data == 0){
					$(".heart").prop("src", "/resources/img/empty_heart.png");
					alert("좋아요가 취소되었습니다");
				}
			}
		});//ajax end
	}); // .heart click end
	
}); // document end
</script>



<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


//주소로 좌표를 검색합니다
// geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
geocoder.addressSearch('${rboard.address}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
     var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + `${rboard.planame}` + '</div>'
    });
    
    infowindow.open(map, marker); 

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

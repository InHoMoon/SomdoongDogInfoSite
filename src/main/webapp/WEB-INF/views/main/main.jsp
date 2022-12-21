<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<style>
	.album{
		float:left; 
		text-align:center;
 		margin: 15px;
	}
		/* clear: both; */
	.col-md-8 {
		padding-left: 14px;
	}
	
	.col-md-1 {
		padding-top: 55px;
	}
	
	#show_title {
		height: 60px;
		margin-top: 60px;
	}
	
	#show_title_name {
		height: 50px;
		font-family: 'Dongle', sans-serif;
		text-align: center;
		font-size: 40px;
		margin-top: 10px;
	}
	
	#main {
		margin-top: 70px;
		height: 600px;
	}
	
	a {
		text-decoration : none;
		color: black;
		font-weight: bold;
	}
	
	.banner-slider{
	    width: 1080px;
	    height: 265px;
 	    position: relative;
	    margin: 0 auto;
	    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
	    margin-top: 60px;
	}
	.banner-slider input[type=radio]{
	    display: none;
	}
	
	ul.imgs {
		padding: 0;
		margin: 0;
		list-style: none;
	}
	
	ul.imgs li {
 		position: absolute;
		left: 1080px;
		transition-delay: 1s; /* 새 이미지가 이동해오는 동안 이전 슬라이드에 이미지 안보이도록 지연*/
		padding: 0;
		margin: 0;
	}
	
	.label {
	    position: absolute;
	    left: 50%;
	    transform: translateX(-50%);
	    bottom: 20px;
	    z-index: 2;
	}
	.label label{
	    display: inline-block;
	    border-radius: 50%;
	    background-color: rgba(0,0,0,0.55);
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
	}
	/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
	.banner-slider input[type=radio]:nth-child(1):checked~.label>label:nth-child(1){
	    background-color: #fff;
	}
	.banner-slider input[type=radio]:nth-child(2):checked~.label>label:nth-child(2){
	    background-color: #fff;
	}
	.banner-slider input[type=radio]:nth-child(3):checked~.label>label:nth-child(3){
	    background-color: #fff;
	}
	.banner-slider input[type=radio]:nth-child(4):checked~.label>label:nth-child(4){
	    background-color: #fff;
	}
	
	.banner-slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.banner-slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.banner-slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}
	.banner-slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
	    left: 0;
	    transition: 0.5s;
	    z-index:1;
	}

</style>

<div class="container">

<div class="row" id="show_title">
<div id="show_title_name" style="font-family: 'Black Han Sans', sans-serif; font-size: 45px;">
<span>솜둥이네 <span style="color: #ff1493;">TOP</span> <span style="font-size:50px;">4</span></span>
</div>
</div>

<div class="row" style="margin-top: 30px; margin-left:50px;">
		<div>
<div style="margin-left: 95px; margin-top:5px; float: left;"><img class="heart" src="../resources/chkLike.png" width="50px;"></div>	
		<c:forEach items="${list }" var="list" varStatus="status">
		<div class="album">
			<div style = "text-align:center;">
				<a href="/community/showview?sno=${list.SNO }"><img src="/upload/${list.STORED_NAME }" class="img-circle" style="width: 155px; height: 155px;"></a>
			</div>
		</div>
		</c:forEach>
<div style="margin-right: 0px;"><img class="heart" src="../resources/chkLike.png" width="50px;"></div>	
		</div>
</div>

<!-- 가운데 배너 들어갈꺼!  -->
<div class="banner-slider">
	<input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <ul id="img" class="imgs">
    	<li><img src="../resources/main2.png"></li>
    	<li><a href="제품판매 경로"><img src="../resources/main1.png"></a></li>
    </ul>
    <div class="label">
    	<label for="slide1">&nbsp;</label>
    	<label for="slide2">&nbsp;</label>
    </div>
</div>
<!-- 배너 END -->

<div id="main">
<!-- 강아지 연구소 -->
<div class="col-xs-6" id="doginfo">
<div>
	<div style="float: right;"><a href="강아지정보 리스트 경로">▷더보기</a></div>
	<div style="width: 60px; float: left;"><img src="../resources/info2.jpg" style="width: 53px;"></div>
	<div style="width: 220px; margin-top: 20px; margin-left: 65px">
	<span style="font-family: 'Black Han Sans', sans-serif; font-size: 30px;">강아지 연구소</span>
	</div>
</div>

<div>
	<table class="table table-striped">
	<tr>
		<th class="col-md-1" style="text-align: center;">NO</th>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">작성일</th>
		<th class="col-md-2" style="text-align: center;">조회수</th>
	</tr>
	<c:forEach items="${dList }" var="dList" >
	<tr>
		<td class="col-md-2" style="text-align: center;">${dList.dinfono }</td>
		<td><a href="/강아지정보 상세글 경로?dinfono=${dList.dinfono }">${dList.dinfotitle }</a></td>
		<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${dList.dinfodate }" pattern="yy-MM-dd" /></td>
		<td class="col-md-2" style="text-align: center;">${dList.dinfohit }</td>
	</tr>
	</c:forEach>
	</table>
</div>

</div> <!-- 강아지 연구소 END -->

<!-- 공지사항 시작! -->
<div class="col-xs-6" id="notice">
<div>
	<div style="float: right;"><a href="/notice/list">▷더보기</a></div>
	<div style="width: 60px; float: left;"><img src="../resources/notice1.png" style="width: 60px;"></div>
	<div style="width: 200px; margin-top: 12px;">
	<span style="font-family: 'Black Han Sans', sans-serif; font-size: 30px;">공지사항</span>
	</div>
</div>

<div>
	<table class="table table-striped">
	<tr>
		<th class="col-md-1" style="text-align: center;">NO</th>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">작성일</th>
		<th class="col-md-2" style="text-align: center;">조회수</th>
	</tr>
	<c:forEach items="${nList }" var="nList" >
	<tr>
		<td class="col-md-2" style="text-align: center;">${nList.notino }</td>
		<td><a href="/notice/view?notino=${nList.notino }">${nList.title }</a></td>
		<td class="col-md-2" style="text-align: center;"><fmt:formatDate value="${nList.notidate }" pattern="yy-MM-dd" /></td>
		<td class="col-md-2" style="text-align: center;">${nList.hit }</td>
	</tr>
	</c:forEach>
	</table>
</div>

</div> <!-- 공지사항 END -->
</div>




</div> <!-- container END -->

<c:import url="../layout/footer.jsp"/>
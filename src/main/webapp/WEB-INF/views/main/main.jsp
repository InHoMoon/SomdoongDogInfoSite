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
		margin-top: 20px;
	}
	
	#show_title_name {
		height: 50px;
		font-family: 'Dongle', sans-serif;
		text-align: center;
		font-size: 35px;
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

</style>

<div class="container">

<div class="row" style="border: 1px solid #ccc;" id="show_title">
<div class="col-md-6 col-md-offset-3" style="border: 1px solid red;" id="show_title_name">
솜둥이네 인기쟁이!
</div>
</div>

<div class="row"">
<div class="col-md-1" style="margin-left: 95px;"><img class="heart" src="../resources/chkLike.png" width="50px;"></div>	
		<div class="col-md-8">
		<c:forEach items="${list }" var="list" varStatus="status">
		<div class="album">
			<div style = "text-align:center;">
				<a href="/community/showview?sno=${list.SNO }"><img src="/upload/${list.STORED_NAME }" class="img-circle" style="width: 155px; height: 155px;"></a>
			</div>
		</div>
		</c:forEach>
		</div>
<div class="col-md-1" style="margin-right: 0px;"><img class="heart" src="../resources/chkLike.png" width="50px;"></div>	
</div>

<div id="main" style="border: 1px solid #ccc;">
<div class="col-xs-6" id="doginfo" style="border: 1px solid green;">
<div style="border: 1px solid pink;">
	<div style="float: right;"><a href="강아지정보 리스트 경로">▷더보기</a></div>
	<div style="width: 60px; float: left;"><img src="../resources/info1.png" style="width: 53px;"></div>
	<div style="width: 220px; margin-top: 12px; margin-left: 65px">
	<span style="font-family: 'Black Han Sans', sans-serif; font-size: 30px;">강아지 연구소</span>
	</div>
</div>

<div style="border: 1px solid yellow; ">
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

</div>
<div class="col-xs-6" id="notice" style="border: 1px solid blue;">

<div style="border: 1px solid pink;">
	<div style="float: right;"><a href="/notice/list">▷더보기</a></div>
	<div style="width: 60px; float: left;"><img src="../resources/notice1.png" style="width: 60px;"></div>
	<div style="width: 200px; margin-top: 12px;">
	<span style="font-family: 'Black Han Sans', sans-serif; font-size: 30px;">공지사항</span>
	</div>
</div>

<div style="border: 1px solid yellow; ">
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

</div>
</div>

<div>

<form action="./search" method="get">
	<div class="search">
		<input name="keyword" type="text" placeholder="검색어를 입력해주세요">
	</div>
	
	<button>검색</button>
</form>

</div>



</div>

<c:import url="../layout/footer.jsp"/>
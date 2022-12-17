<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){
		
		if(${empty userid}){
			alert("로그인 후 이용해주세요!");
			return location.href = "/community/showlist";
		}
	});
});
</script>
<style>
.container {
	font-family: 'Dongle', sans-serif;
}
	.album{
		float:left; 
		text-align:center;
		margin: 15px;
		border: 3px solid #FFDEB4;
		border-radius: 7px;
	}
		/* clear: both; */
		
	.col-md-8 {
		margin-left: 15px;
	}
		
	.showlogo {
		margin-left: 261px;
		margin-top: 60px;
	}
	
	.main-text {
		font-size: 40px;
		margin-left: 383px;
		color: #ff8c10;
	}
</style>

<div class="container">
<div class="showlogo">
<img src="../resources/show1.PNG" style="width: 664px; float: center;">
</div>

<div class="show-title">
<span class="main-text">솜둥이들의 귀여운 강아지를 자랑해주세요!</span>
</div>

<div class="row">
	<div class="col-md-2">
	<img src="../resources/show123.png" style="width: 190px; padding-top: 57px;">
	</div>
	<div class="col-md-8">
	<c:forEach items="${list }" var="list" varStatus="status">
	<div class="album">
		<div style = "text-align:center;">
			<img src="/upload/${list.STORED_NAME }" class="img-thumbnail" style="width: 150px; height: 150px;">
		</div>
		<div style = "text-align:center; font-size: 20px;"><a href="./showview?sno=${list.SNO }">${list.TITLE }</a></div>
		<div style = "text-align:center;">${list.USERID }</div>
	</div>

	</c:forEach>
	</div>
<div class="col-md-2">
</div>
</div>

<button id="btnWrite" class="btn btn-primary pull-left" onclick="location.href='showwrite'">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>
<div><c:import url="./paging_s.jsp"/></div>

</div>

<c:import url="../layout/footer.jsp"/>
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
	}
		/* clear: both; */
		
	.showlogo {
		margin-left: 350px;
	}
</style>

<div class="container">
<div class="showlogo">
<img src="../resources/show.PNG" style="width: 350px; float: center;">
</div>

<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<c:forEach items="${list }" var="list" varStatus="status">
	<div class="album">
		<div style = "text-align:center;">
			<img src="/upload/${list.STORED_NAME }" class="img-thumbnail" style="width: 140px; height: 140px;">
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
<div><c:import url="../layout/paging.jsp"/></div>

</div>

<c:import url="../layout/footer.jsp"/>
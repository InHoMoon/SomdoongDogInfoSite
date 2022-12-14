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
		padding-left: 35px;
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
		margin-top: 20px;
		height: 600px;
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
				<a href="/community/showview?sno=${list.SNO }"><img src="/upload/${list.STORED_NAME }" class="img-circle" style="width: 140px; height: 140px;"></a>
			</div>
		</div>
		</c:forEach>
		</div>
<div class="col-md-1" style="margin-right: 0px;"><img class="heart" src="../resources/chkLike.png" width="50px;"></div>	
</div>

<div id="main" style="border: 1px solid #ccc;">
<div class="col-xs-6" id="doginfo" style="border: 1px solid green;">강아지 상식글 들어갈곳!</div>
<div class="col-xs-6" id="notice" style="border: 1px solid blue;">공지사항 들어갈 곳!</div>
</div>




</div>

<c:import url="../layout/footer.jsp"/>
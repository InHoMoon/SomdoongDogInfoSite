<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnList").click(function(){
		location.href = "./showlist"
	})
	
	$("#btnUpdate").click(function(){
		location.href = "./showupdate?sno=${view.sno}"
	})
	
	$("#btnDelete").click(function(){
		alert("정말 삭제하시겠습니까?!");
		location.href = "./showdelete?sno=${view.sno}"
	})
	
	$("#commBtn").click(function(){
		if(${empty userid}){
			alert("로그인 후 이용해주세요!");
			return;
		}
	})
	
})

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

.like img {
	width: 80px;
	position: relative;
	float: center;
}

#likewrap {
	margin-left: 530px;
	margin-right: 530px;
}

.container {
	font-family: 'Dongle', sans-serif;
}
.showTitle {
	font-size: 35px;
	margin-top: 30px;
	color: #ff8c10;
	
}
.title {
	font-size: 40px;
	font-weight: bold;
	margin-left: 35px;
	height: 32px;
}
.info {
	font-size: 25px;
	text-align: right;
}

.content {
	font-size: 25px;
	margin-top: 35px;
}

.showimg {
	text-align: center;
}

.content-text {
	margin-top: 35px;
}

.btnwrap {
	margin: 35px;
    padding: 30px;
	
}

.commContent {
	margin-left: 215px;
}
</style>

<div class="container">

<div class="showTitle">강아지 자랑</div>

<div class="title">${view.title }</div>
<div class="info">${view.userid } 
/ 
<img src="../resources/time.png" style="width: 18px; padding-right: 3px;"><fmt:formatDate value="${view.writeDate }" pattern="yy-MM-dd" /> 
/ 조회수(${view.hit })</div>
<div style="border-bottom: 4px solid #ccc;"></div>

<div class="content">

<div class="showimg"><img src="/upload/${file.storedName }" alt="이미지 아님" style="height: 500px;"></div>
<div class="content-text">${view.content }</div>

</div>

<!-- 조아요 -->
<div class="row">
<div class="col-md-4" id="likewrap">
<span class="like"><img id="like" src="../resources/like.png"></span>
</div>
</div>

<div class="btnwrap">

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	<c:if test="${userid eq view.userid }">
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div>

<!-- 댓글 -->

</div> <!-- .container END -->

<c:import url="../layout/footer.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	
	//변수선언
	var chkLike = ${chkLike}
	
	if(chkLike > 0){
		console.log("좋아요 상태");
		$("#like").prop("src", "../resources/chkLike.png");
	} else {
		console.log("좋아요 빈 상태")
		$("#like").prop("src", "../resources/like.png");
	}
	
	$(".like").click(function(){
		
		if(${empty userid}){
			alert("로그인 후 이용해주세요!");
			return;
		}
		
		$.ajax({
			url : "/community/sLike"
			, type : "post"
			, data : { "sno":'${view.sno}', "userid":'${view.userid}' }
			, dataType : 'json'
			, success : function(data){
				if(data == 1){
					$(".like img").prop("src", "../resources/chkLike.png");
					console.log("좋아요 완료")
				} else if(data == 0){
					$(".like img").prop("src", "../resources/like.png");
					console.log("좋아요 취소")
					alert("좋아요가 취소되었습니다");
				}
			}
	});
		
	})
	
});
</script>
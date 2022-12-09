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
		location.href = "./showdelete?sno=${view.sno}"
	})
	
	
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<div class="container">

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td colspan="3">${view.sno }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>${view.userid }</td>
</tr>
<tr>
	<td class="info">조회수</td><td>${view.hit }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${view.write_date }" pattern="yy-MM-dd HH:mm:ss" /></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${view.title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4"><img src="/upload/${file.stored_name }" alt="이미지 아님" style="width: 140px; height: 140px;">${view.content }</td>
</tr>
</table>
<div>${file.origin_name }</div>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	<c:if test="${userid eq view.userid }">
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>


</div>

<c:import url="../layout/footer.jsp"/>
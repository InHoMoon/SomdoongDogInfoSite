<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/notice/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/notice/update?notiNo=${viewNotice.notiNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/notice/delete?notiNo=${viewNotice.notiNo }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td colspan="3">${viewNotice.notiNo }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>${viewNotice.adminId }</td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewNotice.notiHit }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewNotice.notiDate }" pattern="yy-MM-dd"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewNotice.notiTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewNotice.notiContent }</td>
</tr>
</table>

<a href="/notice/download?nFileNo=${noticeFile.nFileNo }">${noticeFile.originName }</a>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${id eq viewNotice.adminId }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />

















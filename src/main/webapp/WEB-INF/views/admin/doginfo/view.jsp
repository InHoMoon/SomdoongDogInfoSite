<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/doginfo/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/doginfo/update?dno=${viewDogInfo.dno }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/doginfo/delete?dno=${viewDogInfo.dno }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<div class="container">

<h1>연구소 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td colspan="3">${viewDogInfo.dno }</td>
</tr>
<!-- <tr> -->
	<td class="info">작성자</td><td>관리자</td>
<%-- 	<td class="info">닉네임</td><td>${viewBoard.writerNick }</td> --%>
<!-- </tr> -->
<tr>
	<td class="info">조회수</td><td>${viewDogInfo.dhit }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewDogInfo.dwritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewDogInfo.dtitle }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewDogInfo.dcontent }</td>
</tr>
</table>

<a href="/admin/doginfo/download?fileNo=${doginfoFile.d_fileno }">${doginfoFile.originName }</a>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${adminid eq viewDogInfo.adminid }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div><!-- .container end -->

<c:import url="../../layout/footer.jsp" />

















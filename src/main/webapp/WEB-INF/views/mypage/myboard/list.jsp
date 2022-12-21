<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../../layout/header.jsp" />

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>


<div class="container">

<h1>내가 쓴 글</h1>
		
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%;">글번호</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 20%;">조회수</th>
		<th style="width: 20%;">작성일</th>
	
	</tr>
</thead>

<tbody>
<c:forEach items="${listAll }" var="list">
	<tr>
	<c:choose>
		<c:when test="${list.type eq 'f' }">
			<td>${list.fno }</td>
		</c:when>
		
		<c:when test="${list.type eq 's' }">
			<td>${list.fno }</td>
		</c:when>
		<c:when test="${list.type eq 'r' }">
			<td>${list.fno }</td>
		</c:when>
	</c:choose>
	
		<td>${list.userid }</td>
		
	
	<c:choose>
		<c:when test="${list.type eq 'f' }">
			<td><a href="/community/free/view?fno=${list.fno }">${list.title }</a></td>
		</c:when>
		
		<c:when test="${list.type eq 's' }">
			<td><a href="/community/showview/sno=${list.fno }">${list.title }</a></td>
		</c:when>
		<c:when test="${list.type eq 'r' }">
			<td><a href="/community/recommend/view?rno=${list.fno }">${list.title }</a></td>
		</c:when>
	</c:choose>

		<td>${list.hit }</td>
		<td><fmt:formatDate value="${list.writedate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>

</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/myboardPaging.jsp" />

<c:import url="../../layout/footer.jsp" />


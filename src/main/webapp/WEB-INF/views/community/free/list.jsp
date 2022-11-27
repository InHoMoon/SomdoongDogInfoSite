<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/community/free/write"
	})
})
</script>

<style type="text/css">
.container {
	width: auto;
    padding: 57px 34px 0px;
}

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

<h1>자유게시판</h1>
<hr>

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix" style="padding-bottom: 15px;"></div>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%; text-align: center;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="fboard">
	<tr>
		<td>${fboard.fno }</td>
		<td id="title"><a href="/community/free/view?fno=${fboard.fno }">${fboard.title }</a></td>
<%-- 		<td>${fboard.title }</td> --%>
		<td>${fboard.userid }</td>
		<td>${fboard.hit }</td>
		<td><fmt:formatDate value="${fboard.writeDate }" pattern="yy-MM-dd HH:mm"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-default pull-right">글쓰기</button>
<div class="clearfix"></div>



<c:import url="/WEB-INF/views/community/free/paging_f.jsp" />

<!-- <form action="/community/list" method="post"> -->
<!-- 	<div class="search"> -->
<!-- 		<select class="search-op"> -->
<!-- 			<option>제목</option> -->
<!-- 			<option>작성자</option> -->
<!-- 		</select> -->
<!-- 		<input type="text" class="search-text"> -->
<!-- 		<button class="search-btn">검색</button> -->
<!-- 	</div> search -->
<!-- </form> -->

</div> <!-- container -->

<c:import url="../../layout/footer.jsp" />
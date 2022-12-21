<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/doginfo/write"
	})
})
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

.imgs {
	width: 40px;
	height: 40px;
}

</style>

<div class="container">

<h1><img class="imgs" src="/resources/img/연구소.jpg"/> 강아지 연구소</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
<!-- 		<th style="width: 20%;">작성자</th> -->
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="doginfo">
	<tr>
		<td>${doginfo.dno }</td>
		<td><a href="./view?dno=${doginfo.dno }">${doginfo.dtitle }</a></td>
<%-- 		<td>${doginfo.adminid }</td> --%>
		<td>${doginfo.dhit }</td>
		<td><fmt:formatDate value="${doginfo.dwritedate }" pattern="yy년 MM월 dd일"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary">글쓰기</button>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>



<c:import url="/WEB-INF/views/layout/adminpaging.jsp" />

</div><!-- .container -->

<c:import url="../../layout/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/notice/write"
	})
})
</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0; /* 모든 마진과 패딩 값 초기화*/
}

.title-wrap {

}
.title{
    font-family: 'Dongle';
    font-size: 40px;
  	font-style: normal;
  	font-weight: 300;
  	font-display: swap;
  	margin-left: 520px;
  	margin-top: 30px;
  	margin-bottom: 40px;
  	border-bottom: 2px solid #FFCD00;
  	width: 80px;
}
 
}


table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	text-align: justify;
}
</style>

<div class="container">

<div class="title">
공지사항
</div>


<table class="table table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.notiNo}</td>
		<td><a href="/notice/view?notiNo=${notice.notiNo }">${notice.notiTitle }</a></td>
		<td>${notice.adminId }</td>
		<td>${notice.notiHit }</td>
		<td><fmt:formatDate value="${notice.notiDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />
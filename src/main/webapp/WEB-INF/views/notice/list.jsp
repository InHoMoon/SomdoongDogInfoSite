<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Timestamp" %>

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
.title{
    font-family: 'Dongle';
    font-size: 40px;
  	font-style: normal;
  	font-weight: 300;
  	font-display: swap;
  	margin-left: 535px;
  	margin-top: 30px;
  	margin-bottom: 40px;
  	border-bottom: 2px solid #FFCD00;
  	width: 80px;
}
 
.table-wrap {
	width: 90%;
	margin-left: 80px;
	margin-bottom: 40px;
}
table {
	table-layout: fixed;
	border-collapse: collapse;
  	border-spacing: 0;
}
thead {
	display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
table, th {
	text-align: center;
}
td:nth-child(2) {
	text-align: left;
	text-align: justify;
}
#btnWrite {
	padding: 3px 12px;
    font-size: 12px;
    line-height: 20px;
    color: #fff;
    background-color: #FFCD00;
    border-color: #ccc;
    box-shadow: var(--color-btn-primary-shadow),var(--color-btn-primary-inset-shadow);
}

#searchForm{
   text-align : center; 
   margin-top: 5%;
   margin-bottom: 2%;
   margin-left: 50%;
}
#search {
	background-color: #FFCD00;
	color: #FFFFFF;
}

.page {
	padding: 5px 8px;
	border: 1px solid rgba(0,0,0,0.1);
	margin: 0;
	cursor: pointer;
	display: inline-block;
	
}

.curPage {
	font-weight: bold;
	color: #89E241;
	
}

#page_btn {
	margin-top: 3%;
	margin-bottom: 5%;
	margin-left: 40%;
	
}

select {
  width: 85px;
  height: 42px;
  border-radius: 10px;
  text-align: center;
  border: 1px solid #ADADB1;
}

select option {
  background: #E9F8E0;
  color: black;
  padding: 3px 0;
}

</style>

<div class="container">

<div class="title">
공지사항
</div>

<div class="table-wrap">
<table class="table table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 35%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 15%;">작성일</th>
		<th style="width: 10%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.notino}</td>
		<td><a href="/notice/view?notino=${notice.notino }">${notice.title }</a></td>
		<td>${notice.adminid }</td>
		<td><fmt:formatDate value="${notice.notidate }" pattern="yy-MM-dd"/></td>
		<td>${notice.hit }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class=" pull-right">글쓰기</button>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="../layout/paging.jsp" />

<input type="button" onclick="getSearchList()" class="btn btn-outline-primary mr-2" value="검색"><input>
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />
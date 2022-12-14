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

.search-wrap {
	margin-top: 10px;
	margin-left: 380px;
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

<div class="search-wrap">
<div id="searchForm">
   <form>
      <div class="selectBox">
   <select name="category">
       <option  hidden="" disabled="disabled" selected="selected" value="">선택</option>
       <option value="title">제목</option>
       <option value="content">내용</option>
     </select> 
     <input type="text" size="20" name="search" />&nbsp;
     <input type="submit" id="search" value="검색"/>
   </div>
    </form>
</div>
</div>
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){
		location.href="/mypage/write"
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
</style>

<div class="container">

<h1>게시판 리스트</h1>
<hr>

<table>
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 35%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="inquire">
<%-- <c:if test="${id == inquire.iUsername }"> --%>
	<tr>
		<td>${inquire.iCategory }</td>  
		<td>${inquire.iNum }</td>
		<td><a href="/mypage/view?iNum=${inquire.iNum }">${inquire.iTitle }</a></td>
		<td>${inquire.iUsername }</td>
		<td>${inquire.ihit }</td>
		<td><fmt:formatDate value="${inquire.iwriteDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
<%-- </c:if> --%>
</c:forEach>

</tbody>
</table>

<button id="btnWrite">글쓰기</button>


<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />

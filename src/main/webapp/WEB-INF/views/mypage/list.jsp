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


#btnWrite{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 5px;
    font-size: 14px;
    border: none;
    color: #555;
    border: 1px solid #ccc;
}


table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(3) {
	text-align: left;
}
</style>

<div class="container">

<h1>1대1 문의</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 10%;">글번호</th>
		<th style="width: 25%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>

	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="inquire">
	<tr>
		<td>${inquire.iCategory }</td>  
		<td>${inquire.iNum }</td>
		<td><a href="/mypage/view?iNum=${inquire.iNum }">${inquire.iTitle }</a></td>
		<td>${inquire.iUsername }</td>
		<td>${inquire.ihit }</td>
		<td><fmt:formatDate value="${inquire.iwriteDate }" pattern="yy-MM-dd"/></td>
	</tr>

</c:forEach>

</tbody>
</table>

<span class="pull-right">게시글 수 : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/mypageListPaging.jsp" />


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../../layout/header.jsp" />



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

<h1>1대1 문의</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 25%;">번호</th>
		<th style="width: 25%;">상품번호</th>
		<th style="width: 25%;">유저 아이디</th>
		<th style="width: 25%;">작성일</th>

	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="list">

	<tr>
		<td>${list.wishListNo }</td>  
		<td>${list.storeNo }</td>
		<td>${list.userid }</td>
		<td><fmt:formatDate value="${list.addDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>

</c:forEach>

</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/mypageListPaging.jsp" />

<a href="/mypage/myboard/list?userid=${userid }"> 내가쓴글</a>

</div><!-- .container -->

<c:import url="../../layout/footer.jsp" />

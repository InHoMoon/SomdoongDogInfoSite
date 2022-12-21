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

<h1>위시 리스트</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th stlye="widthd:20%;">사진</th>
		<th style="width: 20%;">상품번호</th>
		<th style="width: 20%;">상품명</th>
		<th style="width: 20%;">추가한 날짜</th>
		<th style="width: 20%;">삭제</th>
	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="list">

	<tr>
		<td><img src="/upload/${list.storeName }"></td>
		<td>${list.storeNo }</td>
		<td>${list.productName }
		<td><fmt:formatDate value="${list.addDate }" pattern="yy-MM-dd"/></td>
		<td><button class="btnDelete" data-wishListNo="${list.wishListNo}">삭제하기</button></td>
	</tr>

</c:forEach>

</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/mypagewishlistPaging.jsp" />


</div><!-- .container -->

<script type="text/javascript">
$(".btnDelete").on('click',function(e){
	e.stopPropagation();
    e.preventDefault();
    var wishListNo =  $(this).attr('data-wishlistno');
	location.href = "/mypage/wishlist/delete?wishListNo="+wishListNo;
});
</script>

<c:import url="../../layout/footer.jsp" />

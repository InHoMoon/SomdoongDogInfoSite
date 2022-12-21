<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$("#btnDelete").click(function() {
	location.href = "/mypage/purchase/delete?p_num=${purchase.pNum}"
})

</script>
<title>Insert title here</title>
</head>
<body>


<div class="container">

<h1>1대1 문의</h1>
<hr>
<form action="/mypage/purchase/delete" method="post">
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">pnum</th>
		<th style="width: 15%;">userid</th>
		<th style="width: 10%;">product_no</th>
		<th style="width: 10%;">p_amount</th>
		<th style="width: 20%;">PRICE</th>
		<th style="width: 25%;">상품명</th>
		<th style="width: 20%;">삭제</th>
	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.pNum }</td>  
		<td>${list.userid }</td>
			<td>${list.pAmount }</td>
			<td><a href="/mypage/view?pNum=${list.pNum }">${list.pAmount }</a></td>
			<td>${list.price }</td>
			<td>${list.pName }</td>			
			<td><button id="btnDelete" data-pNum="${list.pNum}">삭제하기</button></td>
		
		</tr>
		 
</c:forEach>
	
</tbody>
</table>
</form>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/mypagePurchasePaging.jsp" />


</div><!-- .container -->


</body>
</html>
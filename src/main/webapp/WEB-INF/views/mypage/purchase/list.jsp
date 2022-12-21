<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


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
		<th style="width: 20%;">구매자</th>
		<th style="width: 20%;">상품명</th>
		<th style="width: 20%;">수량</th>
		<th style="width: 20%;">가격</th>
		<th style="width: 20%;">삭제</th>
	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="list">
	<tr>
		 	<td>${list.userid }</td>
		 	<td>${list.pName }</td>	
			<td>${list.pAmount }</td>
<%-- 			<td><a href="/mypage/view?pNum=${list.pNum }">${list.pAmount }</a></td> --%>
			<td>${list.price }</td>
				
			<td><button class="btnDelete" data-pNum="${list.pNum}">삭제하기</button></td>
</c:forEach>
	
</tbody>
</table>
</form>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/mypagePurchasePaging.jsp" />


</div><!-- .container -->

<script type="text/javascript">
$(".btnDelete").on('click',function(e){
	e.stopPropagation();
    e.preventDefault();
    var pNum =  $(this).attr('data-pnum');
	location.href = "/mypage/purchase/delete?pNum="+pNum;
});
</script>

<c:import url="../../layout/footer.jsp" />
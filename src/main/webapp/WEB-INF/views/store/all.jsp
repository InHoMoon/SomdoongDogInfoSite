<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none !important;
	color: inherit;
}

#list-case {
 	margin: 25px;
	float: left;
}

li > img:hover {
	box-shadow: 2px 2px 10px #d3d3d3;
}


ul > li > img:hover {
	cursor: pointer;
}

#product-title {
	font-size: 40px;
	
	margin-bottom: 5px;
}

#product-price {
	font-size: 40px;
	font-weight: bold;
}

</style>
</head>
<body>

<div class="wrap-content">

<c:forEach items="${list }" var="list">
	<ul id="list-case">
		<li><img src="/resources/store_monster08.gif" onclick="location.href='/store/list/detail?storeNo=${list.storeNo }'" width="320px" height="200px"></li>
		<li id="product-title"><a href="/store/list/detail?storeNo=${list.storeNo }">${list.title }</a></li>
		<li style="font-size: 30px; line-height: 10px;">${list.product.productName }</li>
		<li id="product-price"><fmt:formatNumber value="${list.product.price }"/>원</li>
	</ul>
</c:forEach>

</div>

</body>
</html>
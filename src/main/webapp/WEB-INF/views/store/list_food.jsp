<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style: none;
	float: left;
}

a {
	text-decoration: none;
	color: inherit;
}

ul > li > img:hover {
	cursor: pointer;
}

#product-title {
	font-size: 20px;
/* 	font-weight: bold; */
	margin-bottom: 5px;
}

#product-price {
	font-size: 22px;
	font-weight: bold;
}

</style>
</head>
<body>

<h2>사료</h2>
<hr>

<!-- 반복 횟수가 4의 배수일때마다 줄바꿈 추가 -->

<c:forEach items="${foodList }" var="food">
<ul>
	<li><img src="/resources/monster08.gif" onclick="location.href='#'"></li>
	<li id="product-title"><a href="#">${food.title }</a></li>
	<li>${food.product.productName }</li>
	<li id="product-price"><fmt:formatNumber value="${food.product.price }"/>원</li>
</ul>
</c:forEach>

</body>
</html>
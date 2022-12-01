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
#food-list {
 	margin: 25px;
}

</style>
</head>
<body style="height: 100%;">

<div class="wrap-content">

<h3>의료</h3>

<c:forEach items="${list }" var="list">
	<ul id="food-list">
		<li><img src="/resources/monster08.gif" onclick="location.href='#'" width="300px" height="200px"></li>
		<li id="product-title"><a href="#">${list.title }</a></li>
		<li>${list.product.productName }</li>
		<li id="product-price"><fmt:formatNumber value="${list.product.price }"/>원</li>
	</ul>
</c:forEach>

</div>

</body>
</html>
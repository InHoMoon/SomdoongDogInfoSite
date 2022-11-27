<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</style>
</head>
<body>

<h2>사료</h2>
<hr>

<c:forEach items="${foodList }" var="food">
<ul>
	<li>사진</li>
	<li>${food.title }</li>
	<li>${food.productName }</li>
	<li>${food.price }</li>
	<li>추천수</li>
</ul>
</c:forEach>

</body>
</html>
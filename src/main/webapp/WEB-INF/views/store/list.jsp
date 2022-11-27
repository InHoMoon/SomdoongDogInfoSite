<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품 목록</h1>
<hr>

<table>
	<tr>
		<th>게시글번호</th>
		<th>상품번호</th>
		<th>제목</th>
		<th>설명</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>추천수</th>
	</tr>
<c:forEach items="${list }" var="sList">
	<tr>
		<td>${sList.storeNo }</td>
		<td>${sList.productNo }</td>
		<td>${sList.title }</td>
		<td>${sList.info }</td>
		<td>${sList.content }</td>
		<td>${sList.reportingDate }</td>
		<td>${sList.hit }</td>
		<td>${sList.likepost }</td>
	</tr>
</c:forEach>


</table>

</body>
</html>
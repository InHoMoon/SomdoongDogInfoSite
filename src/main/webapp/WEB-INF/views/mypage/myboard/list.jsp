<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		
<table>
<thead>
	<tr>
		<th style="width: 25%;">번호</th>
		<th style="width: 25%;">유저 아이디</th>
		<th style="width: 25%;">제목</th>
		<th style="width: 15%;">내용</th>
		<th style="width: 10%;">날짜</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${listAll }" var="list">
	<tr>
		<td>${list.num }</td>
		<td>${list.userid }</td>
		<td>${list.title }</td>
		<td>${list.content }</td>
		<td><fmt:formatDate value="${list.write_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>

</tbody>
</table>
</body>




</html>
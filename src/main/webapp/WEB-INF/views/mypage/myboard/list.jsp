<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../../layout/header.jsp" />
<h1>내가 쓴 글</h1>
		
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
		
	
	<c:choose>
		<c:when test="${list.type eq 'f' }">
			<td><a href="/mypage/view?iNum=${list.num }">${list.title }</a></td>
		</c:when>
		
		<c:when test="${list.type eq 's' }">
			<td><a href="/mypage/view?iNum=${list.num }">${list.title }</a></td>
		</c:when>
		<c:when test="${list.type eq 'r' }">
			<td><a href="/mypage/view?iNum=${list.num }">${list.title }</a></td>
		</c:when>
	</c:choose>
		<td>${list.content }</td>
		<td><fmt:formatDate value="${list.writedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>

</tbody>
</table>

<c:import url="../../layout/footer.jsp" />


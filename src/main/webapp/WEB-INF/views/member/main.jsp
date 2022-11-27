<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<div class="container">

<h1>메인 화면</h1>
<hr>

<c:choose>
	<c:when test="${empty login }">
		<a href="/member/login">로그인</a>
	</c:when>
	<c:when test="${not empty login }">
		<a href="/member/logout">로그아웃</a>
	</c:when>
</c:choose>

<hr>

<a class="btn btn-default" href="/community/free/list">목록</a>

<hr>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />

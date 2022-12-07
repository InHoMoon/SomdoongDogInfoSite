<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.keyword }">
<c:set var="searchParam" value="&searchType=${param.searchType }&keyword=${param.keyword }"/>
</c:if>

<div id="page_btn">

	<c:if test="${sPaging.curPage > 1 }">
		<li><a href="/community/free/list?curPage=${sPaging.curPage - 1 }${searchParam}">◀</a></li>	
		
<%-- 		<div class="page" onclick="location.href='/community/free/list?curPage=${sPaging.curPage - 1 }${searchParam}'">◀</div> --%>
	</c:if>
	
	<c:forEach begin="${sPaging.startPage}" end="${sPaging.endPage}" var="i">
		<c:if test="${sPaging.curPage eq i}">
			<li><a href="/community/free/list?curPage=${i}${searchParam}">${i}</a></li>
<%-- 			<div class="page curPage" onclick="location.href='/community/free/list?curPage=${i}${searchParam}'">${i}</div> --%>
		</c:if>
		<c:if test="${sPaging.curPage ne i}">
			<li><a href="/community/free/list?curPage=${i}${searchParam}">${i}</a></li>
<%-- 			<div class="page" onclick="location.href='/community/free/list?curPage=${i}${searchParam}'">${i}</div> --%>
		</c:if>
	</c:forEach>
	
	<c:if test="${sPaging.curPage < sPaging.totalPage}">
		<li><a href="/community/free/list?curPage=${sPaging.curPage +1 }${searchParam}">▶</a></li>	
<%-- 		<div class="page" onclick="location.href='/community/free/list?curPage=${sPaging.curPage +1 }${searchParam}'">▶</div> --%>
	</c:if>
	
</div>
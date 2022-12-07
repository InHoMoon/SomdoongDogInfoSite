<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="searchParam" value="&searchType=${sPaging.searchType }&keyword=${sPaging.keyword }"/>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${sPaging.curPage ne 1 }">
		<li><a href="/community/free/list?curPage=${sPaging.curPage - 1 }${searchParam}">&laquo;</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 (10개 앞으로 이동) --%>
	<c:if test="${paging.startPage ne 1 }">
		<li><a href="/community/free/list?curPage=${paging.startPage - paging.pageCount }">&lt; 이전</a></li>	
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${sPaging.startPage }" end="${sPaging.endPage }" var="i">
	<c:if test="${sPaging.curPage eq i }">
		<li class="active"><a href="/community/free/list?curPage=${i}${searchParam}">${i }</a></li>
	</c:if>
	<c:if test="${sPaging.curPage ne i }">
		<li><a href="/community/free/list?curPage=${i}${searchParam}">${i }</a></li>
	</c:if>
	</c:forEach>

	
	<%-- 다음 페이징 리스트로 이동 (10개 뒤로 이동) --%>
	<c:if test="${paging.endPage ne paging.totalPage }">
		<li><a href="/community/free/list?curPage=${paging.startPage + paging.pageCount }">다음 &gt;</a></li>	
	</c:if>
	

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/community/free/list?curPage=${paging.totalPage }">&raquo;</a></li>	
	</c:if>
	
	</ul>
</div>

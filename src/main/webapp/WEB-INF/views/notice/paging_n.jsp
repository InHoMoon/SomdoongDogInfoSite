<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/notice/list">&laquo;</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 (10개 앞으로 이동) --%>
	<c:if test="${paging.startPage ne 1 }">
		<li><a href="/notice/list?curPage=${paging.startPage - paging.pageCount }">&lt; 이전</a></li>	
	</c:if>
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/notice/list?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/notice/list?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이징 리스트로 이동 (10개 뒤로 이동) --%>
	<c:if test="${paging.endPage ne paging.totalPage }">
		<li><a href="/notice/list?curPage=${paging.startPage + paging.pageCount }">다음 &gt;</a></li>	
	</c:if>
	

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/notice/list?curPage=${paging.totalPage }">&raquo;</a></li>	
	</c:if>
	
	</ul>
</div>

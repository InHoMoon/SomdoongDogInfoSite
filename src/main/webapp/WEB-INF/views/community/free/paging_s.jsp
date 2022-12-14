<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 이전 페이징 리스트로 이동 (10개 앞으로 이동) --%>
	<c:if test="${sePaging.startPage ne 1 }">
		<li data-curpage="${sePaging.startPage - sePaging.pageCount }"><a>&lt; 이전</a></li>	
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${sePaging.startPage }" end="${sePaging.endPage }" var="i">
	<c:if test="${sePaging.curPage eq i }">
		<li class="active" data-curpage="${i}"><a>${i }</a></li>
	</c:if>
	<c:if test="${sePaging.curPage ne i }">
		<li data-curpage="${i}"><a>${i }</a></li>
	</c:if>
	</c:forEach>

	<%-- 다음 페이징 리스트로 이동 (10개 뒤로 이동) --%>
	<c:if test="${sePaging.endPage ne sePaging.totalPage }">
		<li data-curpage="${sePaging.startPage + sePaging.pageCount }"><a>다음 &gt;</a></li>	
	</c:if>
	
	</ul>
</div>

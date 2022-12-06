<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%; text-align: center;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${sList }" var="s">
	<tr>
		<td>${s.fno }</td>
		<td id="title"><a href="/community/free/view?fno=${s.fno }">${s.title }</a></td>
		<td>${s.userid }</td>
		<td>${s.hit }</td>
		<td><fmt:formatDate value="${s.writeDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>

<%-- <c:if test="${not empty param.keyword }"> --%>
<%-- <c:set var="searchParam" value="&searchType=${param.searchType }&keyword=${param.keyword }"/> --%>
<%-- </c:if> --%>

<!-- <div id="page_btn"> -->
<%-- 	<c:if test="${paging.curPage > 1 }"> --%>
<%-- 		<div class="page" onclick="location.href='/community/free/list?curPage=${paging.curPage - 1 }${searchParam}'">◀</div> --%>
<%-- 	</c:if> --%>
	
<%-- 	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"> --%>
<%-- 		<c:if test="${paging.curPage eq i}"> --%>
<%-- 			<div class="page curPage" onclick="location.href='/community/free/list?curPage=${i}${searchParam}'">${i}</div> --%>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${paging.curPage ne i}"> --%>
<%-- 			<div class="page" onclick="location.href='/community/free/list?curPage=${i}${searchParam}'">${i}</div> --%>
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>
	
<%-- 	<c:if test="${paging.curPage < paging.totalPage}"> --%>
<%-- 		<div class="page" onclick="location.href='/community/free/list?curPage=${paging.curPage +1 }${searchParam}'">▶</div> --%>
<%-- 	</c:if> --%>
<!-- </div> -->
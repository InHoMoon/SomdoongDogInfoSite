<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<input type="hidden" id="iptsTotal" value="${totalCnt}">

<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 35%; text-align: center;">제목</th>
			<th style="width: 20%;">작성자</th>
			<th style="width: 15%;">작성일</th>
			<th style="width: 10%;">조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${sList }" var="s">
		<tr>
			<td>${s.notino }</td>
			<td><a href="/notice/view?notino=${s.notino }">${s.ntitle }</a></td>
			<td>${s.adminid }</td>
			<td><fmt:formatDate value="${s.notidate }" pattern="yy-MM-dd"/></td>
			<td>${s.hit }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/notice/paging_s.jsp" />

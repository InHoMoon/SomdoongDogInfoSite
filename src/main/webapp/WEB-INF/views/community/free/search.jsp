<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<input type="hidden" id="iptsTotal" value="${totalCnt}">

<table class="table table-striped table-hover table-condensed">
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
			<td id="title">
				<a href="/community/free/view?fno=${s.fno }">${s.title }&nbsp;</a>
				<c:if test="${s.fiCnt > 0 }">
					<img src="/resources/picture.png" style="width: 15px; height: 17px;">
				</c:if>
				<span style="color: tomato;">[${s.commCnt }]</span>
			</td>
			<td>${s.userid }</td>
			<td>${s.hit }</td>
			<td><fmt:formatDate value="${s.writeDate }" pattern="yy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/community/free/paging_s.jsp" /> 

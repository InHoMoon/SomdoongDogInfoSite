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
			<th style="width: 15%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 10%;">좋아요</th>
			<th style="width: 10%;">작성일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${sList }" var="s">
		<tr>
			<td style="text-align: center; line-height: 5;">${s.rno }</td>
<!-- 			<td id="title" style="line-height: 5;"> -->
			<td id="title">
				<c:if test="${not empty s.fiName }">
<%-- 					<img src="/upload/${rboard.fiName }" style="width: 80px; height: 80px;"> --%>
					<div class="imgBox" style="background-image: url('/upload/${s.fiName }');"></div>
				</c:if>
				
				<c:if test="${s.fiName eq null }">
					<img src="/resources/img/pic.png" style="width: 80px; height: 80px;">
				</c:if>
				<a href="/community/recommend/view?rno=${s.rno }">${s.title }</a>
			</td>
			<td style="text-align: center; line-height: 5;">${s.userid }</td>
			<td style="text-align: center; line-height: 5;">${s.hit }</td>
			<td style="text-align: center; line-height: 5;">
				<img src="/resources/img/heart.png" style="width: 17px; height: 17px;"></div>
				${s.likeCnt }
			</td>
			<td style="text-align: center; line-height: 5;"><fmt:formatDate value="${s.writeDate }" pattern="yy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/community/recommend/paging_s.jsp" /> 

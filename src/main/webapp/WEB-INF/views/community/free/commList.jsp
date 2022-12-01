<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		
<style>
#listContent{
 	border-bottom: 1px solid #e8e8e8;
    margin-bottom: 10px;
    padding-bottom: 12px;
    width: 1018px;
    display: inline-block;
}

#btnModify{ float: right; border: none; background: none; }

.pagingC { text-align: center; }
.pagingC > li{ display: inline-block; }

</style>



<!-- 댓글 목록 -->
<c:forEach var="row" items="${list}">
<strong><span id="listUserid">${row.userid }(<fmt:formatDate value="${row.commDate}" pattern="yyyy.MM.dd HH:mm"/>)</span></strong><br>

<span id="listContent">
	${row.commContent }
	<c:if test="${sessionScope.userid == row.userid}">
		<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.cno}')">
	</c:if>
</span><br>


<!-- 댓글 수정 영역-->
<div id="modifyReply"></div>
</c:forEach>

<br>

<!-- <div class="text-center"> -->
<!-- 	<ul class="pagination pagination-sm"> -->
<div>
	<ul class="pagingC">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${commPaging.curBlock > 1}">
			<li><a href="javascript:listReplyRest('1')">처음</a></li>
			<a href="javascript:listReplyRest('1')">[처음]</a>
		</c:if>
		
		<%-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 --%>
		<c:if test="${commPaging.curBlock > 1}">
			<li><a href="javascript:listReplyRest('${commPaging.prevPage}">[이전]</a></li>
			<a href="javascript:listReplyRest('${commPaging.prevPage}')">[이전]</a>
		</c:if>
		
		<%-- 페이지 블럭 처음부터 마지막 블럭까지 --%>
		<c:forEach var="num" begin="${commPaging.blockBegin}" end="${commPaging.blockEnd}">
			<c:choose>
				<c:when test="${num == commPaging.curPage}">
					<li>${num}&nbsp;</li>
				</c:when>
				
				<c:otherwise>
					<li><a href="javascript:listReplyRest('${num}')">${num}</a>&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 --%>
		<c:if test="${commPaging.curBlock <= commPaging.totBlock}">
			<li><a href="javascript:listReplyRest('${commPaging.nextPage}')">[다음]</a><li>
		</c:if>
		
		<%-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 --%>
		<c:if test="${commPaging.curBlock <= commPaging.totBlock}">
			<li><a href="javascript:listReplyRest('${commPaging.totPage}')">[끝]</a></li>
		</c:if>
	
	</ul>
</div>



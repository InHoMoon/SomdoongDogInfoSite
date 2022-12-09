<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<style type="text/css">

.all {
	padding: 57px 91px 0px;
    margin: 0 auto;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
}

/* 제목, 작성자, 작성일, 조회수 영역 */
.title_area {
	margin: 0 0 7px;
    padding-bottom: 15px;
    border-bottom: 1px solid #efefef;
}

/* 작성자, 작성일, 조회수 */
.post_info{
	font-size: 13px;
    color: #a7a7a7;
}

/* 수정, 삭제 */
.up-delete{
	display: inline-block;
    float: right;
}

/* 작성자, 작성일, 조회수 사이에 있는 | 표시 */
.text_bar{
	margin: 0 9px 0 5px;
	display: inline-block;
    width: 1px;
    height: 9px;
    background-color: #ebebeb;
}

/* 첨부파일 영역 */
.file-area{
	display: inline-block;
    float: right;
    font-size: 13px;
}

/* 글 내용 */
.view_area{
	color: #5c5c5c;
    word-wrap: break-word;
    margin-top: 30px;
}


/* 목록버튼 */
.btnList{
    width: 80px;
    height: 32px;
    padding: 0;
    border: 1px solid rgba(185,185,185,5);
    border-radius: 16px;
    line-height: 30px;
    color: inherit;
    box-sizing: border-box;
    background: none;
}

</style>



<div class="all">

	<div class="title_area">
			
			<span class="post_info" style="font-size: 12px;">식당추천</span>
			<h3 style="margin-top: 8px;">${rboard.title }</h3>
			
			<span class="post_info">${rboard.userid }</span>
			<span class="text_bar"></span>
			<span class="post_info"><fmt:formatDate value="${rboard.writeDate }" pattern="yyyy.MM.dd HH:mm"/></span>
			<span class="text_bar"></span>
			<span class="post_info">조회 ${rboard.hit }</span>
			
			
			<c:if test="${userid eq rboard.userid }">
				<span class="up-delete">
					<a href="/community/recommend/update?fno=${rboard.rno }" id="update">수정</a>
					<span class="text_bar"></span>
					<a href="/community/recommend/delete?fno=${rboard.rno }" style="color: #f84720;">삭제</a>
				</span>
			</c:if>
		
	</div> <!-- title_area -->
	
	<div class="file-area">
		<c:if test="${not empty rboardFile }">
		<span><img src="/resources/download.png" style="width: 15px; height: 17px;"></span>
			<a href="/community/recommend/download?fFileno=${rboardFile.fFileno }">${rboardFile.originName }</a>
		</c:if>
	</div> <!-- file=area -->
	
	<div style="padding-bottom: 30px;"></div>
	
	<div class="view_area">
		<div class="view">
				<p>${rboard.content }</p>
				<c:if test="${not empty rboardFile }">
				<img src="/upload/${rboardFile.storedName }" style="width: 40%; height: auto;">
				</c:if>
		</div>
	</div> <!-- view_area -->
</div> <!-- all -->



<c:import url="../../layout/footer.jsp" />


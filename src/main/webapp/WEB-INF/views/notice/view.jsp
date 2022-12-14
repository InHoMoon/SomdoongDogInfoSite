<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/notice/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/notice/update?notino=${viewNotice.notino }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/notice/delete?notino=${viewNotice.notino }"
	})
})
</script>

<style type="text/css">

.title{
    font-family: 'Dongle';
    font-size: 40px;
  	font-style: normal;
  	font-weight: 300;
  	font-display: swap;
 	margin-left: 535px;
  	margin-top: 30px;
  	margin-bottom: 40px;
  	border-bottom: 2px solid #FFCD00;
  	width: 80px;
}

.layout-content {
    width: 860px;
    margin: 0px auto;
}

.content-wrap {
    position: relative;
    width: 860px;
    margin: 0px auto;
    font-size: 12px;
}
.content-box {
	padding: 29px 29px 0;
    border: 1px solid #ccc;
    border-radius: 6px;
}

.content-header {
	position: relative;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #ccc;
}

.content-title {
	margin-bottom: 15px;
    font-size: 13px;
}

.content-title_area {
	margin-top: 10px;
}

.content-title_areaText {
	font-weight: 400;
    font-size: 26px;
    overflow-wrap: break-word;
    word-break: break-word;
}

.content-info {
	display: block;
}

.content-info_area {
	display: block;
}

.content-info_areaId {
	font-size: 15px;
    line-height: 13px;
	float: left;
}

.content-info_areaDate {
	font-size: 15px;
    line-height: 13px;
    color: #ccc;
    float: right;
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

.content-main {
	display: block;
	margin-bottom:10px;
}

.btn-list {
	display: inline-block;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
    background: #80ff00;
}

.btn-update {
	display: inline-block;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
    background: #00994c;
}

.btn-delete {
	display: inline-block;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
    background: #ff0000;
}



#btn:hover { 
   background: #3A7F03; 
}

.btn-wrap {
	margin-top: 15px;
	margin-bottom: 15px;
}

</style>

<div class="container">

<div class="title">
공지사항
</div>

<div class="layout-content">
<div class="content-wrap">

<div class="content-box">

	<div class="content-header">
		<div class="content-title">
			<div class="content-title_area">
				<div class="content-title_areaText">${viewNotice.ntitle }</div>
			</div>
		</div>
			<div class="content-info">
				<div class="content-info_area">
					<div class="content-info_areaId">${viewNotice.adminid }</div>
					<div class="content-info_areaDate"><fmt:formatDate value="${viewNotice.notidate }" pattern="yy-MM-dd"/></div>
				</div>
			</div>
	</div>
			<div class="file-area">
				<c:if test="${not empty noticeFile }">
					<span><img src="/resources/img/download.png" style="width: 15px; height: 17px;"></span>
					<a href="/notice/download?fileNo=${noticeFile.fileNo }">${noticeFile.originName }</a>
				</c:if>
			</div> <!-- file=area -->
	
	<div style="padding-bottom: 30px;"></div>
	
	<div class="view_area">
		<div class="view">
				<c:if test="${not empty noticeFile }">
				<img src="/upload/${noticeFile.storedName }" style="width: 40%; height: auto;">
				</c:if>
		</div>
	</div> <!-- view_area -->
	
	
			<div class="content-main">${viewNotice.ncontent }</div>
	
</div>

<div class="btn-wrap">
	<div class="text-center">
			<button id="btnList" class="btn btn-default btn-list">목록</button>

			<c:if test="${adminid eq viewNotice.adminid }">
				<button id="btnUpdate" class="btn btn-primary btn-update">수정</button>
				<button id="btnDelete" class="btn btn-danger btn-delete">삭제</button>
			</c:if>
		</div>
</div>
		
</div>
</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />

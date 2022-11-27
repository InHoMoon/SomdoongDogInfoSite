<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<style type="text/css">

.all {
	width: auto;
    padding: 57px 34px 0px;
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

/* 하트, 목록 영역 */
.like_list{
	padding: 35px 0;
    position: relative;
    clear: both;
}

/* 하트이미지 들어가는 영역 */
.like{
	float: left;
    padding: 0 9px;
    border-radius: 16px;
    border: 1px solid #959595;
    border-color: rgba(185,185,185,0.5);
    width: 80px;
    height: 32px;
    margin-right: 10px;
}

/* 하트 이미지 */
.heart {
	width: 20px;
    height: 20px;
    position: relative;
    left: 18px;
    top: 4px;
}

/* 목록버튼 */
.btnList{
    width: 80px;
    height: 32px;
    padding: 0;
    border: 1px solid rgba(185,185,185,.5);
    border-radius: 16px;
    line-height: 30px;
    color: inherit;
    box-sizing: border-box;
    background: none;
}


/* 총 댓글 갯수 Comments */
.comm_num{
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}

/* 댓글 작성 전체 영역(회색배경) */
.comm_box{
	border-top: 1px solid #e8e8e8;
    background-color: #fafafa;
    position: relative;
    height: 200px;
    border-bottom: 1px solid #e8e8e8;
}

/* 댓글 작성자 아이디 */
.writer_info{
	margin-bottom: 5px;
    position: relative;
    left: 13px;
}

/* 댓글 input 감싸는 흰색 영역 */
.write_area{
	position: relative;
    left: 13px;
    padding: 7px 12px;
    border: 1px solid #e8e8e8;
    background-color: #fff;
    height: 130px;
    width: 1002px;
}

/* 댓글 input창 */
#comm{
	width: 100%;
    height: 70px;
    border: none;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
}

/* 댓글 등록 버튼 */
#commBtn{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 10px;
    font-size: 13px;
    border: none;
    background-color: #6bacce;
    color: #fff;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
	$(".like").click(function(){
		console.log("좋아요 클릭");
// 		$(".heart").attr("src", "https://cdn-icons-png.flaticon.com/512/7757/7757506.png");
		
		if ( $(".heart").attr("src") == "https://cdn-icons-png.flaticon.com/512/8719/8719659.png")  {
			$(".heart").attr("src", "https://cdn-icons-png.flaticon.com/512/7757/7757506.png");
			console.log("좋아요 클릭");
		} else {
			$(".heart").attr("src", "https://cdn-icons-png.flaticon.com/512/8719/8719659.png"); 
			console.log("좋아요 취소");
		}
	})
	
	$(".btnList").click(function() {
		location.href = "/community/free/list"
	})

})
</script>

<div class="all">

	<div class="title_area">
			
			<span class="post_info" style="font-size: 12px;">자유게시판</span>
			<h3 style="margin-top: 8px;">${fboard.title }</h3>
			
			<span class="post_info">${fboard.userid }</span>
			<span class="text_bar"></span>
			<span class="post_info"><fmt:formatDate value="${fboard.writeDate }" pattern="yyyy.MM.dd HH:mm"/></span>
			<span class="text_bar"></span>
			<span class="post_info">조회 ${fboard.hit }</span>
			
			
			<c:if test="${userid eq fboard.userid }">
				<span class="up-delete">
					<a href="/community/free/update?fno=${fboard.fno }" id="update">수정</a>
					<span class="text_bar"></span>
					<a href="/community/free/delete?fno=${fboard.fno }" style="color: #f84720;">삭제</a>
				</span>
			</c:if>
		
	</div> <!-- title_area -->
	
	<div class="file-area">
		<c:if test="${not empty fboardFile }">
		<span style="color: #a7a7a7;"> 첨부파일명 : 
			<a href="/community/free/download?fFileno=${fboardFile.fFileno }">${fboardFile.originName }</a>
		</span>
		</c:if>
	</div>
	
	
	<div class="view_area">
		<div class="view">
				<p>${fboard.content }</p>
		</div>
	</div> <!-- view_area -->
		
		
	<div class="like_list">
		<div class="like">
			<img src="https://cdn-icons-png.flaticon.com/512/8719/8719659.png" class="heart">
<!-- 				<span class="heart"><img src="https://cdn-icons-png.flaticon.com/512/7757/7757506.png"></span> -->
		</div>
		
<!-- 		<div class="list"> -->
<!-- 			<button class="btnList">목록</button> -->
<!-- 		</div> -->
	</div> <!-- like_list -->
		
		
<!-- 	<div class="file-area"> -->
<%-- 		<a href="/community/free/download?fFileno=${fboardFile.fFileno }">${fboardFile.originName }</a> --%>
<!-- 	</div> -->
	
		
	
</div> <!-- all -->



<!-- 댓글입력창 -->
<div class="comm_area" style="padding: 0 34px 30px;">

	<strong class="comm_num">
		<span>1</span> Comments
	</strong>

	<div class="comm_box" style="padding-top: 10px;">
		<div class="writer_info" style="margin-bottom: 5px;">
			<span>${userid }</span>
		</div>
		
		<div class="write_area">
			<textarea id="comm" name="comm" placeholder="댓글을 입력해주세요"></textarea>
			<button id="commBtn">등록</button>
		</div>
	</div> <!-- comm_box -->
	
</div> <!-- comm_area -->

<c:import url="../../layout/footer.jsp" />
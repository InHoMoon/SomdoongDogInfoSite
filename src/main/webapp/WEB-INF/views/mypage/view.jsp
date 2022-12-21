<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/mypage/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/mypage/update?iNum=${viewInquire.iNum }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/mypage/delete?iNum=${viewInquire.iNum }"
	})
})
</script>

<style type="text/css">

*{
	margin : 0;
	padding : 0;
	
}

ul ,li{
	list-style:none;
}

a{
	text-decoration:none;
	color:inherit;
}

.board_wrap{
	width:1000px;
	margin: 100px auto;
}

.board_title{
	margin-bottom:30px;
}

.board_title strong{
	font-size : 3rem;
}

.bt_wrap{
	margin-top : 30px;
	text-align:center;
}

.bt_wrap button{
	display:inline-block;
	min-width:80px;
	padding:10px;
	border:1px solid #000;
	border-radius:2px;
	margin-left:10px;

}

.board_view{
	width:100%;
	border-top:2px solid #000;
}

.board_view .title{
	padding:20px 15px;
	border-bottom:1px dashed #ddd;
	font-size:2rem;
}
.board_view .info{
	display:inline-block;
	padding:15px;

/* 	font-size:0; */
}

.board_view .info dl{
	display:inline-block;
	padding:0 20px;
	border-right:1px solid #000;
}

.board_view .info dl:first-child{
	padding-left:0;
}

.board_view .info dl dt,
.board_view .info dl dd{
	display:inline-block
 	font-size:1.4rem;
}

.board_view .info dl dt{
display:inline-block;
}

.board_view .info dl dd{
	display:inline-block;	
	margin-left:10px;
	color:#777;
}


.board_view .cont{
	padding:15px;
	border-top:1px solid #999;
	border-bottom:1px solid #000;
	line-height:160%;
	font-size:1.4rem;
}
</style>

<div class="board_wrap">
	
	<div class="board_title">
		<strong>1대1 문의 내역</strong>
	</div>
	
	<div class="board_view_wrap">
		<div class="board_view">
			<div class="title">
		
			제목 :  ${viewInquire.iTitle }
	
				
			</div>		
			
			<div class="info">
				<dl>
					<dt>카테고리</dt>
					<dd> ${viewInquire.iCategory }</dd>
					
				</dl>
						
				<dl>
					<dt>닉네임</dt>
					<dd> ${viewInquire.iUsername }</dd>	
				</dl>
						
				<dl>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${viewInquire.iwriteDate }" pattern="yy-MM-dd"/></dd>	
				</dl>
				
				<dl>
					<dt>조회수</dt>
					<dd>${viewInquire.ihit }</dd>	
				</dl>

			
			</div>
			
			<div class="cont">
			
				 본문  ${viewInquire.iContent }

			</div>
		
			첨부파일: 
			<a href="/mypage/download?iFileno=${iBoardFile.iFileno }">
 			${iBoardFile.iOriginName }
			</a>
		</div>

		
		<div class="bt_wrap">
				<button id="btnList"  class="btn btn-default">목록</button>
			<c:if test="${userid eq viewInquire.iUserid }">
				<button id="btnUpdate"  class="btn btn-primary" >수정</button>
				<button id="btnDelete"  class="btn btn-danger" >삭제</button>
			</c:if>
	
		</div>
		
	
	</div>



</div>
<c:import url="../layout/footer.jsp" />

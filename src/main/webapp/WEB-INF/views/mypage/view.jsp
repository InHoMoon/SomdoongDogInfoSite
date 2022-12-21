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

$(document).ready(function() {

	cCount();
    listReplyRest("1");
	

	//댓글등록
	$("#replyBtn").click(function(){
		
		//변수 선언
		var iNum = ${inquire.iNum};
		var replyContent = $("#replyContent").val().replace("\n", "<br>");
		
		
		if(replyContent == ""){
			alert("내용을 입력하세요");
			return;
		}
		
		$.ajax({
			url : "/mypage/Cwrite"
			, type : "POST"
			, data : { "iNum" : iNum, "replyContent" : replyContent }
			, dataType : "text"
			, success : function(data){
				if(data == "success"){   
					
					console.log("댓글 등록 완료");
					cCount();
					listReplyRest("1");
					
				} else {
					console.log("댓글 등록 실패");
				}
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		}); //ajax end
	
		$("#replyContent").val("");
		
	}); // click end
	
}) // document end




function cCount(){
	$.ajax({
		url : "/mypage/cCount?iNum=${inquire.iNum}"
		, type : "get"
		, contentType : "application/json"
		, success : function(res){
			console.log(res);
			
			if(res > 0){
				$("#cCnt").html(res);
			} else {
				$("#cCnt").html("0");
			}
			
		}
			
	}); //ajax end
} //cCount end




//댓글 목록
function listReplyRest(num){
    $.ajax({
        type: "get",
        url: "/mypage/Clist?iNum=${inquire.iNum}&curPage="+num,
        success: function(result){
            $(".reply_result").html(result);
        }
    });
}// listReplyRest end



//댓글 수정화면 생성
function showReplyModify(incno,comment,target){
	
	console.log("수정 버튼 클릭");
	
	$("#reply_txt"+ incno).hide(); //댓글
	
	$(".bm_btn_" + incno).hide(); //수정버튼
	$("#rplyDelete_" + incno).hide(); //삭제버튼
	$("#text_bar2_" + incno).hide(); // |
	
	//- txt el 생성
	console.log($(target).next())
	$(target).next().find(".textarea_wrap").html('<textarea id="detailReplyContent" rows="5" cols="82">' + comment + '</textarea>');
	$("#mw_" + incno).show();

}

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

/* 댓글영역 전체 */
.reply_area{
	padding: 0 91px 30px;
	padding-top: 100px;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
    color: #5c5c5c;
}

/* 총 댓글 갯수 Comments */
.reply_num{
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}

/* 댓글 목록 영역 */
.reply_list{
	width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    padding-bottom: 30px;
}


/* 댓글 작성 전체 영역(회색배경) */
.reply_box{
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
    min-width: 820px;
    max-width: 820px;
}

/* 댓글 input창 */
#replyContent{
	width: 100%;
    height: 70px;
    border: none;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
}

/* 댓글 등록 버튼 */
#replyBtn{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 10px;
    font-size: 13px;
    border: none;
    background-color: #6bacce;
    color: #fff;
}

#detailReplyContent{
	width: 1016px;
    height: 98px;
  	padding: 7px 12px;
    border: 1px solid #e8e8e8;
    resize: none;
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
	
	<!-- 댓글 영역 -->
	<div class="reply_area">
	<form method="POST" id="replyForm" name="replyForm">
	
		<strong class="reply_num" style="font-size: 30px;">
			<img src="/resources/img/comm.png" style="width: 40px; height: 40px;"> <span id="cCnt"></span> Comments
		</strong>
		
		
		<!-- 댓글 목록 영역 -->
		<div class="reply_result">
		</div>
	
	
		<!-- 댓글 등록 영역 -->
		<c:if test="${not empty adminid }">
		<div class="reply_box" style="padding-top: 10px;">
		
			<div class="writer_info" style="margin-bottom: 5px;">
				<strong><span id="adminid">${adminid }</span></strong>
			</div>
			
			<div class="write_area">
				<textarea id="replyContent" name="replyContent" placeholder="댓글을 입력해주세요"></textarea>
				<button id="replyBtn" type="button">등록</button>
			</div>
		</div> <!-- reply_box -->
		</c:if>
		
	</form>
	</div> <!-- reply_area -->



</div>
<c:import url="../layout/footer.jsp" />

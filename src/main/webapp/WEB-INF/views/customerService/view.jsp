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

/* 댓글영역 전체 */
.comm_area{
	padding: 0 91px 30px;
	padding-top: 100px;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
    color: #5c5c5c;
}

/* 총 댓글 갯수 Comments */
.comm_num{
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}

/* 댓글 목록 영역 */
.comm_list{
	width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    padding-bottom: 30px;
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
    min-width: 980px;
    max-width: 980px;
}

/* 댓글 input창 */
#commContent{
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

#detailReplyContent{
	width: 1016px;
    height: 98px;
  	padding: 7px 12px;
    border: 1px solid #e8e8e8;
    resize: none;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/customService/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/customService/update?iNum=${viewInquire.iNum }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/customService/delete?iNum=${viewInquire.iNum }"
	})
})

$(document).ready(function() {

	cCount();
    listReplyRest("1");
	

	//댓글등록
	$("#commBtn").click(function(){
		
		//변수 선언
		var inum = ${inquire.iNum};
		var replyContent = $("#replyContent").val().replace("\n", "<br>");
		
		
		if(replyContent == ""){
			alert("내용을 입력하세요");
			return;
		}
		
		$.ajax({
			url : "/customerService/Cwrite"
			, type : "POST"
			, data : { "inum" : iNum, "replyContent" : replyContent }
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
		url : "/customerService/cCount?inum=${inquire.iNum}"
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
        url: "/customerService/Clist?inum=${inquire.iNum}&curPage="+num,
        success: function(result){
            $(".comm_result").html(result);
        }
    });
}// listReplyRest end



//댓글 수정화면 생성
function showReplyModify(incno,comment,target){
	
	console.log("수정 버튼 클릭");
	
	$("#comm_txt"+ incno).hide(); //댓글
	
	$(".bm_btn_" + incno).hide(); //수정버튼
	$("#rplyDelete_" + incno).hide(); //삭제버튼
	$("#text_bar2_" + incno).hide(); // |
	
	//- txt el 생성
	console.log($(target).next())
	$(target).next().find(".textarea_wrap").html('<textarea id="detailReplyContent" rows="5" cols="82">' + comment + '</textarea>');
	$("#mw_" + incno).show();

}
</script>

<h1>1대1문의</h1>
<hr>

<table>
<tr>
	<td class="info">글번호</td><td>${viewInquire.iNum }</td>
</tr>

<tr>
	<td> 카테고리 :</td><td> ${viewInquire.iCategory } </td>
	<td> 아이디 :</td><td> ${viewInquire.iUserid } </td>	
	<td> 이름 : </td> <td> ${viewInquire.iUsername } </td>
</tr>

<tr>
	<td class="info"> 조회수 :</td> <td>${viewInquire.ihit }</td>
	<td class="info"> 작성일 :</td> <td><fmt:formatDate value="${viewInquire.iwriteDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info"> 제목 :</td> <td>${viewInquire.iTitle }</td>
</tr>

<tr>
	<td class="info"> 본문내용 : </td> <td>${viewInquire.iContent }</td>
</tr>
</table>

첨부파일: 
<a href="/mypage/download?iFileno=${iBoardFile.iFileno }">
 ${iBoardFile.iOriginName }
</a>

<div>

	<button id="btnList">목록</button>
	
	<c:if test="${userid eq viewInquire.iUserid }">
	<button id="btnUpdate">수정</button>
	<button id="btnDelete" >삭제</button>
	</c:if>
	
</div>

<!-- 댓글 영역 -->
<div class="comm_area">
<form method="POST" id="commForm" name="commForm">

	<strong class="comm_num" style="font-size: 30px;">
		<img src="/resources/img/comm.png" style="width: 40px; height: 40px;"> <span id="cCnt"></span> Comments
	</strong>
	
	
	<!-- 댓글 목록 영역 -->
	<div class="comm_result">
	</div>


	<!-- 댓글 등록 영역 -->
	<c:if test="${not empty adminid }">
	<div class="comm_box" style="padding-top: 10px;">
	
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="adminid">${adminid }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="commContent" name="commContent" placeholder="댓글을 입력해주세요"></textarea>
			<button id="commBtn" type="button">등록</button>
		</div>
	</div> <!-- comm_box -->
	</c:if>
	
</form>
</div> <!-- comm_area -->



<c:import url="../../layout/footer.jsp" />


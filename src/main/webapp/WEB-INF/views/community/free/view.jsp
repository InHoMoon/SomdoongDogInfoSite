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

/* 하트, 목록 영역 */
.like_list{
	padding: 35px 0;
    position: relative;
    clear: both;
}

/* 하트이미지 들어가는 영역 */
.like{
	margin: 20px 0px;
    text-align: center;
}

/* 하트 이미지 */
.heart {
    width: 40px;
    height: 40px;
    position: relative;
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

/* 댓글영역 전체 */
.comm_area{
	padding: 0 91px 30px;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
}

/* 총 댓글 갯수 Comments */
.comm_num{
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}

.comm_list{
	width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    padding-bottom: 30px;
}

#list_content{
	border-bottom: 1px solid #e8e8e8;
    padding-bottom: 10px;
    width: 1018px;
    display: inline-block;
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
</style>


<script type="text/javascript">
$(document).ready(function() {
	
//댓글 리스트 가져오는 함수
getList2();
	
	//댓글등록 -  [등록]버튼 클릭 시
	$("#commBtn").click(function(){
		
		//변수 선언
		var bno = ${fboard.fno};
		var commContent = $("#commContent").val().replace("\n", "<br>");
		
		
		//로그인 여부 검사
		if(${empty userid}){
			alert("로그인 후 이용해주세요");
			$("#commContent").val("");
			return;
		} else if(commContent == "") {
			alert("내용을 입력하세요");
		}
			
		$.ajax({
			url : "/community/free/writeC"
			, type : "POST"
			, data : { "bno" : bno, "commContent" : commContent }
			, dataType : "text"
			, success : function(data){
				if(data == "success"){        
					console.log("댓글 등록 완료");
					getList2();
				} else {
					console.log("댓글 등록 실패");
				}
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		}); //ajax end
	
		$("#commContent").val("");
		
	}); // click end
}) // document end


function getList(){
	$.ajax({
		url : "/community/free/listC?bno=${fboard.fno}"
		, type : "get"
		, success : function(res){
			$(".comm_result").html(res);
		}
	}); //ajax end
}// getList end


//댓글 리스트 조회 함수 (json방식)
function getList2(){
	$.ajax({
		url : "/community/free/listJson?bno=${fboard.fno}"
		, type : "get"
		, contentType : "application/json"
		, success : function(res){
			console.log(res);
			
			if(res.total > 0){
				var list = res.list;
// 				var userid = '${fboard.userid}';
				var userid = '${sessionScope.userid}';
				
				var output = "<div>";
				
				$("#cCnt").html(res.total);
				for(i = 0; i < list.length; i++){
					output += "<div><span id='comm_userid'><strong>" + list[i].userid + "</strong></span><br/>";
					output += "<span id='comm_content'>" + list[i].commContent + "</span>";
					
// 					if(list[i].userid == userid){
					if(${userid eq list[i].userid}){
// 						output += "<span id='delete' style='cursor:pointer;' data-id ="+list[i].comContent+">[삭제]</span><br></div><hr>";
						output += " <span id='updelete'><button type='button' id='updateBtn'>수정</button> <button id='deleteBtn'>삭제</button></span><br></div><hr>";
						 
					}
					else{
						output += "</div><hr>";
					}
					
				} //for end
				$(".comm_result").html(output);
				
			} else {
				var output = "<div>등록된 댓글이 없습니다.</div>";
				$(".comm_result").html(output);
			}
		}
			
	}); //ajax end
} //getList2 end


//댓글 수정화면 생성 함수
function showModify(cno){
	$.ajax({
		type: "get",
		url: "/community/free/detailC"+cno,
		success: function(res){
			$("#comm_modify").html(res);
			// 태그.css("속성", "값")
			$("#comm_modify").css("visibility", "visible");
		}
	})
}


$("#updateBtn").click(function(){
	showModify();
	console.log("수정버튼 클릭");
	
}); //updateBtn


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
	</div> <!-- file=area -->
	
	
	<div class="view_area">
		<div class="view">
				<p>${fboard.content }</p>
		</div>
	</div> <!-- view_area -->
		
		
	<div class="like_list">
		<div class="like">
			<img src="/resources/empty_heart.png" class="heart">
		</div>
	</div> <!-- like_list -->
		
		
		
	
</div> <!-- all -->

<!-- 댓글입력창 -->
<div class="comm_area">
<form method="POST" id="commForm" name="commForm">

	<strong class="comm_num">
		<span id="cCnt"></span> Comments
	</strong>
	
	<!-- 댓글 목록 영역 -->
	<div class="comm_result">
<%-- 		<strong><span id="list_userid" style="display: hidden;">${list.userid }</span></strong> --%>
<%-- 		<span id="list_content" style="display: hidden;">${list.comContent }</span> --%>
	</div>

	<div class="comm_box" style="padding-top: 10px;">
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="userid">${userid }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="commContent" name="commContent" placeholder="댓글을 입력해주세요"></textarea>
			<button id="commBtn" type="button">등록</button>
		</div>
	</div> <!-- comm_box -->
	
</form>
</div> <!-- comm_area -->

<!-- <div class="box-footer"> 페이지네이션 -->
<!-- 	<div class="text-center"> -->
<!-- 		<ul class="pagination pagination-sm no-margin"> -->
		
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- 댓글 수정 영역-->
<div class="comm_modify"></div>



<c:import url="../../layout/footer.jsp" />


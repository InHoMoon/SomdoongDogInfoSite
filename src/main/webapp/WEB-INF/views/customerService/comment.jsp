<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.reply_area {
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
}
/* 총 댓글 갯수 Comments */
.reply_num {
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}
.reply_list{
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
    min-width: 980px;
    max-width: 980px;
}
/* 댓글 input창 */
#incommContent{
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
    border-radius: 5px;
    font-size: 13px;
    border: none;
    background-color: #68ae6d;
    color: #fff;
}
#updateBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}
#deleteBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}
#btn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}
#cancelBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    float: right;
    width: 54px;
    height: 35px;
}
#childReplyBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 100px;
    height: 40px;
}

</style>

<form method="POST" id="replyForm" name="replyForm">

	<strong class="reply_num">
		<span id="cCnt"></span> <b>Comment</b><hr>
	</strong>
	
	<div class="reply_result"> <!-- 댓글이 들어갈 박스 -->
		<strong><span id="list_adminid"></span></strong>
		<span id="list_content"></span>
	</div>

	<div class="reply_box" style="padding-top: 10px;">
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="adminid">${adminid }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="incommContent" name="incommContent" placeholder="댓글을 입력해주세요."></textarea>
			<button id="replyBtn" type="button" onclick="postComment(this)">등록</button>
			<button id="childReplyBtn" type="button" onclick="postChildReplyComment(this)" style="visibility: hidden;">답댓글 등록</button>
			<button id="cancelBtn" type="button" onclick="cancel()">취소</button>
		</div>
	</div> <!-- comm_box -->
	
</form>
</div> <!-- comm_area -->

           <!--  <div class="reply">
                <input type="button" value="수정" id="J" >
                <input type="button" value="삭제" id="K">
            </div> -->
     
  

    
<script type="text/javascript">
$(document).ready(function() {
	
	//댓글 리스트 가져오는 함수
	
	getCommentList();
		
		//댓글등록 -  [등록]버튼 클릭 시
		$("#commBtn").click(function(){
			
			//변수 선언
			var inum = ${viewInquire.iNum};
			var recontent = $("#incommContent").val().replace("\n", "<br>");
			
			
			//로그인 여부 검사
			if(${empty adminid}){
				alert("로그인 후 이용해주세요");
				$("#incommContent").val("");
				return;
			} else if(incommContent == "") {
				alert("내용을 입력하세요");
			}
				
			$.ajax({
				url : "/customerService/Cwrite"
				, type : "POST"
				, data : { "i_num" : iNum, "incommContent" : incommContent }
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
		
			$("#incommContent").val("");
			
		}); // click end
	}) // document end
	function getList(){
		$.ajax({
			url : "/customerService/view?inum=${viewInquire.iNum}"
			, type : "get"
			, success : function(res){
				$(".comm_result").html(res);
			}
		}); //ajax end
	}//  end
	
	
	//댓글 리스트 조회 함수 (json방식)
	function getCommentList(){
		$.ajax({
			url : "/customerService/view?inum=${viewInquire.iNum}"
			, type : "get"
			, contentType : "application/json"
			, success : function(res){
				 
				if(res.list.length > 0){
					var list = res.list;
					console.log(list)
					var output = "<div>";
					
					for(i = 0; i < list.length; i++){
						var type =  list[i].parentno == 0 ? 'parent' :  'child' ;	
					
						output += "<span id='adminid'>" + '✔️&ensp;'+list[i].adminid + '&ensp;|&ensp;'+"</span>";
						output += "<span class='" + type + "'><span id='adminid'><strong>" + list[i].adminid + "</strong></span>";
						output += "<span id='incommdate'>" +'&nbsp;&nbsp;|&ensp;'+ list[i].incommDate +"</span></br>";
						output += "<span id='ajaxIncommContent"+list[i].incno+"'>" + list[i].incommContent +"</span>";
						
//	 					if(list[i].adminid == adminid){
						// 추후 로그인 기능이 생기면 해당 부분 현재 로그인된 유저의 사번으로 비교
						if(${adminid eq list[i].adminid}){
//	 						output += "<span id='delete' style='cursor:pointer;' data-id ="+list[i].incommContent+">[삭제]</span><br></div><hr>";
							output += " <span id='updelete'> "
							
							output += " <button id='deleteBtn' type='button' onclick='deleteAjaxComment("+list[i].incno+")'>삭제</button> ";
							
							// 일반댓글일 경우에만 댓글 버튼 표시(자식 대댓글에는 대댓글을 달 수 없음)
							if(type === 'parent'){
								output += " <button type='button' id='updateBtn' onclick='focusModifyForm("+ list[i].incno +")'>수정</button> ";
								output += "<button type='button' id='btn' onclick='focusChildReplyForm("+list[i].incno+")'>댓글</button></span><br></div></div><hr> ";
								
							} else {
								output += " <button type='button' id='updateBtn' onclick='focusChildModifyForm("+ list[i].incno +")'>수정</button> ";
								output += "</div><hr> "
							}
							 
						}
						else{
							output += "</div><hr>";
						}
						
					} //for end
					$(".reply_result").html(output);
					
				} else {
					var output = "<div>등록된 댓글이 없습니다.</div>";
					$(".reply_result").html(output);
				}
			}
				
		}); //ajax end
	} //getCommentList end
	
	
	//댓글 수정화면 생성 함수
	function showModify(cno){
		$.ajax({
			type: "get",
			url: "/customerService/Cupdate"+incno,
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
	
	// 댓글 등록버튼 
	// 등록 & 수정 기능 
	function postComment(e) {
		var incno = e.value
	 	var isCreate = (incno == "" || incno.length < 1)
		
	 	var message = isCreate ? "댓글을 작성하시겠습니까?" : "댓글을 수정하시겠습니까?"
	 	var cf = confirm(message)
	 
		if(cf){
			var content = document.getElementById('incommContent')
		
			if(!isCreate){
				var incno = e.value
				
				// 댓글 수정
				$.ajax({
					url : "/board/reply/update"
					, type : "POST"
					, data : { "incno" : incno, "incommContent" : content.value }
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 수정 완료");
							getCommentList();
						} else {
							console.log("댓글 수정 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // update ajax end
			
			}else {
				console.log(${viewInquire.iNum})
				// 댓글 등록
				// 추후 로그인 유저의 사번 가져오기
				var adminid = 'ADMIN'
				$.ajax({
					url : "/board/reply"
					, type : "POST"
					, data : { 
						"incommContent" : content.value, "inum" : ${viewInquire.iNum},"adminid" :  adminid, "parentNo" :  0}
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 등록 완료");
							getCommentList();
						} else {
							console.log("댓글 등록 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // post ajax end
			}
			content.value = ""
		} 
	}
	
	// 댓글 수정 버튼 클릭시 입력 폼에 포커스, 기존 댓글 내용 불러오기
	function focusModifyForm(reply) {
		var area = document.getElementById('incommContent')
		var content = document.getElementById('ajaxIncommContent'+reply)
		var replyBtn = document.getElementById('replyBtn')
		replyBtn.value = reply
		area.value = content.innerText
		area.focus()
	}
	
// 	// 대댓글 수정 버튼 클릭, 기능은 위와 동일 
// 	function focusChildModifyForm(reply) {
// 		var area = document.getElementById('incommContent')
// 		var content = document.getElementById('ajaxIncommContent'+reply)
// 		var childReplyBtn = document.getElementById('childReplyBtn')
// 		childReplyBtn.value = reply
// 		area.value = content.innerText
// 		area.focus()
// 		// 작성버튼을 대댓글 작성 버튼으로 변경
// 		replyBtn.style.visibility = 'hidden';
// 		childReplyBtn.style.visibility = 'visible';
	}
	// 댓글 삭제
	function deleteAjaxComment(incno) {
		var cf = confirm('댓글을 삭제하시겠습니까?')
		if(cf){
			$.ajax({
				url : "/board/reply/delete?incno="+incno
				, type : "get"
				, success : function(data){
					console.log(data)			
					if(data == "success"){        
						console.log("댓글 삭제 완료");
						getCommentList();
					} else {
						console.log("댓글 삭제 실패");
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); // update ajax end	
		} // if end
	}
// 	// 대댓글
// 	function focusChildReplyForm(no){
// 		// no : 원댓글의 no (=부모댓글)
// 		var area = document.getElementById('incommContent')
// 		var replyBtn = document.getElementById('replyBtn')
// 		var childReplyBtn = document.getElementById('childReplyBtn')
// 		area.focus()
// 		// 작성버튼을 대댓글 작성 버튼으로 변경
// 		replyBtn.style.visibility = 'hidden';
// 		childReplyBtn.style.visibility = 'visible';
		
// 		childReplyBtn.name = "to_"+no
	}
	function cancel(){
		var btn = document.getElementById('replyBtn')
		var childReplyBtn = document.getElementById('childReplyBtn')
		var area = document.getElementById('incommContent')
		btn.value = ""
		area.value = ""
		
// 		// 대댓글 작성 버튼을 작성버튼으로 변경
// 		replyBtn.style.visibility = 'visible';
// 		childReplyBtn.style.visibility = 'hidden';		
	
	}
	
// 	// 대댓글 작성 & 수정 기능 함수
// 	function postChildReplyComment(e){
// 		var childReplyBtn = document.getElementById('childReplyBtn')
// 		var incno = e.value
// 		console.log(e.name)
// 		// 새로 작성하는 글인지에 대한 여부
// 		var isCreate = (incno == "" || incno.length < 1)
		
// 		var message = isCreate ? "답댓글을 작성하시겠습니까?" : "답댓글을 수정하시겠습니까?"
// 	 	var cf = confirm(message)
		
// 		if(cf){
// 			var content = document.getElementById('incommContent')
// 			// 추후 수정 필요
// 			var adminid = 'ADMIN2'
			
// 			if(isCreate){
// 				var parentno = e.name.split('_')[1]
// 				console.log(e.name)
// 				$.ajax({
// 					url : "/board/reply"
// 					, type : "POST"
// 					, data : { 
// 						"recontent" : content.value, "inum" : ${viewBoard.bno},"adminid" :  adminid, "parentno" : parentno }
// 					, dataType : "text"
// 					, success : function(data){
// 						if(data == "success"){        
// 							console.log("댓글 등록 완료");
// 							getCommentList();
							
// 						} else {
// 							console.log("댓글 등록 실패");
// 						}
// 					},
// 					error : function(){
// 						console.log("ajax 통신 실패");
// 					}
// 				}); // post ajax end	
// 			} else {
// 				$.ajax({
// 					url : "/board/reply/update"
// 					, type : "POST"
// 					, data : { 
// 						"incommContent" : content.value, "incno" :  e.value}
// 					, dataType : "text"
// 					, success : function(data){
// 						if(data == "success"){        
// 							console.log("댓글 등록 완료");
// 							getCommentList();
							
// 						} else {
// 							console.log("댓글 등록 실패");
// 						}
// 					},
// 					error : function(){
// 						console.log("ajax 통신 실패");
// 					}
// 				}); // update ajax end	
				
				
// 			} // end if
				
// 			content.value = ""
// 			childReplyBtn.value = ""
// 			childReplyBtn.name = ""
			
// 			// 대댓글 작성 버튼을 작성버튼으로 변경
// 			replyBtn.style.visibility = 'visible';
// 			childReplyBtn.style.visibility = 'hidden';		
// 		} 
	}
	
	
</script>
    
    


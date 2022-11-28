<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<style type="text/css">

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


<!-- 댓글입력창 -->
<div class="comm_area">
<form method="POST" id="commForm" name="commForm">

	<strong class="comm_num">
		<span id="cCnt"></span> Comments
	</strong>
	
	<div class="comm_result"> <!-- 댓글이 들어갈 박스 -->
		<strong><span id="list_userid"></span></strong>
		<span id="list_content"></span>
	</div>

	<div class="comm_box" style="padding-top: 10px;">
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="userid">${userid }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="commContent" name="commContent" placeholder="댓글을 입력해주세요"></textarea>
			<button id="commBtn">등록</button>
		</div>
	</div> <!-- comm_box -->
	
</form>
</div> <!-- comm_area -->




<div class="box-footer"> <!-- 페이지네이션 -->
	<div class="text-center">
		<ul class="pagination pagination-sm no-margin">
		
		</ul>
	</div>
</div>


<!-- <div class="comm_list"> -->
<!--     <form id="commListForm" name="commListForm" method="post"> -->
<!--         <div id="commentList"> -->
<!--         </div> -->
<!--     </form> -->
<!-- </div> comm_list -->


<script type="text/javascript">
$(function(){
    init();
})

function init(){
    var fno = ${fboard.fno}
    sendData={"fno":fno}
    $.ajax({
        data : sendData,
        method :'POST',
        url: '/community/free/commlist',
        success : output
    })
}

function output(data){
	if(data.total > 0){
		var list = data.list;
		
		var comment_html = "<div class='comm_result'>";
		
		$('#cCnt').html(data.total);
		for(i = 0;i < list.length;i++){
			var content = list[i].commContent;
			var userid = list[i].userid;
			comment_html += "<span id='list_userid'><strong>" + userid + "</strong></span>";
			comment_html += "<span id='list_content'>" + content + "</span>";
			if(userid == $("#userid").val()){
				 comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br><hr>";
				 
			}
			else{
				comment_html += "</div><hr>";
			}
		}
		
		$(".comm_box").html(comment_html);
		
		
	}
	else{
		var comment_html = "<span id='list_content'>등록된 댓글이 없습니다.</span>";
		$(".comm_box").html(comment_html);
	}
}

</script>







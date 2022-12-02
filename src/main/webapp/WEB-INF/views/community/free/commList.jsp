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

#btnModify{ 
	float: right; 
	border: none; 
	background: none; 
	color: #337ab7;
}

.text_bar2{
	margin: 0px 9px 0 9px;
    display: inline-block;
    float: right;
    width: 1px;
    height: 18px;
    background-color: #ebebeb;
}

.btnReplyDelete{
	float: right;
    border: none;
    background: none;
    color: #f84720;
}

.pagingC { text-align: center; }
.pagingC > li{ display: inline-block; }

.btnReplyClose{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #5c5c5c;
    color: #fff;
    width: 38px;
    height: 30px;
    margin-right: 10px;
}

.btnReplyUpdate{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #6bacce;
    color: #fff;
    width: 38px;
    height: 30px;
}
</style>



<!-- 댓글 목록 -->
<c:forEach var="row" items="${list}">
<span id="listUserid"><strong>${row.userid }</strong>(<fmt:formatDate value="${row.commDate}" pattern="yyyy.MM.dd HH:mm"/>)</span><br>

<div id="listContent">
	<span class="comm_txt" id="comm_txt${row.cno}">${row.commContent }</span>
	
	<c:if test="${sessionScope.userid == row.userid}">
	
		<button type="button" class="btnReplyDelete" id="rplyDelete_${row.cno}">삭제</button>
		<span class="text_bar2" id="text_bar2_${row.cno}"></span>
		<input type="button" id="btnModify" class="bm_btn_${row.cno}" value="수정" onclick="showReplyModify('${row.cno}','${row.commContent}',this)">
		
		<div class="modi_wrap" id="mw_${row.cno}" style="display:none;">
			<div class="textarea_wrap"></div>
			
			<button type="button" class="btnReplyUpdate" id="rplyUpdate_${row.cno}">완료</button>
<%-- 			<button type="button" class="btnReplyDelete" id="rplyDelete_${row.cno}">삭제</button> --%>
			<button type="button" class="btnReplyClose" id="rplyClose_${row.cno}" >취소</button>
		</div>
	</c:if>
	
</div><br>


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
<!-- 			<a href="javascript:listReplyRest('1')">[처음]</a> -->
		</c:if>
		
		<%-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 --%>
		<c:if test="${commPaging.curBlock > 1}">
			<li><a href="javascript:listReplyRest('${commPaging.prevPage}">[이전]</a></li>
<%-- 			<a href="javascript:listReplyRest('${commPaging.prevPage}')">[이전]</a> --%>
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

<script>
$(document).ready(function() {
	$(".btnReplyClose").click(function(){
		var cno = $(this).attr("id").replace("rplyClose_","");
		
		console.log(cno)
		
		$("#mw_"+ cno).hide(); //댓글 수정 입력칸
		$("#comm_txt" + cno).show(); //댓글
		$("#rplyDelete_" + cno).show(); //삭제버튼
        $("#text_bar2_" + cno).show(); // |
		$(".bm_btn_" + cno).show(); // 수정버튼
	});
	
	
	
	
	$(".btnReplyUpdate").click(function(){
		
	    var detailCommContent = $("#detailCommContent").val().replace("\n", "<br>");
       	var cno = $(this).attr("id").replace("rplyUpdate_","");
	    console.log("e")
	    
	    $.ajax({
// 	    	url: "/community/free/updateC/${fcomm.cno}"
	        url: "/community/free/updateC/" + cno
	        , type: "put"
	        , headers: { "Content-Type":"application/json" }
	        , data: JSON.stringify({ commContent : detailCommContent })
	        , dataType: "text"
	        , success: function(result){
	            if(result == "success"){
	            	
	            	
// 	            	let cno = ${fcomm.cno};

	            	$("#mw_" + cno).hide();
	            	$("#comm_txt" + cno).show();
	                //$("#modifyReply").css("visibility", "hidden");
	                //$("#modifyReply").hide();
	                listReplyRest("1");
	            }
	        } // success
	    }); // ajax
	}); //updateBtn click
	
	
	$(".btnReplyDelete").click(function(){
		var cno = $(this).attr("id").replace("rplyDelete_","");
		
	    if(confirm("삭제하시겠습니까?")){
	        $.ajax({
	            url: "/community/free/deleteC/" + cno
	            , type: "delete"
	            , success : function(result){
	                if(result == "success"){
	                    alert("삭제되었습니다.");
// 	                    $("#modifyReply").css("visibility", "hidden");
	                    cCount();
	                    listReplyRest("1");
	                }
	            } // success
	        }); //ajax
	    } // if
	}); //deleteBtn click
	
}); //document end
</script>

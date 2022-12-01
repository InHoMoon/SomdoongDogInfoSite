<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">

$("#btnReplyUpdate").click(function(){
	
    var detailCommContent = $("#detailCommContent").val().replace("\n", "<br>");
    
    $.ajax({
        url: "/community/free/updateC/${fcomm.cno}"
        , type: "put"
        , headers: { "Content-Type":"application/json" }
        , data: JSON.stringify({ commContent : detailCommContent })
        , dataType: "text"
        , success: function(result){
            if(result == "success"){
                $("#modifyReply").css("visibility", "hidden");
                listReplyRest("1");
            }
        } // success
    }); // ajax
}); //updateBtn click



$("#btnReplyClose").click(function(){
    $("#modifyReply").css("visibility", "hidden");
    $("#listContent").css("visibility", "visible");
});



$("#btnReplyDelete").click(function(){
    if(confirm("삭제하시겠습니까?")){
        $.ajax({
            url: "/community/free/deleteC/${fcomm.cno}"
            , type: "delete"
            , success : function(result){
                if(result == "success"){
                    alert("삭제되었습니다.");
                    $("#modifyReply").css("visibility", "hidden");
                    cCount();
                    listReplyRest("1");
                }
            } // success
        }); //ajax
    } // if
}); //deleteBtn click
</script>


댓글 번호 : ${fcomm.cno}<br>
<textarea id="detailCommContent" rows="5" cols="82">${fcomm.commContent}</textarea>

<div style="text-align: center;">

	<c:if test="${sessionScope.userid == fcomm.userid}">
		<button type="button" id="btnReplyUpdate" >완료</button>
		<button type="button" id="btnReplyDelete" >삭제</button>
	</c:if>
	
	<button type="button" id="btnReplyClose" >취소</button>
	
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">

$(".btnReplyUpdate").click(function(){
	
    var detailCommContent = $("#detailCommContent").val().replace("\n", "<br>");
    console.log("e")
    $.ajax({
        url: "/community/free/updateC/${fcomm.cno}"
        , type: "put"
        , headers: { "Content-Type":"application/json" }
        , data: JSON.stringify({ commContent : detailCommContent })
        , dataType: "text"
        , success: function(result){
            if(result == "success"){
            	let cno = ${fcomm.cno};
            	$("#mw_" + cno).hide();
            	$("#comm_txt" + cno).show();
                //$("#modifyReply").css("visibility", "hidden");
                //$("#modifyReply").hide();
                listReplyRest("1");
            }
        } // success
    }); // ajax
}); //updateBtn click



/* $(".btnReplyClose").click(function(){
    /* $("#modifyReply").css("visibility", "hidden");
    $("#listContent").css("visibility", "visible"); 
    console.log($(this))
    //rplyClose_${row.cno}
    $("#modifyReply").hide();
    $("#btnModify").show();
    // 해바,,
}); */



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
<!--  여기에,, 일단 주석을 할개,, -->
<%-- <textarea id="detailCommContent" rows="5" cols="82">${fcomm.commContent}</textarea>
<div style="text-align: center;">
</div>--%>


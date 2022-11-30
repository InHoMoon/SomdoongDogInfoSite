<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../../layout/header.jsp" />

<!-- ===================================================================================== -->


<script type="text/javascript">
$("#updateBtn").click(function(){
	var commDetail = $("#commDetail").val();
	
	$.ajax({
		url : "/community/free/updateC/${fcomm.cno}"
		, type : "put"
		, headers : { "Content-Type" : "application/json" }
		, dataType : "text"
		, success : function(res){
			if(res == "success"){
				$("#comm_modify").css("visibility", "hidden");
			}
		}
	}) //ajax end
}); //updateBtn click end

</script>


댓글 번호 : ${fcomm.cno }<br>
<textarea id="commDetail" rows="5" cols="82">${fcomm.commContent }</textarea>
<div style="text-align: center;">
	<c:if test="${sessionScope.userid == fcomm.userid }">
		<button type="button" id="updateBtn">수정</button>
		<button type="button" id="deleteBtn">삭제</button>
	</c:if>
	<button type="button" id="closelBtn">닫기</button>
</div>


<c:import url="../../layout/footer.jsp" />

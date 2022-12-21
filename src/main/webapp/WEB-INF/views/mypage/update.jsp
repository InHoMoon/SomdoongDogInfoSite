<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	

	
	if( ${empty iBoardFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		$("#originFile").toggle()
	})
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["iContent"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

<style type="text/css">

#originFile, #newFile{
	display: none;
}

</style>

<div class="container">

<h1>글수정</h1>
<hr>

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="iNum" value="${param.iNum  }">

<div class="form-group">
	<select name="iCategory" id="iCategory" value="${updateInquire.iCategory }">
		<option value="배송">배송 </option>
		<option value="반품/환불">반품/환불</option>
		<option value="결제">결제 </option>
		<option value="탈퇴">탈퇴 </option>
	</select>
<!-- 	<input type="text" id="iCategory" name="iCategory" class="form-control"> -->
</div>


<div class="form-group">
	<label for="writer">작성자</label>
	<input type="text" id="writer"   class="form-control" value="${username }" readonly="readonly">
</div>

<div class="form-group">
	<label for="iTitle">제목</label>
	<input type="text" id="iTitle" name="iTitle" class="form-control" value="${updateInquire.iTitle }">
</div>

<div class="form-group">
	<label for="iContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="iContent" name="iContent">${updateInquire.iContent }</textarea>
</div>

<div class="form-group"> 

	<div id="fileBox">
	
		<div id="originFile">
			<a href="/mypage/download?iFileno=${iBoardFile.iFileno }"> ${iBoardFile.iOriginName }</a>
			<span id="deleteFile">X</span>
		</div>
	
		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
		</div>
	

	</div>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>
</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />















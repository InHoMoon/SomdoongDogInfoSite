<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>

<!-- 스마트에디터2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	//작성버튼 동작
	$("#btnWrite").click(function() {
		
		//작성된 내용을 <textarea>에 적용하기
		updateContents()
		
		//폼 제출
		$("form").submit()
		
		//** submit 전에 에디터 내용이 반영되도록 작성할 것
	})
	
	//취소버튼
	$("#cancle").click(function() {
		history.go(-1);
	})
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}

</script>

<div class="container">
<h3>강아지 자랑 글쓰기</h3>

<form action="./showwrite" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="writer">작성자</label>
	<input type="text" id="writer" value="${userid }" class="form-control" readonly="readonly">
</div>
<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control">
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width:100%" id="content" name="content"></textarea>
</div>
<div class="form-group">
	<label for="file">파일</label>
	<input type="file" id="file" name="file" class="form-control">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="button" id="cancle" class="btn btn-danger" >취소</button>
</div>
</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div>

<c:import url="../layout/footer.jsp"/>
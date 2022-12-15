<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["iContent"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

<div class="container">

<h1>글쓰기</h1>
<hr>

<form action="./write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<select name="iCategory" id="iCategory">
		<option value=""> </option>
		<option value="1번">1번 </option>
		<option value="2번">2번 </option>
		<option value="3번">3번 </option>
	</select>
<!-- 	<input type="text" id="iCategory" name="iCategory" class="form-control"> -->
</div>

<div class="form-group">
	<label for="writer">작성자</label>
	<input type="text" id="writer" value="${username }"  class="form-control"  readonly="readonly">
</div>


<div class="form-group">
	<label for="iTitle">제목</label>
	<input type="text" id="iTitle" name="iTitle" class="form-control">
</div>

<div class="form-group">
	<label for="iContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="iContent" name="iContent"></textarea>
</div>

<div class="form-group">
	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
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















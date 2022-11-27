<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1);
	})
	
	$("#id").focus()
})
</script>

<div class="container">

<h1>로그인</h1>
<hr>

<div>
<form action="/member/login" method="post" class="form-horizontal">

<div class="form-group">
	<label for="id" class="col-sm-4 control-label">아이디</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="id" name="userid" placeholder="아이디 입력">
	</div>
</div>

<div class="form-group">
	<label for="pw" class="col-sm-4 control-label">패스워드</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="pw" name="userpw" placeholder="패스워드 입력">
	</div>
</div>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">로그인</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>
</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />

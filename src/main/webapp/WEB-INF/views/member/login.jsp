<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>


<h3>로그인</h3>
<hr>

<div>
<form action="/member/login" method="post" class="form-horizontal">

<div class="form-group">
	<label for="id" class="col-sm-4 control-lable">아이디</label>
<div class="col-sm-5">
<input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요" class="form-control">
</div>
</div>

<div class="form-group">
	<label for="userpw" class="col-sm-4 control-lable">비밀번호</label>
<div class="col-sm-5">
<input type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요" class="form-control">
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-5">
	<button class="btn btn-primary">로그인</button>
	<button class="btn btn-danger" id="cancel">취소</button>
</div>
</div>

</form>
</div>


<c:import url="../layout/footer.jsp"/>

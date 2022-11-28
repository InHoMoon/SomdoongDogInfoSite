<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){

	$("#submit").on("click", function(){
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if($("#userpw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userpw").focus();
			return false;
		}
		if($("#username").val()==""){
			alert("성명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
	})
	
		
	
});  


</script>


<div class="container">
	<h1>회원가입</h1>
	<br>
	<div>
		<form action="./join" method="post" class="form-horizontal">

			<div class="form-group">
				<label for="userid" class="col-sm-4 control-label">아이디</label>

				<div class="col-sm-5">
					<input type="text" class="form-control" id="userid" name="userid"
						placeholder="아이디 입력">
				</div>

				<div>
					<button id="idcheck" type="button" class="btn btn-secondary">중복확인</button>
				</div>
			</div>

			<div class="form-group">
				<label for="userpw" class="col-sm-4 control-label">패스워드</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="userpw"
						name="userpw" placeholder="패스워드 입력">
				</div>
			</div>

			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="username"
						name="username">
				</div>
			</div>

			<div class="form-group">
				<label for="userphone" class="col-sm-4 control-label">휴대폰</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="userphone"
						name="userphone">
				</div>
			</div>

			<div class="form-group">
				<label for="useradd" class="col-sm-4 control-label">주소</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="useradd" name="useradd">
				</div>
			</div>

			<div class="form-group">
				<label for="useraddd" class="col-sm-4 control-label">상세주소</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="useraddd"
						name="useraddd">
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-4 control-label">email</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="ex)abc@naver.com">

				</div>
			</div>

			<div class="form-group">

				<div class="col-sm-offset-5">
					<button type= "submit" id="submit" class="btn btn-primary">회원가입</button>
					<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
				</div>

			</div>


		</form>
	</div>
</div>

<c:import url="../layout/footer.jsp" />
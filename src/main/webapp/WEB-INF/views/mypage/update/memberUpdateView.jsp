<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cancle").on("click", function(){
				location.href = "/";
		})
		
		$("#submit").on("click", function(){
			if($("#userpass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if($("#username").val()==""){
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
		});
	})
</script>
	
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/mypage/update/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userid">아이디</label>
					<input class="form-control" type="text" id="userid" name="userid" value="${member.userid}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userpw">패스워드</label>
					<input class="form-control" type="userpw" id="userpw" name="userpw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="username">성명</label>
					<input class="form-control" type="text" id="username" name="username" value="${member.username}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userphone">휴대폰</label>
					<input class="form-control" type="text" id="userphone" name="userphone" value="${member.userphone}"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="useradd">주소</label>
					<input class="form-control" type="text" id="useradd" name="useradd" value="${member.useradd}"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="useraddd">상세주소</label>
					<input class="form-control" type="text" id="useraddd" name="useraddd" value="${member.useraddd}"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${member.email}"/>
				</div>
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			
</body>
</html>
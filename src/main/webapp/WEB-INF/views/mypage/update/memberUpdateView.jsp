<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../../layout/header.jsp" />
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
	
	
<div>	
<h1>회원 정보 수정</h1>
<hr>


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
			<a href="/mypage/update/memberDeleteView?userid=${userid}">회원 탈퇴 </a>
</div>
<c:import url="../../layout/footer.jsp" />
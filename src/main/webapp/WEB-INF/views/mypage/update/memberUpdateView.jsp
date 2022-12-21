<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cancle").on("click", function(){
				location.href = "/main";
		})
		
		
		$("#submit").on("click", function(){
			if($("#userpw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userpw").focus();
				return false;
			}
			if($("#username").val()==""){
				alert("성명을 입력해주세요.");
				$("#username").focus();
				return false;
			}
			alert("수정되었습니다");
		});
	})
</script>

<style type="text/css">
	.delete{  
      text-decoration: none;
     
      color:white;
      padding:10px 20px 5px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
    }
   .delete{
      transform: translateY(3px);
    }
   .delete{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
}
</style>

	
<div class="container">	
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
					<a class="delete" href="/mypage/update/memberDeleteView?userid=${userid}">회원 탈퇴 </a>
				</div>
				
			</form>
			
</div>

<c:import url="../../layout/footer.jsp" />
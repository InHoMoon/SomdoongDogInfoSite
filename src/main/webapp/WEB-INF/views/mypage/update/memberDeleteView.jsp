<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
	
<h1>회원 탈퇴</h1>
<hr>


<form action="/mypage/update/memberDelete" method="post">

		<div class="form-group has-feedback">
			<label class="control-label" for="userid">아이디</label>
			 <input class="form-control" type="text" id="userid" name="userid" value="${member.userid}" readonly="readonly" />
		</div>
		
		<div class="form-group has-feedback">
			<label class="control-label" for="userpw">패스워드</label>
			 <input class="form-control" type="password" id="userpw" name="userpw" />
		</div>
		
		<div class="form-group has-feedback">
			<label class="control-label" for="username">성명</label>
			<input class="form-control" type="text" id="username" name="username" value="${member.username}" readonly="readonly" />
		</div>
		
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
			<button class="cancle btn btn-danger" type="button">취소</button>
		</div>
</form>

<c:import url="../../layout/footer.jsp" />
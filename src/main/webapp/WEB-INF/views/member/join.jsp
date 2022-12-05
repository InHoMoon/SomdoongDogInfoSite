<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/header.jsp" />


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


$(document).ready(function() {

	$("#idcheck").click(function(){
		$("#submit").attr("type", "button");
		const id = $("#userid").val();
		$.ajax({
		type: "get",
		async: false,
		url: "/member/idcheck",
		data: {userid: id},
		success: function (data) {
		if (id =="") {
			alert("아이디를 입력 후 중복확인 해 주세요.");
		}else if(data == 1) {
			$("#olmessage").text("이미 사용중인 ID 입니다.");
			$("#me_id_yn").val("N");
			$("#olmessage").addClass("olmessagef");
			$("#olmessage").removeClass("olmessaget");
		}else if (data == 0) {
			$("#olmessage").text("사용 가능한 ID 입니다.");
			$("#me_id_yn").val("Y");
			$("#olmessage").addClass("olmessaget");
			$("#olmessage").removeClass("olmessagef");
			$("#submit").attr("type", "submit");		
		}	

	
		},
			error : function(){
			alert("서버요청실패");
	
			}

		})

	})
	
	$("#userid").click(function(){
		if($("#userid").val()==""){
			$("#olmessage").text("아이디를 입력 해주세요.");
			$("#userid").focus();
			$("#olmessage").addClass("olmessaget");
			$("#olmessage").removeClass("olmessagef");
			return false;
		}
	})
	
});

$(document).ready(function() {
	
	$("#goback").click(function() {
		$(location).attr("href", "/member/login")
	})
	
})


$(document).ready(function(){
	
    var hobbyCheck = false;
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var getName= RegExp(/^[가-힣]+$/);
    var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
    var buf = new Array(13); //주민등록번호 배열
    var regExp = /^[0-9]*$/; //숫자만
	

	$("#submit").on("click", function(){
		

		 //아이디 공백 확인
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		  //아이디 유효성검사
	      if(!getCheck.test($("#userid").val())){
	        alert("형식에 맞게 입력해주세요");
	        $("#userid").val("");
	        $("#userid").focus();
	        return false;
	      }
		  
	      if ($("#me_id_yn").val() != 'Y') {
	    	  alert("아이디 중복체크를 눌러주세요.");
	    	  $("#me_id_yn").focus();
	    	   
	    	  return false;
	    	  }
		  
		  	 
	    //비밀번호 공백 확인  
		if($("#userpw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userpw").focus();
			return false;
		}
	    
	      //아이디 비밀번호 같음 확인
	      if($("#userid").val() == $("#userpw").val()){
	        alert("아이디와 비밀번호가 같습니다");
	        $("#userpw").val("");
	        $("#userpw").focus();
	        return false;
	      }
	      
	      //비밀번호 유효성검사
	      if(!getCheck.test($("#userpw").val())){
	        alert("형식에 맞게 입력해주세요");
	        $("#userpw").val("");
	        $("#userpw").focus();
	        return false;
	      }
	      
	      //비밀번호 확인란 공백 확인
	      if($("#userpwcheck").val() == ""){
	        alert("패스워드 확인란을 입력해주세요");
	        $("#userpwcheck").focus();
	        return false;
	      }
	      
	      //비밀번호 서로확인
	      if($("#userpw").val() != $("#userpwcheck").val()){
	          alert("비밀번호가 상이합니다");
	          $("#userpw").val("");
	          $("#userpwcheck").val("");
	          $("#userpw").focus();
	          return false;
	      }
	      	     
	      //이름 공백 검사
	      if($("#username").val() == ""){
	        alert("이름을 입력해주세요");
	        $("#username").focus();
	        return false;
	      }
	      
	      //이름 유효성 검사
	      if(!getCheck.test($("#username").val())){
	        alert("이름형식에 맞게 입력해주세요")
	        $("#username").val("");
	        $("#username").focus();
	        return false;
	      }
	      
	      //휴대폰 공백 검사
	      if($("#userphone").val() == ""){
	        alert("휴대폰번호를 입력해주세요");
	        $("#userphone").focus();
	        return false;
	      }
	      
	      //휴대폰 유효성 검사
	      if(!regExp.test($("#userphone").val())){
	        alert("숫자만 입력해 주세요")
	        $("#userphone").val("");
	        $("#userphone").focus();
	        return false;
	      }
	      
	      //우편번호 공백 확인
	      if($("#sample4_postcode").val() == ""){
	        alert("우편번호를 찾아주세요");
	        $("#sample4_postcode").focus();
	        return false;
	      }
	      
	      //상세주소 공백 확인
	      if($("#useraddd").val() == ""){
	        alert("상세주소를 입력해 주세요");
	        $("#useraddd").focus();
	        return false;
	      }
	      
	      //이메일 공백 확인
	      if($("#email").val() == ""){
	        alert("이메일을 입력해주세요");
	        $("#email").focus();
	        return false;
	      }
	      
	      //이메일 유효성 검사
	      if(!getMail.test($("#email").val())){
	        alert("이메일형식에 맞게 입력해주세요")
	        $("#email").val("");
	        $("#email").focus();
	        return false;
	      }
 
	})

}) 

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>

<style type="text/css">
.container {

	height: 800px;

}

#join {
	position: relative;
	top: 170px;
	
}



.olmessagef {color: red; font-style: Italic;}
.olmessaget {color: blue; font-style: Italic;}

</style>


<div class="container">

	<div id="join">
		<form action="./join" method="post" class="form-horizontal">
		<input type="hidden" id="me_id_yn" name="me_id_yn" value="N"/>

			<div class="form-group">
				<label for="userid" class="col-sm-4 control-label">아이디</label>

				<div class="col-sm-5">
					<input type="text" class="form-control" id="userid" name="userid"
						placeholder="4~12자리의 영문 대소문자와 숫자로만 입력">
					<span id="olmessage"></span>
				</div>

				<div>
					<button id="idcheck" type="button" class="btn btn-secondary">중복확인</button>
				</div>
			</div>

			<div class="form-group">
				<label for="userpw" class="col-sm-4 control-label">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="userpw"
						name="userpw" placeholder="4~12자리의 영문 대소문자와 숫자로만 입력">
				</div>
			</div>
			
			<div class="form-group">
				<label for="userpw" class="col-sm-4 control-label">비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="userpwcheck"
						name="userpwcheck" placeholder="비밀번호 확인">
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
					<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
					<input type="text" class="form-control" id="sample4_roadAddress" name="useradd" placeholder="도로명 주소">
				</div>
				
				<div>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
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
					<button type= "submit" id="submit" class="btn btn-warning">회원가입</button>
					<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
					<button type= "button" id="goback" class="btn btn-info">돌아가기</button>
				</div>

			</div>
 





		</form>
	</div>
</div>

<c:import url="../layout/footer.jsp" />
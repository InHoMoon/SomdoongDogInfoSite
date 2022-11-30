<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1);
	})
	
	$("#submit").on("click", function(){
		

		 //이름 공백 확인
		if($("#username").val()==""){
			alert("이름을 입력해주세요.");
			$("#username").focus();
			return false;
		}
		 
		 //휴대폰 공백 확인
		if($("#userphone").val()==""){
			alert("휴대폰번호를 입력해주세요.");
			$("#userphone").focus();
			return false;
		}
	
	})

})


</script>


<style type="text/css">


.container {

	height: 800px;

}

#idfind {
	position: relative;
	top: 300px;
	left: 100px;
}

</style>




    <div class="container">
   
   
    
    <div id="idfind">
    <form action="./idfind" method="post" class="form-horizontal">
    
  
   <div class="form-group">
    	<label for="userid" class="col-sm-4 control-label">이름</label>
  	  	<div class="col-sm-3">
    		<input type="text" class="form-control" id="username" name="username" placeholder="이름 입력">
   		</div>
   </div>
    
    <div class="form-group">
   		 <label for="userpw" class="col-sm-4 control-label">휴대폰</label>
   		 <div class="col-sm-3">
   		 	<input type="text" class="form-control" id="userphone" name="userphone" placeholder="휴대폰 입력">
    	 </div>
    </div>
    
        <div class="form-group">
    
     	 <div class="col-sm-offset-5">
     	 	<button id= "submit" class="btn btn-warning">확인</button>
     	 	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
    	 </div>
    
    </div>
    
        </form>   
    </div>
    
    
    
    </div><!-- container end  -->

<c:import url="../layout/footer.jsp" />
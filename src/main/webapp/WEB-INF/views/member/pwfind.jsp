<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
    <c:import url="../layout/header.jsp" />
    
    <script type="text/javascript">
    $(document).ready(function() {
    	$("#cancel").click(function() {
    		history.go(-1);
    	})
    	
    	$("#submit").on("click", function(){
    		

    		 //아이디 공백 확인
    		if($("#userid").val()==""){
    			alert("아이디를 입력해주세요.");
    			$("#userid").focus();
    			return false;
    		}
    		 
    		 //이메일 공백 확인
    		if($("#email").val()==""){
    			alert("이메일을 입력해주세요.");
    			$("#email").focus();
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
    	<label for="userid" class="col-sm-4 control-label">아이디</label>
  	  	<div class="col-sm-3">
    		<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력">
   		</div>
   </div>
    
    <div class="form-group">
   		 <label for="userpw" class="col-sm-4 control-label">이메일</label>
   		 <div class="col-sm-3">
   		 	<input type="text" class="form-control" id="email" name="email" placeholder="이메일 입력">
    	 </div>
    </div>
    
        <div class="form-group">
    
     	 <div class="col-sm-offset-5">
     	 	<button id="submit" class="btn btn-warning">확인</button>
     	 	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
    	 </div>
    
    </div>
    
        </form>   
    </div>
    
    
    
    </div><!-- container end  -->

<c:import url="../layout/footer.jsp" />
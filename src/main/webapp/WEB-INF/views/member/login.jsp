<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:import url="../layout/header.jsp" />
    
    
    <script type="text/javascript">
    $(document).ready(function() {
    	

    })


    </script>
    
    

    
  <style  type="text/css">

	.container {

	height: 800px;

}

#login {
	position: relative;
	top: 300px;
	
}

#find {
	position: relative;
	left: 20px;
}

    
    </style>
    
    
    <div class="container">
   
   
    
    <div id="login">
    <form action="./login" method="post" class="form-horizontal">
    

   <div class="form-group">
    	<label for="userid" class="col-sm-4 control-label">아이디</label>
  	  	<div class="col-sm-4">
    		<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력">
   		</div>
   </div>
    
    <div class="form-group">
   		 <label for="userpw" class="col-sm-4 control-label">패스워드</label>
   		 <div class="col-sm-4">
   		 	<input type="password" class="form-control" id="userpw" name="userpw" placeholder="패스워드 입력">
    	 </div>
    </div>
    

 <div id="find">
   <div class="form-group">
    <div class="col-sm-offset-4">
    	 <a href="./idfind" >아이디 찾기 |</a> 
   		 <a href="./pwfind" >비밀번호 찾기 |</a> 
   		 <a href="./agree" >회원가입 |</a>
   		  <a href="/admin/login" >관리자 로그인</a> 
    </div>
   </div>
 </div>   
 
    <div class="form-group">
    
     	 <div class="col-sm-offset-5">
     	 	<button id="loginbu" class="btn btn-warning">로그인</button>
     	 	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
    	 </div>
    
    </div>


    
    </form>   
    </div>
    
    
    
    </div><!-- container end  -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <c:import url="../layout/footer.jsp" />
<<<<<<< HEAD
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
=======
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
	left: 55px;
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
    	 <a href="./idfind" >아이디 찾기</a> 
   		 <a href="./pwfind" >비밀번호 찾기</a> 
   		 <a href="./agree" >회원가입</a> 
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
>>>>>>> 43ae123cf658f30f43cef2ea49763570de93d629

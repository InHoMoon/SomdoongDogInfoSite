<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
 
});
 
</script>

<style type="text/css">


.container{
	height: 800px;	
}


#search {
	position: relative;
	top:300px;
}

</style>



  <div class="container">
  
  <div id="search"> 
      <div class="text-center">
          <h1 class="h4 text-gray-900 mb-2">비밀번호를 확인하세요.</h1><br><br>
      <div class="text-center">                                                                            
        <c:choose>                                                                          
            <c:when test="${empty searchMember}">                                                 
                <p class="mb-4">조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p class="mb-4" style="color: red;">${searchMember.userpw}</p>                                              
            </c:otherwise>                                                                    
        </c:choose>                                                                         
    </div>      
      </div>
      <br>
      <div class="text-center">
          <a class="small" href="/member/agree">새로운 계정을만드실래요?</a>
      </div>
      <div class="text-center">
          <a class="small" href="/member/login">이미 계정이 있으신가요? 로그인하세요!</a>
      </div>
  </div>
</div>
<c:import url="../layout/footer.jsp" />
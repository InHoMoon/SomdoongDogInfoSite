<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
   $("#btnList").click(function() {
      location.href = "/admin/doginfo/list"
   })
   
   $("#btnUpdate").click(function() {
      location.href = "/admin/doginfo/update?dno=${viewDogInfo.dno }"
   })
   
   $("#btnDelete").click(function() {
      location.href = "/admin/doginfo/delete?dno=${viewDogInfo.dno }"
   })
})
</script>

<style type="text/css">

*{
   margin : 0;
   padding : 0;
   
}

.imgs {
	width: 40px;
	height: 40px;
}

.imgss {
	width: 20px;
	height: 20px;
}

ul ,li{
   list-style:none;
}

a{
   text-decoration:none;
   color:inherit;
}

.board_wrap{
   width:1000px;
   margin: 100px auto;
}

.board_title{
   margin-bottom:30px;
}

.board_title strong{
   font-size : 3rem;
}

.bt_wrap{
   margin-top : 30px;
   text-align:center;
}

.bt_wrap button{
   display:inline-block;
   min-width:80px;
   padding:10px;
   border:1px solid #000;
   border-radius:2px;
   margin-left:10px;

}

.board_view{
   width:100%;
   border-top:2px solid #000;
}

.board_view .title{
   padding:20px 15px;
   border-bottom:1px dashed #ddd;
   font-size:3rem;
}
.board_view .info{
   display:inline-block;
   padding:15px;

/*    font-size:0; */
}

.board_view .info dl{
   display:inline-block;
   padding:0 20px;
   border-right:1px solid #000;
}

.board_view .info dl:first-child{
   padding-left:0;
}

.board_view .info dl dt,
.board_view .info dl dd{
   display:inline-block
    font-size:1.4rem;
}

.board_view .info dl dt{
display:inline-block;
}

.board_view .info dl dd{
   display:inline-block;   
   margin-left:10px;
   color:#777;
}


.board_view .cont{
   padding:15px;
   border-top:1px solid #999;
   border-bottom:1px solid #000;
   line-height:160%;
   font-size : 1.8rem;
}
   
</style>

<div class="board_wrap">
   
   <div class="board_title">
      <img class="imgs" src="/resources/img/연구소.jpg"/><strong> 연구보기</strong>
   </div>
   
   <div class="board_view_wrap">
      <div class="board_view">
         <div class="title">
      
         ${viewDogInfo.dtitle }
   
            
         </div>      
         
         <div class="info">
                  
            <dl>
               <dt>작성자</dt>
               <dd>${viewDogInfo.adminid }</dd>   
            </dl>
                  
            <dl>
               <dt>작성일</dt>
               <dd><fmt:formatDate value="${viewDogInfo.dwritedate }" pattern="yy년 MM월 dd일"/></dd>   
            </dl>
            
            <dl>
               <dt>조회수</dt>
               <dd>${viewDogInfo.dhit }</dd>   
            </dl>

            <dl>
               <dt>좋아요</dt>
               <dd><img class="imgss" src="/resources/img/empty_heart.png"/></dd>   
            </dl>
         
         </div>
         
         <div class="cont">
         
             ${viewDogInfo.dcontent }

         </div>
      
      
      
      </div>
      
	  <br>
	  <a href="/admin/doginfo/download?fileNo=${doginfoFile.d_fileno }">${doginfoFile.originName }</a>
      
      <div class="bt_wrap">
            <button class="btn btn-default" id="btnList">목록</button>
            <button class="btn btn-primary" id="btnUpdate" >수정</button>
            <button class="btn btn-danger" id="btnDelete" >삭제</button>
   
      </div>
   </div>



</div>
<c:import url="../../layout/footer.jsp" />

<script type="text/javascript">
$(document).ready(function(){

	//변수선언
	var findLike = ${findLike}
	
	if(findLike > 0){
		console.log("already like....");
		$(".imgss").prop("src", "/resources/img/heart.png");
	} else {
		console.log("you can like this post!")
		$(".imgss").prop("src", "/resources/img/empty_heart.png");
	}
	
	$(".imgss").click(function(){
		
		if(${empty userid}){
			alert("로그인 후 이용해주세요");
			return;
		}
		
		$.ajax({
			url : "/admin/doginfo/like"
			, type : "post"
// 			, data : { "rno" : ${rboard.rno}, "userid" : `${rboard.userid}` }
			, data : { "dno" : ${viewDogInfo.dno}, "userid" : `${userid}` }
			, dataType : "json"
			, success : function(data){
				if(data == 1){
					$(".imgss").prop("src", "/resources/img/heart.png");
					console.log("하트 클릭");
				} else if(data == 0){
					$(".imgss").prop("src", "/resources/img/empty_heart.png");
					alert("좋아요가 취소되었습니다");
					console.log("하트 취소");
				}
			}
		});//ajax end
	}); // .heart click end
	
}); // document end
</script>

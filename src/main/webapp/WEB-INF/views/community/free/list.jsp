<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/community/free/write"
	})
})


$(".search-btn").click(function(){
	
	$.ajax({
		
		url : "/community/free/search"
		, type : "post"
		
		
	});// ajax end
	
})//search-btn clikc
</script>

<style type="text/css">
.container {
	width: auto;
    padding: 57px 175px 0px;
}

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}


#btnWrite{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 5px;
    font-size: 14px;
    border: none;
    color: #555;
    border: 1px solid #ccc;
}

.search { text-align: right; font-size: 12px;}
.search-op { height: 30px; width: 80px; text-align: center; border: 1px solid #e8e8e8; }
.search-text { height: 30px; width: 200px; border: 1px solid #e8e8e8; }
.search-btn { height: 30px; width:35px; border: 1px solid #6bacce; background-color: #6bacce; color: #fff; }


#title > a{ color: #333; }
</style>

<div class="container">

<h1>자유게시판</h1>
<hr>

<span class="pull-left">total : ${paging.totalCount }</span>

<form id="form">
	<div class="search">
		<select class="search-op">
			<option>제목</option>
			<option>작성자</option>
		</select>
		<input type="text" class="search-text" value="검색어를 입력하세요">
		<button class="search-btn">찾기</button>
	</div> 
</form>
<!-- <form id="form"> -->
<!-- 	<div class="dropdown"> -->
<!-- 		<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"> -->
<!-- 			제목 -->
<!-- 			<span class="caret"></span> -->
<!-- 		</button> -->
<!-- 		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> -->
<!-- 		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">제목</a></li> -->
<!-- 		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">작성자</a></li> -->
<!-- 		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">제목+작성자</a></li> -->
<!-- 	  	</ul> -->
	  	
<!-- 		<input type="text" class="search-text" value="검색어를 입력하세요"> -->
<!-- 		<button class="search-btn">찾기</button> -->
<!-- 	</div>  -->
<!-- </form> -->

<div class="clearfix" style="padding-bottom: 30px;"></div>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%; text-align: center;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="fboard">
	<tr>
		<td>${fboard.fno }</td>
		<td id="title"><a href="/community/free/view?fno=${fboard.fno }">${fboard.title }</a></td>
<%-- 		<td>${fboard.title }</td> --%>
		<td>${fboard.userid }</td>
		<td>${fboard.hit }</td>
		<td><fmt:formatDate value="${fboard.writeDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:if test="${login eq true }">
<button id="btnWrite">글쓰기</button>
</c:if>
<div class="clearfix"></div>


<!-- <form action="/community/list" method="post"> -->
<!-- 	<div class="search"> -->
<!-- 		<select class="search-op"> -->
<!-- 			<option>제목</option> -->
<!-- 			<option>작성자</option> -->
<!-- 		</select> -->
<!-- 		<input type="text" class="search-text" value="검색어를 입력하세요"> -->
<!-- 		<button class="search-btn">찾기</button> -->
<!-- 	</div>  -->
<!-- </form> -->


<c:import url="/WEB-INF/views/community/free/paging_f.jsp" />


</div> <!-- container -->

<c:import url="../../layout/footer.jsp" />
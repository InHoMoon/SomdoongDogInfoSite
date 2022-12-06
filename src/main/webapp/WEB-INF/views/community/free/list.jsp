<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../../layout/header.jsp" />
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
.search-op { height: 40px; width: 100px; border: 1px solid #e8e8e8; }
.search-text { height: 40px; width: 240px; border: 1px solid #e8e8e8; }
.search-btn { height: 30px; width:35px; border: 1px solid #6bacce; background-color: #6bacce; color: #fff; }


#title > a{ color: #333; }
</style>

<div class="container">

<h1>자유게시판</h1>
<hr>

<span class="pull-left">total : ${paging.totalCount }</span>

<div class="search">
	<form id="form" id="searForm">
		<select class="search-op" id="searchType">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" class="search-text" placeholder="검색어를 입력하세요" id="keyword" name="keyword">
	</form>
		<button class="search-btn" id="searBtn">찾기</button	>
</div> 

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


<div id="paging">
<c:import url="/WEB-INF/views/community/free/paging_f.jsp" />
</div>

<div id="pagingS" style="display: none;">
<c:import url="/WEB-INF/views/community/free/pagingS.jsp" />
</div>




</div> <!-- container -->


<div class="searchList"></div>

<c:import url="../../layout/footer.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/community/free/write"
	})
	
// 	$("#keyword").on("keydown",function(key){
//         if(key.keyCode == 13) {
//         	$("#searBtn").click();
//         }
//     });
	
	
	$("#searBtn").click(function(){
		
		var searchType = $("#searchType option:selected").val();
		var keyword = $("#keyword").val();
		
		if(keyword == ''){
			alert("검색어를 입력하세요");
			return false;
		}
		
		$.ajax({
			url : "/community/free/listS"
			, type : "post"
// 			, data : $('#searForm').serialize()
			, data : { "searchType" : searchType, "keyword" : keyword }
			, dataType: "html"
			, success : function(result){
				$(".table-condensed").html(result);
				$("#paging").hide();
				$("#pagingS").show();
			}
			
		});// ajax end
	
	});//searBtn click
});
</script>
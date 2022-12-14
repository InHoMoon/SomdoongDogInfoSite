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
.search-btn { height: 40px; width:37px; border: 1px solid #6bacce; background-color: #6bacce; color: #fff; }


#title > a{ color: #333; }

.imgBox { 
	width: 80px;
    height: 80px;
    background-repeat: no-repeat, no-repeat;
    background-position: right, left;
    background-size: cover;
    display: inline-block;
}
</style>

<div class="container">

<h1>맛집 추천</h1>
<hr>

<span class="pull-left">total : <span id="totalCnt">${paging.totalCount }</span></span>

<div class="search">
	<form id="form" id="searForm" style="display: inline-block;">
		<select class="search-op" id="searchType">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" class="search-text" placeholder="🔍 검색어를 입력하세요" id="keyword" name="keyword">
	</form>
		<button class="search-btn" id="searBtn">찾기</button	>
</div> 

<div class="clearfix" style="padding-bottom: 30px;"></div>

<div id="apeend_wrap">
	<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 45%; text-align: center;">제목</th>
			<th style="width: 15%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 10%;">좋아요</th>
			<th style="width: 10%;">작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list }" var="rboard">
		<tr>
			<td style="text-align: center; line-height: 5;">${rboard.rno }</td>
<!-- 			<td id="title" style="line-height: 5;"> -->
			<td id="title">
				<c:if test="${not empty rboard.fiName }">
<%-- 					<img src="/upload/${rboard.fiName }" style="width: 80px; height: 80px;"> --%>
					<div class="imgBox" style="background-image: url('/upload/${rboard.fiName }');"></div>
				</c:if>
				
				<c:if test="${rboard.fiName eq null }">
					<img src="/resources/img/pic.png" style="width: 80px; height: 80px;">
				</c:if>
				<a href="/community/recommend/view?rno=${rboard.rno }">${rboard.title }</a>
			</td>
			<td style="text-align: center; line-height: 5;">${rboard.userid }</td>
			<td style="text-align: center; line-height: 5;">${rboard.hit }</td>
			<td style="text-align: center; line-height: 5;">
				<img src="/resources/img/heart.png" style="width: 17px; height: 17px;"></div>
				${rboard.likeCnt }
			</td>
			<td style="text-align: center; line-height: 5;"><fmt:formatDate value="${rboard.writeDate }" pattern="yy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<c:if test="${login eq true }">
	<button id="btnWrite">글쓰기</button>
	</c:if>
	<div class="clearfix"></div>
	
	
	<div id="paging">
		<c:import url="/WEB-INF/views/community/recommend/paging_r.jsp" />
	</div>
</div>



</div> <!-- container -->

	
<div class="searchList"></div>


<c:import url="../../layout/footer.jsp" />



<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/community/recommend/write"
	});
	
	$("#searBtn").click(function() {
		search(0);
	});
	
	$("#keyword").on("keydown",function(e){
        if(e.keyCode == 13) {
        	e.preventDefault();
        	search(0);
        }
    });
	
	$(document).on("click","[data-curpage]", function(e) {
		search($(this).data("curpage")); 
	});
});
	
	
function search(curPage){
	var searchType = $("#searchType option:selected").val();
	var keyword = $("#keyword").val();
	
	if(keyword == ''){
		alert("검색어를 입력하세요");
		return false;
	}
	$.ajax({
		url : "/community/recommend/listS"
		, type : "post"
		, data : { "searchType" : searchType, "keyword" : keyword, curPage : curPage }
		, dataType: "html"
		, success : function(result){
			$("#apeend_wrap").html(result);
			$("#totalCnt").text($("#iptsTotal").val());
		}
	});// ajax end
};//search function
</script>
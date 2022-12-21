<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="../layout/header.jsp" />

<style type="text/css">
* {
	margin: 0;
	padding: 0; /* 모든 마진과 패딩 값 초기화*/
}
.title{
    font-family: 'Dongle';
    font-size: 40px;
  	font-style: normal;
  	font-weight: 300;
  	font-display: swap;
  	margin-left: 535px;
  	margin-top: 30px;
  	margin-bottom: 40px;
  	border-bottom: 2px solid #FFCD00;
  	width: 80px;
}
 
.table-wrap {
	width: 90%;
	margin-left: 80px;
	margin-bottom: 40px;
}

table {
	table-layout: fixed;
	border-collapse: collapse;
  	border-spacing: 0;
}
thead {
	display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
table, th {
	text-align: center;
}
td:nth-child(2) {
	text-align: left;
	text-align: justify;
}
#btn-write {
	display: inline-block;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
    background: #80ff00;
}

.search-wrap {
	margin-top: 10px;
	margin-left: 350px;
}

.search { font-size: 12px;}
.search-op { height: 40px; width: 100px; border: 1px solid #e8e8e8; }
.search-text { height: 40px; width: 240px; border: 1px solid #e8e8e8; }
.search-btn { height: 40px; width:37px; border: 1px solid #6bacce; background-color: #6bacce; color: #fff; }

</style>

<div class="container">

<div class="title">
공지사항
</div>

<div class="table-wrap">
<table class="table table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 35%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 15%;">작성일</th>
		<th style="width: 10%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.notino}</td>
		<td><a href="/notice/view?notino=${notice.notino }">${notice.ntitle }</a></td>
		<td>${notice.adminid }</td>
		<td><fmt:formatDate value="${notice.notidate }" pattern="yy-MM-dd"/></td>
		<td>${notice.hit }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:if test="${adminlogin eq true }">
<button id="btnWrite" class="btn pull-right btn-write">글쓰기</button>
</c:if>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/notice/paging_n.jsp" />

<div class="search-wrap">
<div class="search">
	<form id="form" id="searForm" style="display: inline-block;">
		<select class="search-op" id="searchType">
			<option value="ntitle">제목</option>
			<option value="ncontent">내용</option>
		</select>
		<input type="text" class="search-text" placeholder="🔍 검색어를 입력하세요" id="keyword">
	</form>
		<button class="search-btn" id="searBtn">찾기</button>
</div> 
</div>

</div>


</div><!-- .container -->

<div class="searchList"></div>

<c:import url="../layout/footer.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/notice/write"
	})
	
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
		url : "/notice/listS"
		, type : "post"
		, data : { "searchType" : searchType, "keyword" : keyword, curPage : curPage }
		, dataType: "html"
		, success : function(result){
			$(".table-wrap").html(result);
			$("#totalCnt").text($("#iptsTotal").val());
		}
	});// ajax end
};//search function
</script>

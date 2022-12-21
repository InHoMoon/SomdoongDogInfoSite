<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.search-wrap {
	margin-top: 10px;
	margin-left: 350px;
}
</style>


<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 이전 페이징 리스트로 이동 (10개 앞으로 이동) --%>
	<c:if test="${sePaging.startPage ne 1 }">
		<li data-curpage="${sePaging.startPage - sePaging.pageCount }"><a>&lt; 이전</a></li>	
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${sePaging.startPage }" end="${sePaging.endPage }" var="i">
	<c:if test="${sePaging.curPage eq i }">
		<li class="active" data-curpage="${i}"><a>${i }</a></li>
	</c:if>
	<c:if test="${sePaging.curPage ne i }">
		<li data-curpage="${i}"><a>${i }</a></li>
	</c:if>
	</c:forEach>

	<%-- 다음 페이징 리스트로 이동 (10개 뒤로 이동) --%>
	<c:if test="${sePaging.endPage ne sePaging.totalPage }">
		<li data-curpage="${sePaging.startPage + sePaging.pageCount }"><a>다음 &gt;</a></li>	
	</c:if>
	
	</ul>
	
</div> 
	<div class="search-wrap">
<div class="search">
	<form id="form" id="searForm" style="display: inline-block;">
		<select class="search-op" id="searchType">
			<option value="ntitle">제목</option>
			<option value="ncontent">내용</option>
		</select>
		<input type="text" class="search-text" placeholder="🔍 검색어를 입력하세요" id="keyword">
	</form>
		<button class="search-btn" id="searBtn">찾기</button	>
</div>
</div>

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

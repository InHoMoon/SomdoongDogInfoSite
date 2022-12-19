<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		$(".category").click(function() {

			var id_check = $(this).attr("id");

			console.log(id_check);

			var url = "/store/list/" + id_check

			$.ajax({
				type : "POST",
				url : url,
				async : true,
				cache : "false",
				data : {id_check},
				dataType : "html",
				success : function(data) {
					console.log("ajax 성공")

					$("#list-content").children().remove();

					$("#list-content").html(data);
				},
				error : function() {
					console.log("ajax 실패")
				}
			})
		});
		
		$(".view-all").click(function() {
			
			$.ajax({
				type: "POST",
				url: "/store/list/all",
				async : true,
				cache : "false",
				data : {},
				dataType : "html",
				success : function(data) {
					console.log("ajax 성공")
					
					$("#list-content").children().remove();

					$("#list-content").html(data);
				},
				error : function() {
					console.log("ajax 실패")
				}
				
			})
		})
	})
</script>

<style type="text/css">
#nav {
	float: left;
	width: 19%;
}

#nav > div {
	display: flex;
	justify-content: flex-end;
	
	margin: 35px 25px;
}

#nav > div > ul > li {
	font-size: 20px;

	margin-bottom: 30px;
}

#wrap-index {
	width: 1900px;
	height: 100%;
	min-height: 100%;
}

h3 {
	border-bottom: 2px solid #d3d3d3;
	
	margin-right: 20px;
	padding-bottom: 10px;
}

ul {
	list-style: none;
	float: left;
	
}

.category {
	cursor: pointer;
}

a {
	text-decoration: none !important;
	color: inherit;
}

ul > li > img:hover {
	cursor: pointer;
}

#product-title {
	font-size: 20px;
	
	margin-bottom: 5px;
}

#product-price {
	font-size: 22px;
	font-weight: bold;
}

#list-content {
	float: right;
	width: 81%;
	height: 100%;
	
	padding-left: 20px;
	
	border-left: 2px solid #d3d3d3;
}

.view-all {
	cursor: pointer;
}

</style>

<div id="wrap-index">

<div id="nav">
	<div>
		<ul>
			<li class="view-all">전체</li>
			<li class="category" id="food">사료</li>
			<li class="category" id="snack">간식</li>
			<li class="category" id="medical">의료</li>
			<li class="category" id="toy">장난감</li>
		</ul>
	</div>
</div>

<div id="list-content">
	<%@	include file="./list_all.jsp" %>
</div>

</div>

<%@	include file="../layout/footer.jsp" %>

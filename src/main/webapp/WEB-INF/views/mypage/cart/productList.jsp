<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/mypage/cart/insert" method="post">
	<input type="hidden" name="productNo" value="${ productNo}">
	
	<select name="cAmount">
		<c:forEach begin = "1" end = "10" var="i">
			<option value="${i }" >${i }</option>	
		</c:forEach>	
	</select>
	<input type="submit" value="장바구니에 담기">

</form>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<head>
	<title>Home</title>
</head>
<body>
	<%@include file="inc/top.jsp" %>
<h1>
	Hello world!  

</h1>
<P>  The time on the server is ${serverTime}. </P>

<a href="${pageContext.request.contextPath}/board/listSearch?page=1&perPageNum=10&searchType=t&keyword="> List </a>



</body>
</html>

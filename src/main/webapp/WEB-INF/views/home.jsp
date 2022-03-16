<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<%@include file="inc/meta.jsp" %>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<%--  <script src="${pageContext.request.contextPath}/resources/js/fileupload.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fileuplaod.css"> --%>

<meta charset="UTF-8">
<title>뭔지모를사이트</title>

<body>
	<%@include file="inc/top.jsp" %>

<pre>

		220408 + view 단에서 처리하던 로직 controller로 이전작업 (중복참여,공대장참여,참여인원 초과시 조건)
 		220408 + 관리자 사이트 직관성패치 (신규가입유저)

 </pre>

</body>
</html>
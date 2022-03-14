<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<script
	src="//cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link
	href="//cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
  
  


<title>Insert title here</title>

<style type="text/css">
.gdsDes img { max-width:600px; height:auto; }

</style>




</head>

<body>
	<%@include file="inc/top.jsp" %>
<script type="text/javascript">


</script> 



<form role="form" method="post" autocomplete="off" name="readForm">
<input type="hidden" name="n" value="${cal.id}" />









<div class="container border border-info  " style="border: 1px''">


<hr>
<div class="row">
  <b class="border-end"	> ${cal.id}<b>
 <bclass="category2">${cal.cateName}</b>

<h1>${cal.title}</h1>
<hr>
 <small class="fs-5">${cal.writer}
 </small><br><small class="fs-6">${cal.start1}</small> 


</div>

	
				<hr>
				
<div class="abcd border" >

				
		

 <pre >${cal.content}
 
 
 
 
 
 
 


 
 </pre>
 
 
 
 



</div>



</div>
<hr>
				
				
<div class="inputArea">

 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
 <button type="button" id="list_btn" class="btn btn-primary">목록</button>

 <script>
  var formObj = $("form[role='form']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "${pageContext.request.contextPath}/board/boardupdate");
   formObj.attr("method", "get")
   formObj.submit();
  });
  
 	$("#list_btn").click(function(){
		
		
		self.location = "${pageContext.request.contextPath}/board/listSearch?"
				+ "page=${scri.page}&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";					
	});


	</script>

 
</div>

</form>
</body>
</html>
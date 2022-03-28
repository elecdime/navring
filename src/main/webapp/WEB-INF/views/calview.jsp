<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  	<%@include file="inc/meta.jsp" %>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<script
	src="//cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
<label>공대장:(${cal.leader_id})    참여자 목록(${cal.cateMin}/${cal.cateMax}): </label>
<span><c:forEach items="${rd}" var="rd">
	<input type="hidden" value="${rd.id}">
	<label name ="nickname">${rd.nickname}, </label>
	 <c:if test ="${rd.userid == user.id}">

	   <button type="button" onclick="location.href='/deljoin?n=${rd.id}&s=${rd.calid}';" class="btn btn-warning test-button1" name ="test-button1" id ="test-button1">참가취소</button>
	 </c:if>
	
		</c:forEach>
		 <c:choose>
                    	<c:when test ="${user == null}">
	                    
	                           <label><b style="background-color: red;">로그인후 레이드 참가가능</b>
	                                 </label>
     							
                    	</c:when>
                    	<c:otherwise>
                   
      <form action="/radejoin" method="POST">
 	 <input type="hidden" id="nickname" name="nickname" value="${user.nickname}" readonly="readonly" />	
 	 <input type="hidden" name="n" value="${cal.id}" />

 	 <c:if test ="${cal.leader_id != user.name}">

 	 
 	 
 	 		<c:if test="${cal.cateMax > cal.cateMin}">
 <button type="submit" id="join" class="btn btn-primary">참가</button>

 </c:if>
       </c:if>
                    	</c:otherwise>
                    	</c:choose>

 </form>
</span>
<p></p>
 <button type="button" id="list_btn" class="btn btn-primary">목록</button>
</div>
<hr>

				

<div class="inputArea">



 <script>
  
 	$("#list_btn").click(function(){
		
		
		self.location = "/cal";					
	});
 
	$("#test-button1").click(function(){
		
		alert("참가취소를 여러번 누르지 말아주세요 ");		
			
	});
	</script>
<script type="text/javascript">


</script>
 
</div>


   	<%@include file="inc/footer.jsp" %>

</body>

</html>
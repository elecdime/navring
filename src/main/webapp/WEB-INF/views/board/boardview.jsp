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

<script type="text/javascript">


</script> 



<form role="form" method="post" autocomplete="off" name="readForm">
<input type="hidden" name="n" value="${bbs.bbsno}" />
<input type="hidden" name="s" value="${bbs.bbsGroup}" />
<input type="hidden" name="f" value="${bbs.bbsStep}" />
<input type="hidden" name="g" value="${bbs.bbsDent}" />
		<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />








<div class="container border border-info  " style="border: 1px''">


<hr>
<div class="row">
  <b class="border-end"	> ${bbs.bbsno}<b>
 <bclass="category2">${bbs.cateName}</b>

<h1>${bbs.title}</h1>
<hr>
 <small class="fs-5">${bbs.writer}
 </small><br><small class="fs-6">${bbs.regDate}</small>   <small>조회:${bbs.viewCnt}</small> 


</div>

	
				<hr>
				
<div class="abcd border" >

				
				<div class="form-group dropdown" style="border: 1px solid #dbdbdb;">
				<button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
  							파일목록
  								</button>
  								<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<c:forEach var="file" items="${file}">
						<input type="hidden" id="IDX" name="IDX" value="${file.FILE_NO}" > 
					
					<li> <a class="dropdown-item" href='<c:url value="/board/fileDown?IDX=${file.FILE_NO}"/>' name="file" >${file.ORGFILE}</a><BR>
					</c:forEach>
					  </ul>
				</div>






 <pre >${bbs.content}
 
 
 
 
 
 
 
 
 
 

 
 
 </pre>
 
 
 
 



</div>



</div>
<hr>
				
				
<div class="inputArea">

 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
 <button type="button" id="list_btn" class="btn btn-primary">목록</button>
	<button type="button" class="btn btn-praimary" id ="reply_Btn">답글</button>
 <script>
  var formObj = $("form[role='form']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "${pageContext.request.contextPath}/board/boardupdate");
   formObj.attr("method", "get")
   formObj.submit();
  });
  
  $("#delete_Btn").click(function(){
	  
	  var con = confirm("정말로 삭제하시겠습니까?");
	  
	  if(con) {      
	   formObj.attr("action", "${pageContext.request.contextPath}/board/boarddelete");
	   formObj.submit();
	  }
	 });
  $("#reply_Btn").click(function(){
	   formObj.attr("action", "${pageContext.request.contextPath}/board/reply");
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
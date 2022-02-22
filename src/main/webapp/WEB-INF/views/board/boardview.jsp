<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
  
  
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>






</head>

<body>

<script type="text/javascript">


</script> <form  role="form" method="post" autocomplete="off">
			<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
			
			<div class="form-group">
				<label for="bno" class="col-sm-2 control-label">글 번호</label>
				<div class="col-sm-10">
					<input type="text" id="bno" name="bno" class="form-control" value="${bbs.bbsno}" readonly="readonly" />
				</div>
			</div>
		
		</form>



<form role="form" method="post" autocomplete="off" name="readForm">
<input type="hidden" name="n" value="${bbs.bbsno}" />
<input type="hidden" name="s" value="${bbs.bbsGroup}" />
<input type="hidden" name="f" value="${bbs.bbsStep}" />
<input type="hidden" name="g" value="${bbs.bbsDent}" />
<div class="inputArea"> 
 <label>1차 분류</label>
 <span class="category1"></span>        
 <label>2차 분류</label>
 <span class="category2">${bbs.cateCode}</span>
</div>

<div class="inputArea">
 <label for="title">제목</label>
 <span>${bbs.title}</span>
</div>

<div class="inputArea">
 <label for="title">제목</label>
 <span>${bbs.title}</span>
</div>
	<hr>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
						<c:forEach var="file" items="${file}">
						<input type="hidden" id="IDX" name="IDX" value="${file.FILE_NO}" > 
					 <a href="/web/resources/upload/${file.SAVEFILE}" name="file" onclick="fn_downloadFile('${file.FILE_NO}'); return false;">${file.ORGFILE}</a><BR>
					</c:forEach>
				</div>
				
				<hr>


<div class="inputArea">
 <label for="content">내용</label>
 <span>${bbs.content}</span>
   <img src="${pageContext.request.contextPath}/${bbs.img} " class="oriImg"/>
   <img src="${pageContext.request.contextPath}/${bbs.imgs} " class="oriImg"/>
</div>

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
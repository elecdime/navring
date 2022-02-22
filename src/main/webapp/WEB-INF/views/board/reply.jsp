<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/fileupload.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fileuplaod.css">

<title>Insert title here</title>



</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


	<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" action="reply?n=${bbs.bbsno}">
<label>${bbs.bbsno}</label>

<div class="inputArea">
 <label for="title">제목</label>

 <input type="text" id="title" name="title" >
</div>

<div class="inputArea">
 <label for="writer">작성자</label>
 <input type="text" id="writer" name="writer" />
</div>

<div class="inputArea">
 <label for="content">내용</label>
 <textarea rows="5" cols="50" id="content" name="content"></textarea>
</div>
<input type="hidden" name="bbsGroup" value="${bbs.bbsGroup}" />
<input type="hidden" name="bbsStep" value="${bbs.bbsStep}" />
<input type="hidden" name="bbsDent" value="${bbs.bbsDent}" />
<input type="hidden" name="bbsno" value="${bbs.bbsno}" />

<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "${pageContext.request.contextPath}/board/ckUpload"
 };
 
 CKEDITOR.replace("content", ckeditor_config);
</script>
 

 <div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>
 </from>
 
 



<%=request.getRealPath("/") %>

</body>

</html>
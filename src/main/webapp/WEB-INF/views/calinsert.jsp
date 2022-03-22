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

<title>Insert title here</title>

<script>	 

	$(document).ready(function(){  

		$("#register_Btn").click(function(){ 

				if($("#title").val().length==0){ alert("제목을 입력하세요."); $("#title").focus(); return false; } 

				if($("#start1").val().length==0){ alert("날짜와 시간을 입력하세요"); $("#start1").focus(); return false; } 
			});		 

	}); 

	</script> 

</head>
 <c:choose>
                    	<c:when test ="${user == null}">
	                 <script type="text/javascript">
	                  alert("로그인후 이용해주세요");
	                  location.href='/cal'
	                 </script>
	                           
	                   
                    	</c:when>
                    	<c:otherwise>
                    
                                    
                    
                    	
  
 
  </div>



<body>
	<%@include file="inc/top.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<form role="form" method="post" autocomplete="off" action="/calinsert">

<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="0">전체</option>
 </select>

 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="0">전체</option>
 </select>
 </div>

<div class="inputArea">
 <label for="title">제목</label>
 <input type="text" id="title" name="title" />
</div>
<div class="inputArea">
 <label for="writer">작성자</label>
 <input type="text" id="writer" name="writer" value="${user.nickname}" readonly="readonly" />
</div>
 <input type="hidden" id="leader_id" name="leader_id" value="${user.name}" readonly="readonly" />
  <input type="hidden" id="userid" name="userid" value="${user.id}" readonly="readonly" />
 
<div >
 <label for="start1">일정 시작</label>
 <input type="datetime-local" id="start1" name="start1" />
 
</div>

<div class="inputArea">
 <label for="content">상세 내용</label>
 <textarea rows="5" cols="50" id="content" name="content"></textarea>
</div>
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
 <button type="submit" name="register_Btn" id="register_Btn" class="btn btn-primary">등록</button>
</div>
</form>

 
<!--  
 <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
 
 
        
    <a href="#" onclick="uploadFile(); return false;" class="btn bg_01">파일 업로드</a>
 -->



<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);
var cate1Arr = new Array();
var cate1Obj = new Object();
// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}
// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      + cate1Arr[i].cateName + "</option>"); 
}
$(document).on("change", "select.category1", function(){
	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();
	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});
</script>
<%=request.getRealPath("/") %>



</c:otherwise>
                    	</c:choose>
                    	
</body>

</html>
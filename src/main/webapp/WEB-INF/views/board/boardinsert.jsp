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


	<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="">전체</option>
 </select>

 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
 <label>공지사항 등록</label>
 <input type="radio" id="bbb" name="abcd" value="10" onchange="setDisplay()"> none
<input type="radio" id="aaa" name="abcd" value="00" onchange="setDisplay()"> 상단고정

    <input type="hidden" id ="notice" class="notice" name="notice" value="0" />
</div>

<div class="inputArea">
 <label for="title">제목</label>
 <input type="text" id="title" name="title" />
</div>

<div class="inputArea">
 <label for="writer">작성자</label>
 <input type="text" id="writer" name="writer" />
</div>

<div class="hidden2" id ="hidden2" style="display: none;">
 <label for="endDate">공지시작일</label>
 <input type="" id="startDate" name="startDate" />
 ~
 <label for="endDate">공지삭제일</label>
 <input type="hidden" id="endDate" name="endDate" />

</div>

<div class="inputArea">
 <label for="content">내용</label>
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
 


<!-- <div class="inputArea">
 <label for="img">이미지</label>
 <input type="file" id="img" name="file" />
 <div class="select_img"><img src="imgs" /></div>
 이미지 업로드
 <script>
  $("#img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 

</div> -->
 <div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>
 </from>
 
 
 <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
 
 
            </tbody>
        </table>
    </form>
        
    <a href="#" onclick="uploadFile(); return false;" class="btn bg_01">파일 업로드</a>




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
<script type="text/javascript">

function setDisplay(){
    if($('input:radio[id=aaa]').is(':checked')){
        $('#hidden2').show();
        $('#endDate').prop("type","Date");
        $('#startDate').prop("type","Date");
        $('#notice').val(1);
    }else{
        $('#hidden2').hide();
	    $('#endDate').prop("type","hidden");
	    $('#startDate').prop("type","hidden");
        $('#notice').val(0);
    }
}

</script>
</body>

</html>
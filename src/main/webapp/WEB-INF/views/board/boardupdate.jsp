<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/fileupdate.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fileuplaod.css">
     <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


	<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 <input type="hidden" id="bbsno" name="bbsno" value="${bbs.bbsno}" />
 <input type="hidden" id="n" name="n" value="${bbs.bbsno}" />
 
<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="">전체</option>
 </select>

 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
</div>

<div class="inputArea">
 <label for="title">제목</label>
 <input type="text" id="title" name="title" value="${bbs.title}" />
</div>

<div class="inputArea">
 <label for="writer">작성자</label>
 <input type="text" id="writer" name="writer" value="${bbs.writer}"/>
</div>

<div class="inputArea">
 <label for="content">내용</label>
 <textarea rows="5" cols="50" id="content" name="content" >${bbs.content}</textarea>
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
	<hr>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
						<c:forEach var="file" items="${file}">
				
						<input type="hidden" id="IDX" name="IDX" value="${file.FILE_NO}" > 
							${file.ORGFILE}
							<input type="button" id="delete_file" value="파일삭제" onclick="location.href='${pageContext.request.contextPath}/board/deleteBoardFile?num=${file.FILE_NO}&boardIdx=${bbs.bbsno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=t&keyword=${scri.keyword}'";>
	
					
						<br>		

			
					</c:forEach>
					
				</div>
				
				





 
 
            </tbody>
        </table>
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>
<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
    </form>
    
         
 
 <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
 		 <input type="hidden" id="n" name="n" value="${bbs.bbsno}" />
 		
        
    <a href="#" onclick="uploadFile(); return false;" class="btn bg_01">파일 업로드</a>


  <%=request.getRealPath("/") %>
 
</div>

<div class="inputArea">
 
<script>
 $("#back_Btn").click(function(){
  //history.back();
/*   location.href = "${pageContext.request.contextPath}/board/boardview?n=" + ${bbs.bbsno}; */
  
	
	self.location = "${pageContext.request.contextPath}/board/boardview?n=${bbs.bbsno}" 
			+ "&page=${scri.page}&perPageNum=${scri.perPageNum}"
			+ "&searchType=t&keyword=${scri.keyword}";	
 }); 




</script>
</form>

<script>
//컨트롤러에서 데이터 받기
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
var select_cateCode = '${bbs.cateCode}';
var select_cateCodeRef = '${bbs.cateCodeRef}';
var select_cateName = '${bbs.cateName}';

if(select_cateCodeRef != null && select_cateCodeRef != '') {
 $(".category1").val(select_cateCodeRef);
 $(".category2").val(select_cateCode);
 $(".category2").children().remove();
 $(".category2").append("<option value='"
       + select_cateCode + "'>" + select_cateName + "</option>");
} else {
 $(".category1").val(select_cateCode);
 //$(".category2").val(select_cateCode);
 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
}
</script>

<script type="text/javascript">

$(document).ready(function(){
    var objDragAndDrop = $(".dragAndDropDiv");
    
    $(document).on("dragenter",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    $(document).on("dragover",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on("drop",".dragAndDropDiv",function(e){
        
        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;
    
        handleFileUpload(files,objDragAndDrop);
    });
    
    $(document).on('dragenter', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e){
      e.stopPropagation();
      e.preventDefault();
      objDragAndDrop.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
    //drag 영역 클릭시 파일 선택창
    objDragAndDrop.on('click',function (e){
        $('input[type=file]').trigger('click');
    });

    $('input[type=file]').on('change', function(e) {
        var files = e.originalEvent.target.files;
        handleFileUpload(files,objDragAndDrop);
    });
    
    function handleFileUpload(files,obj)
    {
       for (var i = 0; i < files.length; i++) 
       {
            var fd = new FormData();
			
			fd.append('bbsno',${bbs.bbsno});
            fd.append('file', files[i]);
     		
            var status = new createStatusbar(obj); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status);
     
       }
    }
    
    var rowCount=0;
    function createStatusbar(obj){
            
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even";
        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
        
        obj.after(this.statusbar);
     
        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }
     
            this.filename.html(name);
            this.size.html(sizeStr);
        }
        
        this.setProgress = function(progress){       
            var progressBarWidth =progress*this.progressBar.width()/ 100;  
            this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
            if(parseInt(progress) >= 100)
            {
                this.abort.hide();
            }
        }
        
        this.setAbort = function(jqxhr){
            var sb = this.statusbar;
            this.abort.click(function()
            {
                jqxhr.abort();
                sb.hide();
            });
        }
    }
    
   function sendFileToServer(formData,status)
	
    {
        var uploadURL = "/web/fileupDate/post"; //Upload URL
        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
                xhr: function() {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function(event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                        }, false);
                    }
                return xhrobj;
            },
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                status.setProgress(100);
     
                //$("#status1").append("File upload Done<br>");           
            }
        }); 
     
        status.setAbort(jqXHR);
    }
    
});


</script>


</body>

</html>
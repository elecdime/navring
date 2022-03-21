<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




<style>
.item_btn > button {
					padding: 3px 10px;
					border: 2px solid #58b8db;
					border-radius: 10%;
					font-weight: bold;
				}

</style>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
   
 
<%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  	<%@include file="../inc/left.jsp"%>


   

                <form name="MyForm" method="post" action="/admin/update">
				<input type="hidden" value="${memberList.id}" name = "id" id ="id" >
                					<div>
                             		<label>닉네임 :</label>
                                	<c:out value="${memberList.name}" />
                        		</div>
                        		<hr>
                               <div>
                             		<label>토벌전 참여여부(수정시 옵션을 셀렉트 옵션 변경필요)</label><br>
                             		   <input type="hidden" id="sooncut" name ="sooncut" value="${memberList.sooncut}"/>
                 						 <select id="changeTest">
                  	
                                	<option value="Y" name ="sooncut" id ="sooncut">Y</option>
                                	<option value="N" name ="sooncut" id ="sooncut">N</option> 
                                	</select>
           		                  </div>
   				<hr>
                    <div>
                    <label>이슈</label>
                                   	<input class ="frm_input"type="text" name ="issu" id ="issu" value="${memberList.issu}" /> </div>
                        <hr>
                        <div>
                        
                             		<label>경고횟수</label>
                     
                                          	<input class ="frm_input" type="text" name ="yellowCard" id ="yellowCard" value="${memberList.yellowCard}" /> 
                  </div>
                    <hr>
                <div>
                             		<label>경고사유</label>
                                	   	<textarea rows="10" cols="10"name ="yellowCardWhy" id ="yellowCardWhy" /> 
                                	   	${memberList.yellowCardWhy}
                                </textarea>
                             </div>

<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "${pageContext.request.contextPath}/board/ckUpload"
 };
 
 CKEDITOR.replace("yellowCardWhy", ckeditor_config);
</script>
 
                          
                          
                          
                          
                          
                           <input type="submit" class="adBtn" value="응애" > 
                     
                            
    
                            
                           
              
    
                </form>
       
      
 

    <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
</script>
<script>

$(document).ready(function(){
	$("#changeTest").change(function(){
		console.log("값변경테스트: " + $(this).val());
		$("#sooncut").val($(this).val());

		
	});
 });
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>

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
 <c:choose>

 	<c:when test ="${login == null}">
	                 <script type="text/javascript">
	                  alert("로그인후 이용해주세요");
	                  location.href='/admin/login'
	                 </script>
	                           
	                   
                    	</c:when>
                    	<c:otherwise>
                    
   
 
<%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  	<%@include file="../inc/left.jsp"%>

          <!--  seller_wrap  -->
    <form name="flist" class="local_sch01 local_sch" action="/admin/userlist" method="POST">

                <div class="formTitle">회원 리스트 <span>검색조건에 해당하는 회원 리스트를 확인 할수 있습니다.</span></div><label for="sca" class="sound_only">분류선택</label>
                <select name="searchCulumn" id="sca">
                    <option value="name">닉네임</option>
                    <option value="real_tobal">토벌전</option>
                </select>

                <label for="stx" class="sound_only">검색어</label>
                
                <input type="text" name="searchText" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button><div id="listdiv">

                <form name="signForm" method="post" >

                    <table class="listTbl fixed myTable" name ="myTable">
               <colgroup>
                      
                            <col width="100">
                            <col width="100">
                            <col width="50">
                             <col width="100">
                            <col width="100">
                            <col width="200">
                             <col width="100">
                            <col width="100">
                          <col width="100">
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                        
                                <th class="listTitle">닉네임</th>
                                <th class="listTitle">레벨</th>
                                <th class="listTitle">직업</th>
                                <th class="listTitle">마지막토벌전</th>
                                <th class="listTitle">기여도 달성</th>
                                <th class="listTitle">특이사항</th>
                                <th class="listTitle">경고횟수</th>
                                <th class="listTitle">경고사유</th>
                			   <th class="col-md-2">수정</th>
                            </tr>
                            
                           <!-- jspl -->
                           
                        <c:forEach items="${memberList}" var = "memberList">
                           
                            <tr> 
                       
                                <td class="listData">
                                	<c:out value="${memberList.name}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.lv}" /> 
                                </td>
                                    <td class="listData">
                                	<c:out value="${memberList.role}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.real_tobal}"/>
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.sooncut}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.issu}" />
                                </td>
                        <td class="editable" contenteditable="true">${memberList.yellowCard} </td>
                                <td class="listData">
                                	<c:out value="${memberList.yellowCardWhy}" /> 
                                </td>
                                <td>
                            <a href ="/admin/update?n=${memberList.id}" class="btn btn-primary" type="button" >수정</a>
                                </td>
                            </tr>
                            
                           </c:forEach>
                            
                           
                        </tbody>
                    </table>
                </form>
            </div>
            </form>
 

    <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
</script>
</c:otherwise>
</c:choose>
</body>
</html>

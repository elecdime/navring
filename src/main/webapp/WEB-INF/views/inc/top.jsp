<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<style type="text/css">

	li {list-style: none; display:inline; padding: 6px;}
</style>
 <div class="util_menu">
                    	<c:choose>
                    	<c:when test ="${user == null}">
	                    	<ul>
	                            <li><a href="https://discord.com/api/oauth2/authorize?response_type=code&client_id=894943429283446814&redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&scope=identify%20email%20connections%20guilds.members.read%20guilds">로그인</a></li>
	            
	                            <li onclick = "MSG()"><a href="${pageContext.request.contextPath}/login">마이페이지</a></li>
	                            <li onclick = "MSG()"><a href="${pageContext.request.contextPath}/login">고객센터</a></li>
	                        </ul>
                    	</c:when>
                    	<c:otherwise>
                    	<ul>
                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                            <li><a>${user.nickname}님</a></li>
                            <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                            <li><a href="${pageContext.request.contextPath}/board/flist">고객센터</a></li>
                        </ul>
                    	</c:otherwise>
                    	</c:choose>
  
                    </div>

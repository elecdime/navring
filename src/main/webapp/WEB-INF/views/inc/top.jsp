<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<style type="text/css">

	li {list-style: none; display:inline; padding: 6px;}
</style>

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">나브링</a>
    </div>
    <ul class="nav navbar-nav">
      <li class><a href="/">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">레이드<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/cal">레이드 참여</a></li>
          <li><a href="/calinsert">레이드 참여모집</a></li>

        </ul>
      </li>
 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">기타<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/about">뭐하는곳일까요?</a></li>
          <li><a href="/baby">응애</a></li>

        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:choose>
                    	<c:when test ="${user == null}">
	                    
	                           
	                                 
     								 <li><a href="https://discord.com/api/oauth2/authorize?response_type=code&client_id=894943429283446814&redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&scope=identify%20guilds.members.read%20guilds"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	                        </span>
	                        </ul>
                    	</c:when>
                    	<c:otherwise>
                    
                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                            <li><a>${user.nickname}님</a></li>   
                          </ul>
                    	</c:otherwise>
                    	</c:choose>
                    	

  </div>
</nav>

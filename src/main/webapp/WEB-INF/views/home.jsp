<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<head>
  	<%@include file="inc/meta.jsp" %>
  	 <link rel="shortcut icon" href="../favicon.ico"> 
		<link href='http://fonts.googleapis.com/css?family=Josefin+Slab:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr.custom.79639.js"></script> 
		<!--[if lte IE 8]>
			 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/simple.css" />
		<![endif]-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Home</title>
</head>

 <div class="container">

			<!-- Codrops top bar -->
						
            <div class="codrops-top">
          
                
          
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			
			<div class="st-container">
			
				<input type="radio" name="radio-set" checked="checked" id="st-control-1"/>
				<a href="#st-panel-1">소개</a>
				<input type="radio" name="radio-set" id="st-control-2"/>
				<a href="#st-panel-2">연혁</a>
				<input type="radio" name="radio-set" id="st-control-3"/>
				<a href="#st-panel-3">이벤트</a>
				<input type="radio" name="radio-set" id="st-control-4"/>
				<a href="#st-panel-4">공지</a>
				<input type="radio" name="radio-set" id="st-control-5"/>
				<a href="#st-panel-5">가입</a>
				
				<div class="st-scroll">
				
					<!-- Placeholder text from http://hipsteripsum.me/ -->
					
					<section class="st-panel" id="st-panel-1">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="H"></div>
						<h2>소개</h2>
						<p>앙 디자인 조졌띠</p>
					</section>
					
					<section class="st-panel st-color" id="st-panel-2">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="2"></div>
						<h2>연혁</h2>
						<p>2021-07~</p>
					</section>
					
					<section class="st-panel" id="st-panel-3">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="B"></div>
						<h2>이벤트</h2>
						<p>사이트 디자인해줘.</p>
					</section>
					
					<section class="st-panel st-color" id="st-panel-4">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="x"></div>
						<h2>공지</h2>
						
					</section>
					
					<section class="st-panel" id="st-panel-5">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="Ç"></div>
						<h2>가입</h2>
						<p>디스코드 다임#7109</p>
					</section>

				</div><!-- // st-scroll -->
				
			</div><!-- // st-container -->
			
        </div>
	</body>
</html>
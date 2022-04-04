<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>

<head>
  	<%@include file="inc/meta.jsp" %>
	  <meta name="naver-site-verification" content="57a078cc55a48ce14fe42b80fb42f3f815842f2d" />
  	<meta name="google-site-verification" content="7_Lfkd7uYZXr2qF5IkxrhkR9HM-dyZ0244mzB8c-N1o" />
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
	<title>나브링</title>
<style type="text/css">
.nabring {
	position: relative;
	left: 25%;
	height: 90%;
	opacity: 30%;
}
.navdeco {
z-index: 1;
}
.nabring2 {
	position: relative;
	left: 27.5%;
	height: 90%;
}
.nabring3 {
	position: relative;
	left: 28%;
	height: 90%;
}
</style>
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
				<a href="#st-panel-2">길드컨텐츠</a>
				<input type="radio" name="radio-set" id="st-control-3"/>
				<a href="#st-panel-3">가입</a>
				
				
				<div class="st-scroll">
				
					<!-- Placeholder text from http://hipsteripsum.me/ -->
					
					<section class="st-panel" id="st-panel-1">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco navdeco" data-icon="H"></div>
						<h2>소개</h2>
						<img class="nabring" src="/resources/img/11.png">
						</p>
				
					</section>
					
					<section class="st-panel st-color" id="st-panel-2">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco navdeco" data-icon="2"></div>
						<h2>길드컨텐츠</h2>
					<img class="nabring2"  src="/resources/img/12.png">
					
				
					</section>
					
					<section class="st-panel" id="st-panel-3">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco navdeco" data-icon="B"></div>
							<h2>가입문의</h2>
						<img class="nabring3" src="/resources/img/13.png">
					
					</section>
					
			

				</div><!-- // st-scroll -->
				
			</div><!-- // st-container -->
			
        </div>
	</body>
</html>
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
						<p>평균레벨 1520이상의 니나브서버 친목길드..</p>
						<p>메데이아 점령전2등...</p>
						<p>디스코드 피크시간 접속인원 10↑</p>
						<p>롤 내전(4팀나옴ㄷㄷ),구스구스덕,발탄암살대회,PVP대회 등등... 각종이벤트 </p>
						<p>배고픈데 오늘저녁 뭐먹지</p>
						<p>아무튼 이딴게 친목길드..?</p>
					</section>
					
					<section class="st-panel st-color" id="st-panel-2">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="2"></div>
						<h2>연혁</h2>
						<p>(故니아마을납치단)2021-07 ~ 2022-03</p>
						<p>(나브링)2022-03 ~ ing</p>
					</section>
					
					<section class="st-panel" id="st-panel-3">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="B"></div>
						<h2>이벤트</h2>
						<p>나브링 캐릭터 공모전</p>
						<p>기간 ?</p>
						<p>상품 ?</p>
					
					</section>
					
					<section class="st-panel st-color" id="st-panel-4">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="x"></div>
						<h2>공지</h2>
						<p>2주에 한번 토벌전 참여 필수</p>
						<p>기여도 300이하 댕강 </p>
						<p>미참,기여도 미달시 사유 임원진에게 말하면 정상참작</p>
						<p>사이트 대충만들어서 공지도 대충적음</p> 
					</section>
					
					<section class="st-panel" id="st-panel-5">
					  <%@include file="inc/top.jsp" %>
						<div class="st-deco" data-icon="Ç"></div>
						<h2>가입문의</h2>
						<p>디스코드 다임#7109,강산#8259,밍구님#7021</p>
					</section>

				</div><!-- // st-scroll -->
				
			</div><!-- // st-container -->
			
        </div>
	</body>
</html>
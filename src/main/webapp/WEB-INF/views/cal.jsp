<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="com.bbs.domain.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
    		initialView : 'dayGridMonth',
    		locale : 'ko', // 한국어 설정
    		headerToolbar : {
            	start : "",
                center : "prev title next",
                end : 'dayGridMonth,dayGridWeek,dayGridDay'
                },
    	
    	droppable : false,
    	editable : true, 
    	
    	


    	events : [ 
        	    <%List<Calendar> calendarList = (List<Calendar>) request.getAttribute("calendarList");%>
                <%if (calendarList != null) {%>
                <%for (Calendar vo : calendarList) {%>
                {
                	title : '<%=vo.getTitle()%>',
                    start : '<%=vo.getStart1()%>',
                    end : '<%=vo.getEnd()%>',
               		url : '${pageContext.request.contextPath}/calview?n=<%=vo.getId()%>',

                    	
                    color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
                 },
    	<%}
    }%>
    				], 


                
                
            

    				
    			});
    			calendar.render();
    		});
    	
    </script>
    
    <style>
        #calendarBox{
            width: 70%;
            padding-left: 15%;
        }

    </style>
</head>

<body>
	<%@include file="inc/top.jsp" %>
   <div id='calendar'></div>
</body>

</html>

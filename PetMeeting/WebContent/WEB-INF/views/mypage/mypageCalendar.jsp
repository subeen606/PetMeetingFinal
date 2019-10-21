<%@page import="com.petmeeting.joy.playboard.model.PlayboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!public String dot3(String msg){
	String str = "";
	if(msg.length() >= 17){
		str = msg.substring(0,15);	// 0에서 9까지
		str += "...";
	}else{
		str = msg.trim();
	}
	return str;
}%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 - 나의 일정</title>
<!----------------- CSS------------------->
<link href='mypage_resources/mypage_s/fullcalendar/core/main.css?after'
	rel='stylesheet' />
<link href='mypage_resources/mypage_s/fullcalendar/daygrid/main.css?after'
	rel='stylesheet' />


<!----------------- JS------------------->
<script src='mypage_resources/mypage_s/fullcalendar/core/main.js'></script>
<script src='mypage_resources/mypage_s/fullcalendar/daygrid/main.js'></script>
<script src='mypage_resources/mypage_s/fullcalendar/core/locales/ko.js'></script>

<%
	//Data를 넣기 위해 json 생성
	List<PlayboardDto> joinlist = (List<PlayboardDto>) request.getAttribute("myjoinlist");
	List<PlayboardDto> makelist = (List<PlayboardDto>) request.getAttribute("mymakelist");
	String jsonData = "[";
	if(!joinlist.isEmpty()){
		
		for (PlayboardDto pdto : joinlist) {
	jsonData += "{title:'" + dot3(pdto.getTitle()) + "', start:'" + pdto.getPdate() + "', color:'#ff9c3d' },";
		}
	}
	if(!makelist.isEmpty()){
		for (PlayboardDto pdto : makelist) {
	jsonData += "{title:'" + dot3(pdto.getTitle()) + "', start:'" + pdto.getPdate() + "', color:'#ffe7c1' },";
		}		
	}
	if(jsonData.equals("[")){
		jsonData = "";			
	}
	else{
		jsonData = jsonData.substring(0, jsonData.lastIndexOf(","));
		jsonData += "]";		
	}


	System.out.println("jsonData" + jsonData);
	//calendar에서 불러주기 위한 json data
	request.setAttribute("jsonData", jsonData);
%>

<!-- fullCalendar 초기화 :버튼, 한글화  -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : ['dayGrid' ],
			header : {
				left : '',
				center : 'title',
				right : 'today prev,next'
			},
			
			editable : false,
			contentHeight: 730,
			eventLimit: 3,
			locale : 'ko',
			<%
			if(!jsonData.equals("")){	
			%>
			events : <%=request.getAttribute("jsonData")%>,
			<%
			 }			
			%>
			displayEventTime:false
	});

		calendar.render();
	});
</script>

</head>
<body>

			<jsp:include page="../main.jsp" flush="false" />
<div id="wrapper">

  <!-- Main -->
	<div id="main">
		<div class="inner">
		 <h2>나의 일정</h2>
		 <hr>
		<section class="main-container">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
				<div id='calendar'></div>
							</div>
						</div>
					</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>	


<script type="text/javascript">
$(document).ready(function() {
	$(".fc-left").append(
			"<font>참여</font><div id='join-color'></div><font>모집</font><div id='make-color'></div>");
});

</script>



</body>
</html>
<%@page import="com.petmeeting.joy.playboard.model.PlayboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta charset="UTF-8">
<title>나의페이지 홈</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_resources/mypagehome/css/mypage_home.css?after">
<link href='${pageContext.request.contextPath}/mypage_resources/mypagehome/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/mypage_resources/mypagehome/fullcalendar/list/main.css' rel='stylesheet' />

<script src='${pageContext.request.contextPath}/mypage_resources/mypagehome/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath}/mypage_resources/mypagehome/fullcalendar/list/main.js'></script>
<%
	//Data를 넣기 위해 json 생성
	List<PlayboardDto> joinlist = (List<PlayboardDto>) request.getAttribute("myattendList");
	List<PlayboardDto> makelist = (List<PlayboardDto>) request.getAttribute("mymakeList");
	String jsonData = "[";
	if(!joinlist.isEmpty()){
		
		for (PlayboardDto pdto : joinlist) {
	jsonData += "{title:'" + dot3(pdto.getTitle()) + "', start:'" + pdto.getPdate() + "', backgroundColor:'#ff9c3d' },";
		}
	}
	if(!makelist.isEmpty()){
		for (PlayboardDto pdto : makelist) {
	jsonData += "{title:'" + dot3(pdto.getTitle()) + "', start:'" + pdto.getPdate() + "', backgroundColor:'#ffe7c1' },";
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

<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		  plugins: [ 'list' ],
		  defaultView: 'listWeek',
		  
		  header:{
			  left:'',
			  center:'',
			  right:''
		  },
		  <%
			if(!jsonData.equals("")){	
			%>
			events : <%=request.getAttribute("jsonData")%>,
			<%
			 }
			 %>
			 locale : 'ko'
	});

	calendar.render();
}); 
</script>
</head>


<body class="is-preload">
	<jsp:include page="../main.jsp" flush="false" />
<!-- Wrapper -->
<div id="wrapper">

  <!-- Main -->
	<div id="main">
		<div class="inner">
		  <h2>나의페이지 홈</h2>
		 	<hr>
			<section class="main-container">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 two-boxes">
							<div class="right-box">
								<div class="col-md-12 member-card">
									<div class="grade-container">
									<img class="gradeimg" alt="${userGrade.filename }" 
									src="${pageContext.request.contextPath}/mypage_resources/mypage_j/images/${userGrade.filename }">
									<span class="gradename" >${userGrade.grade_name }</span>
									</div>
									<div class="details">
										<div class="card-detail">
											<div class="card-detail-title">
												현재 포인트
											</div>
											<div class="card-detail-content">
												${login.point} 
											</div>
										</div>
										<div class="card-detail">
											<div class="card-detail-title">
												누적 포인트
											</div>
											<div class="card-detail-content">
												${login.totalpoint} 
											</div>
										</div>
										<div class="card-detail">
											<div class="card-detail-title">
												작성한 글
											</div>
											<div class="card-detail-content">
												${writingCount } 
											</div>
										</div>
										<div class="card-detail">
											<div class="card-detail-title">
												작성한 댓글
											</div>
											<div class="card-detail-content">
												${commentCount }
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 my-description">
									<div class="accordion vertical">
									    <ul>
									        <li>
									            <input type="radio" id="radio-1" name="radio-accordion" />
									            <label for="radio-1">포인트 사용내역</label>
									            <div class="content">
									           <!--  <p>예정된 모임이 없습니다.</p> -->
									        
									              <table class="pointlist_table">
											<colgroup> <col width="10%"><col width="32%"><col width="10%"><col width="10%"><col width="18%"><col width="20%"> </colgroup>
											
											<tbody>
											<tr class="pointlist_table_th">
												<th>NO</th><th>적립/사용내역</th><th>적립</th><th>사용</th><th>잔여포인트</th><th>날짜</th>
											</tr>
												<tr>
													<td colspan="6">후원한 내역이 없습니다.</td>
												</tr>
											
											<%-- 
											<c:if test="${list empty}">
											</c:if>
												<c:forEach items="${list }" var="list" varStatus="i">
											<tr>
												<td>1</td><td>test</td><td>200</td><td>200</td><td>1000</td><td>2019-00-00</td>
											</tr>
												</c:forEach> --%>
											
										
													
											
											
											</tbody>										
										</table> 
									            </div>
									        </li>
									        <li>
									            <input type="radio" id="radio-2" name="radio-accordion" />
									            <label for="radio-2">등급 기준</label>
									            <div class="content">
									              <table class="grade-table">
									              <col width="25%"><col width="25%"><col width="25%"><col width="25%">
									              	<tr>
										              	<th class="grade-th">
										        	      	<img class="grade-th-img" src="${pageContext.request.contextPath}/mypage_resources/mypage_j/images/level_vvip.png">
										             		
										             		 <font color="#f57b76">VVIP</font>
										              	</th>
										              	<th class="grade-th">
										        		   	<img class="grade-th-img" src="${pageContext.request.contextPath}/mypage_resources/mypage_j/images/level_vip.png">            	
										              		<font color="#fed77c">VIP</font>
										              	</th>
										              	<th class="grade-th">
										         			<img class="grade-th-img" src="${pageContext.request.contextPath}/mypage_resources/mypage_j/images/level_family.png">              	
										              		<font color="#65d4f0">FAMILY</font>
										              	</th>
										              	<th class="grade-th">
										               		<img class="grade-th-img" src="${pageContext.request.contextPath}/mypage_resources/mypage_j/images/level_new.png"> 	
										          	    	<font color="#b4ce49">NEW</font>
										              	</th>
									              	</tr>
									              	<tr class="grade-tr">
										              	<td class="grade-td">	
										              		<p>▶ 10000포인트 이상 </p>
										              		<p>▶ 로그인 시 매일 1회 300포인트 증정</p>
										              		<p>▶  소모임/자유게시판 글 작성 시 100포인트 증정</p>
										              	</td>
										              	<td class="grade-td">
										              		<p>▶ 5000포인트 이상 10000포인트 미만</p>
										              		<p>▶ 로그인 시 매일 1회 300포인트 증정</p>
										              		<p>▶ 소모임/자유게시판 글 작성 시 100포인트 증정</p>
										              	</td>
										              	<td class="grade-td">
										              		
										              		<p>▶ 프로필 등록 완료 시</p>
										              		<p>▶ 1000포인트 이상 5000포인트 미만</p>
										              		<p>▶ 로그인 시 매일 1회 300포인트 증정</p>
										              		<p>▶ 소모임/자유게시판 글 작성 시 100포인트 증정</p>
										              	</td>
										              	<td class="grade-td"	>
										              	
										              		<p>▶ 펫미팅 신규가입 시</p>
										              		<p>▶ 로그인 시 매일 1회 300포인트 증정</p>
										              	</td>
									              	</tr>
									              </table>
									            </div>
									        </li>
									        <li>
									            <input type="radio" id="radio-3" name="radio-accordion"  checked="checked"/>
									            <label for="radio-3">이번주 모임</label>
									            <div class="content">
									          			<div id='calendar'></div>
									        
            </div>
        </li>
    </ul>
</div>
									
								</div>
							</div>
							<div class="left-box">
									<table border="1">
									<!-- 팔로워 프로필 사진, 닉네임  / [보드코드] 타이틀, 소모임의 경우   /레지데이트  -->
									<col width="20%"><col width="60%"><col width="20%">
									<c:if test="${ empty flwerAllPlayList }">
									<tr>
										<td>이번주의 팔로워 글이 없습니다.</td>
									</tr>
									</c:if>
									<c:if test="${ not empty flwerAllPlayList }">
										<tr>
										<th>팔로워</th>
										<th>소모임 정보</th>
										<th>모임 예정일</th>
										</tr>
										<c:forEach items="${flwerAllPlayList }" var="play" varStatus="i">
											<tr>
											<td>
												<img src="${play.myprofile_img }">
												<br>
												${play.nickname }
											</td>
											
											<td>
												${play.sort }
												<br>
												${play.category }&nbsp;${play.title }
											</td>
											
											<td>${play.pdate }</td>
											</tr>
										</c:forEach>
									</c:if>
									</table>
							</div>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>


<script type="text/javascript">
$(document).ready(function(){
	var grade = $(".gradename").text();
	
	if(grade == 'new'){
		$(".gradename").css("color","#b4ce49");
	}
	else if(grade == 'family'){
		$(".gradename").css("color","#65d4f0");
	}
	else if(grade == 'vip'){
		$(".gradename").css("color","#fed77c");
	}
	else if(grade == 'vvip'){
		$(".gradename").css("color","#f57b76");
	}

	<%
	for(int i = 0; i< makelist.size();i++){
	%>
		$(".ffe7c1").text("모집");
	<%
	}
	%>
	<%
	for(int i = 0; i< joinlist.size();i++){
	%>
		$(".ff9c3d").text("참여");
	<%
	}
	%>
	
});
</script>
</body>
</html>
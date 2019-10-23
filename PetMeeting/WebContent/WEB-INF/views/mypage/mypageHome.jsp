<%@page import="com.petmeeting.joy.playboard.model.PlayboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	List<PlayboardDto> joinlist = (List<PlayboardDto>) request.getAttribute("myattendList");
	List<PlayboardDto> makelist = (List<PlayboardDto>) request.getAttribute("mymakeList");
	String jsonData = (String)request.getAttribute("jsonData");
%>

<script>
var jsonData = 
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
			events : <%=jsonData%>,
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

    	<jsp:include page="/common/navbar/templates/header.jsp" flush="false"/>
  
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
												${userdto.point} 
											</div>
										</div>
										<div class="card-detail">
											<div class="card-detail-title">
												누적 포인트
											</div>
											<div class="card-detail-content">
												${userdto.totalpoint} 
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
									            <div class="content plistcontent">
									            
									        	
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
									 <label for="flwer-play-activity">팔로워의 최신 소모임</label>
									 <div class="flwer-activity">
									<table id="flwer-play-activity">
									<!-- 팔로워 프로필 사진, 닉네임  / [보드코드] 타이틀, 소모임의 경우   /레지데이트  -->
									<col width="15%"><col width="55%"><col width="25%">
									<c:if test="${ empty flwerAllPlayList }">
									<tr>
										<td>이번주의 팔로워 글이 없습니다.</td>
									</tr>
									</c:if>
									<jsp:useBean id="dateUtil" class="com.petmeeting.joy.mypage.util.MypageDateUtil"/>
									<c:if test="${ not empty flwerAllPlayList }">
										<tr>
										<th>팔로워</th>
										<th>소모임 정보</th>
										<th>모임 예정일</th>
										</tr>
										<c:forEach items="${flwerAllPlayList }" var="play" varStatus="i">
											<jsp:setProperty property="date1" name="dateUtil" value="${play.pdate }"/>
											<tr>
											<td>
												<img src="${play.myprofile_img }" class="list-profileimg">
												<br>
												${play.nickname }
											</td>
											
											<td align="left">
												${play.sort }
												<br>
												${play.category }&nbsp;${play.title }
											</td>
											
											<td><jsp:getProperty property="dateString1" name="dateUtil"/></td>
											</tr>
										</c:forEach>
									</c:if>
									</table>
									</div>
									
									 <label for="flwer-play-activity">팔로워의 최신 게시글</label>
									 <div class="flwer-activity">
									<table id="flwer-free-activity">
									<!-- 팔로워 프로필 사진, 닉네임  / [보드코드] 타이틀, 소모임의 경우   /레지데이트  -->
									<col width="15%"><col width="55%"><col width="25%">
									<c:if test="${ empty flwerFreeList }">
									<tr>
										<td>이번주의 팔로워 글이 없습니다.</td>
									</tr>
									</c:if>
									<c:if test="${ not empty flwerFreeList }">
										<tr>
										<th>팔로워</th>
										<th>게시글 정보</th>
										<th>작성일</th>
										</tr>
										<c:forEach items="${flwerFreeList }" var="free" varStatus="i">
											<jsp:setProperty property="date1" name="dateUtil" value="${free.regdate }"/>
											<tr>
											<td>
												<img src="${free.myprofile_img }" class="list-profileimg">
												<br>
												${free.nickname }
											</td>
											
											<td align="left">
												${free.sort }
												<br>
												${free.category }&nbsp;${free.title }
											</td>
											
											<td><jsp:getProperty property="dateString1" name="dateUtil"/></td>
											</tr>
										</c:forEach>
									</c:if>
									</table>
									</div>
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
	
	
	var frmdata = $("#frm").serialize();
	$(".plistcontent").load("mypagehomePointHistoryList.do?frmdata=" +frmdata);
	
});


function goPage(pageNumber){
	$("#_pageNumber").val(pageNumber);
	$("#_recordCountPerPage").val("${pparam.recordCountPerPage}");
	
	var frmdata = $("#frm").serialize();
	$(".plistcontent").load("mypagehomePointHistoryList.do?frmdata=" +frmdata);
};


</script>
</body>
</html>
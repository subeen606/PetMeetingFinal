<%@page import="com.petmeeting.joy.playboard.model.PlayboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 나의 소모임</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_resources/mypage_s/listform/list-style.css">
<link href="./mypage_resources/mypage_s/datepicker/datepicker.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../main.jsp" flush="false" />

<div id="wrapper">

  <!-- Main -->
	<div id="main">
		<div class="inner">
		  
		  <h2>나의 소모임</h2>
		 <hr>
		  <div id="attend-tap">
		  	<font>참여</font>
		  </div>
		 
		  <div id="make-tap">
			<font>모집</font>	  
		  </div>
			  <div class="searchbar">
				<form id="frm">
				<input type="hidden" id="_play" name="play" value="${listparam.play }">
						<select name="category" id="_category">
							<option>모임 유형</option>
							<option>산책</option>
							<option>봉사</option>
							<option>원데이 클래스</option>
							<option>동호회</option>
							<option>기타</option>
						</select>
						<select name="selection" id="_selection">
							<option>선택</option>
							<option>제목</option>
							<option>장소</option>
							<option>일시</option>
						</select>
						<input type="text" class="input-text" value="" name="keyword" id="_keyword" autocomplete="off">
						 <img alt="d" src="./mypage_resources/mypage_s/images/searchIcon1.png" class="imgBtn" id="searchBtn">
				</form>
			  </div>
		<div class="attend" id="_attend">
	
		  <c:if test="${empty myattendList  }">
		     <section class="left-image">
              <div class="container-fluid">
                	<div class="row">
                		<div class="empty-playlist">
					  	<font>참여한 활동이 없습니다.</font>
                		</div>
                	</div>
               </div>
             </section>
		  </c:if>
		  <jsp:useBean id="dateUtil" class="com.petmeeting.joy.mypage.util.MypageDateUtil"/>
		  <c:forEach items="${myattendList }" var="attend" varStatus="i">
				<jsp:setProperty property="date1" name="dateUtil" value="${attend.pdate }"/>
				<jsp:setProperty property="date2" name="dateUtil" value="${attend.pdate }"/>
				<jsp:setProperty property="date3" name="dateUtil" value="${attend.edate }"/>
				<jsp:setProperty property="location" name="dateUtil" value="${attend.location }"/>
            <section class="left-image">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-4">
                      <img src="./mypage_resources/mypage_s/images/main1.jpg" alt="" class="mysize">
              <!--     <img src="${attend.filename }" alt=""> -->  
                  </div>
                  <div class="col-md-4">
                    <div class="right-content">
                      <h3>[${attend.category}] ${attend.title }</h3>
                      <div>
                      <img src="./mypage_resources/mypage_s/images/calendar.png" class="playicon">&nbsp;&nbsp;<jsp:getProperty property="dateString1" name="dateUtil"/><span id="expired-attend${i.index }" class="expired"></span>
                      </div>
                      <div>
                	    <img src="./mypage_resources/mypage_s/images/location.png" class="playicon">&nbsp;&nbsp;<font><jsp:getProperty property="simpleLoc" name="dateUtil"/></font>
                      </div>
                      <div>
                      <img src="./mypage_resources/mypage_s/images/like.png" class="playicon">&nbsp;&nbsp;<font>${attend.likecount }</font>                      
                      </div>
                      <div id="checkExpired-attend${i.index }" personcount="${attend.personcount}" people="${attend.people }" isEnd="<jsp:getProperty property='isEnd3' name='dateUtil'/>">
    	            <img src="./mypage_resources/mypage_s/images/people.png" class="playicon">&nbsp;&nbsp;<font>${attend.personcount}명 참여중  모집인원 ${attend.people }명</font>
                     </div>
                      <div class="primary-button" seq="${attend.seq }" isEnd="<jsp:getProperty property='isEnd2' name='dateUtil'/>">
                        <a>Read More</a>
                      </div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </section>

			<hr>
          
             </c:forEach>
            <div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="moreBtn" style="color:#23527c">LOAD MORE</a> </div>
            </div>
            
            <div class="make">
		
		  <c:if test="${empty mymakeList  }">
		   	 <section class="left-image">
              <div class="container-fluid">
                	<div class="row">
                		<div class="empty-playlist">
					  	<font>모집한 활동이 없습니다.</font>
                		</div>
                	</div>
               </div>
             </section>
		  </c:if>
		  <c:forEach items="${mymakeList }" var="make" varStatus="i">
		  	<jsp:setProperty property="date2" name="dateUtil" value="${make.pdate }"/>
				<jsp:setProperty property="date3" name="dateUtil" value="${make.edate }"/>
			<jsp:setProperty property="location" name="dateUtil" value="${make.location }"/>
            <section class="left-image">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-4">
                      <img src="./mypage_resources/mypage_s/images/main1.jpg" alt="" class="mysize">
              <!--     <img src="${make.filename }" alt=""> -->  
                  </div>
                  <div class="col-md-4">
                    <div class="right-content">
                      <h3>[${make.category}] ${make.title }</h3>
                      <div>
                      <img src="./mypage_resources/mypage_s/images/calendar.png" class="playicon">&nbsp;&nbsp;<font><jsp:getProperty property="dateString2" name="dateUtil"/></font><span id="expired-make${i.index }" class="expired"></span>
                      </div>
                      <div>
                	    <img src="./mypage_resources/mypage_s/images/location.png" class="playicon">&nbsp;&nbsp;<font><jsp:getProperty property="simpleLoc" name="dateUtil"/></font>
                      </div>
                      <div>
                      <img src="./mypage_resources/mypage_s/images/like.png" class="playicon">&nbsp;&nbsp;<font>${make.likecount }</font>                      
                      </div>
                      <div id="checkExpired-make${i.index }" personcount="${make.personcount}" people="${make.people }" isEnd="<jsp:getProperty property='isEnd3' name='dateUtil'/>">
    	            <img src="./mypage_resources/mypage_s/images/people.png" class="playicon">&nbsp;&nbsp;<font>${make.personcount}명 참여중  모집인원&nbsp; ${make.people }명</font>
                     </div>
                      <div class="primary-button"  seq="${make.seq }" isEnd="<jsp:getProperty property='isEnd2' name='dateUtil'/>">
                        <a>Read More</a>
                      </div>
                    </div>
                  </div>
               
                </div>
              </div>
            </section>

			<hr>
          
             </c:forEach>
             
            </div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>	
<script src="./mypage_resources/mypage_s/datepicker/datepicker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var play = $("#_play").val();
	
	if(play == "attend"){
		$(".make").hide();
		$("#attend-tap").css("background-color","rgb(241,238,235,0.6)");
		$("#make-tap").css("background-color","white");
	}	
	else if(play == "make"){
		$(".attend").hide();
		$("#make-tap").css("background-color","rgb(241,238,235,0.6)");
		$("#attend-tap").css("background-color","white");
	}
	<%List<PlayboardDto> attendlist = (List<PlayboardDto>)request.getAttribute("myattendList"); 
	List<PlayboardDto> makelist = (List<PlayboardDto>)request.getAttribute("mymakeList");%>
	
	


	
	<%
	for(int i = 0; i <attendlist.size() ; i++){
	%>
		var people = $("#checkExpired-attend<%=i%>").attr("people");
		var personcount =  $("#checkExpired-attend<%=i%>").attr("personcount");
		var edate =  $("#checkExpired-attend<%=i%>").attr("isEnd");
		
		if(edate == 0 || people == personcount){
			$("#expired-attend<%=i%>").text("  마감 ");	
		}
	<%
	}
	%>
	<%
	for(int i = 0; i <makelist.size() ; i++){
	%>
		var people = $("#checkExpired-make<%=i%>").attr("people");
		var personcount =  $("#checkExpired-make<%=i%>").attr("personcount");
		var edate =  $("#checkExpired-attend<%=i%>").attr("isEnd");
		
		
		if(edate == 0 || people == personcount){
			$("#expired-make<%=i%>").text("  마감 ");	
		}
	<%
	}
	%>
	
	$(".primary-button").on("click",function(){
		var pdate =$(this).attr("isEnd");
		var seq = $(this).attr("seq");
		
		if(pdate == 0){
			alert("모임 예정일이 지난 소모임입니다.");
		}else{
			location.href="detailPlay.do?seq="+seq;
		}
		
		
	});
	
	$("#attend-tap").on("click",function(){
		$(this).css("background-color","rgb(241,238,235,0.6)");
		$("#make-tap").css("background-color","white");
		$(".attend").show();
		$(".make").hide();
		$("#_play").val("attend");
	});
	
	$("#make-tap").on("click",function(){
		$(this).css("background-color","rgb(241,238,235,0.6)");
		$("#attend-tap").css("background-color","white");
		$(".make").show();
		$(".attend").hide();
		$("#_play").val("make");
	});

	$("#searchBtn").on("click", function(){
		$("#frm").attr("action","mypageplaylist.do").submit();
	});
	
	
	$("#_selection").on("change", function(){
		if($(this).val() == "일시"){
			$("#_keyword").attr("data-toggle","datepicker");
			$('[data-toggle="datepicker"]').datepicker();
		}
		else{
			$('[data-toggle="datepicker"]').datepicker("destroy");
			$("#_keyword").removeAttr("data-toggle","datepicker");
			
		}
	});
	
	 load('#_attend', '5');
	 $("#js-btn-wrap .moreBtn").on("click", function () {
	        load('#_attend', '5', '#js-btn-wrap');
	 });
	    
	
});

function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.moreBtn').hide();
        $('.btn-wrap').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

</script>
</body>
</html>
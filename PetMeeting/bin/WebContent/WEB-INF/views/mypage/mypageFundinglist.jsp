<%@page import="com.petmeeting.joy.funding.model.FundingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 나의 후원 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_resources/mypage_s/listform/list-style.css">
<link href="./mypage_resources/mypage_s/datepicker/datepicker.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../main.jsp" flush="false" />
<div id="wrapper">

  <!-- Main -->
	<div id="main">
		<div class="inner">
		  <h2>나의 후원 내역</h2>
		 <hr>
			  <div class="fund-searchbar">
				<form id="frm">
						<input type="text" class="input-text" value="" name="keyword" id="_keyword" placeholder="후원명을 입력하세요">
						 <img alt="d" src="./mypage_resources/mypage_s/images/searchIcon1.png" class="imgBtn" id="searchBtn">
				</form>
			  </div>
			<br><br>
		<div class="attend" id="_attend">
	
		  <c:if test="${empty fundinglist  }">
		     <section class="left-image">
              <div class="container-fluid">
                	<div class="row">
                		<div class="empty-playlist">
					  	<font>후원한 내역이 없습니다.</font>
                		</div>
                	</div>
               </div>
             </section>
		  </c:if>
		  <jsp:useBean id="dateUtil" class="com.petmeeting.joy.mypage.util.MypageDateUtil"/>
		  <c:forEach items="${fundinglist }" var="fund" varStatus="i">
		   <jsp:setProperty property="date1" name="dateUtil" value="${fund.sdate }"/>
		  <jsp:setProperty property="date2" name="dateUtil" value="${fund.edate }"/>
            <section class="left-image">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-4">
                      <img src="./mypage_resources/mypage_s/images/main1.jpg" alt="" class="mysize">
              <!--     <img src="${fund.thumbnail }" alt=""> -->  
                  </div>
                  <div class="col-md-4">
                    <div class="right-content">
                      <h3>${fund.title }</h3>
                      <div>
                     	 <img src="./mypage_resources/mypage_s/images/calendar.png" class="playicon">&nbsp;&nbsp;<font><jsp:getProperty property="dateString1" name="dateUtil"/> ~ <jsp:getProperty property="dateString2" name="dateUtil"/></font><span id="expired-attend${i.index }" class="expired"></span>
                      </div>
                      <div>
                      	<img src="./mypage_resources/mypage_s/images/like.png" class="playicon">&nbsp;&nbsp;<font>${fund.likecount }</font>                      
                      </div>
                      <div>
    	             	<img src="./mypage_resources/mypage_s/images/angels.png" class="playicon">&nbsp;&nbsp;<font>${fund.personcount}명의 후원</font>
                      </div>
                       <div id="checkExpired-fund${i.index }" isEnd="<jsp:getProperty property='isEnd2' name='dateUtil'/>" current_price="${fund.current_price }" max_price="${fund.max_price }">
                     	 <img src="./mypage_resources/mypage_s/images/fundprice.png" class="playicon">&nbsp;&nbsp;<font>${fund.current_price } / ${fund.max_price }&nbsp;원&nbsp;( 나의 후원금 : ${fund.donation }&nbsp;원 )</font>
                      </div>
                      <div class="primary-button"  seq="${fund.seq }">
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
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>	
<script src="./mypage_resources/mypage_s/datepicker/datepicker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	<%
	List<FundingDto> fundinglist = (List<FundingDto>)request.getAttribute("fundinglist"); 
	%>
	<%
	for(int i = 0; i <fundinglist.size() ; i++){
	%>
		var current_price = $("#checkExpired-fund<%=i%>").attr("current_price");
		var max_price =  $("#checkExpired-fund<%=i%>").attr("max_price");
		var edate = $("#checkExpired-fund<%=i%>").attr("isEnd");
		
		if(edate == 0 || current_price == max_price){
			$("#expired-attend<%=i%>").text("  마감 ");	
		}
		
	<%
	}
	%>

	$(".primary-button").on("click",function(){
		var seq = $(this).attr("seq");
		location.href="fundingDetail.do?seq="+seq+"&email="+<%=request.getAttribute("login")%>;
		
		
		
	});
	$("#searchBtn").on("click", function(){
		$("#frm").attr("action","mypageplaylist.do").submit();
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
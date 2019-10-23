<%@page import="com.petmeeting.joy.login.model.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypagemylike/css/mypagemyfundinglike.css">
</head>
<%
MemberDto member=(MemberDto) request.getSession().getAttribute("login");
%>
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
		 
		  <c:forEach items="${fundinglist }" var="fund" varStatus="i">
		  
		    <div id="section${i.index}">
            
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
                     	 <img src="./mypage_resources/mypage_s/images/calendar.png" class="playicon">&nbsp;&nbsp;<font>${fund.sdate } ~ ${fund.edate }</font><span id="expired-attend${i.index }" class="expired"></span>
                      </div>
                      <div>
                      	<img src="./mypage_resources/mypage_s/images/like.png" class="playicon">&nbsp;&nbsp;<font>${fund.likecount }</font>                      
                      </div>
                      <div>
    	             	<img src="./mypage_resources/mypage_s/images/angels.png" class="playicon">&nbsp;&nbsp;<font>${fund.personcount}명의 후원</font>
                      </div>
                     <div id="checkExpired-fund${i.index }" edate="${fund.edate }" current_price="${fund.current_price }" max_price="${fund.max_price }">
                       <img src=" ./mypage_resources/mypage_s/images/fundprice.png" class="playicon">&nbsp;&nbsp;<font>   ${fund.current_price } / ${fund.max_price } &nbsp; 원 &nbsp; </font> 
                      </div> 
                      <div class="primary-button">
                        <a href="fundingDetail.do?seq=${fund.seq}&email=<%=member.getEmail()%>">Read More</a>
                      </div>
                    </div> 
                  </div>
                 
                </div>
              </div> 
            </section>

			<hr>
			
          </div> 
             </c:forEach>
           
             <input type="hidden" class="nowpage" value="5" >
             <input type="hidden" class="totallist" value="${fundinglist.size() }"> 
            <div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="moreBtn" style="color:#23527c">LOAD MORE</a> </div> 
            </div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>	
<script src="./mypage_resources/mypage_s/datepicker/datepicker.js"></script>
<script type="text/javascript">


$("#js-btn-wrap").click(function () {
	 var nowpage1=$(".nowpage").val();
	 $(".nowpage").val( Number(nowpage1)+5);     
	 var nowpage2=$(".nowpage").val();
	 
	 for(var i=0 ; i<nowpage2; i++){
		 $("#section"+i).fadeIn(2000);
	 }
	 var offset = $("#section" + nowpage1).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);

	
	 
	 if(nowpage2>$(".totallist").val()){
		 $("#js-btn-wrap").hide();
	 }

});

$(document).ready(function(){
	
	
	
	var nowpage=$(".nowpage").val();
	var totalsize=$(".totallist").val();
    if(totalsize<=5){
    	 $("#js-btn-wrap").hide();
    }

	for(var i = Number(nowpage) ; i<totalsize ; i++){
		
		$("#section"+i).hide();
	}	
	
	
	<%
	List<MypageFundingParam> fundinglist = (List<MypageFundingParam>)request.getAttribute("fundinglist"); 
	%>
	<%
	for(int i = 0; i <fundinglist.size() ; i++){
	%>
		var current_price = $("#checkExpired-fund<%=i%>").attr("current_price");
		var max_price =  $("#checkExpired-fund<%=i%>").attr("max_price");
		var edate =  new Date($("#checkExpired-fund<%=i%>").attr("edate"));
		var today = new Date();
		
		if(edate.getTime()<=today.getTime() || current_price == max_price){
			$("#expired-attend<%=i%>").text("  마감 ");	
		}
		
	<%
	}
	%>

	
	$("#searchBtn").on("click", function(){
		$("#frm").attr("action","mypagefundinglike.do").submit();
	});
	

	 load('#_attend', '5');
	 $("#js-btn-wrap .moreBtn").on("click", function () {
	        load('#_attend', '5', '#js-btn-wrap');
	 });
	    
	
});



</script>
</body>
</html>
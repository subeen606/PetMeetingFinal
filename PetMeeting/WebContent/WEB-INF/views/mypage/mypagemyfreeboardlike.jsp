<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypagemylike/css/mypagemyfundinglike.css">
</head>
<body>
<jsp:include page="../main.jsp" flush="false" />
<div id="wrapper">

  <!-- Main -->
   <div id="main">
      <div class="inner">
        <h2>게시글 좋아요</h2>
       <hr>
       <div id="attend-tap">
		<font>게시글</font>
</div>
		 
       
           <div class="fund-searchbar">
            <form id="frm">
            <select name="board_code" id="_category">
							<option>게시판 유형</option>
							<option>강아지</option>
							<option>고양이</option>
							<option>기타 소동물</option>
						</select>
            
               <select name="category" id="_category">
							<option>분류 유형</option>
							<option>잡답</option>
							<option>찾아요</option>
							<option>정보</option>
							<option>질문</option>
							<option>자랑</option>
						</select>
						<select name="selection" id="_selection">
							<option>선택</option>
							<option>제목</option>
							<option>이메일</option>
						</select>
						<input type="text" class="input-text" value="" name="keyword" id="_keyword" autocomplete="off">
						 <img alt="d" src="./mypage_resources/mypage_s/images/searchIcon1.png" class="imgBtn" id="searchBtn">
            </form>
           </div>
          
         <br><br>
      <div class="attend" id="_attend">
   
          </div> 
            
            <c:if test="${empty list }">
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
	-   <c:forEach items="${list }" var="attend" varStatus="i">
				<jsp:setProperty property="date1" name="dateUtil" value="${attend.regdate }"/>
            <div id="section${i.index}">
            <section class="left-image">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-4">
                      <img src="./mypage_resources/mypage_s/images/main1.jpg" alt="" class="mysize">
        
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
                      <div class="primary-button" onclick="playboarddetail(${attend.seq})" seq="${list.seq }" isEnd="<jsp:getProperty property='isEnd2' name='dateUtil'/>">
                        <a>Read More</a>
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
</body>
</html>
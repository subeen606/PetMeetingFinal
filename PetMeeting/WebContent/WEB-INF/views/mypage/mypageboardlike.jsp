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
       
           <div class="fund-searchbar">
            <form id="frm">
                  <input type="text" class="input-text" value="" name="keyword" id="_keyword" placeholder="후원명을 입력하세요">
                   <img alt="d" src="./mypage_resources/mypage_s/images/searchIcon1.png" class="imgBtn" id="searchBtn">
            </form>
           </div>
          
         <br><br>
      <div class="attend" id="_attend">
   
          </div> 
            
           
             <input type="hidden" class="nowpage" value="5" >
             <input type="hidden" class="totallist" value="${fundinglist.size() }"> 
            <div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="moreBtn" style="color:#23527c">LOAD MORE</a> </div> 
            
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>   
</body>
</html>
<%@page import="com.petmeeting.joy.mypage.model.MypageFollowDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/css/msgbox_style.css">
        <%
List<MypageFollowDto> list= (List) request.getAttribute("flist");  
 
        %>

</head>
<body>
    <div class="myfollowfollower">
     <div class="followlist_f">
        [팔로워]
     </div> 
     <div class="followinglist_f">
         팔로잉
     </div>
     
     <div class="flistcontent">
     </div>
     
    </div>
</body>
</html>
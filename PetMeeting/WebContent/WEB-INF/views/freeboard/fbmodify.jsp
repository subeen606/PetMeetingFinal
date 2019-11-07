<%@page import="com.petmeeting.joy.login.model.MemberDto"%>
<%@page import="com.petmeeting.joy.freeboard.model.FreeboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetMeeting-자유게시판</title>

<link rel="stylesheet" href="freeboard_resources/css/bootstrap.css">
<link rel="stylesheet" href="freeboard_resources/css/freeboard_style.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  
<script type="text/javascript" src="freeboard_resources/ckeditor/ckeditor.js"></script>

</head>
<body>

<!--::header part start::-->
<jsp:include page="/common/navbar/templates/header.jsp" flush="false"/>    
<!-- Header part end-->
          
<%
FreeboardDto dto = (FreeboardDto)request.getAttribute("dto");
%>

<%
MemberDto user = (MemberDto)request.getSession().getAttribute("login");
%>
<!-- 설명 설명 들어가는 부분 -->

<br><br>
<form name="frmForm" id="_frmForm" method="post" action="freeboard_boardupdate.do">
<input type="hidden" name="nickname" value="<%=user.getNickname() %>">
<input type="hidden" name="email" value="<%=user.getEmail() %>">
<input type="hidden" name="seq"   value="${dto.seq}"/>
<input type="hidden" name="board_code"   value="${dto.board_code}"/>

<div class="container">
        <div id="commentList">
        	<br><br>
        	<div>
            	<div>
                <span><strong></strong></span> <span id="cCnt"></span>
            	</div>
            		<div>
            			<table>
            			<tr>
		            		<td>	<label for ="category"></label>
							        <select id="category" name="category" size="1">
						            
						            <option name="1" value="잡담">잡담</option>
						            <option name="2" value="찾아요">찾아요</option>
						            <option name="3" value="정보">정보</option>
						            <option name="4" value="질문">질문</option>
						            <option name="5" value="자랑">자랑</option>
						    	    </select>
						   	</td>
	            			<td>
	            				<input type="text" name="title" placeholder="제목" style= width:1000px; value="${dto.title}">
	            			</td>
            			</tr>
            			<tr>
            				<td colspan="2">
            					<textarea type="text" name="content" placeholder="내용" id="p_content"  rows="10" cols="50" >${dto.content}</textarea>			
            				</td>
            			</tr>
            			<tr>
            			</tr>
            	</table>
	       	</div>
	        </div>
        <input type="hidden" id="b_code" name="b_code" value="" />  
        </div>
    
</div>  
<br>

<div class="container">

<input type="button" class="_btnlist cancel" value="수정취소" onclick="location.href='fblistview.do?board_code=${board_code}'">
<input type="submit" class="_btnlist ok" value="수정완료">

</div>

</form>
 
   
<!--::footer part start::-->    
<jsp:include page="/common/navbar/templates/footer.jsp" flush="false"/>   
<!-- footer part end-->
   
 <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
   

<script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500                                                  
                 });
</script>
</body>
</html>
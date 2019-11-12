<%@page import="com.petmeeting.joy.freeboard.model.FreeboardDto"%>
<%@page import="com.petmeeting.joy.login.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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


<input type="hidden" class="hdemail" value="${login.email}">
<%	MemberDto user = (MemberDto)request.getSession().getAttribute("login");%>
<%FreeboardDto fb = (FreeboardDto)request.getAttribute("dto"); %>


<form method="post" name="fbwriteinfo" id="_fbwriteFrm" action="freeboard_boardwritedown.do">
	<input type="hidden" name="email" value="<%=user.getEmail() %>">
	<input type="hidden" name="board_code" value="${board_code}">
<div class="container">
  
        <div id="commentList">
        	<br><br>
        	<div>
            	<div>
                <span><strong>${dto.category}</strong></span> <span id="cCnt"></span>
            	</div>
            		<div>
            			<table>
            			<tr>
		            		<td>	<label for ="category"></label>
							        <select id="category" class="category" name="category" size="1">
						            
						            <option name="1" value="잡담">잡담</option>
						            <option name="2" value="찾아요">찾아요</option>
						            <option name="3" value="정보">정보</option>
						            <option name="4" value="질문">질문</option>
						            <option name="5" value="자랑">자랑</option>
						    	    </select>
						   	</td>
	            			<td>
	            				<input type="text" name="title" maxLength="40" class="title" placeholder="제목" style= width:1000px;>
	            			</td>
            			</tr>
            			<tr>
            				<td colspan="2"><br>
            					<textarea type="text" name="content" class="content" placeholder="내용" id="p_content"  rows="10" cols="50" ></textarea>		
            					
            				</td>
            			</tr>
            	</table>
	       	</div>
	        </div>
        <input type="hidden" id="b_code" name="b_code" value="" />  
        </div>
   <br>
</div>  


<div class="container" >
<input type="button" class="_btnlist cancel" value="취소" onclick="location.href='freeboard_listview.do'">
<input type="button" class="_btnlist ok" value="글쓰기완료" onclick="writefb()">
<br><br><br><br>	
<!-- email -->
<input type="hidden" class="hdemail" value="${login.email}">

</div>
</form>

<!--::footer part start::-->    
<jsp:include page="/common/navbar/templates/footer.jsp" flush="false"/>   
<!-- footer part end--> 


<script>
function notnull(){
	alert("여기옴");
	
}



function writefb(){
	var form = document.fbwriteinfo;
	
 	if(!form.title.value || !form.content.value){
		alert("모든 항목을 입력해주세요");
		return false;
	} 
	
	$("#_fbwriteFrm").submit();
	
	
}






</script>


<script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500                                                  
                 });
</script>


   
</body>
</html>
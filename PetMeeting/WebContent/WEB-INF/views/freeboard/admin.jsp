<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.petmeeting.joy.freeboard.model.FreeboardDto"%>
<%@page import="com.petmeeting.joy.login.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int totalRecordCount = (int)request.getAttribute("totalRecordCount");
	int pageNumber =  (int)request.getAttribute("pageNumber");
%>
<%
	String s_category = (String)request.getAttribute("s_category");
if(s_category == null) s_category = "";
	
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";

%>
<%
	List<FreeboardDto> list = (List<FreeboardDto>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>PetMeeting-자유게시판</title>

<style>

.fb1{	width:110px;}
.fb2{	width:100px; style="word-break:break-all"}
.fb3{	width:800px;}
.fb4{	width:150px;}
.fb5{	width:130px;}
.fb6{	width:100px;}
.fb7{	width:100px;}



#_btnlist{
	border-radius: 8px;
	width:100px;
	height:30px;
	color:white;
	font-family:NanumSquareRound;
	font-size: 15px;
	
	}


#boardtitle{
	border-radius: 8px;
	width:300px;
	height:50px;
	color:white;
	font-family:NanumSquareRound;
	font-size: 30px;
	
}
</style>    

</head>
<body>
<%
	MemberDto user = (MemberDto)request.getSession().getAttribute("login");
%>
 
    
<input type="hidden" class="hdemail" value="${login.email}">
   
<body>

<h1>관리자 게시판</h1>
<br>

<div class="container">
        <div id="freeboardList" style="float:left">
        	
				<select name="choicesorting" id="sorting_" onchange="_sorting(this.value)">
						<option  value=""<c:if test="${empty sorting }">selected='selected'</c:if>>정렬</option>
						<option  value="old"<c:if test="${sorting eq 'old' }">selected='selected'</c:if> >오래된 작성순</option>
						<option  value="like"<c:if test="${sorting eq 'like' }">selected='selected'</c:if>>좋아요순</option>
						<option  value="read"<c:if test="${sorting eq 'read' }">selected='selected'</c:if>>조회수 많은 순</option>
					</select>
					<select id="" name="category" id="category_" onchange="_category(this.value)">
						<option value="" <c:if test="${empty category }">selected='selected'</c:if>>분류</option>
						<option value="free"<c:if test="${category=='free' }">selected='selected'</c:if>>잡담</option>
						<option value="search" <c:if test="${category=='search'}">selected='selected'</c:if>>찾아요</option>
						<option value="infor"<c:if test="${category=='infor'}">selected='selected'</c:if>>정보</option>
						<option value="qna"<c:if test="${category=='qna'}">selected='selected'</c:if>>질문</option>
						<option value="boast"<c:if test="${category=='boast'}">selected='selected'</c:if>>자랑</option>
					</select>
						<input type="hidden" id="category_"
						<c:if test="${category=='free' }">value="free"</c:if>
						<c:if test="${category=='search' }">value="search"</c:if>
						<c:if test="${category=='infor' }">value="infor"</c:if>
						<c:if test="${category=='qna' }">value="qna"</c:if>
						<c:if test="${category=='boast' }">value="boast"</c:if>
																			>
						<input type="hidden" id="sorting_"
						<c:if test="${sorting=='old' }">value="old"</c:if>
						<c:if test="${sorting=='like' }">value="like"</c:if>
						<c:if test="${sorting=='read' }">value="read"</c:if>
																			>
						
			
			
			
        <input type="hidden" id="b_code" name="b_code" value="" /> 
        </div>
    </form>
    </div>
    <!-- 검색 -->

<form id="_frmFormSearch" name="frmForm1" class="_frmFormSearch" method="get" action="freeboard_admin.do">
<div align="right" class="container">
	<input type="hidden" class="sorting" name="sorting" id="frm_sorting" value="">
	<input type="hidden" class="category" name="category" id="frm_category" value="">
	<input type="hidden" class="board_code" name="board_code" id="frm_board_code" value='${board_code }'>
	<!-- 검색 -->
	<select id="_s_category" name="s_category">
		<option value="">선택</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<!-- <option value="email">이메일</option> -->
		<option value="nickname">닉네임</option>
	</select>
	<input type="text" id="_s_keyword" name="s_keyword">
	<button type="button" id="_btnSearch" style="background-color:#585e7d; border: 1px solid #585e7d">검색</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</div>



<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">

</form>


<div class="container">
    <form id="deleteboardform" method="post" action="freeboard_admin_delete.do">
        <div id="freeboardList">
        	<br>
        	<div>
            	<div>
                <span><strong>List</strong></span> <span id="cCnt"></span> <span id="cCnt"></span> <span id="cCnt"></span> <span id="cCnt"></span>
            	</div>
            		<div>
            		 
            		 <table class ="table">
            		<thead>
                            <tr>
                            	<th class="fb1" style="text-align: center"><input type="checkbox" name="alldel" ></th>
                                <th class="fb1" style="text-align: center">게시판</th>
                                <th class="fb2" style="text-align: center">분류</th>
                                <th class="fb3" style="text-align: center">제목</th>
                                <th class="fb4" style="text-align: center">작성자</th>
                                <th class="fb5" style="text-align: center">작성일</th>
                                <th class="fb6" style="text-align: center">조회수</th>
                                <th class="fb7" style="text-align: center">좋아요</th>
                                <th class="fb7" style="text-align: center">상태</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                         <%
                         	for(int i = 0; i < list.size(); i++) { 
                                                 	FreeboardDto fb = list.get(i);
                                                 	
                                                 	String from = fb.getRegdate();
                                                 	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                 	Date to = transFormat.parse(from);                                                 	
                                                 	
                         %>
                        	
                            <tr>
                            	<td><input type="checkbox" name="deleteboard" value="<%=fb.getSeq() %>"></td>
                               	<td style="text-align: center">
                               		<%if(fb.getBoard_code().equals("DOG")){ %>
	                                 	강아지
	                                <%}else if(fb.getBoard_code().equals("CAT")	){ %>
	                                	고양이
	                               <%} else{%>
	                               		기타 동물
	                               		<%} %>
                               	</td>
                               	
                               	<td style="text-align: center"><%=fb.getCategory() %></td>
                                <td style="word-break:break-all; color:black;">
                             	<a href="freeboard_boardadmindetail.do?seq=<%=fb.getSeq()%>" style="color:black; "><%=fb.getTitle() %>&nbsp;&nbsp;&nbsp;(<%=fb.getCountreply() %>)</a>
                                
                                </td>
                                <td style="text-align: center"><img src="./gradeimg/<%=fb.getFilename()%>" style="width:20px; height:20px;" ><%=fb.getNickname() %></td>
                                <%-- <td style="text-align: center"><%=fb.getRegdate() %></td> --%>
                                <td style="text-align: center"><%=transFormat.format(to) %></td>
                                <td style="text-align: center"><%=fb.getReadcount() %></td>
                                <td style="text-align: center"><%=fb.getLikecount() %></td>
                                
                                <td style="text-align: center">
	                                <%if(fb.getDel() == 0){ %>
	                                	삭제안됨
	                                <%}else{ %>
	                                	삭제됨
	                               <%} %>
                                </td>
                                
                            </tr>                       	
                        	<%
                        
                        }
                        %> 
                        </tbody> 
            		 </table>
            </div>
	        </div>
        <input type="hidden" id="b_code" name="b_code" value="" /> 
        </div>
    </form>
</div>

<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/freeboard/paging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />	
	</jsp:include>
</div>

<div class="container">
<input id="deleteBtn" type="button" value="삭제" onclick="deleteboard()">
</div>


<!--::footer part start::-->    
<jsp:include page="/common/navbar/templates/footer.jsp" flush="false"/>   
<!-- footer part end-->
   


<script type="text/javascript">

$(function () {
	
	
	/* 전체선택 및 전체선택 해제 */
	$("input:checkbox[name='alldel']").change(function() {
		if($("input:checkbox[name='alldel']").is(":checked")){
			//alert("체크");
			$("input:checkbox[name='deleteboard']").each(function () {
				$(this).prop("checked", true);
			});
		}else{
			//alert("체크 해제");
			$("input:checkbox[name='deleteboard']").each(function () {
				$(this).prop("checked", false);
			});
		}
	});
	
	
	$("#deleteBtn").click(function () {
		var checklen = $("input:checkbox[name='deleteboard']:checked").length;
		if(checklen == 0){
			alert("삭제할 글을 선택하세요!");
		}else{
			var check = confirm("선택하신 글들을 삭제하시겠습니까?");
			if(check){
				$("#deleteboardform").submit();
			}else{
				return false;
			}
		}
		
		
	});
	

});

function goPage( pageNumber ) {
	var sort = $("select[name=choicesorting]").val();
	var category = $("select[name=category]").val();
	
	
	$("#frm_sorting").val(sort);
	$("#frm_category").val(category);
	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "freeboard_admin.do").submit();	
	
}




function _sorting(sorting){
	var category = $("#category_").val();
	var sorting = $("#sorting_").val();
	$("#frm_sorting").val(sorting);
	$("#frm_category").val(category);
	$("#keyword").val(keyword);
	$("#_pageNumber").val(0);
	$("#_frmFormSearch").submit();
	}
 	
function _category(category){
	var sorting = $("#sorting_").val();
	
 	$("#frm_sorting").val(sorting);
	$("#frm_category").val(category);
	$("#keyword").val(keyword);
	//alert($("#frm_category").val());
	$("#_pageNumber").val(0);
	$("#_frmFormSearch").submit();
 	}
 	
 	
 	
 	

$("#_btnSearch").click(function () {
	
	var form = document.frmForm1;
	var content = $(".s_keyword").val();
	//alert(content);
	
	if(!form._s_category.value){
		alert("카테고리를 선택해주세요");
		return false;
	}
	if(!form.s_keyword.value){
		alert("내용을 입력해주세요");
		return false;
	}
	
	
	
	
	
	
	
	
	
	var check = $("#_s_keyword").val;
	//alert(check);
	
	$("#_pageNumber").val(0);
	
	var sort = $("select[name=choicesorting]").val();
	var category = $("select[name=category]").val();
	
	
	$("#frm_sorting").val(sort);
	$("#frm_category").val(category);
	$("#_frmFormSearch").attr("action", "freeboard_admin.do").submit();	
});


//검색을 유지하기 위한 처리
var s_category = "<%=s_category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
	document.frmForm1.s_keyword.value = keyword;
	
	if(keyword == "" || keyword == null){
		s_category = "";
	}
	
	$("#_s_category").val( s_category );
	
});

 	

</script>
</body>
</html>
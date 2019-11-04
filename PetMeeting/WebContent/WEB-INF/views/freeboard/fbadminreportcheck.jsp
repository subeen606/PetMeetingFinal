<%@page import="java.util.List"%>
<%@page import="com.petmeeting.joy.freeboard.model.FreeboardDto"%>
<%@page import="com.petmeeting.joy.freeboard.model.ReportDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetMeeting</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>


<%-- <%
	ReportDto reportdto = (ReportDto)request.getAttribute("_reportform");
%> --%>
<%
	FreeboardDto dto = (FreeboardDto)request.getAttribute("dto");
%>

<%
	List<ReportDto> list = (List<ReportDto>)request.getAttribute("reportform");
%>

<div class="container">

<form id="reportFrm">


<%	for(int i = 0; i < list.size(); i++) { 
  ReportDto fb = list.get(i); 
if(list.isEmpty()){ %>
 <span>신고 기록이 없습니다.</span>

<%} %>
  <span>신고자 : <%=fb.getNickname() %></span>
  <span>신고사유 : <%=fb.getReason()%></span>
  <span>신고사유2 : <%=fb.getReasonTxt() %></span>
	<br>

<% } %>



</form>
</div>



</body>
</html>
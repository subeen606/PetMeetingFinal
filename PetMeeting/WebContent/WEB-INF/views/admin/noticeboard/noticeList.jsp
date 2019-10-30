<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>admin</title>
<link rel="icon" href="${pageContext.request.contextPath}/common/navbar/img/petmeetingicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin_resources/css/admin_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin_resources/css/fundingboard.css">
</head>
<body>

<div id="right-panel" class="right-panel">
	<!--::header part start::-->
		<jsp:include page="/admin_resources/admincss/templates/adminheader.jsp" flush="false"/>
	<!-- Header part end-->
<!-- Content -->
<div class="content">
<div class="container">

<div class="mainTitle">공지</div>

<form id="frm">

<input type="text" name="f_keyword" placeholder="글 제목" <c:if test="${f_keyword != null }">value='${f_keyword }'</c:if>> 
<input type="button" id="searchBtn" value="검색">

<input type="button" value="공지 작성" onclick="location.href='noticeWrite.do'">

	<table class="boardTable">
		<thead>
			<tr>
				<th><input type="checkbox" name="allcheck"></th>
				<th>No.</th>
				<th>제목</th>
				<th>공지일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="list" varStatus="vs">
			<tr>
				<td><input type="checkbox" name="seq" value="${list.seq }"></td>
				<td>${vs.count }</td>
				<td><a href="noticeDetail.do?seq=${list.seq }">${list.title }</a></td>
				<td><fmt:formatDate value="${list.regdate }" pattern="[yyyy-MM-dd]"/></td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
</form>
	
	<input id="deleteBtn" type="button" value="삭제">

	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/admin/playboard/paging.jsp" flush="false">
			<jsp:param  name="pageNumber" value="${pageNumber }"/>
			<jsp:param  name="totalRecordCount" value="${totalRecordCount }"/>
			<jsp:param  name="pageCountPerScreen" value="${pageCountPerScreen }"/>
			<jsp:param  name="recordCountPerPage" value="${recordCountPerPage }"/>
		</jsp:include>
	</div>
</div>
</div>
</div>

<script type="text/javascript">
$("input[name=allcheck]").click(function() {
	if($("input[name=allcheck]").prop("checked")){
		$("input[name=seq]").prop("checked",true);
	}else{
		$("input[name=seq]").prop("checked",false);
	}

	$("input[name=seq]").click(function() {
		$("input[name=allcheck]").prop("checked",false);
	});
});

$("#deleteBtn").click(function() {
	
	var checkbox = $("input[name=seq]:checked");
	var checks = $("input[name=seq]");
	var isChecked = false;
	
	for (var i = 0; i < checks.length; i++) {
		if(checks.eq(i).prop("checked")) {
			isChecked = true;
		}
	}
	if(!isChecked){
		alert("삭제할 게시글을 선택해주세요");
	}else{
			$("#frm").attr("action","noticeDelete.do").submit();
	}
	
});

$("#searchBtn").click(function() {
	$("#_pageNumber").val(0);
	$("#frm").attr({"action":"noticeList.do","method":"post"}).submit();
});

/*페이징 번호*/
function goPage( pageNumber ) {
	//alert(pageNumber);
	$("#_pageNumber").val(pageNumber);
	$("#frm").attr({"action":"noticeList.do","method":"post"}).submit();
}

</script>


</body>
</html>
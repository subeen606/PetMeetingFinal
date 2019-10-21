<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 	 <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>jQuery CDN - -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin_resources/css/custom.css">
<style type="text/css">
.boardTable td{
text-align: center;
}

.refund-detail{
display: none;
}

.texts{
text-align: left;
}
</style>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<!--::header part start::-->
		<jsp:include
			page="/admin_resources/admincss/templates/adminheader.jsp" flush="false" />
		<!-- Header part end-->

		<div class="content">
			<div class="container">
			<div style="margin: 40px 0;">
				<h4>반품/교환 목록</h4>			
			</div>
			
				<div class="search-wrap">
					<form id="search-form" method="post">
						<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
						<div style="float: left;">
							<select class="search-select" name="sorting_category">
								<option value="">전체</option>
								<option value="1">반품신청</option>
								<option value="3">반품완료</option>
								<option value="4">교환신청</option>
								<option value="6">교환완료</option>
							</select>
						</div>

						<select class="search-select" name="search_category" id="search-category">
							<option value="주문번호">주문번호</option>
							<option value="주문자명">주문자명</option>
						</select> <input type="text" name="s_keyword" id="search_keyword">
						<input type="button" class="search-btn" id="search_btn">
					</form>
				</div>

				<table class="boardTable">
					<colgroup>
						<col width="30">
						<col width="160">
						<col width="220">
						<col width="180">
						<col width="80">
						<col width="80">
						<col width="100">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>반품/교환 날짜</th>
							<th>주문자명</th>
							<th>반품/교환</th>
							<th>반품/교환 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rlist }" var="list" varStatus="vs">
							<tr>
								<td>${vs.count }</td>
								<td class="refund_detail">${list.ordernumber }</td>
								<td>${list.ordername }</td>
								<td><fmt:formatDate value="${list.refund_date }" pattern="yyyy-MM-dd" /></td>
								<td>${list.rname }</td>
								<td>${list.refund_select }</td>
								<td>
									<c:if test="${list.status eq 1 }">
										<span class="status-change" onclick="cancelPay()" style="cursor: pointer;" ordernumber="${list.ordernumber }">반품대기</span>
									</c:if>
									<c:if test="${list.status eq 2 }">
										반품진행
									</c:if>
									<c:if test="${list.status eq 3 }"> 	
										반품완료
									</c:if>
									<c:if test="${list.status eq 4 }">
										반품대기
									</c:if>
									<c:if test="${list.status eq 5 }">
										교환진행
									</c:if>
									<c:if test="${list.status eq 6 }">
										교환완료
									</c:if>
									
								</td>
							</tr>
							<tr class="refund-detail">
								<td colspan="1"></td>
								<td colspan="6">
									<div class="content-refund-for-reason texts">
										<span class="category" style="width: 120px;">반품/교환 사유</span>${list.reason }	
<%-- 										<span class="status-change" style="padding-left: 50px;">${list.refund_select } 완료</span> --%>
									</div>
									<div class="content-order-product texts">
<%-- 										<c:forEach items="${olist }" var="olist"> --%>
<%-- 											- ${olist.productname } [OPTION] ${olist.psize }/${olist.pcolor } <br> --%>
<%-- 										</c:forEach> --%>
									</div>
									<div class="content-refund-reason-for-detail texts">${list.reason_detail }</div>
									<div class="content-refund-img texts">
									<c:forTokens items="${list.filename }" delims="-" var="file">
										<img alt="이미지없음" src="${pageContext.request.contextPath }/upload/${file}" width="100px" height="100px">
									</c:forTokens>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="7">
							<jsp:include page="/WEB-INF/views/store/mystore/paging.jsp" flush="false">
									<jsp:param name="" value="type" />
									<jsp:param name="pageNumber" value="${pageNumber }" />
									<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
									<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
									<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
							</jsp:include>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
<script type="text/javascript">

// 주문번호 클릭시 반품 사유 디테일 
$(".refund_detail").click(function() {
	$(".refund-detail").css("display", "none");
	$(this).parent().next(".refund-detail").css("display", "table-row");
});



/* function cancelPay() {
    jQuery.ajax({
      "url": "http://www.myservice.com/payments/cancel",
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
        "cancel_request_amount": 2000, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
        "refund_bank": "88"  // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
      }),
      "dataType": "json"
    });
  }
 */


// 페이징 함수
function goPage( type, pageNumber ) {
	$("#_pageNumber").val(pageNumber);
	$("#search-form").attr("action", "adrefundlist.do").submit();
}
 
</script>

</body>
</html>
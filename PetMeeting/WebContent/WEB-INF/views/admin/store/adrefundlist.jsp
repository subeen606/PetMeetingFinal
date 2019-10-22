<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	 <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
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
.content-order-product{
color: #818181; 
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
								<td class="refund_detail" rseq="${list.refund_seq }">${list.ordernumber }</td>
								<td>${list.ordername }</td>
								<td><fmt:formatDate value="${list.refund_date }" pattern="yyyy-MM-dd" /></td>
								<td>${list.rname }</td>
								<td>${list.refund_select }</td>
								<td>
									<c:if test="${list.status eq 1 }">
										<%-- <span class="status-refund" style="cursor: pointer;" ordernumber="${list.ordernumber }">반품대기</span> --%>
										반품대기
									</c:if>
									<c:if test="${list.status eq 2 }">
										반품진행
									</c:if>
									<c:if test="${list.status eq 3 }"> 	
										반품완료
									</c:if>
									<c:if test="${list.status eq 4 }">
										<%-- <span class="status-change"  style="cursor: pointer;" orderno="${list.ordernumber }">교환대기</span> --%>
										교환대기
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
									<div class="content-refund-for-reason texts" >
										<span class="category" style="width: 120px;">반품/교환 사유</span>${list.reason }	&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
										<c:if test="${list.status eq 1 }">
											<span class="status-refund" style="cursor: pointer; color: #B50000;" ordernumber="${list.ordernumber }" detail="${list.reason_detail }">반품진행</span>
										</c:if>
										<c:if test="${list.status eq 4 }">
										<span class="status-change"  style="cursor: pointer; color: #B50000;" ordernumber="${list.ordernumber }">교환진행</span>
										</c:if>
									</div>
									<div class="content-order-product texts" style="padding-left: 25px;">
											
									</div>
									<div class="content-refund-reason-for-detail texts" id="detail_reason">${list.reason_detail }</div>
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

var sort_category = "${param.sorting_category}";
var s_keyword = "${param.s_keyword}";
var search_category = "${param.search_category}";
var pageNumber = "${param.pageNumber}";

//정렬값 유지
$("select[name='sorting_category']").val(sort_category);

// 검색 카테고리가 선택되어있을 시 값 유지
if(search_category != ''){
	$("#search_keyword").val(s_keyword);
	$("#search-category").val(search_category);
}

// 정렬 카테고리 값 변경시
$("select[name='sorting_category'").change(function() {
	$("#search-form").attr("action", "adrefundlist.do").submit();	
})

// 검색시
$("#search_btn").click(function() {
	$("#search-form").attr("action", "adrefundlist.do").submit();	
})

// 주문번호 클릭시 반품 사유 디테일 
$(".refund_detail").click(function() {
	var seq = $(this).attr("rseq");
	$(".refund-detail").css("display", "none");
	
	// 반품한 상품, 개수 가져옴
	$.ajax({
		url : "adrefundproduct.do",
		type: "POST",
		data: {"seq" : seq},
		success: function (data) {
			var htm = "";
			var sum = 0;
			$.each(data, function(i, val) {
				
				sum += val.price;
				
				htm += "-" + val.productname + "  [OPTION]" + val.psize + "/" + val.pcolor + "     " + val.quantity + "개 <br>";
				htm += "<input type='hidden' id='totalprice' value=''>";
			});
				$(".content-order-product").html(htm);
				$("#totalprice").val(sum);
		},
		error: function () {
			alert("err");
		}
		
	})
		$(this).parent().next(".refund-detail").css("display", "table-row");
	
});
/* 
// 반품대기 상태에 커서 올릴때의 이벤트
$(".status-refund").hover(function () {
	$(this).css("color", "#B50000");
	$(this).html("반품");
}, function () {
	$(this).css("color", "#000000");
	$(this).html("반품대기");
});

//교환대기 상태에 커서 올릴때의 이벤트
$(".status-change").hover(function () {
	$(this).css("color", "#B50000");
	$(this).html("교환");
}, function () {
	$(this).css("color", "#000000");
	$(this).html("교환대기");
});
 */
$(".status-refund").click(function () {
	var ordernumber = $(this).attr("ordernumber");
	var totalprice = $("#totalprice").val();
	var detail = $(this).attr("detail");
	
// 	alert("order" + ordernumber);
// 	alert("tp " + totalprice);
// 	alert("detail " + detail);
	
	$.ajax({
       url : "adcancelpay.do",
       type : "POST",
       data : JSON.stringify({
         "reason": detail,
         "merchant_uid" : ordernumber, // 주문번호
         "amount": totalprice // 환불금액
       }),
       dataType : "json"
   }).done(function(result) { // 환불 성공시 로직 
       alert("환불 성공");
   }).fail(function(error) { // 환불 실패시 로직
     alert("환불 실패");
   });
	
});

 $(".status-change").click(function () {
		var ordernumber = $(this).attr("ordernumber");
		var totalprice = $("#totalprice").val();
		alert("order" + ordernumber);
		alert("tp " + totalprice);
 });

// 페이징 함수
function goPage( type, pageNumber ) {
	$("#_pageNumber").val(pageNumber);
	$("#search-form").attr("action", "adrefundlist.do").submit();
};

</script>

</body>
</html>
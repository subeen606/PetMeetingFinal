<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetMeeting-funding</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/common/navbar/img/petmeetingicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/magnific-popup.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/style.css">
    <!-- 우리가 추가한 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/navbar/css/custom.css?after">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fundingboard_resources/css/fundingboard.css">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
</head>
<body>

<!--::header part start::-->
    <header class="header_area">
        <div class="sub_header">
            <div class="container">
                <div class="row align-items-center">
                      <div id="logo">
                         <img src="${pageContext.request.contextPath}/common/navbar/img/petmeetinglogo.png" alt="" title="" width="400px" />
                      </div>
                </div>
            </div>
        </div>
    </header>
    
    <div class="main_menu" id="fundingbar">
    </div>
    <!-- Header part end-->

<form id="frm">
	<input type="hidden" name="email" value="${login.email }">
	<input type="hidden" name="funding_seq" value="${dto.seq }">  
	<div id="divv" class="container">
	<div style="text-align: center;">
	 	<div class="payfont">PETMEETING FUNDING</div>
	 	<div class="con-flex">
			<img class="listimg" src="fundingFileupload/${dto.thumbnail}"> 
			<div class="paycontent">
				<div class="pc">
					<div class="titleSt">${dto.title }</div>
					<div class="introSt">${dto.intro }</div>
				</div>
			</div>
		</div>
		<div class="fundcontent">
		<table class="payTable">
			<tr>
				<th>이름</th>
				<td>${mem.name }</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>${mem.phone }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${mem.address }</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>${mem.address_detail }</td>
			</tr>
			<tr>
				<th>목표금액</th>
				<td><input value='<fmt:formatNumber value="${dto.max_price }" pattern="#,###"/>' readonly="readonly"> 원</td>
				<input type="hidden" id="goal_fund1" value="${dto.max_price }">
			</tr>
			<tr>
				<th>남은금액</th>
				<td><input value='<fmt:formatNumber value="${dto.max_price - dto.current_price }" pattern="#,###"/>' readonly="readonly"> 원</td>
				<input type="hidden" id="goal_fund" value="${dto.max_price - dto.current_price }">
			</tr>
			<tr>
				<th>후원금액</th>
				<td><input class="number" id="_funding" type="text"  placeholder="후원금액" > 원</td>
				<input type="hidden" name=donation id="realfund">
			</tr>
			<tr>
				<td colspan="2">
					<input style="display: inline" type="radio" name="howfund" value="포인트기부">포인트기부 &nbsp;&nbsp;
					<input style="display: inline" type="radio" name="howfund" value="결제기부">결제기부
				</td>
			</tr>
			<tr id="pointCheck" style="display: none">
				<th>사용POINT / 보유POINT</th>
				<td><input name="d_point" id="fundingPt" type="text" placeholder="0">  /  <input id="_point" type="text" value="${mem.point }" readonly="readonly">
				<input id="pointBtn" type="button" value="포인트사용">
				</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><input id="funding" type="text" readonly="readonly"> 원</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" class="check">전체선택 <br>
					<input type="checkbox" id="check1" class="checkB">PetMeeting 이용약관 동의 <a href="">상세보기</a>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="check2" class="checkB">개인정보 수집/이용 동의 <a href="">상세보기</a>
				</td>
			</tr>
		</table>
		<div class="PayBtn">
			<input class="PBtn" id="check_module" type="button" value="후원하기"> &nbsp;&nbsp;&nbsp;&nbsp;
			<input  class="PBtn" id="close" type="button" value="취소">				
		</div>
	</div>	
</div>
</div>
</form>


<script>

$(document).on("keyup", "input[type=text].number", function () {
    var $this = $(this);
    var num = $this.val().replace(/[^0-9]/g,"");
 
    var parts = num.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    $this.val(parts.join("."));
});

/* 약관동의 */
$(".check").click(function() {
	$(".checkB").prop('checked', this.checked);
});


/* 기부방법결정 */
$("input[name=howfund]").click(function() {
	var num = $(".number").val().replace(/[^\d]+/g, "");
	$("#realfund").val(parseInt(num));
	
	var goal = parseInt($("#goal_fund").val()); //목표 금액
	var _funding = parseInt($("#realfund").val()); //후원 금액
	var point = parseInt($("#fundingPt").val()); //사용 포인트
	var havepoint = parseInt($("#_point").val()); //보유포인트
	var funding = parseInt($("#funding").val()); //총 후원금액
	
	if($(".number").val() == "" || $(".number").val() == null){
		alert("후원금액을 입력해주세요");
		$("#_funding").focus();
		$("input[name=howfund]").prop("checked",false);
	}else{

	if( goal < _funding ){
		alert("목표금액이 초과된 금액입니다\n다시 입력해주세요.");
		$("#_funding").focus();
	}
	if(_funding > 1000000){
		alert("후원금액은 1,000,000원 이하까지 가능합니다.");
		$("#_funding").focus();
	}
	
	if( goal >= _funding && _funding <= 1000000){	
    	var b = $("input[name=howfund]:checked").val();
    	
		if(b == "포인트기부"){
			$("#pointCheck").css("display","");
			$("#funding").val("");
		  }
		  else if(b != "포인트기부"){
			var num = $(".number").val().replace(/[^\d]+/g, "");
			$("#realfund").val(parseInt(num));
			$("#pointCheck").css("display","none");
		  }
		  if(b == "결제기부"){
			  //alert( $("#_funding").val() );
			$("#funding").val( $("#_funding").val() );  
			$("#_funding").on("propertychange change keyup paste input", function() {
 					var currentVal = $(this).val();
 					$("#funding").val( currentVal );  
		  	});
		   }
		}
	}
});

/* 포인트사용 버튼 클릭시 */
$("#pointBtn").click(function() {
	
	//alert("클릭");
	var num = $(".number").val().replace(/[^\d]+/g, "");
	$("#realfund").val(parseInt(num));
	
	var goal = parseInt($("#goal_fund").val()); //목표 금액
	var _funding = parseInt($("#realfund").val()); //후원 금액
	var point = parseInt($("#fundingPt").val()); //사용 포인트
	var havepoint = parseInt($("#_point").val()); //보유포인트
	var funding = parseInt($("#funding").val()); //총 후원금액

	if($("#fundingPt").val()==""){
		alert("사용하실 POINT를 입력해주세요");
		$("#funding").val("");
		$("#fundingPt").focus();
	}
	if($("#fundingPt").val() < 500){
		alert("포인트는 500점 이상부터 사용가능합니다");
		$("#fundingPt").focus();
	}
	if( _funding < point ){
		alert("후원금액을 초과했습니다.\n사용하실  POINT를 다시 확인해주세요");
		$("#fundingPt").focus();
	}
	if( havepoint < point){
		//alert( $("#fundingPt").val() - $("#_point").val() );
		alert("보유POINT를 초과하셨습니다.\n사용하실 POINT를 다시확인해주세요");
		$("#fundingPt").focus();
	}
	if( _funding >= point && havepoint >= point && point >= 500){
		$("#funding").val($("#realfund").val() - $("#fundingPt").val());
	}
});

/* 팝업 닫기 */
$("#close").click(function() {
		self.close();
});

/* 기부하기 버튼 눌렀을때 (point사용  / 결제 API) */
$("#check_module").click(function () {
	
	var num = $("#funding").val().replace(/[^\d]+/g, "");
	$("#funding").val(parseInt(num));
	
	if($("input[name=d_point]").val() == null || $("input[name=d_point]").val() == ""){
		$("input[name=d_point]").val(0);
	}
	
	var goal = parseInt($("#goal_fund").val()); //목표 금액
	var _funding = parseInt($("#_funding").val()); //후원 금액
	var point = parseInt($("#fundingPt").val()); //사용 포인트
	var havepoint = parseInt($("#_point").val()); //보유포인트
	var funding = parseInt($("#funding").val()); //총 후원금액
	
	//alert( $("#goal_fund").val());
	var a = $("#check1").is(":checked");
	var b = $("#check2").is(":checked");
	if(a == false || b == false){
		alert("[이용약관 동의] 를 해주세요");
	}
	if(_funding>1000000){
		alert("후원금액은 1,000,000원 이하까지 가능합니다.");
	}
	if( goal < funding){
		alert("목표금액이 초과된 금액입니다\n다시 입력해주세요.");
	}

	else if(a==true && b==true){

        if( $("#funding").val() == '0' ){
            var queryString = $("#frm").serialize();
            
            $.ajax({
                  data : queryString,
                  type: "POST",
                  url: "fundingpayAf.do",
                  success: function(data) {
                           //alert("success");
                           alert("후원해주셔서 감사합니다");
                           self.close();
                           opener.document.location.reload();
                        },error: function() {
                        alert("error");
                        }
                  });
             }
         else if($("#funding").val() != '0') {
            var IMP = window.IMP; // 생략가능
            IMP.init('imp35263945');
            // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
            // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
            IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            /*
            'kakao':카카오페이,
            html5_inicis':이니시스(웹표준결제)
            'nice':나이스페이
            'jtnet':제이티넷
            'uplus':LG유플러스
            'danal':다날
            'payco':페이코
            'syrup':시럽페이
            'paypal':페이팔
            */
            pay_method: 'card',
            /*
            'samsung':삼성페이,
            'card':신용카드,
            'trans':실시간계좌이체,
            'vbank':가상계좌,
            'phone':휴대폰소액결제
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /*
            merchant_uid에 경우
            https://docs.iamport.kr/implementation/payment
            위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
            참고하세요.
            나중에 포스팅 해볼게요.
            */
            name: '후원금액',
            //결제창에서 보여질 이름
            amount: $("#funding").val(),
            //가격
            buyer_email: '${mem.email}',
            buyer_name: '${mem.name}',
            buyer_tel: '${mem.phone}',
            buyer_addr: '${mem.address}',
            buyer_postcode: '${mem.address_detail}',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*
            모바일 결제시,
            결제가 끝나고 랜딩되는 URL을 지정
            (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
            */
            }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
            var msg = '\n';
            //msg += '고유ID : ' + rsp.imp_uid;
            //msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount +'\n';
            msg += '카드 승인번호 : ' + rsp.apply_num +'\n';
            msg += '후원해주셔서 감사합니다.';
            var queryString = $("#frm").serialize();
            
            $.ajax({
               data : queryString,
               type: "POST",
               url: "fundingpayAf.do",
               success: function(data) {
                  self.close();
                  opener.document.location.reload();
               },error: function() {
                  alert("error");
               }
            });
            
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
            }alert(msg);
            });
         }
    }
   });
</script>
</body>
</html>
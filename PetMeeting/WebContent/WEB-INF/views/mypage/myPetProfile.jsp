<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 프로필</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/jquery.form.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage_resources/mypage_j/css/myprofile.css">

</head>
<body class="is-preload">
	  <header class="header_area">
    	<jsp:include page="/common/navbar/templates/header.jsp" flush="false"/>
    </header>
	<c:if test="${mypet eq null}">
		<script type="text/javascript">
			$.ajax({
				url : "checkprofile.do",
				async: false,
				success : function(checkIS) {
					if(checkIS){
						console.log("PM_CHECK_MYPROFILE에 유저정보 있음");
						alert("나의 펫 프로필을 등록하고 1000point 받으세요!");
					}
					if(!checkIS){
						console.log("PM_CHECK_MYPROFILE에 유저정보 없음");				
						alert("나의 프로필을 등록 후 펫등록이 가능합니다.");
						location.href="myprofile.do";
					}
				},
				fail : function(error) {
					alert(JSON.stringify(error));		
				}	
			});
		</script>
	</c:if>
	
<!-- Wrapper -->
<div id="wrapper">

  <!-- Main -->
	<div id="main">
		<div class="inner">
			<h2>나의 펫프로필</h2>
			<hr>							
			<section class="main-container">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 myprofile-all-container">
						
							<form name="petProfileForm" id="_petProfileForm">		
							<div class="col-md-6 right-content myprofile-container">
									<input name="email" type="hidden" value="${login.email }">
									<input name="petprofile_img" type="hidden" value="${mypet.petprofile_img }">
									
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">펫 이름</p>							
											<span>
											<input name="petname" type="text" size="20px" value="" >
											
											</span>
											<span><p class="petalert_name displayis" ></p></span>
											
										</div>						
									</div>
								
									<div class="mypageHomebox_1">
										<div class="input_row">
												<p class="input_title">펫 나이</p>
											<span><input name="petage" type="text" size="6px" value="${userProfile.myage==0? '':userProfile.myage }" >&nbsp;&nbsp;세</span>
											<span><p class="petalert_age displayis" >정말이세요..?</p></span>
										</div>						
									</div>
									
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">펫 성별</p>
											<input type="checkbox" class="resizeCheckbox" name="petsex" id="_petsex0" value="0">
											<font class="checklabel">암컷</font>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="checkbox" class="resizeCheckbox" name="petsex" id="_petsex1" value="1">
											<font class="checklabel">숫컷</font>			
										</div>						
									</div>
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">중성화 유무</p>
											<input type="checkbox" class="resizeCheckbox" name="pettnr" id="_pettnr1" value="1">
											<font class="checklabel">유</font>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="checkbox" class="resizeCheckbox" name="pettnr" id="_pettnr0" value="0">
											<font class="checklabel">무</font>
										</div>						
									</div>
										<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">무게</p>
											<span>
											<select name="petweight" class="petselectbox">
												<option value="5kg미만">5kg미만</option>
												<option value="5~10kg">5~10kg</option>
												<option value="10~15kg">10~15kg</option>	
												<option value="15~20kg">15~20kg</option>	
												<option value="20kg이상">20kg이상</option>				
											</select>
											</span>
										</div>						
									</div>
									<div class="mypageHomebox_1">
										<div class="input_row">
										<p class="input_title">펫 소개</p>
											<textarea name="petintro" placeholder="나의 펫에 대한 소개를 작성해주세요"></textarea>
										</div>											
									</div>
							
							
							
							
							</div>
							<div class="col-md-6 left-content myprofile-container">
							
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">펫 프로필 이미지</p>			
											<div class="input_content">								
												<img id="img_preView" class="img_preView" alt="이미지없음" src="./mypage_resources/mypage_j/images/petprofile_icon.png" align="center"/>
																																
												<!-- 프로필세션의 프로필이미지 있는경우 -->
												<!-- 들어온 프로필 변수-->											
												<c:set var="myimg" value="${userProfile.myprofile_img}"/>
												
												<!-- 프로필 이미지파일 있는경우 -->
												<c:if test="${userProfile.myprofile_img ne null}">
													<script>
														var myprofileimg = '<c:out value="${myimg }"/>';							
														$(".img_preView").attr("src", "upload/" + myprofileimg);
													</script>
												</c:if>
												
												<!-- 주소형식 이미지의 경우(카카오프로필의 경우) -->											
												<c:if test="${fn:contains(myimg,'http')}">
													<script>
														var myprofileimg = '<c:out value="${myimg}"/>';
														$(".img_preView").attr("src", myprofileimg);
													</script>
												</c:if>
												
												<br><br>
												<input type="file" name="fileload">
												<p>250px * 250px 이상의 이미지사용을 권장합니다.<br>(권장사이즈 이상 시 사진이 잘릴 수 있습니다)</p>
											</div>
										</div>						
									</div>
									<div class="mypageHomebox_1 below-img" >
										<div class="input_row">
											<p class="input_title">구분</p>
											<span>
											<select name="pettype" onchange="categoryChange(this.value)" class="petselectbox">
												<option value="강아지">강아지</option>
												<option value="고양이">고양이</option>
												<option value="기타">기타</option>			
											</select>
											</span>
										</div>
									</div>
										<div class="mypageHomebox_1 below-img">
										<div class="input_row">
											<p class="input_title">종류</p><!-- 견종, 모종, 그외.. 검색api? 팝업?  -->
											<span>
											<select name="petdetail" id="_petdetail" class="petselectbox">
											</select>
											
											<input name="petdetail" class="ectpet displayis" type="text" size="50px" value="">
											<font class="ectpetinput displayis" color="darkgray">( 강아지,고양이 외의 경우 종을 기입해 주세요. )</font>
											</span>
										</div>
									</div>
							</div>
								</form>		
						</div>
					</div>
				</div>
				<div class="mypageHomebox_1">
									<div class="input_row">
										<button class="profile_Btn displayis" id="myProfile_insertBtn">프로필 등록하기</button>
										<button class="profile_Btn displayis" id="myProfile_updateSubBtn">프로필 수정완료</button>						
									</div>
								</div>
			</section>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp"/>
</div>


<c:if test="${mypet ne null}">	<c:set var="petname" value="${mypet.petname }"/>
<!-- 펫프로필 세션있을 경우 input값 변경 -->
	<c:set var="petage" value="${mypet.petage }"/>
	<c:set var="petprofile_img" value="${mypet.petprofile_img}"/>
	<c:set var="pettype" value="${mypet.pettype}"/>
	<c:set var="petdetail" value="${mypet.petdetail}"/>
	<c:set var="petweight" value="${mypet.petweight}"/>
	<c:set var="petsex" value="${mypet.petsex}"/>
	<c:set var="pettnr" value="${mypet.pettnr}"/>
	<c:set var="petintro" value="${mypet.petintro}"/>
	
	<script type="text/javascript">	
		var petname = '<c:out value="${petname }"/>';
		var petage = '<c:out value="${petage }"/>';							
		var petprofile_img = '<c:out value="${petprofile_img }"/>';		
		var pettype = '<c:out value="${pettype }"/>';	
		var petdetail = '<c:out value="${petdetail }"/>';	
		var petweight = '<c:out value="${petweight }"/>';
		var petsex = '<c:out value="${petsex }"/>';
		var pettnr = '<c:out value="${pettnr }"/>';
		var petintro = '<c:out value="${petintro }"/>';
		
		$("input[name=petname]").attr("value", petname);
		$("input[name=petage]").attr("value", petage);
		$("#img_preView").attr("src", "upload/" + petprofile_img);
		$("select[name=pettype]").val(pettype).prop("selected", true);
		$("select[name=petweight]").val(petweight).prop("selected", true);
		$("input:checkbox[id='_petsex"+petsex+"']").prop("checked", true);
		$("input:checkbox[id='_pettnr"+pettnr+"']").prop("checked", true);
		$("textarea[name=petintro]").val(petintro);
		
		if(pettype === "기타"){
			$("input[name=petdetail]").val(petdetail);
		}
		
	</script>
</c:if>


<script type="text/javascript">
function typeChange( value ) {
	//$("input[name=petage]").val( Number(value) );
	alert( $("input[name=petage]").val() );
}

$(document).ready(function(){
	$(".input_title").prepend("<img src='./mypage_resources/mypage_s/images/orange.png' class='input-icon'>");
	 $('input[type="checkbox"]').bind('click',function() {
		    $('input[type="checkbox"]').not(this).prop("checked", false);
	 });
	
	var gender = $("#gender").val();
	
	if(gender == 0){
		$("#female").prop("checked",true);
	}
	else{
		$("#male").prop("checked",true);
	}
	
	
	
	$.ajax({
		url : "checkpetprofile.do",
		async: false,
		success : function(checkIS) {
			if(checkIS){
				console.log("PM_CHECK_PETPROFILE 등록되어있음");

				$("#petProfile_insertBtn").addClass("displayis");
				$("#petProfile_updateSubBtn").removeClass("displayis");
				
				//유저가 가져온 pettype에 따라 petdetail option 추가, 선택				
				var seltype = $("select[name=pettype] option:selected").val();
				categoryChange(seltype);				
			}
			if(!checkIS){
				console.log("PM_CHECK_PETPROFILE 등록안되어있음");
				categoryChange('강아지');	//초기 펫타입 강아지로 설정
			}
		},
		fail : function(error) {
			alert(JSON.stringify(error));			
		}
	});
 	

	$('input[name=petname]').focus(function(){
		 
		 $('input[name=petname]').addClass("value");
	});

	

});

//select제어
function categoryChange(seltype) {
	// 하위 선택사항 ajax로 받아와소.. 배열에 집어넣어야 한다....
	var dogtype = ["미입력", "말티즈", "미니핀", "요크셔테리어", "불독"];
	var cattype = ["미입력", "뱅갈", "샴", "스코티쉬폴드", "러시안"];

	//var ect = ["기타"];
	var target = document.getElementById("_petdetail");
	var optionarr;

	if(seltype == '강아지'){
		console.log(seltype);
		optionarr = dogtype;
		$("#_petdetail").removeClass("displayis");
	 	$(".ectpet").addClass("displayis");
	 	$(".ectpet").val("");
	 	$(".ectpetinput").addClass("displayis");
	}
	else if(seltype == '고양이'){
		optionarr = cattype;
		$("#_petdetail").removeClass("displayis");
		$(".ectpet").addClass("displayis");
		$(".ectpet").val("");
		$(".ectpetinput").addClass("displayis");
	}
	else if(seltype == '기타'){	
		$("#_petdetail").addClass("displayis");
		$(".ectpet").removeClass("displayis");
		$(".ectpetinput").removeClass("displayis");
		
	}
	
	$('#_petdetail').empty();
	
	for(var count = 0; count < optionarr.length; count++){
		var opt = document.createElement("option");
		opt.value = optionarr[count];
		opt.innerHTML = optionarr[count];		
		target.appendChild(opt);
	}

	$("#_petdetail option:eq(0)").attr("selected", "selected");
}

//checkbox제어
$("#_petsex0").on("click",function(){
	$("#_petsex1").prop("checked",false);
});

$("#_petsex1").on("click",function(){
	$("#_petsex0").prop("checked",false);
});

$("#_pettnr1").on("click",function(){
	$("#_pettnr0").prop("checked",false);
	
});
$("#_pettnr0").on("click",function(){
	$("#_pettnr1").prop("checked",false);
	
});

//파일업로드시 미리보기
$("input[name=fileload]").change(function() {
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img_preView').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

// 펫 프로필 등록 submit
$('#petProfile_insertBtn').on("click",function(){
	alert("등록버튼 click");
	
	// Get form
	var petProfileForm = $("#_petProfileForm")[0];
	//alert("petProfileForm = " + petProfileForm);
	
	// FormData object 생성
	var data = new FormData(petProfileForm);

	// 등록과 수정 모두 이뤄지는 컨트롤러로 이동
	$.ajax({
		url : "updatepetProfile.do",
		method : "post",
		data : data,
		enctype: 'multipart/form-data',
		processData: false,
        contentType: false,
        cache: false,
		async: false,
		success : function(str) {			
			alert("펫 프로필 등록 완료!");
			location.href="mypetprofile.do";
			
		},
		error: function (error) {
            alert(JSON.stringify(error));          
            $("#petProfile_insertBtn").prop("disabled", false);
            alert("펫 프로필 등록 실패...");
		}
	});
	 
});

// 펫프로필 수정 submit
$('#petProfile_updateSubBtn').on("click",function(){
	var petProfileForm = $("#_petProfileForm")[0];
	var data = new FormData(petProfileForm);
  
	$.ajax({
		url : "updatepetProfile.do",
		method : "post",
		data : data,
		enctype: 'multipart/form-data',
		processData: false,
        contentType: false,
        cache: false,
		async: false,
		success : function(str) {			
			alert("펫 프로필 수정 완료!");
			location.href="mypetprofile.do";
			
		},
		error: function (error) {
            alert(JSON.stringify(error)); 
            alert("펫 프로필 수정 실패...");
		}
	});
});



// 스크립트 제어
$('input[name=petname]').on('keyup', function(event) {    
	if($(this).val().length > 8) {
		$('.petalert_name').text("이름은 8자 이하로 작성해 주세요.");
		$('.petalert_name').removeClass("displayis");
		//alert("펫이름은 8자 이하로 작성해 주세요.");
        //$(this).val($(this).val().substring(0, 8));
    }
	if($(this).val().length <= 8) {
		$('.petalert_name').addClass("displayis");
	}
});

$('input[name=petage]').on('keyup', function(event) {    
	if($(this).val().length > 2) {
		$('.petalert_age').text("십장생..?");
		$('.petalert_age').removeClass("displayis");
    }
	if($(this).val().length < 3) {
		$('.petalert_age').addClass("displayis");
    }
	
	var regexp = /[^0-9]/gi;
    var v = $(this).val();

    if ( regexp.test(v) ) {
    	$('.petalert_age').text("숫자만 입력가능 합니다.\n-(하이픈)을 제외한 숫자만 입력하여 주세요.");
        //$(this).val(v.replace(regexp, ''));
    }
	
});



</script>

</body>
</html>
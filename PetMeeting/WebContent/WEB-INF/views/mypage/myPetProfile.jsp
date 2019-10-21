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
	<jsp:include page="../main.jsp" flush="false" />
	
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
						
							<form name="profileForm" id="_profileForm">	
							<div class="col-md-6 right-content myprofile-container">
									<input name="email" type="hidden" value="${login.email }">
									<input name="myprofile_img" type="hidden" value="${userProfile.myprofile_img }">
									<input name="mysex" id="gender" type="hidden" value="${userProfile.mysex }">
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">닉네임</p>							
											<span>
											<input name="nickname" type="text" size="20px" value="${login.nickname }">
											<input type="button" id="nickChk_btn" value="사용하기">
											</span>
										</div>						
									</div>
								
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">&nbsp;&nbsp;나이</p>
											<span>&nbsp;<input name="myage" type="text" size="6px" value="${userProfile.myage==0? '':userProfile.myage }" >&nbsp;&nbsp;세</span>
										</div>						
									</div>
									
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">&nbsp;&nbsp;성별</p>
											<input name="mysex" type="checkbox" value="0" id="female">&nbsp;&nbsp;여
												&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="mysex" type="checkbox" value="1" id="male">&nbsp;&nbsp;남
																	
										</div>						
									</div>
									
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">&nbsp;&nbsp;소개</p>
											<textarea name="myintro">${userProfile.myintro }</textarea>	
										</div>											
									</div>
							
							
							
							
							</div>
							<div class="col-md-6 left-content myprofile-container">
							
									<div class="mypageHomebox_1">
										<div class="input_row">
											<p class="input_title">프로필이미지</p>	
											<div class="input_content">								
												<img id="img_preView" class="img_preView" alt="이미지없음" src="./mypage_resources/mypage_j/images/profile_icon.png" align="center"/>
																																
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


<script type="text/javascript">
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
		url : "checkprofile.do",
		async: false,
		success : function(checkIS) {
			if(checkIS){
				console.log("PM_CHECK_MYPROFILE에 유저정보 있음");
				$("#myProfile_updateSubBtn").removeClass("displayis");
			}
			if(!checkIS){
				console.log("PM_CHECK_MYPROFILE에 유저정보 없음");				
				alert("프로필을 등록하고 1000point 받으세요!");
				$("#myProfile_insertBtn").removeClass("displayis");
			}			
		},
		fail : function(error) {
			alert(JSON.stringify(error));			
		}	
	});
});


// 파일업로드시 미리보기
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



// 프로필 등록 js
$('#myProfile_insertBtn').on("click",function(){
	
	var profileForm = $("#_profileForm")[0];
	var data = new FormData(profileForm);

	$.ajax({
		url : "updateProfile.do",
		method : "post",
		data : data,
		enctype: 'multipart/form-data',
		processData: false,
        contentType: false,
        cache: false,
		async: false,
		success : function(str) {			
			alert("프로필 등록 완료!");
			location.href ="myprofile.do";
			
		},
		error: function (error) {
            alert(JSON.stringify(error));          
            $("#myProfile_insertBtn").prop("disabled", false);
            alert("프로필 등록 실패...");
		}	
	});
	
});

//프로필 수정 js
$('#myProfile_updateBtn').on("click",function(){
	$('input').prop('readonly', false);
	$('textarea').prop('readonly', false);
	$('input[name=nickname]').prop('readonly', false);
	
	// disabled the submit button
    $("#myProfile_updateSubBtn").removeClass("displayis");
	
});

// 프로필 수정 submit
$('#myProfile_updateSubBtn').on("click",function(){

	var profileForm = $("#_profileForm")[0];
	var data = new FormData(profileForm);
	
	$.ajax({
		url : "updateProfile.do",
		method : "post",
		data : data,
		enctype: 'multipart/form-data',
		processData: false,
        contentType: false,
        cache: false,
		async: false,
		success : function(str) {			
			alert("프로필 수정 완료!");
			location.href="myprofile.do";
		},
		error: function (error) {
            alert(JSON.stringify(error));
            alert("프로필 수정 실패...");
		}
	});
});

// 닉네임체크버튼
$("#nickChk_btn").on("click",function(){
	alert("닉네임체크");
	
	var profileForm = $("#_profileForm")[0];
	var data = new FormData(profileForm);
	
	$.ajax({
		url : "nicknameCheck.do",
		method : "post",
		data : data,
		enctype: 'multipart/form-data',
		processData: false,
        contentType: false,
        cache: false,
		async: false,
		success : function(check) {
			alert("success");
			if(check) alert("사용가능한 닉네임입니다");
			else if(!check) alert("사용불가능한 닉네임입니다");
		},
		error: function (error) {
            alert(JSON.stringify(error));
            alert("닉네임체크 실패...");
		}
	});
	

});
</script>
</body>
</html>
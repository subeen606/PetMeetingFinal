$(function() {
	// 회원가입 input 제어 -----------------------------------------------------------------
	var account_email = $("input[name=email]", document.accountform);
	var account_pwd = $("input[name=pwd]", document.accountform);
	var account_nickname = $("input[name=nickname]", document.accountform);
	var account_name = $("input[name='name']", document.accountform);
	var address = $("input[name=address]", document.accountform);
	var address_detail = $("input[name=address_detail]", document.accountform);
	var phone = $("input[name=phone]", document.accountform);
	/*var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;*/
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	
	
	/* 이메일 event */
	account_email.on({
		keyup: function (event) {
			if( account_email.val() == "") {
				account_email.addClass("inputcheck");
				account_email.attr("placeholder","email은 필수사항입니다");
				account_email.focus();
			}
			if( !getMail.test( account_email.val() ) ){
				account_email.css({"font-weight":"initial","color":"initial"});
				$("#emailCheck-Btn").css({"background-color":"#fff","color":"#ccc6c6"});
				if($("#emailCheck-Btn").prop("disabled",false)){
					$("#emailCheck-Btn").prop("disabled",true);
				}				
			}
			else{
				account_email.css({"font-weight":"bolder","color":"#ff9c3d"});
				$("#emailCheck-Btn").css({"color":"#ff9c3d"});
				if($("#emailCheck-Btn").prop("disabled",true)){
					$("#emailCheck-Btn").prop("disabled",false);
				}
			}	
		},
		focusout: function (event) {
			if( !getMail.test( account_email.val() ) ) {
				if( account_email.val() == ""){
					return false;
				}
				alert('이메일 주소를 형식에 맞게 기입하세요. 예)userid@sitename.com');
				return false;
			}
		}
	});


	/* 이메일인증 버튼 event */
	$("#emailCheck-Btn").on({
		focus: function (event) {
			$("#emailCheck-Btn").css({"background-color":"#1d1616bf","color":"#fff"});
			return false;
		},
		focusout: function (event) {
			$("#emailCheck-Btn").css({"background-color":"#fff","color":"#ccc6c6"});
			return false;	
		},
		keydown:function(e) {
		    if (e.keyCode == 13) {
		    	$("#emailCheck-Btn").css({"background-color":"#1d1616bf","color":"#fff"});
		    	if (!e.shiftKey){
		    		alert("체크버튼누름ㄴ");
		    		 // email데리고 가서 체크하고 success하면 focus이동
		    		 account_pwd.focus();
		    	}
		    }
		},
		keyup:function(e) {
		    if (e.keyCode == 13) {
		    	 $("#emailCheck-Btn").css({"background-color":"#fff","color":"#ccc6c6"});
		    }
		},
		click: function(e) {
			alert("이메일인증을 클릭했겠지만 중복체크가 실행될것이다..");
			var nickname = account_email.val().replace(/ /gi, '');
			
			$.ajax({
				url : "checkNickname.do",
				type : "post",
				data :"nickname=" + nickname,
				dataType : "text",
				async: false,
				success : function( data ) {
					alert(data);
				},
				error: function (error) {
		            alert(JSON.stringify(error));
		            alert("닉네임 체크 실패...");
				}
			});
			/*
			var inputEmail = account_email.val();
			alert("이메일인증email = " +inputEmail);
			
			//이메일 인증보내기
			$.ajax({
				url : "emailAuth.do",
				method : "post",
				data : {"inputEmail" : inputEmail},
				dataType: "text",
				success : function( msg ) {
					alert("emailAuth seccess");
					alert(msg);
				},fail : function(error) {
					alert("emailAuth error");
				}
			});	
			*/
			
			
		}
	});


	/* 비밀번호 event */
	account_pwd.on({
		keyup: function(event) {
			if( $(this).val().length > 13) {
				//account_pwd.addClass("inputcheck");
				alert("비밀번호는 13자 이하로 작성해 주세요");
		        $(this).val($(this).val().substring(0, 13));
		        account_pwd.focus();
		        return false;
		    }
		}
	});


	/* 닉네임 event */



	/* 이름 event */	

	
	
	
	
	
	
	
	
	
	
	
	
	
	// 로그인 submit
	$("#login-btn").on("click", function() {
		var id = $("input[name=email]", document.loginform).val();
		var pwd = $("input[name=pwd]", document.loginform).val();
		
		if ( id == "") {
			alert("이메일을 입력하세요");
		}
		else if (pwd == "") {
			alert("비밀번호를 입력하세요");
		}
		else {
			var login_data = $("#login-form").serialize() ;
			
			$.ajax({
				url : "loginAf.do",
				method : "post",
				data : login_data,
				dataType : 'json',
				success : function(num) {
					console.log("userChk = " + num);

					if (num == 0) { //DB에 아이디가 없을 경우 
						console.log("일치하는 유저정보 찾지못함");
						alert("id와 비밀번호를 확인해주세요.");
					}
					if( num == 1 ) {
						console.log("활동이 정지된 계정입니다.");
						alert("활동이 정지된 계정입니다.");
					}
					if (num == 2) { //DB에 아이디가 있는 경우 => 로그인 
						console.log("로그인중...");
						
						//포인트지급관련
						$.ajax({
							url : "loginPointCheck.do",
							method : "post",
							data : login_data,
							dataType : 'json',
							success : function( pointcheck ) {
								if(pointcheck == true) {
									alert("main으로 이동합니다.");
								}else if(pointcheck == false) {
									alert("오늘의 출석 포인트 지급 완료! main으로 이동합니다.");
								}
								$("#login-form").attr("method","POST").attr("action","main.do").submit();
							},fail : function(error) {
								alert("loginPointCheck error");
							}
						});
						
					}

					if (num == 3) { // 탈퇴한 회원
						console.log("탈퇴한회원");
						alert("해당 계정은 탈퇴한 계정입니다.");
					}
				},fail : function(error) {
					alert(JSON.stringify(error));
				}
			});	
			
		}
	});
	
	// 회원가입 submit
	$("#account-btn").on("click", function () {	

		var account_email = $("input[name=email]", document.accountform);
		var account_pwd = $("input[name=pwd]", document.accountform);
		var account_nickname = $("input[name=nickname]", document.accountform);
		var name = $("input[name=name]", document.accountform);
		var address = $("input[name=address]", document.accountform);
		var address_detail = $("input[name=address_detail]", document.accountform);
		var phone = $("input[name=phone]", document.accountform);

		
		if(account_email.val() == ""){
			alert("이메일을 입력해주세요");
			account_email.focus();
		}
		else if(account_pwd.val() == "") {
			alert("비밀번호를 입력해주세요");
			account_pwd.focus();
		}
		else if (account_pwd.val().length < 10){
			alert("비밀번호는 10자 이상 13자 이하로 입력해 주세요");
			account_pwd.focus();
		}
		else if(account_nickname.val() == "") {
			alert("닉네임을 입력해주세요");
			account_nickname.focus();
		}else if(name.val() == "") {
			alert("이름을 입력해주세요");
			name.focus();
		}else if(address.val() == "") {
			alert("주소를 입력해주세요");
			address.focus();
		}else if(address_detail.val() == "") {
			alert("상세주소를 입력해주세요");
			address_detail.focus();
		}else if(phone.val() == "") {
			alert("핸드폰번호를 입력해주세요");
			phone.focus();
		}else {
			
			var accountString = $("#account-form").serialize() ;
			
			$.ajax({
				url : "accountAf.do",
				method : "post",
				data : accountString,
				dataType : 'text',
				success : function(str) {					
					console.log("str = " + str);			
					if (str == "kakaoAccount") { //카카오유저회원가입
						console.log("카카오회원 가입완료");
					}
					if (str == "Account") { //일반유저회원가입 
						console.log("일반유저회원가입완료");
					}				
					alert("회원가입완료! 홈페이지 메인으로 이동합니다.");
					
					//포인트지급관련
					$.ajax({
						url : "loginPointCheck.do",
						method : "post",
						data : accountString,
						dataType : 'json',
						success : function( msg ) {
							alert("포인트지급 여부 msg = " + msg);
							alert(JSON.stringify(msg));					
							alert("로그인중...");							
							location.href = "main.do";
						},fail : function(error) {
							alert("loginPointCheck error");
						}
					});	
					
					
				},fail : function(error) {
					alert(JSON.stringify(error));
				}
			});	
		}
	});
});


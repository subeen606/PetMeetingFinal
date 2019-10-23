
<%@page import="com.petmeeting.joy.mypage.model.MypageFollowDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/css/mypageFollow.css">

<%
	List<MypageFollowDto> list = (List) request.getAttribute("mypagelist");
	System.out.println("listsize" + list.size());
%>


</head>
<body>


	<div id="mypageHome">

		<div class="header">
			<jsp:include page="../main.jsp" flush="false" />
		</div>

		<div class="main">
			<div class="sideMenu">
				<jsp:include page="/WEB-INF/views/mypage/mypageSidemenu.jsp" />
			</div>


			<div class="mypageMain">
				<%-- 				<!-- follow코드 오는 부분! -->
<%
int listsize=(int)request.getAttribute("listtotalsize");
%>
	 --%>
	            <div class="topimg">
					<img class="img1" alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet2.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet3.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet4.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet2.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet3.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet4.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet2.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet3.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet4.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet2.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet3.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet4.jpg">
				    <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet2.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet3.jpg">
					<img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet4.jpg">

				
				</div>
				<div class="searchdiv">
					<span class="selectsearch"> <select class="s_category">
							<option vlaue="email">EMAIL</option>

					</select>
					</span> <input type="text" class="searchtext">
					<button type="button" class="searchbtn">
				  검색
					</button>

				</div>

				<div class="quotes">
					<%
						if (list.size() == 0) {
					%>
					구독하고 있는 사람이 존재 하지 않습니다.
					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								MypageFollowDto dto = list.get(i);
					%>



					<div class="box box1" id="followbox<%=i + 1%>">
					

                       
						<div class="mypagecancel">
							<img  alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/more.png" 
							  onclick="getmodal(<%=i+1%>)">
                             		  
							  
					<%-- 		<img alt=""
								src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/Cancel.png"
								onclick="followDel('<%=dto.getEmail()%>')"> --%>
						</div>
						<div class="followingfollow">
							<span>
							<b>FOLLOWER</b>
							<%=dto.getFollower()%>
							<br><b>FOLLOWING</b> 
							<%=dto.getFolloing()%>
							</span>
						</div>

						<div class="followpprofile">
							<%
								if (dto.getPicture() == null || dto.getPicture() == "") {
							%>
							<img alt=""
								src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/pet1.jpg"
								class="myprofileimg">
							<%
								} else {
							%>
							<img alt="" src="<%=dto.getPicture()%>" class="myprofileimg">
							<%
								}
							%>


							<div class="followemail">
						      <b><%=dto.getEmail()%></b>							
							</div>
							  <div class="follownickname">
								<%
									if (dto.getNickname().equals("")) {
								%>
								닉네임이 존재하지 않습니다
								<%
									} else {
								%>
								<b><%=dto.getNickname()%></b>
								<%
									}
								%>
							</div>





						</div>
						<div class="followEmailicon">
							<img alt=""
								src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/mail1.png"
								onclick="followemail()"> 
							<!-- <div class="icon-bar">
								<a class="active" href="#"><i class="fa fa-home"></i></a> <a
									href="#"><i class="fa fa-search"></i></a> <a href="#"><i
									class="fa fa-envelope"></i></a> <a href="#"><i
									class="fa fa-globe"></i></a> <a href="#"><i class="fa fa-trash"></i></a>
							</div> -->
						</div>


					</div>
					
					<div id="myModal<%=i+1 %>" class="modal" >
 
      <div class="modal-content" >
                   <div class="mo">
                     <div class="modalout">
                     	<img  alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/multiply.png" onclick="close_pop(<%=i+1%>)">  
                      </div>
                      
                      <ul class="modalinul">
                        <li class="nonfollow"  onclick="followDel('<%=dto.getEmail()%>')"><a>  <img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/bell.png" > 구독 취소 </a></li>
                        <li class="viewprofile" onclick="viewprofile('<%=dto.getEmail()%>')"><a><img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/user.png" onclick=""> 프로필 </a></li>
                        <li class="sendmessage"><a><img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/noteemail.png" onclick=""> 쪽지 보내기</a></li>
                        <li class="viewlist" onclick="viewlist('<%=dto.getEmail()%>')"> <a><img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/evaluate.png" onclick="">참여중인 모임</a></li>
                        <li class="chat"><a><img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/conversation.png" onclick=""> 채팅 신청</a></li>
                        <li class="nonnotice"><a><img alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/bell.png" onclick=""> 알람 끄기</a></li>
                      </ul>
                      
                   
                   </div>
              
      </div>
 
    </div>
					
					
					


					<%
						}

						}
					%>
					<%
						int listtotal = (int) request.getAttribute("listtotalsize");
						System.out.println("listtotal" + listtotal);
					%>
					<input type="hidden" value="<%=list.size()%>" class="totalhidden">
					<input type="hidden" value="1" class="nowpage">
					<div class="morelist">
						<!-- 
						<a href="#" class="moreatag">더보기(More)</a> !-->
						<input type="hidden" value="1" class="nowpage">

						<button
							class="button button--nina button--text-thick button--text-upper button--size-s"
							data-text="MORE" id="moreatag">
							<span>M</span><span>O</span><span>R</span><span>E</span>
						</button>
			</div>
	 				
   <div id="mypfModal" class="modal" >
    
      <div class="modalpf-content" >
                  <div class="modalout2">
                     	<img  alt="" src="${pageContext.request.contextPath}/mypage_resources/mypage_h/mypageFollow/images/multiply.png" onclick="close_modal()">  
                   </div>
       
        </div>


					<!--follow코드 오는 부분! 끝  -->
				</div>
			</div>

			<div class="footer"></div>

		</div>

		<script type="text/javascript">
		function close_modal() {
			$("#mypfModal").hide();
		};
		
		
		function viewlist(e) {
			alert(e);
			$("#mypfModal").show();
			
			$.ajax({
				 type:"POST",
				 url:"mypagefollowmyattendplay.do",
				 async: false,
				 data:{"email":e},
				  success:function(data){
					  alert("성공");
					//  alert(data);
					  
					  $(".modalpf-content").html(data);
				  },error:function(){
					  alert("실패");
				  }
			})
			
		}
		
		
		//프로필 보기를 눌렀을 때
		function viewprofile(e) {
			alert(e);
		};
		
		
		
		//프로필 옆 더보기 아이콘 눌렀을 때
	
		function getmodal(e) {
			 $('#myModal'+e).show();
		}
	
	
		function moremodal(e) {
	  //      $('#myModal').show();		
	     }
		 function close_pop(e){	
		    $('#myModal'+e).hide();	        
		 };

		 
		 
		 
		
			//검색
			$(".searchbtn").click(function() {
								var email = $(".searchtext").val();
								if (email == "") {
									alert("email을 입력 해 주세요");
									$(".searchtext").focus();
									return false;
								}

								location.href = "mypagefollow.do?s_category=email&s_keyword="
										+ email;

							});

			$(document).ready(function() {
				//

				//
				var totallist = $(".totalhidden").val();

				if (totallist <= 6) {
					$(".morelist").hide();
				}

				//	alert(totallist);
				for (var i = 7; i <= totallist; i++) {
					$("#followbox" + i).hide();
				}

				$("#moreatag").focus();
			});

			$("#moreatag").click(function() {
				var nowpage = $(".nowpage").val();
				var spage = nowpage * 6 + 1; //7
				var epage = spage + 6; //13
				$(".nowpage").val(Number(nowpage) + 1);

				//  alert(spage);
				//  alert(epage);

				for (var i = spage; i < epage; i++) {
					$("#followbox" + i).show();
				}

				var totallist = $(".totalhidden").val();
				//  alert("totallist"+totallist);
				if (epage >= totallist) {
					$(".morelist").hide();
				}

				$('html, body').animate({
					scrollTop : $('.morelist').offset().top
				}, 'slow');

				/* 
				var box=$(".box").length;
				var page=Math.floor(box/6);
				alert(box);
				alert(page);
				$.ajax({
				 type:"POST",
				 url:"mypagefollowmore.do",
				 async: false,
				 data:{"s_category":$(".s_category").val() ,
					 "page":page ,
					 "s_keyword":$("#searchtext").val()
					  },
				  success:function(data){
				  	alert(data);
				  	$.each(data, function (idx,val) {
				  	
						console.log(idx+"" +val.email);
						$("<div class='box box1' id='followbox"+(idx+box+1)+"'>"+(box+idx)+"<div>").insertAfter("#followbox"+(box+idx));		
				          //$(".mypagecancel").clone().appendTo("#followbox"+(idx+box+1));
						
					})
				       
				  },error:function(){
				  	alert("실패");
				  }
				 
				})
				 */
			});

			//구독 취소 버튼
			function followDel(e) {
				alert(e + "삭제");

				if (confirm("팔로우를 취소하시겠습니까?")) {
					location.href = "mypagefolloingdel.do?folloingid=" + e;
				} else {
				}

				//		location.href = "mypagefolloingdel.do?folloingid=" + e;
			}

			//쪽지 보내기 버튼
			function followemail() {
				alert("쪽지 보내기");
			}
		</script>
</body>

</html>
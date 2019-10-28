<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>PetMeeting</title>
	<link rel="icon" href="${pageContext.request.contextPath}/common/navbar/img/petmeetingicon.png">
</head>
<body>


  <!--::header part start::-->
    	<jsp:include page="/common/navbar/templates/header.jsp" flush="false"/>    
  <!-- Header part end-->
    
    
    
   
    <!-- banner part start -->
    <section class="banner_part">
    
    	<!-- Slideshow container -->
		<div class="slideshow-container">
		
		  <!-- Full-width images with number and caption text -->
		  <div class="mySlides fade">
		    <div class="numbertext">1 / 3</div>
		    <img src="${pageContext.request.contextPath}/common/img/slide(1).jpg" width="100%">
		    <div class="text">Caption Text</div>
		  </div>
		
		  <div class="mySlides fade">
		    <div class="numbertext">2 / 3</div>
		    <img src="${pageContext.request.contextPath}/common/img/slide(2).jpg">
		    <div class="text">Caption Two</div>
		  </div>
		
		  <div class="mySlides fade">
		    <div class="numbertext">3 / 3</div>
		     <img src="${pageContext.request.contextPath}/common/img/slide(3).jpg">
		    <div class="text">Caption Three</div>
		  </div>
		
		  <!-- Next and previous buttons -->
		  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		  <a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>		
		
    </section>
    

     
  <!--::footer part start::-->    
  	<jsp:include page="/common/navbar/templates/footer.jsp" flush="false"/>   
  <!-- footer part end-->
    
<script type="text/javascript">

var slideIndex = 1;
showSlides();

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");

  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  
  slides[slideIndex-1].style.display = "block";
}



$(document).ready(function () {
	 Notification.requestPermission(function (status) {
	   // This allows to use Notification.permission with Chrome/Safari
	   //alert("status"+status);
	   if (Notification.permission !== status) {
	     Notification.permission = status;
	   }
	 });
	
	$.ajax({
		 type:"POST",
		 url:"mypagemsgpush.do",
		 async: false,
		 success:function(data){
			 var split_res=data.split('/');
			 var count=split_res[1];
 			if(count!='-1'){
				$(".nowmymsg").val(count);				
			}			
		  },error:function(){
			  alert("실패!");
		  }
	   });
       
		// var notification = new Notification("새 쪽지가 등록 되었습니다");
    function noti() {	   	
		$.ajax({
			 type:"POST",
			 url:"mypagemsgpush.do",
			 async: false,
			 success:function(data){
						 
				 var split_res=data.split('/');
				 var email=split_res[0];
				 var count=split_res[1];
				 
				//alert("이메일"+email);
				 //alert("카운트"+count);
				 				 
				 if(count!='-1'){
					 					 
					 if($(".nowmymsg").val()<count){
							
					    var options={
					        icon:"https://img.icons8.com/cotton/2x/topic-push-notification.png",
					    	body:"새 쪽지가 도착 하였습니다. ",
					    	onclick:"alert('d');"
					    }				    		
					Notification.requestPermission().then(function(result) {
										
				      if(result=='denied'){
				      alert(email+"님으로 부터 쪽지가 왔습니다");	
				  }else{
						var notification = new Notification(email+"님으로 부터 쪽지가 왔습니다",options);
					    notification.onclick =function (){
					       location.href="myrevmsg.do?recordCountPerPage=10";
					    }										  
				  }								 
			});						 
						$(".nowmymsg").val(count);
					}else{
						//alert(data);
					}					
				}				 
				 
			  },error:function(){
				  alert("실패!");
			  }
		   });
	}	
	 setInterval(noti,2000);	 	
});
	
</script>

</body>
</html>
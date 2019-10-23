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
     
           
			
		
    </section>
     
     
    
     
     
    <!--::footer part start::-->    
    	<jsp:include page="/common/navbar/templates/footer.jsp" flush="false"/>   
    <!-- footer part end-->
    
<script type="text/javascript">
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
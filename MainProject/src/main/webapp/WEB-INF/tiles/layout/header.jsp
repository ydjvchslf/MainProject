<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<script type="text/javascript">

//=========로그아웃 테스트 중 =============
	$(function() {	
		
		 Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
		
		 $('#logoutModal a[name=allLogout]').on("click" , function() {
			 
			 let x = document.cookie;
			 
			 const words = x.split("; ");
			 
			 var loginType = "";
			 
			 for(var i=0; i < words.length; i++ ){
				 
				if( words[i].split("=")[0] === "loginType" ){
					 console.log( words[i].split("=")[1] )
					 loginType = words[i].split("=")[1];
				}
			 }
			 
			 if(loginType == "kakao"){
				 
				 alert("카카오 로그아웃!")
				 
				 if (!Kakao.Auth.getAccessToken()) {
					  console.log('Not logged in.');
					  
					  self.location = "/"
					  
					  return;
				}
				 
				 Kakao.API.request({
					 
				  url: '/v1/user/unlink',
				  success: function(response) {
				    console.log(response);
				    
				    self.location = "/"
				  },
				  
				  fail: function(error) {
				    console.log(error);
				  },
				  
				});
				 
			 }else if(loginType == "naver"){
				 
				 var accessToken = localStorage.getItem("com.naver.nid.access_token")
				 var tokenArray = accessToken.split(".");
				 var finalToken = tokenArray[1]
				 
				  $.ajax({
                 		
					  crossOrigin : true,
					  contentType: "application/json",
					  dataType : "json",
					  
	            	  url : "/user/json/naver/logout/" + finalToken,
	                  success : function(JSONData, status){
	                  	console.log("결과->" +JSONData);
	                  	self.location = "/" 
	                  }, error  : function (a,b,c) {
	                  	console.log(a)
	                  	alert("로그아웃 실패");
	                  	
	                  }
	              })
					
			 }else{
				 alert("일반 로그아웃");
				 self.location = "logout"
			 }
			 
		 });
	});



	
	
	
</script>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>


    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><!-- choose when 조건걸기 -->
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                	<c:choose>
                		<c:when test="${!empty user.role}">
                			<strong>${user.name}</strong>(${user.role}) 님
                		</c:when>
                		<c:otherwise>
                			<strong>${email}</strong> 님
                		</c:otherwise>
                	</c:choose>
                </span>
                <img class="img-profile rounded-circle"
                    src="/sbadmin/img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/user/getUser?email=${user.email}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    내정보보기
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>

    </ul>

</nav>
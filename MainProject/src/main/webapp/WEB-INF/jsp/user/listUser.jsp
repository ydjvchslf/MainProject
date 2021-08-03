<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="UTF-8">
  <head>
  	<title>Buy!edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

  </head>
  
  
  <style>
  
   @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }
	
   body{
   overflow-x:hidden; overflow-y:visible;
   font-family: ChosunGu;
   }
   
   
   .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #F8B739;
    border-color: #F8B739;
	}
	
	#tableHead{
	background-color : #4D4D4D;
	color : white;
	text-align : center;
	font-size : 18px;
	}
   
   
  </style>
 
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC;">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
				
				<div class="container-fluid"><!-- container시작 -->
				
                   <jsp:include page="../common/toolbar2.jsp"></jsp:include>
					  
					  <div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					  			  padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">   
					    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
					    <div class="row">
					    	
						    <div class="col-md-6 text-left">
						    </div>
						    
						    <div><br></br></div>
						    
						    <div class="col-md-6 text-right">
							    <form class="form-inline" name="detailForm">
							    
							     <div class="col-md-12 text-right">
							    	<p>
							    		<span><strong> 사용자 역할 </strong></span>
							    		<input type="checkbox" name="searchRole" value="student"> 학생
							    		<input type="checkbox" name="searchRole" value="parents"> 학부모
							    		<input type="checkbox" name="searchRole" value="academy"> 학원
							    	</p>
							    	<p>
							    		<span><strong> 회원 상태 </strong></span>
							    		<input type="checkbox" name="searchAccountState" value="0"> 활동중
							    		<input type="checkbox" name="searchAccountState" value="1"> 탈퇴
							    	</p>
						   		 </div>
							    
							     <div class="col-md-12 text-right">
									  <div class="form-group">
									    <select class="form-control" name="searchCondition" >
											<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>Email</option>
											<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
										</select>
									  </div>
									  
									  <div class="form-group">
									    <label class="sr-only" for="searchKeyword">검색어</label>
									    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
									    			onkeyup="enterEvent()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
									  </div>
									  
									  <button type="button" id="search" class="btn btn-primary">검색</button>
								  </div>
								  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>
					    	
						</div>
						<!-- table 위쪽 검색 Start /////////////////////////////////////-->
						
						
				      <!--  table Start /////////////////////////////////////-->
				      <table class="table table-hover table-striped">
				      
				        <thead>
				          <tr id="tableHead">
				            <th align="center">No</th>
				            <th align="left">구분</th>
				            <th align="left">회원명</th>
				            <th align="left">Email</th>
				            <th align="left">가입일</th>
				            <th align="left">계정상태</th>
				            <th align="left">탈퇴날짜</th>
				          </tr>
				        </thead>
				       
						<tbody>
						
						  <c:set var="i" value="0" />
						  <c:forEach var="user" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${i+(resultPage.currentPage-1)*10}</td>
							  <td align="left">${user.role}</td>
							  <td align="left">${user.name}</td>
							  <td align="left">${user.email}</td>
							  <td align="left">${user.inDate}</td>
							  <td align="left">
								  <c:choose>
									  <c:when test= "${user.accountState == '0' }">
										활동중
									  </c:when>
									  <c:when test= "${user.accountState == '1' }">
										탈퇴
									  </c:when>
								  </c:choose>
							  </td>
							  <td align="left">${ ! empty user.outDate ? user.outDate : "-"}</td>
							</tr>
				          </c:forEach>
				        
				        </tbody>
				      
				      </table>
				      <input type="hidden" name="allLogout" value="로그아웃"></input>
				      
				      <jsp:include page="../common/pageNavigator_new.jsp"/>
                    
				
				  </div>
				</div>
	      	</div><!-- container 끝 -->
      	
       </div>
      
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    
    
    <!-- JS 메인 시작 -->
    <script type="text/javascript">
    
 // 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
	
	function fncGetList(currentPage) {
		//alert(currentPage)
		$("#currentPage").val(currentPage)
	   	$("form").attr("method", "POST").attr("action","/user/listUser").submit();	
	};
	
	
	//엔터시 에러 해결 너왜 안되는거야
	function enterEvent(){
		if(window.event.keyCode == 13){
			//alert("엔터")
			fncGetList(1);
		}
	}
	
	//검색버튼 클릭 event
	$(function() {
		
		$('form[name="detailForm"] input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
		
		
		$( "#search" ).on("click" , function() {
			fncGetList(1);
		});
		 
	});
	
	
	
	
	$(function() {
		
		$("input[name=searchRole]").each(function(index, item){
			var $check = $(this)
			var roles = '${roles}';
			
			console.log(item)
			if (roles.indexOf(item.value) > -1) {
			//	item.checked = true;
				$check.attr("checked", "checked");
			}
		})
		
		$("input[name=searchAccountState]").each(function(index, item){
			var states = '${states}';
			if (states.indexOf(item.value) > -1 )
				item.checked = true;
		})
		
	
		
		
		
		
	//=========로그아웃 테스트 중 =============
	$(function() {	
		
		 $('input[name=allLogout]').on("click" , function() {
			 
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
				 
				 
					Kakao.Auth.logout(function() {
					  console.log(Kakao.Auth.getAccessToken());
					  
					  if(Kakao.Auth.getAccessToken()){
						  alert('로그아웃실패');
					  }else{
						  
					  }
					 
					});
					
				 
				 
			 }else if(loginType == "naver"){
				 
				 alert("네이버 로그아웃!")
				 
				 //sessionStorage.clear();
				 //localStorage.clear();
				 //deleteAllCookies();
				 
				 var accessToken = localStorage.getItem("com.naver.nid.access_token")
				 
				 //console.log(accessToken)
				 
				 var tokenArray = accessToken.split(".");
				 
				 //console.log(tokenArray)
				 
				 var finalToken = tokenArray[1]
				 
				console.log(finalToken)
				
				sessionStorage.clear();
				 
				 //네이버 토큰삭제 요청
				 $.ajax({
					 
					 crossOrigin : true,
	                 
	            	  url : "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&access_token="+finalToken+"&service_provider=NAVER",
	            	  
	            	  dataType: "json",	  
	            			  
	                  headers : {
	                      "Accept" : "application/json",
	                      "Content-Type" : "application/json"
	                    },
	                    success : function(JSONData, status){
                        	console.log("로그아웃좀 되라...");
                        	self.location = "/";
	                        
	                    }
	              })
		              
		            
					 
					
					 /*
						var accessToken = localStorage.getItem("com.naver.nid.access_token")
					 
					 //console.log(accessToken)
					 
					 var tokenArray = accessToken.split(".");
					 
					 //console.log(tokenArray)
					 
					 var finalToken = tokenArray[1]
					 
					 console.log(finalToken)
					 //return
					 
						  $.ajax({
		                 		
							  crossOrigin : true,
							  
			            	  url : "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&service_provider=NAVER&access_token="+finalToken,
			                  
			            	  dataType: "json",
			            			  
	            			  headers : {
			                	  
			                      "Accept" : "application/json",
			                      "Content-Type" : "application/json"
			                    },
			                    success : function(JSONData, status){
			                    	console.log("성공 결과->" +JSONData);
			                    },
			                    
			                    error : function(xhr, status, errorThrown){
			                    	console.log("실패");
			                    	console.log(xhr);
			                    	console.log(status);
			                    	console.log(errorThrown);
			                    	
			                    } 
			                    
		              });
					 
					 
					
			            
					// debugger
					 
					 //self.location = "/"
					 /*
					 localStorage.removeItem('com.naver.nid.access_token');
					 
					 function Logout(){
						 sessionStorage.clear();
					 }
					 
					 //self.location = "/"
					 
					 */
					 
							
		              
					 
				 }else{
					 alert("일반 로그아웃");
					 self.location = "logout"
				 }
				 
				 /*
				 
				 if (!Kakao.Auth.getAccessToken()) {
					  console.log('Not logged in.');
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
				 
				 
				 
					Kakao.Auth.logout(function() {
					  console.log(Kakao.Auth.getAccessToken());
					  
					  if(Kakao.Auth.getAccessToken()){
						  alert('로그아웃실패');
					  }else{
						  
					  }
					 
					});
					
					*/
			 });
		});
		 
	});
		
    
    
    
    </script>
    
  </body>
</html>
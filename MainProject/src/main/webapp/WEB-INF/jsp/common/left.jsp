<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>

<head>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

</head>


<body>
			<nav id="sidebar">
				<div class="p-4 pt-5">
				<br></br>
				<c:choose>
	           		<c:when test="${user.role eq 'admin'}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/admin2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           		<c:when test="${user.role eq 'student' || user.role eq 'parents' || empty user.role}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/student2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           		<c:when test="${user.role eq 'academy'}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/teacher2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           	</c:choose>
	           	
		  		
	        <ul class="list-unstyled components mb-5">
	           <h4>
	       		<c:choose>
	           		<c:when test="${!empty user.role}">
	           			<div align="center">
	           				<span style="color:#F8B739">${user.name}</span>
	           					 <c:if test="${user.role eq 'student' }">(학생)</c:if>
		           				 <c:if test="${user.role eq 'parents' }">(학부모)</c:if>
		           				 <c:if test="${user.role eq 'academy' }">(원장)</c:if>
		           				 <c:if test="${user.role eq 'admin' }">(관리자)</c:if> 님
	           			</div>
	           		</c:when>
	           		<c:otherwise>
	          			<div align="center"><span style="color:#F8B739">${email}</span> 님</div>
	           		</c:otherwise>
	           	</c:choose>
		      </h4>
		      
		        <br>
		        
		        <c:if test="${user.role != null }"></c:if>
		        
		        <c:if test="${user.role == 'academy'}">
		          <li>
		            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내 학원</a>
		            <ul class="collapse list-unstyled" id="homeSubmenu">
				
				<c:forEach var="academy" items="${list}">
					
					<li>
						<input type="hidden" name="codes" value="${academy.academyCode}" />
						<a href="/academy/academyInfo?academyCode=${academy.academyCode}" >${academy.academyName}</a>		 
					</li>	
				</c:forEach>			
	
		            </ul>
		          </li>
		         </c:if> 
		         
		         <c:if test="${user.role != 'admin'}"> 
		          <li>
		            <a href="#userSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내 정보</a>
		          	 <ul class="collapse list-unstyled" id="userSubmenu">
				          <li>
				              <a href="/user/getUser?email=${user.email}">회원 정보</a>
				          </li>
				          <c:if test="${user.role eq 'student' || user.role eq 'parents'}">
					          <li>
			                    <a href="/review/listmyReview?uesrNo=${user.userNo}">내 후기 보기</a>
			               	 </li>
			               	 <li>
			                    <a href="/board/listBoard?isMine=y">내 게시글 보기</a>
			                </li>
		                  </c:if>
		              </ul>
		          </li>
		        </c:if>  
		          
		         <c:if test="${user.role != 'academy'}"> 
		          <li>
		              <a href="/search/searchAcademy">학원검색</a>
		          </li>
		         </c:if> 
		         
		         <c:if test="${user.role == 'admin'}">  
		          <li>
		            <a href="#siteSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">사이트 관리</a>
		            <ul class="collapse list-unstyled" id="siteSubmenu">
	                <li>
	                    <a href="/user/listUser">회원 목록</a>
	                </li>
	                <li>
	                    <a href="/complain/getComplainList">신고 관리</a>
	                </li>
	                <li>
	                    <a href="/chart/getChart">현황 차트</a>
	                </li>
		            </ul>
		          </li>
		         </c:if> 
		          
		          <li>
	              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">게시판</a>
	              <ul class="collapse list-unstyled" id="pageSubmenu">
	                <li>
	                    <a href="/board/listBoard?cateCode=2">자유게시판</a>
	                </li>
	                <li>
	                    <a href="/board/listBoard?cateCode=0">공지사항</a>
	                </li>
	                <li>
	                    <a href="/board/listBoard?cateCode=1">QnA</a>
	                </li>
	              </ul>
		          </li>
		          
		         <c:if test="${user.role == 'student' || user.role =='parents'}">  
		          <li>
	              <a href="#eduSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">수업</a>
	              <ul class="collapse list-unstyled" id="eduSubmenu">
	                <li>
	                    <a href="/pickedu/listPickEdu?userNo=${user.userNo}">관심수업</a>
	                </li>
	                <li>
	                    <a href="/purchaseedu/listPurchaseEdu?userNo=${user.userNo}">구매수업</a>
	                </li>
	              </ul>
		          </li>
		         </c:if> 
		         
		         	</br>
		         	
	                   <div align="center"><span name="logout" href="#" data-toggle="modal" data-target="#logoutModal"><u>로그아웃</u></span></div>
	                
                
	        </ul>
	        
	        

	      </div>
    	</nav>
    	
    	<script src="/js/sockjs.min.js"></script>
    	<script src="/js/stomp.min.js"></script>
    	
    	
    	<script>
    	let socket = new SockJS("/socket");
        let stompClient = Stomp.over(socket);
        
		function connect(){
			stompClient.connect("", "", function(frame) {
	        	console.log("연결 성공", frame);
	        	subscribe();
	        });
        }
		
		function subscribe(){
			document.getElementsByName("codes").forEach(item => {
				stompClient.subscribe("/subscribe/noti/" + item.value + "/userNo", (res) => {
					setNotis(res);
	        		alert("message");
	        		console.log("메시지를 받았습니다.");
	            	console.log("res", res);
	            });	
			});
		}
		
		function setNotis(res){
			let notis = JSON.parse(res);
			let notiCount = notis.length;
			addNotiList(notis);
		}
		
		function addNotiList(notis){
			//알람 리스트 생성
		}
        
        function close(){
        	socket.close();
        }
        
        document.addEventListener("DOMContentLoaded", function(){
        	connect();
        	socket.onclose = function() {
        	    console.log('close');
        	    stompClient.disconnect();
        	};
        });
        
         
        
      //=========로그아웃 테스트 중 =============
    	$(function() {	
    		
    		 Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
    		
    		 
    		 $('#allLogout').on("click" , function() {
    			 
    			 //console.log("2222로그아웃클릭")
    			 
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
    				 
    				 //alert("카카오 로그아웃!")
    				 
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
    				 //alert("일반 로그아웃");
    				 self.location = "/user/logout"
    				 
    				 //수정전
    				 //self.location = "logout"
    			 }
    			 
    		 });
    	});


        
    	</script>
	
		<!-- 로그아웃모달 -->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="abc"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <div align="center">
	                    	<h5 class="modal-title" id="abc">로그아웃 하시겠습니까?</h5>
	                    </div>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" id="allLogout" name="allLogout" href="#" onclick="return false;">Logout</a>
	                </div>
	            </div>
	        </div>
	    </div>

</body>
</html>


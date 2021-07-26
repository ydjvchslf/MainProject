<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

	<!-- JS 구간 /////////// 타겟 잘 바꿔주기! (템플릿꺼에서 추가는 가능, 수정은 불가)-->
	<script type="text/javascript">

	//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
	
	function fncGetList(currentPage) {
		//alert(currentPage)
		$("#currentPage").val(currentPage)
	   	$('form[name="detailForm"]').attr("method", "POST").attr("action","/user/listUser").submit();	
	};
	
	
	//엔터시 에러 해결 너왜 안되는거야
	function enterEvent(){
		if(window.event.keyCode == 13){
			//alert("엔터")
			fncGetList(1);
		}
	}
	
	//처음시작때 엔터 막기
	$(function() {
		
		$('form[name="detailForm"] input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
		    	event.preventDefault();
		 	 };
		});
		 
		 
	});
	
	
	
	//검색버튼 클릭 event
	$(function() {
		
		Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
		
		$( 'button[name="click"]' ).on("click" , function() {
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


<!-- 공통 body 시작 -->
		
					<!-- 찐 본문시작 /// 여러분의 jsp 들어갈 자리 -->
		         	 <!-- DataTales Example -->
		         	 <div class="card shadow mb-4">
		               <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">회원목록조회</h6>
		               </div>
		              
		              <!-- 테이블 검색 -->
		              <div class="row">
						    <div class="col-md-6 text-left">
						    	<p class="text-primary">
						    		&nbsp;&nbsp;전체 회원 ${resultPage.totalCount } 명, 현재 ${resultPage.currentPage}  페이지
						    	</p>
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
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>Email</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
									</select>
									<label class="sr-only" for="searchKeyword">검색어</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
								    			onkeyup="enterEvent()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  
								     <button type="button" name="click" class="btn btn-default">검색</button>
								  </div>
								  
								  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>
					    	
						</div>
					  <!-- 테이블 검색 끝 -->
					  
		              <!-- Data 테이블 시작 -->
		              <div class="card-body">
		                  <div class="table-responsive">
		                      <table class="table table-hover table-striped" id="dataTable" width="100%" cellspacing="0">
		                          <thead>
		                              <tr>
		                                  <th align="center">No</th>
		                                  <th align="left">구분</th>
		                                  <th align="left">회원명</th>
		                                  <th align="left">Email</th>
		                                  <th align="left">가입일</th>
		                                  <th align="left">계정상태</th>
		                                  <th align="left">탈퇴날짜</th>
		                              </tr>
		                          </thead>
		                          <tfoot>
		                              <tr>
		                                  <th align="center">No</th>
		                                  <th align="left">구분</th>
		                                  <th align="left">회원명</th>
		                                  <th align="left">Email</th>
		                                  <th align="left">가입일</th>
		                                  <th align="left">계정상태</th>
		                                  <th align="left">탈퇴날짜</th>
		                              </tr>
		                          </tfoot>
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
		                  </div>
		              </div>
		          </div><!-- Data 테이블 끝 -->
          
          
          <!-- 찐 본문 끝 /////////////////////////////////// -->
     
     <!-- 페이지네비게이션 -->
     <jsp:include page="../common/pageNavigator_tiles.jsp"/>
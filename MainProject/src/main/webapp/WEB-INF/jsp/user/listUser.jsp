<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>userMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="/assets/demo/jquery.ajax-cross-origin.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
        </script>
        <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
        <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
        
		
		<script type="text/javascript">
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
			
		function fncGetList(currentPage) {
			//alert(currentPage)
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/user/listUser").submit();	
		};
		
		//너왜 안되는거야
		function enterEvent(){
			if(window.event.keyCode == 13){
				alert("엔터")
				fncGetList(1);
			}
		}
		
		//검색버튼 클릭 event
		$(function() {
			
			Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
			
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
			 
		});
		
		//모든 쿠키 삭제 함수
		 function deleteAllCookies() {
			    var cookies = document.cookie.split(";");

			    for (var i = 0; i < cookies.length; i++) {
			        var cookie = cookies[i];
			        var eqPos = cookie.indexOf("=");
			        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
			        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
			    }
			}
		
		
		
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
			
			
			function deleteAllCookies() {
			    var cookies = document.cookie.split(";");

			    for (var i = 0; i < cookies.length; i++) {
			        var cookie = cookies[i];
			        var eqPos = cookie.indexOf("=");
			        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
			        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
			    }
			}
			
			
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
		

    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/adminMain">Buy! Edu</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">search</div>
                            <a class="nav-link" href="/academy/listSearch">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                학원검색
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                사이트 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/listUser">전체 사용자 보기</a>
                                    <a class="nav-link" href="/chart/getChart">사이트 현황 보기</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                신고 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">신고 게시글 보기</a>
                                    <a class="nav-link" href="#">신고 댓글 보기</a>
                                    <a class="nav-link" href="#">신고 후기 보기</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">board</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">공지사항</a>
                                	<a class="nav-link" href="#">QnA 게시판</a>
                                    <a class="nav-link" href="/board/listBoard">자유게시판</a>
                                    <a class="nav-link" href="#">학원 공지사항</a>
                                    <a class="nav-link" href="#">내가 작성한 게시글</a>
                                    <a class="nav-link" href="#">내가 작성한 댓글</a>
                                </nav>
                            </div>
                        </div>
                    </div>

                </nav>
            </div>
            <!-- 여기가 가운데 들어갈 화면 (바뀌는 곳) -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        	
						<div class="page-header text-info">
					       <h3>회원목록조회</h3>
					    </div>
					    
					    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
					    <div class="row">
					    
						    <div class="col-md-6 text-left">
						    	<p class="text-primary">
						    		전체 회원 ${resultPage.totalCount } 명, 현재 ${resultPage.currentPage}  페이지
						    	</p>
						    </div>
						    
						   
						    <div><br></br></div>
						    
						    <div class="col-md-6 text-right">
							    <form class="form-inline" name="detailForm">
							    
							     <div class="col-md-6 text-right">
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
							    
								  <div class="form-group">
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>Email</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
									</select>
								  </div>
								  
								  <div class="form-group">
								    <label class="sr-only" for="searchKeyword">검색어</label>
								    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
								    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  </div>
								  
								  <button type="button" class="btn btn-default">검색</button>
								  
								  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>
					    	
						</div>
						<!-- table 위쪽 검색 Start /////////////////////////////////////-->
						
						
				      <!--  table Start /////////////////////////////////////-->
				      <table class="table table-hover table-striped" >
				      
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
				      <input type="button" name="allLogout" value="로그아웃"></input>
				      <jsp:include page="../common/pageNavigator_new.jsp"/>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    
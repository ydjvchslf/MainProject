<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="UTF-8">
  <head>
  	<title>Buy Edu</title>
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
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB;">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
				
				<div class="container-fluid"><!-- container시작 -->
						
						<jsp:include page="../common/toolbar2.jsp"></jsp:include> 
						
						<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
						
					      <div class="row"><!-- 첫번째 row 시작 -->
					        <div class="col-sm-6">
					          <div class="panel panel-default">
					            <div class="panel-heading">
					              <h3 class="panel-title">
					              	<c:choose>
				                		<c:when test="${!empty user.role}">
				                			${user.name}님의 Profile
				                		</c:when>
				                		<c:otherwise>
				                			${email}님의 Profile
				                		</c:otherwise>
			                		</c:choose>
					              </h3>
					              <c:if test="${!empty user.role }"> 
					              <h3 class="m-0 font-weight-bold text-primary" align="right">
									<img src="/image/modify.png" width="30" data-toggle="modal"
											data-target="#updateModal">
								  </h3>
								  </c:if>
					            </div>
					            <div class="panel-body">
					              <input type="hidden" value="${user.userNo}">
					              <c:choose>
			                		<c:when test="${!empty user.role}">
							            E-MAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.email} <br>
				                		NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.name} <br>
										PHONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.phone} <br>
										REG_DATE&nbsp;: ${user.inDate} <br>
			                		</c:when>
			                		<c:otherwise>
			                			E-MAIL : ${email} <br><br>
			                			회원님은 SNS 연동해제 상태입니다.<br>
			                			더 많은 서비스를 이용하시려면 계정연동을 해주세요!<br><br>
			                			<a href="/user/snsAddUser?email=${email}">계정연동하기</a>
			                		</c:otherwise>
				                </c:choose>
					            </div>
					          </div>
					          
					       <c:if test="${!empty user.role && user.role ne 'academy' && user.role ne 'admin'}">  
					          <div class="panel panel-default">
					            <div class="panel-heading">
					              <h3 class="panel-title">My Academy</h3>
					            </div>
					            <div class="panel-body">
					              <input type="hidden" value="${user.userNo}">
					              <!-- 우리 학원 보기 테이블 시작 -->
					            	<table class="table table-hover table-striped">
										<c:choose>
											<c:when test="${empty listAcademy}">
												<span>
													<h6><img src="/image/crying.png">
														인증된 학원이 없습니다. 학원을 인증해주세요!
													</h6>
												</span>
											</c:when>
											<c:otherwise>
												<thead>
													<tr>
														<th align="center">No</th>
														<th align="center">학원이름</th>
														<th align="center">인증상태</th>
														<th align="center">인증취소</th>
													</tr>
												</thead>
	
												<tbody>
													<c:set var="i" value="0" />
													<c:forEach var="connect" items="${listAcademy}">
														<c:set var="i" value="${ i+1 }" />
														<tr>
															<td align="left">${ i }</td>
															<td align="left"><span class="cntAcademyName"
																name="cntAcademyName"><a href="/academy/academyInfo?academyCode=${connect.academy.academyCode}"><u>${connect.academy.academyName}</u></a></span>
																<input type="hidden" name="cntAcademyCode"
																value="${connect.academy.academyCode}"></td>
															<td align="left"><c:choose>
																	<c:when test="${connect.connectState eq '0'}">
																			인증신청
																		  </c:when>
																	<c:when test="${connect.connectState eq '1'}">
																			인증됨
																		  </c:when>
																</c:choose></td>
															<td align="left">
																<span name="delete">
													                &nbsp; &nbsp; &nbsp;
													                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
																	  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
																	</svg>
																</span>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table><!-- 우리 학원 보기 테이블 끝 -->
					            
					            </div>
					          </div>
					         </c:if>
					        </div><!-- /.col-sm-6 -->
					      
					       
					        <div class="col-sm-6">
					        <c:if test="${!empty user.role }"> 
					          <div class="panel panel-default">
					            <div class="panel-heading">
					              <h3 class="panel-title">비밀번호 변경</h3>
					              <h3 class="panel-title" align="right">
					              	<img src="/image/password.png" width="30" data-toggle="modal"
											data-target="#passwordModal">
					              </h3>
					            </div>
					          </div><br>
					          <div class="panel panel-default">
					            <div class="panel-heading">
					              <h3 class="panel-title">계정 탈퇴</h3>
					              <h3 class="panel-title" align="right">
					              	<img src="/image/trash.png" width="30" data-toggle="modal"
											data-target="#outModal">
					              </h3>
					            </div>
					          </div>
					          </c:if>
					          
					          <c:if test="${!empty user.role && user.role ne 'academy' && user.role ne 'admin'}">
					            <!-- 우리학원 인증하기 등록하기 -->
						          <div class="panel panel-default">
						            <div class="panel-heading">
						              <h3 class="panel-title">학원 인증하기</h3>
						              <h3 class="panel-title" align="right">
						                <!-- 인증하기 버튼 -->
											<!--  <span name="addConnect" class="btn btn-success btn-circle btn-sm">
			                                   <i class="fas fa-check">인증버튼</i>
			                                </span>-->
			                               <span name="addConnect"><img src="/image/plus.png" width="30"></span>
						              </h3>
						            </div>
						            <div class="panel-body"> 
						               	<input type="hidden" value="${user.userNo}">
										<input type="text" class="form-control" id="academyCode"
												name="academyCode" placeholder="*학원코드 입력(인증 최대 3개)">
										<span id="helpBlock" class="help-block">
											<strong class="connect_text"></strong>
									   </span>
						            </div>
						          </div>
						         </c:if>
						       </div><!-- /.col-sm-6 -->
					     </div><!-- 첫번째 row 끝 -->  
					       
					      <c:if test="${user.role eq 'academy'}">
						      <div id="academyList" class="row"><!-- 두번째 row -->
						      </div>
					      </c:if> 
				
	
<!-- //////////////////////////////모달 영역/////////////////////////////////////////// -->
					    
					    
					  <!-- 내정보수정 모달 시작-->
						<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">
											Update Your Info</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 모달내용 태그 -->
	                                    <form class="user" name="updateInfoForm">
	                                        <div class="form-group">
	                                        	<input type="hidden" name="userNo" value="${user.userNo}">
	                                        	<input type="text" id="exampleInputEmail" name="email" value="${user.email}" 
	                                        		class="form-control form-control-user" aria-describedby="emailHelp" readonly>
	                                        </div>
	                                        <div class="form-group">
	                                        	<input type="text" class="form-control form-control-user"
	                                               name="name" value="${user.name}" id="exampleInputEmail" aria-describedby="emailHelp">
		                                        	<span id="helpBlock" class="help-block">
													   <strong class="text_name"></strong>
													</span>
											</div>
											<div class="row"><!-- 휴대전화번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                               name="phone" placeholder="휴대전화번호" id="phone" aria-describedby="emailHelp">
				                                        	<span id="helpBlock" class="help-block">
															   <strong class="text_phone"></strong>
															</span>	
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 발송버튼 -->
													<div class="form-group">
														<div class="text-center">
					                                       <a href="#" name="send_sms" class="btn btn-primary btn-user btn-block">
					                                            인증번호발송
					                                        </a>
					                                    </div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="row"><!-- 인증번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                                placeholder="인증번호입력" id="vaildNum" aria-describedby="emailHelp">
				                                        	<span id="helpBlock" class="help-block">
															   <strong class="text_phone"></strong>
															</span>	
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 인증번호 확인버튼 -->
													<div class="form-group">		
														<div class="text-center">
					                                        <a href="#" name="check_sms" class="btn btn-primary btn-user btn-block">
					                                            확인
					                                        </a>
					                                    </div>
			                                        	<span id="helpBlock" class="help-block">
														   <strong class="text_sms"></strong>
														</span>	
			                                        </div>
			                                    </div>
			                                </div>
			                                    
		                                        <button type="button" id="update" name="update" class="btn btn-primary btn-user btn-block">
		                                            수정하기
		                                        </button>
		                                </form>
										<!-- 내정보수정 모달 폼 끝 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div><!-- 내정보수정 모달 끝-->   
					    
					    
					    
					    
					    
					    
					    <!-- 계정휴면 모달 -->
						<div class="modal fade" id="outModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">
											Delete account</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 모달내용 태그 -->
	                                    <form class="user" name="outForm">
	                                        <div class="form-group">
	                                        	<input type="hidden" id="email" name="email" value="${user.email}">
	                                            <input type="password" class="form-control form-control-user"
	                                               name="password00" id="exampleInputEmail" aria-describedby="emailHelp"
	                                                placeholder="현재비밀번호">
	                                            <span id="helpBlock" class="help-block">
											      	<strong class="out_password_check"></strong>
											     </span>
											     <br>
				                                    <p>정말 탈퇴하시겠습니까? <br>
				                                       계정복구는 신청한 날짜로부터 <strong style="color:red">30일</strong> 이내만 가능합니다.
								 					</p>
	                                        </div>
		                                        <button type="button" id="out" name="out" class="btn btn-primary btn-user btn-block">
		                                            탈퇴하기
		                                        </button>
		                                </form>
										<!-- 모달 내용 끝 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div><!-- 계정휴면 모달 끝-->		
						
						
						
						
						
						<!-- 비번수정 모달 -->
						<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">
											Update Your Password</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 모달내용 태그 -->
	                                    <form class="user" name="updatePwForm">
	                                        <div class="form-group">
	                                        	<input type="hidden" id="email" name="email" value="${user.email}">
	                                            <input type="password" class="form-control form-control-user"
	                                               name="pw_0" id="pw_0" aria-describedby="emailHelp"
	                                                placeholder="현재비밀번호">
	                                            <span id="helpBlock" class="help-block">
											      	<strong class="update_password_check"></strong>
											     </span>
											     </div>
											   <div class="form-group">  
											     <input type="password" class="form-control form-control-user"
	                                               name="pw_1" id="pw_1" aria-describedby="emailHelp"
	                                                placeholder="새비밀번호">
	                                            </div>
	                                            <div class="form-group">
											     <input type="password" class="form-control form-control-user"
	                                               name="password" id="pw_2" aria-describedby="emailHelp"
	                                                placeholder="비밀번호확인">
	                                            <span id="helpBlock" class="help-block">
											      	<strong class="update_password_check1"></strong>
											     </span>
	                                       		</div>
	                                       		<div class="form-group">
		                                        <button type="button" id="updatePw" name="updatePw" class="btn btn-primary btn-user btn-block">
		                                           비밀번호수정
		                                        </button>
		                                        </div>
		                                </form>
										<!-- 모달 내용 끝 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div><!-- 비번수정 모달 끝-->	
						
						
						
						
						
						
						
						
						
							
					
						
						<!-- 계정연동 모달 시작-->
						<div class="modal fade" id="unifyModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">계정연동하기</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<h5>계정연동을 위해 추가정보 입력을 해주세요!</h5>
										<hr>
										<!-- 모달내용 태그 -->
										<form class="user">
											<div class="form-group"><!-- 사용자역할 -->
												<span class="radio">
							                        <label><input name="role" id="student8" name="student" type="radio" class="radio-label" checked value="student">학생 </label>
										            <label><input name="role" id="parents8" name="parents" type="radio" class="radio-label" value="parents"> 학부모 </label>
										            <label><input name="role" id="academy8" name="academy" type="radio" class="radio-label" value="academy"> 학원</label>
							                    	<input type="hidden" class="form-control" id="email8" name="email" value="${snsEmail}">
							                    </span>
											</div>
											<div class="form-group">
												<div class="row"><!-- 비밀번호 입력 -->
													<div class="col-6">
														<div class="form-group">		
															<input type="password" id="password0" name="password" class="form-control form-control-user"
				                                                placeholder="비밀번호" aria-describedby="emailHelp">
				                                        </div>
				                                    </div>
				                                    <div class="col-6"><!-- 비밀번호 확인 -->
														<div class="form-group">		
															<input type="password" class="form-control form-control-user"
				                                                placeholder="비밀번호확인" id="password2" name="password2" aria-describedby="emailHelp">
				                                        </div>
				                                    </div>
												      	<strong class="text_password"></strong>
			                            		</div>
											</div>
											<div class="form-group">
                                            <input type="text" id="name8" name="name" class="form-control form-control-user"
                                               aria-describedby="emailHelp"
                                                placeholder="이름">
                                            <span class="text_name"></span>
                                        </div>
                                        <div class="row"><!-- 휴대전화번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" id="phone8" name="phone" class="form-control form-control-user"
			                                                placeholder="휴대전화번호"  aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 발송버튼 -->
													<div class="form-group">
														<div class="text-center">
					                                       <a href="#" name="send_sms8" class="btn btn-primary btn-user btn-block">
					                                            인증요청
					                                        </a>
					                                    </div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="row"><!-- 인증번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                                placeholder="인증번호입력" id="vaildNum8" name="vaildNum8" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 인증번호 확인버튼 -->
													<div class="form-group">		
														<div class="text-center">
					                                        <a href="#" name="check_sms8" class="btn btn-primary btn-user btn-block">
					                                            확인
					                                        </a>
					                                        <span class="text_sms8"></span>
					                                    </div>
			                                        </div>
			                                    </div>
			                                </div><!-- 계정연동 클릭이벤트 해야해 -->
											<a href="#" name="unify"
												class="btn btn-primary btn-user btn-block"> 계정연동하기 </a>
										</form>
										<!-- 모달 내용 끝 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div><!-- 계정연동 모달 끝-->
				
				
				</div>
				
	      	</div><!-- container 끝 -->
      	
       </div>
      
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    
    
   <!-- JS 메인 시작 -->
    <script type="text/javascript">
    
  	//휴대전화번호 자동 대시(-)삽입
	$(document).on("keyup", "input[name=phone]", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	
  	//첫번째 비밀번호, 두번쨰 비밀번호 체크
	var passwordDuplicationCheck = false;
	
	//내정보수정 true 값 체크 메서드
	function fncCheckInfo() {

		var valid = false;

		if ( checkVaild ) {
			valid = true;
		}

		return valid;
	}

	//비밀번호변경 눌렀을때 true 값 체크 메서드
	function fncCheckAll() {

		var valid = false;

		if ( fncCheckPw() ) {
			valid = true;
		}

		return valid;
	}
	
	/*
	//계정휴면 눌렀을때 true 값 체크 메서드
	function fncCheckOut() {

		var valid = false;

		if (  ) {
			valid = true;
		}

		return valid;
	}
	*/
	
  
  	
	//event 함수
	$(function() {
		
		//내정보수정
		//인증번호 발송 event
		$( "a[name='send_sms']" ).on("click" , events.click.phoneBtn);
		//인증번호 확인 event
		$( "a[name='check_sms']" ).on("click" , events.click.vaildBtn);
		//내정보 수정하기 event 연결
		$('button[name="update"]').on("click", events.click.updateInfo);
		
		//비밀번호변경
		//현재비밀번호 변화 event
		$('input[name="password0"]').on("change", events.change.password0);
		//비밀번호1 변화 event
		$('input[name="password"]').on("change", events.change.password);
		//비밀번호2 변화 event
		$('input[name="password2"]').on("change", events.change.password2);
		//비밀번호 수정하기 event 연결
		$('a[name="updatePw"]').on("click", events.click.updatePw);
		
		//계정휴면
		//현재비밀번호 변화 event
		$('input[name="password00"]').on("change", events.change.password00);
		
	});

	
	var events = {

		click : {

			updatePw : function() {
				//alert("1접근")
				if ( fncCheckAll() && passwordDuplicationCheck ) {
					fncUpdatePassword();
				}
			},
			
			updateInfo : function() {
				alert("내정보보기수정클릭")
				if ( fncCheckInfo() ) {
					fncUpdateInfo();
				}
			},
			
			
			phoneBtn : function() {
				alert("인증번호발송 클릭")
				fncAuth();
				
			},
			
			vaildBtn : function() {
				alert("인증확인 클릭")
				fncKey();
				
			}
			
		},

		change : {

			password0 : function() {
				alert("현재비밀번호 change 이벤트")
				passwordChange();
			},

			password : function() {
				//alert("3접근")
				fncCheckPw("first");
			},

			password2 : function() {
				//alert("4접근")
				fncCheckPw("second");
			},

			password00 : function() {
				alert("현재비밀번호 change 이벤트")
				passwordChange00();
			}

		}
	}
	
	
	
	//인증번호 발송 함수
	function fncAuth(){					
		
		var phone = $("#phone").val()
		alert("입력한 연락처 : "+phone);
		
		
		$.ajax({
				url : "/user/json/sms/"+phone ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : 
						function(JSONData , status) {

						//alert("status : "+status);
						//alert("JSONData : \n"+JSONData);
						//alert("JSONData : \n"+JSONData.key);
						key = JSONData.key;
						
				}
					
		});	//End ajax 
	};
	
	
	
	//인증번호 확인 함수
	//test 용, 나중에 실제에서는 지우기
	var key ="123456";
	//var key = "";
	
	var vaildNum = $("#vaildNum").val();
	
	function fncKey() {	
	
		var vaildNum = $("#vaildNum").val();
		//alert("입력한 인증번호=>" + vaildNum)
		
		console.log("key : " +key)
		console.log("vaildNum : " +vaildNum)
		
		if( vaildNum == key ){
			
			$(".text_sms").text("인증번호가 맞습니다.");
			$(".text_sms").css("color", "blue");
			
			checkVaild = true;
			
		}else{
			
			$(".text_sms").text("인증번호가 맞지 않습니다.");
			$(".text_sms").css("color", "red");
		
		}		
	}	
  	
  	
    
    $(function() {

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".updateInfo").on("click", function() {
			self.location = "/user/updateUser?email=${user.email}"
		});
	});

    
    
    
    
    
    
	/////인증 부분 JS 시작
	//인증하기 버튼 event
	$(function() {
		$('span[name="addConnect"]').on("click", function() {

			//alert("잘접근?");
			var userNo = '${user.userNo}';
			var academyCode = $("#academyCode").val()

			console.log("userNo=> " + userNo);
			console.log("academyCode=> " + academyCode);

			$.ajax({
				url : "/user/json/addConnect/${user.userNo}/" + academyCode,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					console.log(JSONData)

					if (JSONData.message == "no") {

						$(".connect_text").val("")
						displayValue = "최대 인증 갯수를 초과했습니다."
						$(".connect_text").text(displayValue).css("color", "red");

					} else if (JSONData.message == "ok") {

						$(".connect_text").val("")
						alert("정상등록 되었습니다.")
						self.location = "/user/getUser?email=${user.email}"

					} else if (JSONData.message == "duplication") {

						$(".connect_text").val("")
						displayValue = "이미 등록된 학원입니다."
						$(".connect_text").text(displayValue).css("color", "red");

					} else if (JSONData.message == "notExist") {

						$(".connect_text").val("")
						displayValue = "유효하지 않은 학원코드입니다."
						$(".connect_text").text(displayValue).css("color", "red");

					}

					$("#academyCode").val("");
					$(".connect_text").text(displayValue);

				}
			});

		});
	});

	
	//인증취소 버튼 event
	$(function() {

		$('span[name="delete"]').on("click",function() {
			
					swal({
						  text: "학원 인증을 취소하시겠습니까?",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    swal("인증 취소 완료!", {
						      icon: "success",
						    });
						    
						    var userNo = '${user.userNo}';
							var academyCode = $('input[name="cntAcademyCode"]')
									.val();

							console.log("userNo=> " + userNo);
							console.log("academyCode=> " + academyCode);

							$.ajax({
								url : "/user/json/deleteConnect/${user.userNo}/"
										+ academyCode,
								method : "GET",
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {

									console.log(JSONData)

									if (JSONData.message == "ok") {
										self.location = "/user/getUser?email=${user.email}"
									}

								}
							});
						    
						    
						  }
						});

				});

	});

	/*
	//등록한 학원 상세보기 페이지 이동 event
	$(function() {
		$('span[name="cntAcademyName"]').on("click", function() {
			alert("이동할겨")
			var academyCode = $('input[name="cntAcademyCode"]').val();
			alert(academyCode);
			self.location = "/academy/academyInfo?academyCode=" + academyCode;
		})

	})
	*/
	
	
	// 비밀번호변경 -> 비밀번호 체인지 & 본래 비밀번호 맞는지
	function passwordChange() {

		var password = $('input[name="password0"]').val();

		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (password) {

			fncCheckCurrentPassword();

		} else {
			$(".password_check").text("비밀번호를 입력하세요.");
			$(".password_check").css("color", "red");
		}

	}
	
	// 계정휴면 -> 비밀번호 체인지 & 본래 비밀번호 맞는지
	function passwordChange00() {

		var password = $('input[name="password00"]').val();

		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (password) {

			fncCheckCurrentPassword00();
			return true;

		} else {
			$(".password_check").text("비밀번호를 입력하세요.");
			$(".password_check").css("color", "red");
		}

	}
	
	
	
	//내정보 수정하기 함수
	function fncUpdateInfo() {
		//swal너무 빨리지나가 어떻게 수정하징
		alert('내 정보가 수정되었습니다!^ㅇ^')
		$("form[name=updateInfoForm]").attr("method", "POST").attr("action", "/user/updateUser")
				.submit();
	}
	
	

	//비밀번호 수정하기 함수
	function fncUpdatePassword() {
		$("form[name=updatePwForm]").attr("method", "POST").attr("action", "/user/updatePassword")
				.submit();
		//swal너무 빨리지나가 어떻게 수정하징
		alert('비밀번호가 수정되었습니다!^ㅇ^')

	}

	
	//비밀번호 변경=> 현재 비밀번호 맞는지 확인 ajax
	function fncCheckCurrentPassword() {

		var email = $('input[name="email"]').val();
		var password = $('input[name="password0"]').val();

		console.log(email);
		console.log(password);

		$.ajax({
			url : "/user/json/checkPassword",
			method : "POST",
			data : JSON.stringify({
				email : email,
				password : password,
			}),
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {

				//alert("성공!");

				if (JSONData.result == "no") {
					console.log("비번 NO");

					passwordDuplicationCheck = false;
					$(".password_check").text("비밀번호가 맞지 않습니다");
					$(".password_check").css("color", "red");

				} else if (JSONData.result == "ok") {
					console.log("비번 OK");

					passwordDuplicationCheck = true;
					$(".password_check").text("비밀번호가 맞습니다");
					$(".password_check").css("color", "blue");
				}
			}
		});

	}
	
	
	
	//계정휴면=> 현재 비밀번호 맞는지 확인 ajax
	function fncCheckCurrentPassword00() {

		var email = $('input[name="email"]').val();
		var password = $('input[name="password00"]').val();

		console.log(email);
		console.log(password);

		$.ajax({
			url : "/user/json/checkPassword",
			method : "POST",
			data : JSON.stringify({
				email : email,
				password : password,
			}),
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {

				//alert("성공!");

				if (JSONData.result == "no") {
					console.log("비번 NO");

					passwordDuplicationCheck = false;
					$(".out_password_check").text("비밀번호가 맞지 않습니다");
					$(".out_password_check").css("color", "red");

				} else if (JSONData.result == "ok") {
					console.log("비번 OK");

					passwordDuplicationCheck = true;
					$(".out_password_check").text("비밀번호가 맞습니다");
					$(".out_password_check").css("color", "blue");
				}
			}
		});

	}
	

	//첫번째,두번째 비밀번호 조건 함수
	function fncCheckPw(passwordType) {

		var passwordTarget = passwordType == "first" ? "password0" : "password2";
		var passwordCompare = passwordType == "first" ? "password2"
				: "password";

		//'input[name="password"]'
		var pw = $('input[name="' + passwordTarget + '"]').val();
		var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

		console.log(pw);

		if (reg.test(pw)) {

			var pw2 = $('input[name="' + passwordCompare + '"]').val();

			if (pw == pw2) {

				$(".text_password").text("비밀번호가 일치합니다.");
				$(".text_password").css("color", "blue");

				return true;

			} else {

				$(".text_password").text("비밀번호가 일치하지 않습니다.");
				$(".text_password").css("color", "red");
			}

		} else {

			var str = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
			$('.text_password').text(str).css("color", "red");
			$("#password").focus();
		}
		return false;
	}
	
	
	
	
	//계정탈퇴 JS 시작
	
	$( function() {
						
				fncCheckPassword();
				
			});
			
			//현재 비밀번호 맞는지 확인
			function fncCheckPassword() {
				 
				$('input[name="password00"]').blur(function(){
					
					var email = $("#email").val();
					var password = $('input[name="password00"]').val();
					
					console.log(email);
					console.log(password);
				
					$.ajax( 
							{
								url : "/user/json/checkPassword",
								method : "POST" ,
								data : JSON.stringify({
									email : email,
									password: password,
								}),
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {
									
									//alert("성공!");
	
									if (JSONData.result == "no") {
										console.log("비번 NO");
										$(".password_check").text("비밀번호가 맞지 않습니다");
										$(".password_check").css("color", "red");
										
									} else if (JSONData.result == "ok") {
										
										console.log("비번 OK");
										
										valid = true;
										
										$(".password_check").text("비밀번호가 맞습니다");
										$(".password_check").css("color", "blue");
									}
									
								}
					});
					
				});
			}
			
		//============= "탈퇴하기"  Event 연결 =============
		 $(function() {
			 
			$( "button[name=out]" ).on("click" , function() {
				
				swal({
					  title: "탈퇴 하시겠습니까?",
					  text: "복구가능기간은 30일 이내입니다!",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  fncOutUser();
					  }
					});
			});
		});	
		
		
		//계정탈퇴 함수
		function fncOutUser() {
					
			$('form[name="outForm"]').attr("method" , "POST").attr("action" , "/user/outUser").submit();
		}
			 
			 
			
		 
		
		
		
		
		<!--                학원 용 입니다               -->
		
		var userno = '${user.userNo}';
        var role = '${user.role}';
        
        function academyList(){
        	$.ajax({
        		url : '/academy/json/academyProfile/${user.userNo}',
        		type : 'get',
        		success : function(data){
        			console.log(data);
        			$.each(data, function(key,value){
        				
        				var a = '';
        				
        				if(value.length<=2){
        					a += '<div class="col-sm-4"><div class="panel panel-default">'
    						a += '<div class="panel-heading">'
    						a += '<h6 class="panel-title"> 학원 등록 하기 </h6></div>'
    						
    						a += '<div class="card-body">'
    						a += '<a href="/academy/addAcademyView"> >> 학원 등록 하기 << </a></div></div></div>'
    					}
        				
        				for(var i=0; i<value.length;i++){
        					
        					a += '<div class="col-sm-4"><div class="panel panel-default">'
        					a += '<div class="panel-heading">'
        					a += '<h6 class="panel-title">'
        					a += '<a href="/academy/academyInfo?academyCode='+(value[i].academyCode)+'" >'+value[i].academyName+'</a></h6>'
        					a += '<div class="dropdown no-arrow">'
        					a += '<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>'
        					a += '<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">'
        					a += '<a onclick="deleteAcademyProfile(\''+(value[i].academyCode)+'\')" class="dropdown-item"> 학원 프로필 삭제 </a>'
        					a += '</div></div></div>'
        					
        					a += '<div id="academyInfo_' + i +'" class="card-body">'
        					a += ' 학원 정보 '+getAcademyInfo(i, value[i].academyCode) 
        					a += '</div></div></div>'
        				}
        				
            			$("#academyList").html(a);
        				
        			});
        		}
        	});
        }
        
        function getAcademyInfo(index, academyCode){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 
					 var a = ''
					 	 a += 'PHONE : ' + data.academyPhone
				 		 a += '<br/><br/>지역구 : ' + data.academyArea
				 		 a += '<br/><br/>학생수 : ' + data.count + '명'
				 		 a += '<br/><br/>수업수 : ' + data.count2 + '개'
			
				 		 // 두번째 세번째 정보 못받아옴
				 		 // 인증 학생 수
				 		 // 등록 수업 수
				 					
					$("#academyInfo_" + index).html(a);
				 }							
			});		
		}
        
		
		// 학원 프로필 삭제하기
		function deleteAcademyProfile(academyCode){
			alert(academyCode)
			
			if(confirm('학원과 관련된 모든 정보가 삭제됩니다. 그래도 삭제 하시겠습니까?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/deleteAcademyAll/'+academyCode,
			        type : 'post',
			        success : function(data){
			            alert("삭제가 완료되었습니다!")
			            academyList();
			        }
			    });
			}
		}
	
		
		 $(document).ready(function(){
	            academyList();
	        });
		 
		 
		 
		 
		 
//////////////////////////추가부분임돵 ///////////비번변경 JS 시작//////////////////////
		
		
//첫번째 비밀번호, 두번쨰 비밀번호 체크
	var passwordDuplicationCheck_new = false;
	
	//비밀번호변경 눌렀을때 true 값 체크 메서드
	function fncCheckAll_new() {

		var valid = false;

		if ( fncCheckPw_new() ) {
			valid = true;
		}

		return valid;
	}		
		
		
		

//event 함수
	$(function() {
		
		
		//비밀번호변경
		//현재비밀번호 변화 event
		$('input[name="pw_0"]').on("change", events_new.change.password0);
		//비밀번호1 변화 event
		$('#pw_1').on("change", events_new.change.password);
		//비밀번호2 변화 event
		$('#pw_2').on("change", events_new.change.password2);
		//비밀번호 수정하기 event 연결
		$('button[name="updatePw"]').on("click", events_new.click.updatePw);
	
	});

	
	var events_new = {

		click : {

			updatePw : function() {
				//alert("1접근")
				if ( fncCheckAll_new() && passwordDuplicationCheck_new ) {
					fncUpdatePassword_new();
				}
			}
			
		},

		change : {

			password0 : function() {
				alert("현재비밀번호 change 이벤트")
				passwordChange_new();
			},

			password : function() {
				//alert("3접근")
				fncCheckPw_new("first");
			},

			password2 : function() {
				//alert("4접근")
				fncCheckPw_new("second");
			},

			password00 : function() {
				alert("현재비밀번호 change 이벤트")
				passwordChange00_new();
			}

		}
	}
	

	// 비밀번호변경 -> 비밀번호 체인지 & 본래 비밀번호 맞는지
	function passwordChange_new() {

		var password = $('#pw_0').val();

		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (password) {

			fncCheckCurrentPassword_new();

		} else {
			$(".update_password_check").text("비밀번호를 입력하세요.");
			$(".update_password_check").css("color", "red");
		}

	}
	
	// 비번변경 -> 비밀번호 체인지 & 본래 비밀번호 맞는지
	function passwordChange_new() {

		var password = $('input[name="pw_0"]').val();

		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (password) {

			fncCheckCurrentPassword00_new();
			return true;

		} else {
			$(".update_password_check").text("비밀번호를 입력하세요.");
			$(".update_password_check").css("color", "red");
		}

	}

	
	//현재 비밀번호 맞는지 확인 ajax
	function fncCheckCurrentPassword00_new() {

		var email = $('#email').val();
		var password = $('input[name="pw_0"]').val();

		console.log(email);
		console.log(password);

		$.ajax({
			url : "/user/json/checkPassword",
			method : "POST",
			data : JSON.stringify({
				email : email,
				password : password,
			}),
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {

				//alert("성공!");

				if (JSONData.result == "no") {
					console.log("비번 NO");

					passwordDuplicationCheck_new = false;
					$(".update_password_check").text("비밀번호가 맞지 않습니다");
					$(".update_password_check").css("color", "red");

				} else if (JSONData.result == "ok") {
					console.log("비번 OK");

					passwordDuplicationCheck_new = true;
					$(".update_password_check").text("비밀번호가 맞습니다");
					$(".update_password_check").css("color", "blue");
				}
			}
		});

	}
	

	//첫번째,두번째 비밀번호 조건 함수
	function fncCheckPw_new(passwordType) {

		var passwordTarget = passwordType == "first" ? "pw_1" : "pw_2";
		var passwordCompare = passwordType == "first" ? "pw_2": "pw_1";
		
		//'input[name="password"]'
		var pw = $('#' + passwordTarget ).val();
		var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

		console.log(pw);

		if (reg.test(pw)) {

			var pw2 = $('#' + passwordCompare ).val();

			if (pw == pw2) {

				$(".update_password_check1").text("비밀번호가 일치합니다.");
				$(".update_password_check1").css("color", "blue");

				return true;

			} else {

				$(".update_password_check1").text("비밀번호가 일치하지 않습니다.");
				$(".update_password_check1").css("color", "red");
			}

		} else {

			var str = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
			$('.update_password_check1').text(str).css("color", "red");
			$("#pw_1").focus();
		}
		return false;
	}
	
	
	
	//비밀번호 수정하기 함수
	function fncUpdatePassword_new() {
		$("form[name=updatePwForm]").attr("method", "POST").attr("action", "/user/updatePassword")
				.submit();
		//swal너무 빨리지나가 어떻게 수정하징
		alert('비밀번호가 수정되었습니다!^ㅇ^')

	}




	        
    
    </script>
    
  </body>
</html>
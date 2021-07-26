<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>getUser</title>
<script type="text/javascript">
	//============= 회원정보수정 Event  처리 =============	
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
						$(".connect_text").css("color", "red");

					} else if (JSONData.message == "ok") {

						$(".connect_text").val("")
						swal("정상등록 되었습니다.")
						self.location = "/user/listConnect"

					} else if (JSONData.message == "duplication") {

						$(".connect_text").val("")
						displayValue = "이미 등록된 학원입니다."
						$(".connect_text").css("color", "red");

					} else if (JSONData.message == "notExist") {

						$(".connect_text").val("")
						displayValue = "유효하지 않은 학원코드입니다."
						$(".connect_text").css("color", "red");

					}

					$("#academyCode").val("");
					$(".connect_text").append(displayValue);

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
										self.location = "/user/listConnect"
									}

								}
							});
						    
						    
						  }
						});

				});

	});

	//등록한 학원 상세보기 페이지 이동 event
	$(function() {
		$('span[name="cntAcademyName"]').on("click", function() {
			alert("이동할겨")
			var academyCode = $('input[name="cntAcademyCode"]').val();
			alert(academyCode);
			self.location = "/academy/academyInfo?academyCode=" + academyCode;
		})

	})

	//////////////////////////////////// 모달 비밀번호 수정
	var passwordDuplicationCheck = false;

	//수정하기 눌렀을때 모든 true 값 체크 메서드
	function fncCheckAll() {

		var valid = false;

		if (fncCheckPw()) {
			valid = true;
		}

		return valid;
	}

	//event 함수
	$(function() {

		//수정하기 event 연결
		$('a[name="updatePw"]').on("click", events.click.updatePw);
		//현재비밀번호 변화 event
		$('input[name="password0"]').on("change", events.change.password0);
		//비밀번호1 변화 event
		$('input[name="password"]').on("change", events.change.password);
		//비밀번호2 변화 event
		$('input[name="password2"]').on("change", events.change.password2);

	});

	var events = {

		click : {

			updatePw : function() {
				//alert("1접근")
				if (fncCheckAll()) {
					fncUpdatePassword();
				}
			}
		},

		change : {

			password0 : function() {
				//alert("2접근")
				passwordChange();
			},

			password : function() {
				//alert("3접근")
				fncCheckPw("first");
			},

			password2 : function() {
				//alert("4접근")
				fncCheckPw("second");
			}

		}
	}

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

	//비밀번호 수정하기 함수
	function fncUpdatePassword() {
		$("form").attr("method", "POST").attr("action", "/user/updatePassword")
				.submit();
		//초 설정 집어넣기
		swal('비밀번호가 수정되었습니다!^ㅇ^')

	}

	//현재 비밀번호 맞는지 확인 ajax
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

	//첫번째,두번째 비밀번호 조건 함수
	function fncCheckPw(passwordType) {

		var passwordTarget = passwordType == "first" ? "password" : "password2";
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
										
										$('button[name="out"]').prop('disabled', false);
										$(".password_check").text("비밀번호가 맞습니다");
										$(".password_check").css("color", "blue");
									}
									
								}
					});
					
				});
			}
			
			//============= "탈퇴하기"  Event 연결 =============
			 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "button[name=out]" ).on("click" , function() {
					//swal("안녕히 가세요. 복구가능기간은 30일 이내입니다!")
					//fncOutUser();
					
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
			
			
			 function fncOutUser() {
						
				$('form[name="outForm"]').attr("method" , "POST").attr("action" , "/user/outUser").submit();
			}
			 
			 
			
			 
		//sns 간편로그인 연동하기 클릭 event
		$(function() {

			$('span[name="unify"]').on("click", function() {
				//self.location = "/user/updateUser?email=${user.email}"
			});
		});	 
	
	
	
	
</script>


			<!-- 찐 본문시작 /// 여러분의 jsp 들어갈 자리 -->
			<div class="row"><!-- low 시작 -->
				<!-- 화면 두개 분할시 여기 필요 -->
				<div class="
							<c:choose>
								<c:when test="${!empty user.role}">col-lg-6</c:when>
								<c:otherwise>col-lg-12</c:otherwise>
							</c:choose>
				">
					<!-- 내정보보기 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">
							   <c:choose>
			                		<c:when test="${!empty user.role}">
			                			${user.name}님의 Profile
			                		</c:when>
			                		<c:otherwise>
			                			${email}님의 Profile
			                		</c:otherwise>
			                	</c:choose>
							   
							</h6>
							<h6 class="m-0 font-weight-bold text-primary" align="right">
								<a href="/user/updateUser?email=${user.email}"
									class="btn btn-info btn-circle btn-sm" data-toggle="modal"
										data-target="#updateModal" align="right">
										<i class="fas fa-info-circle"></i>
								</a>
							</h6>
						</div>
						<div class="card-body">
							<input type="hidden" value="${user.userNo}">
							 <c:choose>
		                		<c:when test="${!empty user.role}">
		                			E-MAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.email} <br>
		                			NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.name} <br>
									PHONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.phone} <br>
									REG_DATE&nbsp;: ${user.inDate} <br>
									PHONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${user.phone} <br>
		                		</c:when>
		                		<c:otherwise>
		                			E-MAIL : ${email} <br><br>
		                			회원님은 SNS 연동해제 상태입니다.<br>
		                			더 많은 서비스를 이용하시려면 계정연동을 해주세요!<br><br>
		                			<span name="unify" data-toggle="modal"
										data-target="#unifyModal" >
										계정연동하기
									</span>
		                		</c:otherwise>
			                </c:choose>
						</div>
					</div>

					<c:if test="${!empty user.role && user.role ne 'academy' && user.role ne 'admin'}">
						<!-- 내가 다니는 학원 보기-->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">My Academy</h6>
							</div>
							<div class="card-body">
								<input type="hidden" value="${user.userNo}">
								<!-- 우리 학원 보기 테이블 시작 -->
								<table class="table table-hover table-striped">
									<c:choose>
										<c:when test="${empty list}">
											<span><h6>
													<img src="/image/crying.png">
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
												<c:forEach var="connect" items="${list}">
													<c:set var="i" value="${ i+1 }" />
													<tr>
														<td align="left">${ i }</td>
														<td align="left"><span class="cntAcademyName"
															name="cntAcademyName"><u>${connect.academy.academyName}</u></span>
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
								</table>
								<!-- 우리 학원 보기 테이블 끝 -->
							</div>
						</div>
					</c:if>

				</div>


				<c:if test="${!empty user.role}">
					<!-- 비밀번호변경 -->
					<div class="col-lg-6">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">비밀번호 변경</h6>
								<h6 class="m-0 font-weight-bold text-primary" align="right">
									<a href="/user/updatePassword?email=${user.email}"
										class="btn btn-info btn-circle btn-sm" data-toggle="modal"
										data-target="#myModal" align="right">
										<i class="fas fa-info-circle"></i>
									</a>
								</h6>
							</div>
						</div>
						<!-- 탈퇴하기-->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">계정휴면</h6>
								<h6 class="m-0 font-weight-bold text-primary" align="right">
									 <a href="/user/outUser?email=${user.email}" 
									 	class="btn btn-danger btn-circle btn-sm" data-toggle="modal"
										data-target="#outModal" align="right">
                                        <i class="fas fa-trash"></i>
                                    </a>
								</h6>
							</div>
						</div>

						<!-- role : 간편로그인, 학원일 경우 인증 안보이게 -->
						<c:if test="${!empty user.role && user.role ne 'academy' && user.role ne 'admin'}">
							<!-- 우리학원 인증하기 등록하기 -->
							<br>
							<br>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">학원 인증하기</h6>
									<h6 class="m-0 font-weight-bold text-primary" align="right">
										<!-- 인증하기 버튼 -->
										<span name="addConnect" class="btn btn-success btn-circle btn-sm">
		                                   <i class="fas fa-check"></i>
		                                </span>
		                            </h6>
								</div>
								<div class="card-body">
									<div class="form-group">
										<div class="card-body">
											<input type="hidden" value="${user.userNo}">
											<input type="text" class="form-control" id="academyCode"
												name="academyCode" placeholder="*학원코드 입력(인증 최대 3개)">
										</div>
											<span id="helpBlock" class="help-block">
												<strong class="connect_text"></strong>
										   </span>
									</div>
								</div>
							</div>
						</c:if>
						
						
						

						<!-- 비밀번호변경 모달 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">Update Your Password</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 모달내용 태그 -->
										<form class="user">
											<div class="form-group">
												<input type="hidden" id="email" name="email"
													value="${user.email}"> <input type="password"
													class="form-control form-control-user" name="password0"
													id="exampleInputEmail" aria-describedby="emailHelp"
													placeholder="현재비밀번호"> <span id="helpBlock"
													class="help-block"> <strong class="password_check"></strong>
												</span>
											</div>
											<div class="form-group">
												<input type="password"
													class="form-control form-control-user"
													id="exampleInputEmail" aria-describedby="emailHelp"
													name="password" placeholder="새비밀번호">
											</div>
											<div class="form-group">
												<input type="password"
													class="form-control form-control-user"
													id="exampleInputEmail" aria-describedby="emailHelp"
													name="password2" placeholder="비밀번호확인"> <span
													id="helpBlock" class="help-block"> <strong
													class="text_password"></strong>
												</span>
											</div>
											<a href="#" name="updatePw"
												class="btn btn-primary btn-user btn-block"> 비밀번호수정 </a>
										</form>
										<!-- 모달 내용 끝 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div><!-- 비밀번호변경 모달 끝-->
						
						<!-- 계정탈퇴 모달 -->
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
											      	<strong class="password_check"></strong>
											     </span>
											     <br>
				                                    <p>정말 탈퇴하시겠습니까? <br>
				                                       계정복구는 신청한 날짜로부터 <strong style="color:red">30일</strong> 이내만 가능합니다.
								 					</p>
	                                        </div>
		                                        <button type="button" id="out" name="out" disabled="disabled" class="btn btn-primary btn-user btn-block">
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
						</div><!-- 계정탈퇴 모달 끝-->
						
						<!-- 내정보수정 모달 -->
						<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">
											Update Your Account</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 모달내용 태그 -->
	                                    <form class="user" name="outForm">
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
			                                               name="phone" placeholder="휴대전화번호" id="exampleInputEmail" aria-describedby="emailHelp">
				                                        	<span id="helpBlock" class="help-block">
															   <strong class="text_phone"></strong>
															</span>	
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 발송버튼 -->
													<div class="form-group">
														<div class="text-center">
					                                       <a href="#" class="btn btn-primary btn-user btn-block">
					                                            인증번호발송
					                                        </a>
					                                    </div>
													    <span><strong class="text_phone"></strong>
													   </span>	
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="row"><!-- 인증번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                               name="phone" placeholder="인증번호입력" id="exampleInputEmail" aria-describedby="emailHelp">
				                                        	<span id="helpBlock" class="help-block">
															   <strong class="text_phone"></strong>
															</span>	
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 인증번호 확인버튼 -->
													<div class="form-group">		
														<div class="text-center">
					                                        <a href="#" class="btn btn-primary btn-user btn-block">
					                                            확인
					                                        </a>
					                                    </div>
			                                        	<span id="helpBlock" class="help-block">
														   <strong class="text_phone"></strong>
														</span>	
			                                        </div>
			                                    </div>
			                                </div>
			                                    
		                                        <button type="button" id="update" name="update" class="btn btn-primary btn-user btn-block">
		                                            수정하기
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
						</div><!-- 내정보수정 모달 끝-->
						
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
										<!-- 모달내용 태그 -->
										<form class="user">
											<div class="form-group">
												<input type="hidden" id="email" name="email"
													value="${user.email}"> <input type="password"
													class="form-control form-control-user" name="password0"
													id="exampleInputEmail" aria-describedby="emailHelp"
													placeholder="현재비밀번호"> <span id="helpBlock"
													class="help-block"> <strong class="password_check"></strong>
												</span>
											</div>
											<div class="form-group">
												<input type="password"
													class="form-control form-control-user"
													id="exampleInputEmail" aria-describedby="emailHelp"
													name="password" placeholder="새비밀번호">
											</div>
											<div class="form-group">
												<input type="password"
													class="form-control form-control-user"
													id="exampleInputEmail" aria-describedby="emailHelp"
													name="password2" placeholder="비밀번호확인"> <span
													id="helpBlock" class="help-block"> <strong
													class="text_password"></strong>
												</span>
											</div>
											<a href="#" name="updatePw"
												class="btn btn-primary btn-user btn-block"> 비밀번호수정 </a>
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
				</c:if>
			</div>
			<!-- low -->
			
		<c:if test="${user.role eq 'academy'}">
			<div class="row"><!-- 학원프로필 카드 시작 -->
                        <div class="col-lg-4">
                           <!-- 프로필1 -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    Dropdown menus can be placed in the card header in order to extend the functionality
                                    of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis
                                    icon in the card header can be clicked on in order to toggle a dropdown menu.
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-4">

                            <!-- 프로필 2 -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    Dropdown menus can be placed in the card header in order to extend the functionality
                                    of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis
                                    icon in the card header can be clicked on in order to toggle a dropdown menu.
                                </div>
                            </div>

                        </div>
                        
                        <div class="col-lg-4">

                            <!-- 프로필 3 -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    Dropdown menus can be placed in the card header in order to extend the functionality
                                    of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis
                                    icon in the card header can be clicked on in order to toggle a dropdown menu.
                                </div>
                            </div>


                        </div>
                </div>
           </c:if>
			
			




<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>

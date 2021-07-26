<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		
		<script type="text/javascript">
			$( function() {
						
				fncCheckPassword();
				
			});
			
			//현재 비밀번호 맞는지 확인
			function fncCheckPassword() {
				 
				$('input[name="password0"]').blur(function(){
					
					var email = $("#email").val();
					var password = $('input[name="password0"]').val();
					
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
			
			
		</script>	
		
		
		
	    
                    <div class="card-body p-0">
	
	                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">탈퇴신청</h1>
                                        <p class="mb-4">현재 비밀번호 입력 후, 탈퇴절차를 진행해주세요.</p>
                                    </div>
                                    <form class="user" name="outForm">
                                        <div class="form-group">
                                        	<input type="hidden" id="email" name="email" value="${user.email}">
                                            <input type="password" class="form-control form-control-user"
                                               name="password0" id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="현재비밀번호">
                                            <span id="helpBlock" class="help-block">
										      	<strong class="password_check"></strong>
										     </span>
										     <br>
										     <div class="card mb-4 py-3 border-left-primary">
				                                <div class="card-body">
				                                    <p>정말 탈퇴하시겠습니까? <br>
				                                       계정복구는 신청한 날짜로부터 30일 이내만 가능합니다.
								 					</p>
				                                </div>
						                      </div>
                                        </div>
	                                        <button type="button" id="out" name="out" disabled="disabled" class="btn btn-primary btn-user btn-block">
	                                            탈퇴하기
	                                        </button>
	                                    </form>
	                                    
	                                </div>
	                        </div>
	                    </div>
	                </div>
		
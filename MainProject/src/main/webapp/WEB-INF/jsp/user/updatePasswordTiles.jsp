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
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<script type="text/javascript">	
		
		
		var passwordDuplicationCheck = false;
		
		//수정하기 눌렀을때 모든 true 값 체크 메서드
		function fncCheckAll() {
			
			var valid = false;
			
			if( fncCheckPw() ){
				valid = true;
			}
			
			return valid;
		}
		
		
		//event 함수
		$(function() {
			
			//수정하기 event 연결
			$( 'a[name="updatePw"]' ).on("click" , events.click.updatePw);
			//현재비밀번호 변화 event
			$('input[name="password0"]').on("change" , events.change.password0);
			//비밀번호1 변화 event
			$('input[name="password"]').on("change", events.change.password);
			//비밀번호2 변화 event
			$('input[name="password2"]').on("change", events.change.password2);
			
		});
		
		
		var events = {
				
			click : {
				
				updatePw : function() {
					//alert("1접근")
					if(fncCheckAll()){
						fncUpdatePassword();
					}
				}
			},
			
			change : {
				
				password0 : function() {
					//alert("2접근")
					passwordChange();
				},
				
				password : function(){
					//alert("3접근")
					fncCheckPw("first");
				},
				
				password2 : function(){
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
				
			}else{
				$(".password_check").text("비밀번호를 입력하세요.");
				$(".password_check").css("color", "red");
			}
			
		}
		
		
		
		//비밀번호 수정하기 함수
		function fncUpdatePassword() {
					
			$("form").attr("method" , "POST").attr("action" , "/user/updatePassword").submit();
		}
		

		
		
		//현재 비밀번호 맞는지 확인 ajax
		function fncCheckCurrentPassword() {
			 
			var email = $('input[name="email"]').val();
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
		function fncCheckPw(passwordType){
			
			var passwordTarget = passwordType == "first" ? "password" : "password2";
			var passwordCompare = passwordType == "first" ? "password2" : "password";
			
			//'input[name="password"]'
			var pw = $('input[name="' + passwordTarget + '"]').val();
			var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			
			console.log(pw);
			
			if(reg.test(pw)) {
				
				var pw2 = $('input[name="' + passwordCompare + '"]').val();
				
				if( pw == pw2 ){
					
					$(".text_password").text("비밀번호가 일치합니다.");
					$(".text_password").css("color", "blue");
					
					return true;
					
				}else{
					
					$(".text_password").text("비밀번호가 일치하지 않습니다.");
					$(".text_password").css("color", "red");
				}
				
			}else {
				
				var str = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				$('.text_password').text(str).css("color", "red");
				$("#password").focus();
			}
			return false;
		}
			
		
			
		</script>	

    </head>
    
     
    <!-- <body class="bg-gradient-primary">
    <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">비밀번호변경</h1>
	                            </div>
	                            	<form class="user">
		                                <div class="form-group">
		                                	<input type="hidden" id="email" name="email" value="${user.email}">
		                                    <input type="password" class="form-control form-control-user" id="exampleInputEmail"
		                                        name="password0" placeholder="현재비밀번호">
		                                     <span id="helpBlock" class="help-block">
										      	<strong class="password_check"></strong>
										     </span>
		                                </div>
		                                <div class="form-group row">
		                                    <div class="col-sm-6 mb-3 mb-sm-0">
		                                        <input type="password" class="form-control form-control-user"
		                                            id="exampleInputPassword" name="password" placeholder="새비밀번호">
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <input type="password" class="form-control form-control-user"
		                                            id="exampleRepeatPassword" name="password2" placeholder="비밀번호확인">
		                                         <span id="helpBlock" class="help-block">
										      	  <strong class="text_password"></strong>
										      	</span>
		                                    </div>
		                                </div>
		                                <a href="login.html" name="updatePw" class="btn btn-primary btn-user btn-block">
		                                    비밀번호수정
		                                </a>
		                       </form>
                        </div>
                    </div>
                </div>
        </div> -->
       
        
        
	<body class="bg-gradient-primary">
	
	    <div class="container">
	    
                    <div class="card-body p-0">
	
	                        <!-- Nested Row within Card Body -->
	                        <div class="row">
	                            <div class="col-lg-6">
	                                <div class="p-5">
	                                    <div class="text-center">
	                                        <h1 class="h4 text-gray-900 mb-2">Update your Password!</h1>
	                                        <p class="mb-4">현재 비밀번호를 입력하여 확인 후, 새로운 비밀번호로 변경하세요.</p>
	                                    </div>
	                                    <form class="user">
	                                        <div class="form-group">
	                                        	<input type="hidden" id="email" name="email" value="${user.email}">
	                                            <input type="password" class="form-control form-control-user"
	                                               name="password0" id="exampleInputEmail" aria-describedby="emailHelp"
	                                                placeholder="현재비밀번호">
	                                            <span id="helpBlock" class="help-block">
											      	<strong class="password_check"></strong>
											     </span>
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user"
	                                                id="exampleInputEmail" aria-describedby="emailHelp"
	                                                name="password" placeholder="새비밀번호">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user"
	                                                id="exampleInputEmail" aria-describedby="emailHelp"
	                                                name="password2" placeholder="비밀번호확인">
	                                            <span id="helpBlock" class="help-block">
										      	  <strong class="text_password"></strong>
										      	</span>
	                                        </div>
	                                        <a href="login.html" name="updatePw" class="btn btn-primary btn-user btn-block">
	                                            비밀번호수정
	                                        </a>
	                                    </form>
	                                    
	                                </div>
	                        </div>
	                    </div>
	                </div>
				</div>
		</body>

    
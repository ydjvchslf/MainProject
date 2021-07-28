<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    
    <title> Forgot Password</title>

    <!-- Custom fonts for this template-->
    <link href="/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
	
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-5 col-lg-9 col-md-6">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                        <br>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" name="name" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이름">
                                            <span id="helpBlock" class="help-block">
										      	<strong class="text_name"></strong>
										     </span>        
                                        </div>
                                       <div class="row"><!-- 휴대전화번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                               name="phone" placeholder="휴대전화번호" id="phone" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 발송버튼 -->
													<div class="form-group">
														<div class="text-center">
					                                       <a href="#" name="send_sms" class="btn btn-primary btn-user btn-block">
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
			                                <div class="form-group">
	                                            <input type="email" name="email" class="form-control form-control-user"
	                                                id="exampleInputEmail" aria-describedby="emailHelp"
	                                                placeholder="Email">
	                                            <span id="helpBlock" class="help-block">
											      	<strong class="text_email"></strong>
											     </span>
											     <span id="helpBlock" class="help-block">
											      	<strong class="explain1"></strong>
											     </span>          
                                       		 </div>
		                                     <a href="#" name="findPassword" class="btn btn-primary btn-user btn-block">
		                                            Find Password
		                                     </a>
                                    </form>
                                    <hr>
                                    
                                    <form class="user" name="updateForm">
                                    		<div class="row"><!-- 새비밀번호 입력 -->
												<div class="col-6">
													<div class="form-group">		
														<input type="password" name="password" class="form-control form-control-user"
			                                                placeholder="새비밀번호" id="password" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-6"><!-- 인증번호 확인버튼 -->
													<div class="form-group">		
														<input type="password" class="form-control form-control-user"
			                                                placeholder="비밀번호확인" id="password2" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <span id="helpBlock" class="help-block">
											      	<strong class="text_password"></strong>
											     </span> 
			                                </div>
			                                <div class="row">
			                                <div class="col-12"><!--비번변경 버튼 -->
													<div class="form-group">		
														<div class="text-center">
					                                        <a href="#" id="changePw" class="btn btn-primary btn-user btn-block">
					                                            수정하기
					                                        </a>
					                                    </div>
			                                        </div>
			                                    </div>
			                                 </div>
                                    		<span id="helpBlock" class="help-block">
											   <strong class="text_phone"></strong>
											</span>	
                                    </form>		
                                    <div class="text-center">
                                        <a class="small" name="login" href="#">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/sbadmin/js/sb-admin-2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>

	<script type="text/javascript">
	
	
	//휴대전화번호 자동 대시(-)삽입
	$(document).on("keyup", "input[name=phone]", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	
	
	$( function() {
		//로그인 이동 event
		$('a[name=login]').on("click" , function() {
			self.location = "/user/login"
		});
		
		//이름 change 이벤트
		$('input[name=name]').on("change" , function() {
			fncCheckName()
		});
		
		//이메일 change 이벤트
		$('input[name=email]').on("change" , function() {
			checkEmail()
		});
		
	});
	
	
	//이름 체크 함수
	function fncCheckName() {
		
		var name = $('input[name=name]').val();
		
	    if(name){
	    	var nameRegExp = /^[가-힣]{2,20}$/;
	    	
	    	if(nameRegExp.test(name)){
	    		$(".text_name").text("올바른 이름 형식입니다.").css("color", "blue");
	    		return true;
	    	}else{
	    		$(".text_name").text("올바른 이름 형식이 아닙니다").css("color", "red");
	    	}
	    } else{
	    	$(".text_name").text("이름을 필수로 입력하세요!");
			$(".text_name").css("color", "red");
	    }
	    return false; //확인이 완료되었을 때
	}
	
	
	//이메일유효성 함수
    function checkEmail() {
		
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var email=$("input[name='email']").val();
		
		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (email) {
			
			if(emailRegExp.test(email)){
				$(".explain1").text("올바른 이메일 형식입니다.").css("color", "blue");
				return true;		
			} else {
				$(".explain1").text("올바른 이메일 형식이 아닙니다.");
				$(".explain1").css("color", "red");
			}
		} else {
			$(".explain1").text("이메일을 입력하세요.");
			$(".explain1").css("color", "red");
		}
		return false;
    }

	
	//비밀번호 찾기 눌렀을때 true 값 체크 메서드
	function fncCheckAll() {
		
		var valid = false;
		
		if( checkEmail() && checkVaild ){
			valid = true;
		}
		
		return valid;
	}
	
	
	
	$(function() {
		
		//인증번호 발송 event
		$( "a[name='send_sms']" ).on("click" , events.click.phonBtn);
		
		//인증번호 확인 event
		$( "a[name='check_sms']" ).on("click" , events.click.vaildBtn);
		
		//비밀번호찾기 event
		$( "a[name='findPassword']" ).on("click" , events.click.findBtn);
		
		//비밀번호 1 = 2 확인
		$("#password2").on("blur" , events.change.pw);
	});
	
	
	
	var events = {
			
			click : {
				
				phonBtn : function() {
					alert("인증번호발송 클릭")
					if ( $("#phone").val() != "" ){
						fncAuth();
					}else{
						swal('핸드폰 번호를 입력해주세요!')
					}
					
				},
				
				vaildBtn : function() {
					alert("인증확인 클릭")
					fncKey();
					
				},
				
				findBtn : function() {
					alert("비밀번호찾기버튼 클릭")
					
					if( fncCheckAll() ){
						alert("2222")
						findPassword();
					}
					
				}
			},
			
			change : {
				
				pw : function() {
					checkPw("first");
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
	
	
	//인증확인 함수
	//test 용, 나중에 실제에서는 지우기
	
	var key ="123456";
	//var key = "";
	
	var vaildNum = $("#vaildNum").val();
	
	function fncKey() {	
		
		var vaildNum = $("#vaildNum").val();
		
		console.log("key : " +key)
		
		if( vaildNum == key ){
			
			$(".text_sms").text("인증번호가 맞습니다.");
			$(".text_sms").css("color", "blue");
			$("#vaildNum").attr('disabled', 'disabled')
			checkVaild = true;
			
		}else{
			
			$(".text_sms").text("인증번호가 맞지 않습니다.");
			$(".text_sms").css("color", "red");
		
		}		
	}		
	
	
	//폼 입력 완성-> 비밀번호 찾기 눌렀을때
	function findPassword() {
			
		console.log(checkVaild);
		console.log('잘접근!');
		
		var name = $("input[name=name]").val();
		var phone = $("input[name=phone]").val();
		var email = $("input[name=email]").val();
		
		console.log(name);
		console.log(phone);
		console.log(email);
	
		$.ajax({
					url : "/user/json/findPassword",
					method : "POST" ,
					data : JSON.stringify({
						name : name,
						phone : phone,
						email : email,
					}),
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						
						alert("성공!");
			    			
						if (JSONData.message == "no") {
							
							var str = '없는 회원정보입니다.';
							
							//console.log("없는 정보");
							$('.explain1').text("")
							$('.explain1').append(str).css("color", "red");
							
						} else if (JSONData.message == "ok") {
							
							var str = '새로운 비밀번호로 수정해주세요!';
							$('.explain1').text("")
							$('.explain1').text(str).css("color", "red");
							
							
							
							
							
						}
					}
		});
	}
	
	
	
	
	
	// 비밀번호, 새 비밀번호 확인
	 
	function checkPw(passwordType) {
				
		var passwordTarget = passwordType == "first" ? "password" : "password2";
		var passwordCompare = passwordType == "first" ? "password2" : "password";
		
		
		var pw = $("#" + passwordTarget).val();
		var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		
		console.log(pw);
		
		if(reg.test(pw)) {
			
			var pw2 = $("#" + passwordCompare).val();
			
			if( pw == pw2 ){
				
				$(".text_password").text("비밀번호가 일치합니다.");
				$(".text_password").css("color", "blue");
				
				return true;
				
			}else{
				
				$(".text_password").text("비밀번호가 일치하지 않습니다.");
				$(".text_password").css("color", "red");
			}
			
		}else {
			
			var str = '비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
			$('.text_password').text(str).css("color", "red");
			$("#password").focus();
		}
		return false;
			   
	}  
			
	
	
	//새로운 비번으로 수정
	 $( function() { 
			
			$("#changePw").click(function(){
				
					console.log('잘접근!');
					
					var name = $("input[name=name]").val();
					var phone = $("input[name=phone]").val();
					var email = $("input[name=email]").val();
					var password = $("#password").val();
					
					console.log(name);
					console.log(phone);
					console.log(email);
					console.log(password);
				
					$.ajax( 
							{
								url : "/user/json/changePassword",
								method : "POST" ,
								data : JSON.stringify({
									name : name,
									phone : phone,
									email : email,
									password : password,
								}),
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {
									
									alert("성공!");
						    			
									if (JSONData.message == "ok") {
										
										var str = '비밀번호가 성공적으로 변경되었습니다^ㅇ^';
										$('.text_password').text("")
										$('.explain2').text("")
										$('.explain2').append(str).css("color", "blue");
										
										swal(str);
										
									}
								}
					});
				});
			});

	
	

	</script>





</html>
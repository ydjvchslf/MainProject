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

<style>

	.bg-gradient-primary {
	    /* background-color: #F6EAC7; */
	    background-image: linear-gradient(
		180deg
		,#D8D8D8 10%,#F6EAC7 100%);
		    background-size: cover;
	}
	
	.btn-primary {
    color: #fff;
     background-color: #636363; 
     border-color: #636363; 
	}
	
	.btn-primary:hover {
    color: #fff;
    background-color: #323232;
    border-color: #323232;
	}
	
	a {
    color: #323232;
    text-decoration: none;
    background-color: transparent;
	}
	
	a:hover {
    color: #000000;
    text-decoration: underline;
    }
    
    
    .explain1, .explain2{
    font-size:12px; font-family:'돋움';
    }

</style>

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
                                        <h1 class="h4 text-gray-900 mb-2">Return Account!</h1>
                                        <br>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이름">
                                        </div>
                                        <div class="form-group" align="center">
										      	<span class="explain1"></span>
									    </div> 
                                        <div class="form-group">
                                            <input type="text" name="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이메일">
                                        </div>
                                        <div class="form-group" align="center">
										     <span class="explain2"></span>
									    </div> 
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="비밀번호">
                                            <span id="helpBlock" class="help-block">
										      	<strong class="explain3"></strong>
										     </span>    
                                        </div>
                                        <a href="#" name="returnUser" class="btn btn-primary btn-user btn-block">
                                            계정복구하기
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" name="login" href="/user/login">sLogin</a>
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
	
	
	$(function() {
		
		$( "input[name=name]" ).on("change" , function() {
			
			fncCheckName();
		});
		
		$( "input[name=email]" ).on("change" , function() {
			
			checkEmail();
		});
		
	});
	
	
	//이름 체크 함수
	function fncCheckName() {
		
		var name = $('input[name=name]').val();
		
	    if(name){
	    	var nameRegExp = /^[가-힣]{2,20}$/;
	    	
	    	if(nameRegExp.test(name)){
	    		$(".explain1").text("올바른 이름 형식입니다.").css("color", "blue");
	    		return true;
	    	}else{
	    		$(".explain1").text("올바른 이름 형식이 아닙니다").css("color", "red");
	    	}
	    } else{
	    	$(".explain1").text("이름을 필수로 입력하세요!");
			$(".explain1").css("color", "red");
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
				$(".explain2").text("올바른 이메일 형식입니다.").css("color", "blue");
				return true;		
			} else {
				$(".explain2").text("올바른 이메일 형식이 아닙니다.").css("color", "red");
			}
		} else {
			$(".explain2").text("이메일을 입력하세요.").css("color", "red");
		}
		return false;
    }



	$( function() {
		 
		$("a[name='returnUser']").on("click" , function() {
			
			if( fncCheckName() && checkEmail() ){
				
				
				var name = $("input[name=name]").val();
				var password = $("input[name=password]").val();
				var email = $("input[name=email]").val();
				
				console.log(name);
				console.log(password);
				console.log(email);
			
				$.ajax( 
						{
							url : "/user/json/returnUser",
							method : "POST" ,
							data : JSON.stringify({
								name : name,
								password: password,
								email: email,
							}),
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								
								//alert("성공!");

								if (JSONData.message == "no") {
									console.log("없는 회원 정보");
									$(".explain3").val("");
									$(".explain3").text("없는 회원 정보입니다.");
									$(".explain3").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
									
								} else if (JSONData.message == "ok") {
									console.log("복구 성공");
									$(".explain").val("");
									swal('계정을 복구하였습니다!^ㅇ^')
									
									$('form').each(function() {
						                this.reset();
						            });
									
									$(".explain1").empty();
									$(".explain2").empty();
									$(".explain3").empty();
									
								}else if (JSONData.message == "disable") {
									console.log("복구가능기간 초과");
									$(".explain3").val("");
									$(".explain3").text("복구가능 기간을 초과하였습니다.");
									$(".explain3").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
								}
								
							}
				});
				
			}
			
			
		});
	});
	

	
	
	
	
	
	
	

	</script>





</html>
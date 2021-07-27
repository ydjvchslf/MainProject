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
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Email?</h1>
                                        <br>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" name="name" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이름">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="phone" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="휴대전화번호">
                                            <span id="helpBlock" class="help-block">
										      	<strong class="text_findEmail"></strong>
										     </span>    
                                        </div>
                                        <a href="#" name="findEmail" class="btn btn-primary btn-user btn-block">
                                            Find Email
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="#">Create an Account!</a>
                                    </div>
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

</body>

<script type="text/javascript">

	$( function() {
		$('a[name=login]').on("click" , function() {
			self.location = "/user/login"
		});
	});
	
	
	$( function() { 
		
		$('a[name=findEmail]').click(function(){
			
				console.log('잘접근!');
				
				var name = $('input[name=name]').val();
				var phone = $('input[name=phone]').val();
				
				console.log(name);
				console.log(phone);
			
				$.ajax( 
						{
							url : "/user/json/findEmail",
							method : "POST" ,
							data : JSON.stringify({
								name : name,
								phone: phone,
							}),
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								
								//alert("성공!");
					    			
								if (JSONData.message == "no") {
									
									var str = '없는 회원정보입니다.';
									
									console.log("없는 정보");
									$('.text_email').text("");
									$('.text_email').append(str).css("color", "red");
									
								} else if (JSONData.message == "ok") {
									
									
									var dbEmail = JSONData.dbEmail;
									var str = '회원님의 email은 "'+dbEmail+'" 입니다!';
									
									//alert(dbEmail)
									$('.text_email').text("");
									$('.text_email').append(str).css("color", "red");
								}
								
							}
				});
				
			});
			
			
		});
	
	
	

	</script>





</html>
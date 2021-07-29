<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy Edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
		
		
		
	</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB;">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">

			<!-- 여기는 학원정보, 멀티정보등 이동 툴바 -->
	        <div class="container-fluid">
	        
	        	<jsp:include page="../common/toolbar2.jsp"></jsp:include>
	        	
	        	<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
	        	 
	        	<div class="row">
				<div class="col-sm-4">
					<form class="user">
                          <div class="form-group" align="center">
                          	<h4>계정연동하기</h4><br>
                             <div class="custom-control custom-checkbox small">
                                <span class="radio">
					                <label><input name="role" id="student" name="student" type="radio" class="radio-label" checked value="student">학생 </label>
								       <label><input name="role" id="parents" name="parents" type="radio" class="radio-label" value="parents"> 학부모 </label>
								       <label><input name="role" id="academy" name="academy" type="radio" class="radio-label" value="academy"> 학원</label>
					            </span>
	                         </div>
	                      </div>
	                      
	                      <div class="form-group">
                              <input type="hidden" name="email" value="${snsEmail}">
                          </div>
	                      <div class="row"><!-- 비밀번호 입력 -->
							<div class="col-4">
								<div class="form-group">		
									<input type="password" id="password" name="password" class="form-control form-control-user"
				                            placeholder="비밀번호" aria-describedby="emailHelp">
	                             </div>
	                        </div>
	                        <div class="col-6"><!-- 새비밀번호 -->
								<div class="form-group">		
									<input type="password" class="form-control form-control-user"
				                           placeholder="비밀번호확인" id="password2" name="password2" aria-describedby="emailHelp">
				                </div>
				            </div>
				            <div class="col-12">
					            <div class="form-group" align="center">
							     	<span class="text_password"></span>
								</div>
							</div>
				            
	                      </div>
                              <div class="form-group">
                                  <input type="text" id="name" name="name" class="form-control form-control-user"
                                     aria-describedby="emailHelp"
                                      placeholder="이름">
                              </div>
                              <div class="col-12">
					            <div class="form-group" align="center">
							     	<span class="text_name"></span>
								</div>
							</div>
	                        <div class="row"><!-- 휴대전화번호 입력 -->
								<div class="col-8">
									<div class="form-group">		
										<input type="text" id="phone" name="phone" class="form-control form-control-user"
					                           placeholder="휴대전화번호"  aria-describedby="emailHelp">
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
	                                          placeholder="인증번호입력" id="vaildNum" name="vaildNum" aria-describedby="emailHelp">
	                                 </div>
	                            </div>
	                             <div class="col-4"><!-- 인증번호 확인버튼 -->
								  <div class="form-group">		
									<div class="text-center">
				                        <a href="#" name="check_sms" class="btn btn-primary btn-user btn-block">
				                             확인</a>
				                    </div>
				                 </div>
				                  </div>
				                 <div class="col-12">
					            <div class="form-group" align="center">
							     	<span class="text_sms"></span>
								</div>
							</div>
				               
	                          </div>
	                               <a href="#" name="btnJoin" id="btnJoin" class="btn btn-primary btn-user btn-block">
	                                   계정연동하기
	                               </a>
	                      </form>
                  		</div>
                  		<div class="col-sm-8" align="center">
                  			<img src="/image/addsns.jpg" width="900">
                  		</div>
				<!-- form Start /////////////////////////////////////-->
				</div>
			</div>	
		</div><!-- container -->
     	
      </div>
      
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	<!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    
    
    
    
    <script>
    
  	//휴대전화번호 자동 대시(-)삽입
	$(document).on("keyup", "input[name=phone]", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	
        
    var emailDuplicationCheck = false;
	
	//가입버튼 눌렀을때 모든 true 값 체크 메서드
	function fncCheckAll() {
		
		var valid = false;
		
		if( fncCheckPw() && fncCheckName() && fncCheckPhone ){
			valid = true;
		}
		
		return valid;
	}
	

	
	$(function() {
		
		//가입 event 연결
		$( "#btnJoin" ).on("click" , events.click.signup);
		
		//취소 event form 초기화
		$('button[name="cancel"]').on("click" , events.click.cancel);
		
		//비밀번호1 변화 event
		$('#password').on("change", events.change.password);
		
		//비밀번호2 변화 event
		$('#password2').on("change", events.change.password2);
		
		//이름 변화 event
		$("#name").on("change", events.change.name);
		
		//이름 변화 event
		$("#phone").on("change", events.change.phone);
		
		//인증번호 발송 event
		$( "a[name='send_sms']" ).on("click" , events.click.phoneBtn);
		
		//인증번호 확인 event
		$( "a[name='check_sms']" ).on("click" , events.click.vaildBtn);
		
		
		
	});	
	
	
	
	
	var events = {
			
		click : {
			signup : function() {
				alert("11111")
				if(fncCheckAll()){
					alert("222222")
					fncAddUser();
				}
				
			},
			
			cancel : function() {
				$("form[name='signupForm']").trigger("reset");
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
			
			password : function(){
				fncCheckPw("first");
			},
			
			password2 : function(){
				fncCheckPw("second");
			},
			
			name : function(){
				fncCheckName();
			},
			
			phone : function(){
				fncCheckPhone();
			}
		}
	}
	
	
	
	
	
	
	//이름 체크 함수
    function fncCheckName() {
		
		var name = $("#name").val();
		
        if(name){
        	var nameRegExp = /^[가-힣]{2,20}$/;
        	
        	if(nameRegExp.test(name)){
        		$(".text_name").text("올바른 이름 형식입니다.");
				$(".text_name").css("color", "blue");
        		return true;
        	}else{
        		$(".text_name").text("올바른 이름 형식이 아닙니다");
				$(".text_name").css("color", "red");
        	}
        } else{
        	$(".text_name").text("이름을 필수로 입력하세요!");
			$(".text_name").css("color", "red");
        }
        return false; //확인이 완료되었을 때
    }
	
	
	
    

	//핸드폰 체크 함수 
    function fncCheckPhone(){
    	
    	var phone = $("#phone").val();
    	
    	if(phone){
    		
    		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    		
    		if(regExp.test(phone)){
    			
    			$(".text_phone").text("올바른 휴대폰 형식입니다.");
				$(".text_phone").css("color", "blue");
				
				return true;
				
    		}else{
    			
    			$(".text_phone").text("올바르지 않은 휴대폰 형식입니다.");
				$(".text_phone").css("color", "red");
    			
    		}
    	}else{
    		
    		$(".text_phone").text("휴대폰번호를 필수로 적어주세요!");
			$(".text_phone").css("color", "red");
    		
    	}
    	return false;
    }


	
	//회원가입 버튼 함수
	function fncAddUser() {
		alert("게정연동에 성공했습니다! 로그인 후 이용해주세요!")
		$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
	}
	

	

	
	
	
	 
	//이메일 중복확인 함수 ajax
	function fncCheckEmailDuplication() {

		var email = $("#email").val();
		
		$.ajax({
			url : "/user/json/checkEmail/"+email,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				
				console.log(JSONData)
				//alert(JSONData);

				if (JSONData.result == 1) {
					
					emailDuplicationCheck = false;
					$(".email_check").text("사용중인 이메일입니다.");
					$(".email_check").css("color", "red");
					
				} else {
					
					emailDuplicationCheck = true;
					$(".email_check").text("사용가능한 이메일입니다.");
					$(".email_check").css("color", "blue");
					
				}
			}
		});
			
	}
	
	
	
	//첫번째,두번째 비밀번호 조건
	
	function fncCheckPw(passwordType){
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
			
			var str = '비밀번호는 8자 이상이어야 하며, 숫자/영문/특수문자를 모두 포함해야 합니다.';
			$('.text_password').text(str).css("color", "red");
			$("#password").focus();
		}
		return false;
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
	
	
	
	
	
	
	
	
	
	
    
        
     </script>
    
  </body>
</html>
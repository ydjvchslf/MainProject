<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script>
	
	var checkVaild = false;
	
	$( function() {
		$("a[href='#' ]").on("click" , function() {
			self.location = "/user/login"
		});
	});
	
	
	//비밀번호 찾기 눌렀을때 true 값 체크 메서드
	function fncCheckAll() {
		
		var valid = false;
		
		if( checkVaildNumber() ){
			valid = true;
		}
		
		return valid;
	}
	
	
	
	$(function() {
		
		//인증번호 발송 event
		$( "button[name='send_sms']" ).on("click" , events.click.phonBtn);
		
		//인증번호 확인 event
		$( "button[name='check_sms']" ).on("click" , events.click.vaildBtn);
		
		//비밀번호찾기 event
		$( "button[name='findPassword']" ).on("click" , events.click.findBtn);
		
	});
	
	
	
	var events = {
			
			click : {
				
				phonBtn : function() {
					alert("인증번호발송 클릭")
					fncAuth();
					
				},
				
				vaildBtn : function() {
					alert("인증확인 클릭")
					fncKey();
					
				},
				
				findBtn : function() {
					alert("비밀번호찾기버튼 클릭")
					
					if( checkVaild ){
						alert("2222")
						findPassword();
					}
					
				}
			}
	}
	
	//휴대전화번호 자동 대시 입력
	$(document).on("keyup", "#phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	
	
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
			
			var name = $("#name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			
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
								
								console.log("없는 정보");
								$('.explain1').text("")
								$('.explain1').append(str).css("color", "red");
								
							} else if (JSONData.message == "ok") {
								
								$('button[name="changeButton"]').prop('disabled', false);
								$("input[type='password']").removeAttr('disabled');
								
								var displayText = '새로운 비밀번호로 수정해주세요!';
								$('.explain1').text("")
								$('.explain1').append(displayText).css("color", "blue");
							}
						}
			});
	}
			
			
	
	
	// 비밀번호, 새 비밀번호 확인
	 $(function(){

		 $('#password2').blur(function(){
				
			   if($('#password').val() != $('#password2').val()){
				   
			    		if ( $('#password2').val() != '' ) {
			    			
			    			$('.text_password').text("");
			    			
			    			var str = '비밀번호가 맞지 않습니다.';
			    			
			    			$('.text_password').append(str).css("color", "red");
				    	    $('#password2').val('');
				         	$('#password2').focus();	
						};
			    }else{
	    			$('.text_password').text("비밀번호가 맞습니다.").css("color", "blue");
			    }
			   
			})   
			
		});
	
	
	//새로운 비번으로 수정
	 $( function() { 
			
			$("button[name='changeButton']").click(function(){
				
					console.log('잘접근!');
					
					var name = $("#name").val();
					var phone = $("#phone").val();
					var email = $("#email").val();
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
										
										var str = '비밀번호가 잘 수정 되었습니다!';
										$('.text_password').text("")
										$('.explain2').text("")
										$('.explain2').append(str).css("color", "blue");
										
									}
								}
					});
				});
			});


	
	//cool sms
	
	
	
	
	
	
	

	</script>
    
</head>

<body>

		<div class="col-md-9">
				<div class="jumbotron">
			  		<p>Password 찾기 화면</p>
			  	</div>

		<form class="form-horizontal" name="form1">
			  <div class="form-group">
			    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="name" name="name" placeholder="name">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
			      <button name="send_sms" class="btn btn-primary" onclick="return false">인증번호발송</button>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="vaild" class="col-sm-offset-1 col-sm-3 control-label"></label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="vaildNum" name="vaildNum" placeholder="인증번호">
			      <button name="check_sms" class="btn btn-primary" onclick="return false">인증확인</button>
			    </div>
				  <span id="helpBlock" class="help-block">
					 <strong class="text_sms"></strong>
				  </span>
			  </div>
			  
			  <div class="form-group">
			    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="email" name="email" placeholder="email">
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" name="findPassword" class="btn btn-primary">비밀번호 찾기</button>
			    </div>
			  </div>
			  
			    <span id="helpBlock" class="help-block">
				   <strong class="explain1"></strong>
				 </span>
			  
		  </form> <!-- /////////////첫번째 폼 끝 -->
		  
		 
		  <form class="form-horizontal" name="form2">
			  <div class="form-group">
			    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">새 비밀번호</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호" disabled="disabled">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" disabled="disabled">
			     	<span id="helpBlock" class="help-block">
			      	  <strong class="text_password"></strong>
			      	</span>
			  	</div>
			  </div>
		  </form>
		  
		  <span id="helpBlock" class="help-block">
		   <strong class="explain2"></strong>
		 </span>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="changeButton" class="btn btn-primary" disabled="disabled">수정하기</button>
			  <a class="btn btn-primary btn" href="#" role="button">로그인하러가기</a>
		    </div>
		  </div>
			
		
		  
		</form>
	
</body>

</html>
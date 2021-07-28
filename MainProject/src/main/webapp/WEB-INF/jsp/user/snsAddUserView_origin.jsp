<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
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
			$( ".signup" ).on("click" , events.click.signup);
			
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
				
				var str = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				$('.text_password').text(str).css("color", "red");
				$("#password").focus();
			}
			return false;
		}
		

			
		 </script>	
		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">SNS 전용 회원가입 화면</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form name="signupForm" class="form-horizontal">
		
		    <div class="form-group">
			  <label for="role" class="col-sm-offset-1 col-sm-3 control-label">사용자역할</label>
			    <div class="col-sm-4">
				  	<label><input name="role" id="academy" name="academy" type="radio" value="academy">학원</label>
				  	<label><input name="role" id="student" name="student" type="radio" checked value="student">학생</label>
		            <label><input name="role" id="parents" name="parents" type="radio" value="parents">학부모</label>
	             </div>
		 	</div>
			<!-- SNS 회원가입 경로 : ${snsEmail} 값이 있음-->
	   		<div class="form-group">
			  	<div class="col-sm-4">
			  	   <input type="hidden" class="form-control" id="email" name="email" value="${snsEmail}">
			 			<span id="helpBlock" class="help-block">
			      			<strong class="email_check"></strong>
			      		</span>
			 	</div>
			</div>
		   
			<div class="form-group">
			   <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
			    </div>
			 </div>
		  
			 <div class="form-group">
			   <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
			     	<span id="helpBlock" class="help-block">
			      	  <strong class="text_password"></strong>
			      	</span>
			  	</div>
			  </div>
		  
			  <div class="form-group">
			    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="name" name="name" placeholder="회원이름">
				    <span id="helpBlock" class="help-block">
				      <strong class="text_name"></strong>
				    </span>
			    </div>
			  </div>
		  
			  <div class="form-group">
			    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호( - 포함)</label>
			     <div class="col-sm-4">
			      <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화번호">
				     <span id="helpBlock" class="help-block">
					      <strong class="text_phone"></strong>
					  </span>
			     </div> 
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" class="signup">가&nbsp;입</button>
			      <button type="button" name="cancel" class="cancel">취&nbsp;소</button>
			    </div>
			  </div>
		    
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
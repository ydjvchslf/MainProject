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
            margin-top: 10px;
        }
        
        html {
    	height: 100%;
		}
		
		body {
		    margin: 0;
		    height: 100%;
		    background: #f5f6f7;
		    font-family: Dotum,'돋움',Helvetica,sans-serif;
		}
		#logo {
		    width: 200px;
		    height: 80px;
		    cursor: pointer;
		}
		
		#header {
		    padding-top: 62px;
		    padding-bottom: 20px;
		    text-align: center;
		}
		#wrapper {
		    position: relative;
		    height: 100%;
		}
		
		#content {
		    position: absolute;
		    left: 50%;
		    transform: translate(-50%);
		    width: 460px;
		}
		
		/* 입력폼 */
		h3 {
		    margin: 19px 0 8px;
		    font-size: 14px;
		    font-weight: 700;
		}
		
		
		.box {
		    display: block;
		    width: 100%;
		    height: 51px;
		    border: solid 1px #dadada;
		    padding: 10px 14px 10px 14px;
		    box-sizing: border-box;
		    background: #fff;
		    position: relative;
		}
		
		.int {
		    display: block;
		    position: relative;
		    width: 100%;
		    height: 29px;
		    border: none;
		    background: #fff;
		    font-size: 15px;
		}
		
		input {
		    font-family: Dotum,'돋움',Helvetica,sans-serif;    
		}
		
		.box.int_id {
		    padding-right: 110px;
		}
		
		.box.int_pass {
		    padding-right: 40px;
		}
		
		.box.int_pass_check {
		    padding-right: 40px;
		}
		
		.step_url {
		    /*@naver.com*/
		    position: absolute;
		    top: 16px;
		    right: 13px;
		    font-size: 15px;
		    color: #8e8e8e;
		}
		
		select {
		    width: 100%;
		    height: 29px;
		    font-size: 15px;
		    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
		    background-size: 20px 8px;
		    -webkit-appearance: none;
		    display: inline-block;
		    text-align: start;
		    border: none;
		    cursor: default;
		    font-family: Dotum,'돋움',Helvetica,sans-serif;
		}
		
		/* 에러메세지 */
		
		.error_next_box {
		    margin-top: 9px;
		    font-size: 12px;
		    color: red;    
		    display: none;
		}
		
		#alertTxt {
		    position: absolute;
		    top: 19px;
		    right: 38px;
		    font-size: 12px;
		    color: red;
		    display: none;
		}
		
		/* 버튼 */
		
		.btn_area {
		    margin: 30px 0 91px;
		}
		
		#btnJoin, .cancel {
		    width: 100%;
		    padding: 10px 0 17px;
		    border: 0;
		    cursor: pointer;
		    color: #fff;
		    background-color: #0D85ED;
		    font-size: 20px;
		    font-weight: 400;
		    font-family: Dotum,'돋움',Helvetica,sans-serif;
		}
		
		.cancel {
			margin-top: 3px;
		}
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var emailDuplicationCheck = false;
		
		//가입버튼 눌렀을때 모든 true 값 체크 메서드
		function fncCheckAll() {
			
			var valid = false;
			
			if( checkEmail() && fncCheckPw() && fncCheckName() && fncCheckPhone ){
				valid = true;
			}
			
			return valid;
		}
		
	
		
		$(function() {
			
			//가입 event 연결
			$( ".signup" ).on("click" , events.click.signup);
			
			//취소 event form 초기화
			$('button[name="cancel"]').on("click" , events.click.cancel);
			
			//이메일칸 변화 event
			$("input[name='email']").on("change" , events.change.email);
			
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
					//alert("11111")
					if(fncCheckAll()){
						//alert("222222")
						fncAddUser();
					}
					
				},
				
				cancel : function() {
					$("form[name='signupForm']").trigger("reset");
				}
			},
		
			change : {
				
				email : function() {
					emailChange();
				},
				
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
		
		
		
		
		
		
		function emailChange(){
			
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			var email=$("input[name='email']").val();
			
			// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
			if (email) {
				
				if(emailRegExp.test(email)){
					fncCheckEmailDuplication();
				}else{
					$(".email_check").text("올바른 이메일 형식이 아닙니다.");
					$(".email_check").css("color", "red");
				}
			
			}else{
				$(".email_check").text("이메일을 입력하세요.");
				$(".email_check").css("color", "red");
			}
			
		}
		
		
	
		//이메일유효성 함수
	    function checkEmail() {
			
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			var email=$("input[name='email']").val();
			
			// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
			if (email) {
				
				if(emailRegExp.test(email)){
					
					if(emailDuplicationCheck){
						return true;
					} else {
						$(".email_check").text("중복된 이메일입니다.");
						$(".email_check").css("color", "red");
					}
				} else {
					$(".email_check").text("올바른 이메일 형식이 아닙니다.");
					$(".email_check").css("color", "red");
				}
			} else {
				$(".email_check").text("이메일을 입력하세요.");
				$(".email_check").css("color", "red");
			}
			return false;
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
				
				var str = '비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				$('.text_password').text(str).css("color", "red");
				$("#password").focus();
			}
			return false;
		}
		

			
		 </script>	
		
    
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		
		<!-- header -->
        <div id="header">
             <a href="logout"><img src="/image/buyedu.jpg" id="logo"></a>
        </div>


        <!-- wrapper -->
        <div id="wrapper">
		   <form name="signupForm">
            <!-- content-->
            <div id="content">

                <!-- 사용자역할 -->
                <div>
                    <h3 class="join_title">
                        <label for="id">사용자 역할</label>
                    </h3>
                    <span class="radio">
                        <label><input name="role" id="student" name="student" type="radio" class="radio-label" checked value="student">학생</label>
			            <label><input name="role" id="parents" name="parents" type="radio" class="radio-label" value="parents">학부모</label>
			            <label><input name="role" id="academy" name="academy" type="radio" class="radio-label" value="academy">학원</label>
                    </span>
                </div>
                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" name="email" class="int" maxlength="100" placeholder="ex) buyedu@co.kr">
                    </span>
                    <span class="email_check"></span>   
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="password" name="password" class="int" placeholder="비밀번호" maxlength="20">
                    </span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="password2" name="password2" class="int" placeholder="비밀번호 확인" maxlength="20">
                    </span>
                    <span class="text_password"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" placeholder="이름" class="int" maxlength="20">
                    </span>
                    <span class="text_name"></span>
                </div>


                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화( - 포함)</label></h3>
                    <span class="box int_mobile">
                        <input type="text" id="phone" name="phone" placeholder="휴대전화번호" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="text_phone"></span>    
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" class="signup" id="btnJoin">가&nbsp;입</button>
                    <button type="button" name="cancel" class="cancel">취&nbsp;소</button>
                </div>


            </div> 
            <!-- content-->
		  </form>
        </div> 
        <!-- wrapper -->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로그아웃')").on("click" , function() {
				self.location = "/user/logout"
			});
		});
		
		$( function() {
			//==> 추가된부분 : "getUser"  Event 연결
			$("a[href='#' ]:contains('내정보보기')").on("click" , function() {
				self.location = "/user/getUser?email=${user.email}"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('비밀번호변경')").on("click" , function() {
				self.location = "/user/updatePassword?email=${user.email}"
			});
		});
		
		$( function() {
			//==> 추가된부분 : "listUser"  Event 연결
			$("a[href='#' ]:contains('전체회원보기')").on("click" , function() {
				self.location = "/user/listUser"
			});
		});
		
		
		$( function() {
			
			fncCheckPassword();
			
		});
		
		
		//현재 비밀번호 맞는지 확인
		function fncCheckPassword() {
			 
			$("#password0").blur(function(){
				
				var email = $("#email").val();
				var password = $("#password0").val();
				
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
									$(".password_check").text("비밀번호가 맞습니다");
									$(".password_check").css("color", "blue");
								}
								
							}
				});
				
			});
		}
		
		
		
		
		 //비밀번호 확인
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
		 
		 
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button" ).on("click" , function() {
				fncUpdatePassword();
			});
		});	
		
		
		function fncUpdatePassword() {
					
				$("form").attr("method" , "POST").attr("action" , "/user/updatePassword").submit();
		}
	
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">buyEdu</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">로그아웃</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 내정보관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">내정보보기</a> <i class="glyphicon glyphicon-ok"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">비밀번호변경</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">내가다니는학원</a>
						 </li>
						  <li class="list-group-item">
						 	<a href="#">탈퇴하기</a>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 회원관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">전체회원보기</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">탈퇴회원보기</a>
						 </li>
					</ul>
		        </div>

				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<p>비밀번호변경 화면</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal">
		  <div class="form-group">
		  <input type="hidden" id="email" name="email" value="${user.email}">
		    <label for="current" class="col-sm-offset-1 col-sm-3 control-label">현재 비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password0" name="password0" placeholder="현재 비밀번호">
		       <span id="helpBlock" class="help-block">
		      	<strong class="password_check"></strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">새 비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호">
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
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">수정하기</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
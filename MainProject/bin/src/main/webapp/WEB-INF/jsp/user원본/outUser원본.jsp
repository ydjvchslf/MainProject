<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

	
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
		
		//============= "탈퇴하기"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				//console.log("잘나오니");
				fncOutUser();
			});
		});	
		
		
		 function fncOutUser() {
					
				$("form").attr("method" , "POST").attr("action" , "/user/outUser").submit();
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

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1>회원탈퇴화면</h1>
		
		<!-- form Start /////////////////////////////////////-->
		
		<form class="form-horizontal">
		  
		  <div class="form-group">
		    <label for="password0">비밀번호 확인</label>
		   	  <input type="hidden" id="email" name="email" value="${user.email}">
		      <input type="password" id="password0" name="password0" placeholder="현재비밀번호">
		      <strong class="password_check"></strong>
		    </br></br></br></br>
		    <label>탈퇴신청</label></br>
		      정말 탈퇴하시겠습니까? </br>
			  계정복구는 신청한 날짜로부터 30일 이내만 가능합니다. 
			 
		  <button type="button" class="btn btn-primary" id="out" name="out">탈퇴하기</button>
		  	
		  </div>
		 
		</form>
		 
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
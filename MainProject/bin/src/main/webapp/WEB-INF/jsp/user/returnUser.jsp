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
			$("a[href='#']").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		
		$( function() {
			 
			$("button[name='returnUser']").on("click" , function() {
				
				var name = $("#name").val();
				var password = $("#password").val();
				var email = $("#email").val();
				
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
									$(".explain").val("");
									$(".explain").text("없는 회원 정보입니다.");
									$(".explain").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
									
								} else if (JSONData.message == "ok") {
									console.log("복구 성공");
									$(".explain").val("");
									$(".explain").text("계정을 복구하였습니다.");
									$(".explain").css("color", "blue");
									
									$('form').each(function() {
						                this.reset();
						            });
									
								}else if (JSONData.message == "disable") {
									console.log("복구가능기간 초과");
									$(".explain").val("");
									$(".explain").text("복구가능 기간을 초과하였습니다.");
									$(".explain").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
								}
								
							}
				});
				
			});
		});
		
		
		
	
		
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
			  		<p>계정 복구 화면</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal" name="returnForm">
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		  	</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		  	  <span id="helpBlock" class="help-block">
		      	  <strong class="explain"></strong>
		      	</span>	
		  	</div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="returnUser" class="btn btn-primary">계정복구신청</button>
		      <a class="btn btn-primary btn" href="#" role="button">로그인하러가기</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->


</body>

</html>
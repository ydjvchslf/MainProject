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
				self.location = "/user/loginView"
			});
		});
		
		
		//인증하기 버튼 event
		 $(function() {
			 $(".addConnect").on("click" , function() {
				
				alert("잘접근?");
				var userNo = ${user.userNo};
				var academyCode = $("#academyCode").val();
				
				console.log("userNo=> "+userNo);
				console.log("academyCode=> "+academyCode);
					
					$.ajax( 
							{
								url : "/user/json/addConnect/${user.userNo}/"+academyCode,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {
									
									console.log(JSONData)
									//alert(JSONData);

									if (JSONData.message == "no") {
										$("#academyCode").val("");
										$(".connect_text").text("최대 인증 갯수(3개)를 초과했습니다.");
										$(".connect_text").css("color", "red");
										
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
			  		<p>내가다니는학원 보기 화면</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal">
		  
		  <div class="form-group">
		    <h4><span class="label label-primary">우리학원 인증하기</span></h4>
		    <div class="col-sm-4">
		      <input type="hidden" value="${user.userNo}">
		      <input type="text" class="form-control" id="academyCode" name="academyCode" placeholder="*학원코드 입력(인증 최대 3개)">
		    </div>
		    <input type="button" class="addConnect" value="인증하기">
		    <span id="helpBlock" class="help-block">
		      	<strong class="connect_text"></strong>
		     </span>
		  </div>
		  
		  <div class="form-group">
		    <h4><span class="label label-primary">인증 요청</span></h4>
		      <input type="text" id="acaName1" name="acaName1" placeholder="학원명1">
		      <input type="text" id="state1" name="state1" placeholder="인증상태1">
		      <input type="button" id="cancel1" name="cancel1" value="취소하기"></br>
		      
		      <input type="text" id="acaName2" name="acaName2" placeholder="학원명2">
		      <input type="text" id="state2" name="state2" placeholder="인증상태2">
		      <input type="button" id="cancel2" name="cancel2" value="취소하기"></br>
		      
		      <input type="text" id="acaName3" name="acaName3" placeholder="학원명3">
		      <input type="text" id="state3" name="state3" placeholder="인증상태3">
		      <input type="button" id="cancel3" name="cancel3" value="취소하기">
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
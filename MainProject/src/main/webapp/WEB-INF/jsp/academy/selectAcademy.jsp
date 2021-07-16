<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
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
		$("a[href='#' ]:contains('탈퇴하기')").on("click" , function() {
			self.location = "/user/outUser?email=${user.email}"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('학원 등록')").on("click" , function() {
			self.location = "/academy/addAcademyView1"
		});
	});
	
	
	
	
	<c:set var="i" value="0" />
		 <c:forEach var="academy" items="${list}">
					 <c:set var="i" value="${ i+1 }" />
			  
			  <li class="list-group-item">
				 	<a href="/academy/academyInfo?academyCode=${academy.academyCode}" >${academy.academyName}</a>
				 </li>
			
         </c:forEach>		
	
	$( function() {
		$("a[href='#' ]:contains('학원명')").on("click" , function() {
			self.location = "/academy/academyInfo?academyCode=${academy.academyCode}"
		});
	});
	
	
	
	</script>

<title>Academy main page</title>
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
						 	<a href="#">탈퇴하기</a>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 학원 프로필
         			</div>
					<ul class="list-group">
					<!-- userController 에서 count 를 넘겨줘야 ~~ -->
					<c:forEach var="academy" items="${count}">
					 <c:if test="${academy.count<=3}">
						<li class="list-group-item">
						 	<a href="#">학원 등록</a>
						 </li>
					</c:if>
					</c:forEach>
					
					<li class="list-group-item">
						 	<a href="#">학원 등록</a>
						 </li>
					
				<c:set var="i" value="0" />
				 <c:forEach var="academy" items="${list}">
							 <c:set var="i" value="${ i+1 }" />
					  
					  <li class="list-group-item">
						 	<a href="#" >${academy.academyName}</a>
						 </li>
					
		          </c:forEach>								 

					</ul>
		        </div>
		        


				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   

			<h1>학원 프로필을 선택 해 주세요.</h1> 		
			
			<a href="/main/academyMain">학원메인으로</a>
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>




</body>
</html>




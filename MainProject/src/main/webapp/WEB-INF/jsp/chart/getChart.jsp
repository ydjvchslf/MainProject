<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>차트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  </head>
  
   <style>
  @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body{
	font-family: ChosunGu;
	}
  </style>
  
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative;  padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">

					<div class="row" >  
						<div class="col-xs-12 col-md-12">
							<h1 id="titlef"><strong>Academy</strong></h1>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<div style="background-color:white;" class="container-fluid"><canvas id="academyChart" width="400" height="80"></canvas></div>
						</div>
		  			</div>
		  			
		  			<div class="row" style="margin-top: 50px">
						<div class="col-xs-12 col-md-6">
							<h1 id="titlef"><strong>User</strong></h1>
							<div style="background-color:white;" class="container-fluid"><canvas id="userChart" width="400" height="300"></canvas></div>
						</div>
						
						<div class="col-xs-12 col-md-6">
							<h1 id="titlef"><strong>Ect</strong></h1>
							<div style="background-color:white;" class="container-fluid"><canvas id="ectChart" width="400" height="300"></canvas></div>
						</div>
		  			</div>



				</div>
	      	</div>
      	
       </div>
      
	</div>
    <script>
		
			var user = new Array;
			var userData = new Array;
			
			var academy = new Array;
			var academyData = new Array;
			
		
			<c:forEach var="user" items="${userData}">
				user.push("${user.userRole}")
				userData.push("${user.userCnt}")
			</c:forEach>
				
			<c:forEach var="academy" items="${academyData}">
				academy.push("${academy.area}")
				academyData.push("${academy.academyCnt}")
			</c:forEach>
		
			var ctx = document.getElementById('userChart');
			var config = {
					type : 'doughnut',
					data: {
						datasets: [{
							data: userData,
							backgroundColor:[
								'rgb(241, 69, 37)','rgb(237, 123, 19)',"yellow"
							],
							label:'유저 현황'
						}],
						labels: user
					},
					options: {
						responsive: false,
					}
			};
			var myChart = new Chart(ctx, config);
			
			var ctx = document.getElementById('academyChart');
			var myChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: academy,
					datasets: [{
					    label: '학원 수',
					    data: academyData,
					    backgroundColor:'rgb(237, 182, 19)',
					    borderColor: 'rgb(237, 123, 19)',
					    borderWidth: 2
					  }]
				},
				
			});
			
			var ctx = document.getElementById('ectChart');
			var config = {
					type : 'bar',
					data: {
						datasets: [{
							label:'동록 수',
							data: [${board},${review},${edu}],
							backgroundColor:'rgba(255, 205, 86, 0.2)',
						    borderColor: 'rgb(255, 205, 86)',
						    borderWidth: 2
						}],
						labels: ['Board','Review','Edu']
					},
					options: {
						responsive: false,
					}
			};
			var myChart = new Chart(ctx, config);
			
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
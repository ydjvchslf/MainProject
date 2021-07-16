<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style >
		body {padding-top : 70px;}
	</style>

</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/">메인으로 가기</a>
			
			<div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div>
			
			<div class="collapsed navbar-collapse" id="target">
				<ul class="nav navbar-nav">
			         <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HTML5 <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">WebUI</a></li>
			            <li><a href="#">W3C</a></li>
			            <li class="divider"></li>
			            <li><a href="#">Static Contents</a></li>
			          </ul>
			        </li>
			        <li><a href="#">JavaScript </a></li>
			        <li><a href="#">CSS </a></li>
			    </ul>
			    
			    <form class="navbar-form navbar-right">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search">
			        </div>
			        <button type="submit" class="btn btn-default">Submit</button>
			    </form>
			    
			    <ul class="nav navbar-nav navbar-right">
			        <li><a href="#">J2SE</a></li>
			        <li><a href="#">API </a></li>
			    </ul>
			</div>
			

		</div>
	</div>

</body>
</html>
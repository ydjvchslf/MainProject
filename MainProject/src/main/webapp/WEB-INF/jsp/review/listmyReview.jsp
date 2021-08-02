<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>학원 검색</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<style>
			body{
				overflow-x:hidden; overflow-y:visible;
				font-family: 'ChosunGu';
			}
	
		    #title{
				vertical-align : top;
				font-size : 30px;
				font-family : TmonMonsori;
			}
</style>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	         <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div id="title" class="row" ><h2>&nbsp;&nbsp;&nbsp;내 후기 보기</div></h2><br>
				
					<form>	
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<table class="table">
							 <thead>
							   <tr>
							      <th>후기 제목</th>
							      <th>후기 내용</th>
							      <th>작성자</th>
							      <th>작성 학원</th>
							      <th>작성일자</th>
							   </tr>
							 </thead>
							 
							 <tbody>
							 
							 <c:forEach var="review" items="${reviewList}">
							 
							 	<tr>
							      <td>${review.reviewTitle}</td>
							      <td>${review.reviewContent}</td>
							      <td>${user.email}</td>
							      <th><a href="/review/listReview?academyCode=${review.academyCode}">학원 가기</a></th>
							      <td>${review.reviewDate}</td>
							   </tr>
							 
							 </c:forEach>

							 </tbody> 
							
						</table>
					</form>
				
						
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
		
	$(document).ready(function(){
	});	
		
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
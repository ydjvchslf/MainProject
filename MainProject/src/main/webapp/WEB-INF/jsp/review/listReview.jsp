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

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">

					<div class="row">
						<div class="col-md-12">
						<c:if test="${count == 0 && state == '1'}">
							<button type="button" id="addReview" class="btn btn-primary" onclick="addReview()">작성</button>
						</c:if>
						</div>	
					</div>
					
					<div class="row">	
					<div class="col-md-12">
					<form>	
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<table class="table">
							 <thead>
							   <tr>
							      <th>후기 제목</th>
							      <th>작성자</th>
							      <th>작성일자</th>
							   </tr>
							 </thead>
							 
							 <tbody>
							 
							 <c:forEach var="review" items="${listR}">
							 
							 	<tr>
							      <td>${review.reviewTitle}</td>
							      <td>${review.reviewWriter.email}</td>
							      <td>${review.reviewDate}</td>
							   </tr>
							 
							 </c:forEach>

							 </tbody> 
							
						</table>
					</form>
					</div>
					</div>
						
						<jsp:include page="../common/pageNavigator_new.jsp"></jsp:include>
						
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
		function fncGetList(currentPage){
			$("#currentPage").val(currentPage)	
			$("form").attr("method","post").attr("action","/review/listReview?academyCode=${academy.academyCode}").submit()	
		}
		
		function addReview(){
			self.location = "/review/testAddReview?userNo=${user.userNo}&academyCode=${academy.academyCode}"
		}
		
		
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
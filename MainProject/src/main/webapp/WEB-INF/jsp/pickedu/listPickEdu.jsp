w<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
  <head>
  	<title>Buy!edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>
	
<style>
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #F8B739;
    border-color: #F8B739;
    }
    
    @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body{
	overflow-x:hidden; overflow-y:visible;
	font-family: 'ChosunGu';
	}
	
	</style>
	
	<script type="text/javascript">
	
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/pickedu/listPickEdu").submit();
		};
		
		
		$(function() {
			
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
			 
		});
		
		$(function() {
			
			$( "input:radio" ).on("click" , function() {

				fncGetList(1);
			});
			 
		});
		
		$( function() {
		      
		      $( "td:nth-child(3)" ).on("click" , function() {

		    	 var eduNo = $(this).find('input').val()
		    	 var academyCode = $(this).find('input').val()
		    	 
		         self.location ="/edu/getEdu?eduNo="+eduNo+"&academyCode="+academyCode;
		      });
		      
		      $( "td:nth-child(3)" ).css("color" , "#FFAB00");
		      
		      $( ".btn:contains('????')" ).on("click" , function() {
					 
					var eduNo = $(this).find('input').val()
					 
					$.ajax({
					    url : '/pickedu/json/deletePickEdu/'+eduNo ,
					    method : 'POST',
				 	    dataType : "json",
					    headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json; charset:UTF-8"
						},
					    success : function(data, status){

					    	alert("???????????? ??????????????.")
					    	
					    	self.location = "/pickedu/listPickEdu?userNo=${user.userNo}"

					    }
					});
			  })
		      
		});
	
  </script>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- ???? ???? ?????? ?????? -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
							<div class="col-md-12" id="titlef" align="center">
		    					<h1>???? ????</h1>
		    				</div>
								<div>&nbsp;</div>
								<div>&nbsp;</div>
						<div class="col-md-6 text-left">
					    	<p>
					    	<c:if test="${user.role == 'academy'}">
					    		<button type="button" class="btn btn-primary">????</button>
					    	</c:if>
					    	</p>
						</div>
						
					</div>
					
					<div class="row">
						
						<table class="table table-hover table-striped" >
      
					        <thead>
					          <tr>
					            <th align="center">No</th>
					            <th align="left">??????</th>
					            <th align="left">??????</th>
					            <th align="left">???? ??????</th>
					            <th align="left">???? ??????</th>
					            <th align="left">???? ????</th>
					            <th align="left">???? ????</th>
					            <th align="left">??????</th>
					            <th align="left"></th>
					          </tr>
					        </thead>
					       
							<tbody>
							
							  <c:set var="i" value="0" />
							  <c:forEach var="pickedu" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
								  <td align="center">${ i }</td>
								  <td align="left">${pickedu.pickAcademy.academyName}</td>
								  <td align="left"><strong>${pickedu.eduName} 
								  <input type="hidden" name="eduNo" id="eduNo" value="${pickedu.eduNo}"/>
								  <input type="hidden" name="academyCode" id="academyCode" value="${pickedu.pickAcademy.academyCode}"/>
								  </strong></td>
								  <td align="left">${pickedu.eduStartDate}</td>
								  <td align="left">${pickedu.eduEndDate}</td>
								  <td align="left">${pickedu.eduGrade}</td>
								  <td align="left">${pickedu.eduSubject}</td>
								  <td align="left">
								  	<fmt:formatNumber value="${pickedu.eduPrice}" pattern="#,###" />??</td>
								  <td align="center"> <button type="button" class="btn btn-primary">???? <input type="hidden" name="eduNo" id="eduNo" value="${pickedu.eduNo}"/> </button></td>
								</tr>
					          </c:forEach>
					        
					        </tbody>
					      
					      </table>
					</div>
					
					<div class="row">
						<jsp:include page="../common/pageNavigator_new.jsp"/>
					</div>
					
				</div>
	      	</div>
	      	
	      	<!-- footer ???? -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
      		
       </div>
      	
	</div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
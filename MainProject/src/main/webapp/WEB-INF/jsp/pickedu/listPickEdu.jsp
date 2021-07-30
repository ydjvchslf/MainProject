<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>수업등록</title>
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
	</style>
	
	<script type="text/javascript">
	
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
		
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
		         self.location ="/edu/getEdu?eduNo="+eduNo;
		      });
		      
		      $( "td:nth-child(3)" ).css("color" , "skyblue");
		      
		      $( ".btn:contains('삭제')" ).on("click" , function() {
					 
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

					    	alert("관심수업에서 삭제되었습니다.")
					    }
					});
			  })
		      
		});
	
  </script>
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
					
					<div class="row">
					
						<div class="col-md-6 text-left">
							<p style="font-size:15px; color:black; font-family:'돋움';">
					    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
					    	</p>
					    	<p>
					    	<c:if test="${user.role == 'academy'}">
					    		<button type="button" class="btn btn-primary">등록</button>
					    	</c:if>
					    	</p>
						</div>
						
					</div>
					
					<div class="row">
						
						<table class="table table-hover table-striped" >
      
					        <thead>
					          <tr>
					            <th align="center">No</th>
					            <th align="left">학원명</th>
					            <th align="left">수업명</th>
					            <th align="left">수업 시작일</th>
					            <th align="left">수업 종료일</th>
					            <th align="left">대상 학년</th>
					            <th align="left">대상 과목</th>
					            <th align="left">수강료</th>
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
								  <td align="left">${pickedu.eduName} <input type="hidden" name="eduNo" id="eduNo" value="${pickedu.eduNo}"/> </td>
								  <td align="left">${pickedu.eduStartDate}</td>
								  <td align="left">${pickedu.eduEndDate}</td>
								  <td align="left">${pickedu.eduGrade}</td>
								  <td align="left">${pickedu.eduSubject}</td>
								  <td align="left">${pickedu.eduPrice}</td>
								  <td align="center"> <button type="button" class="btn btn-primary">삭제 <input type="hidden" name="eduNo" id="eduNo" value="${pickedu.eduNo}"/> </button></td>
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
      		
       </div>
      	
	</div>

    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
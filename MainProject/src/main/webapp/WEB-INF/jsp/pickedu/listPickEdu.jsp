<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy Edu</title>
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
 		body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 70px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
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
		      
		      $( "td:nth-child(2)" ).on("click" , function() {
	
		    	 var eduNo = $(this).find('input').val()
		         self.location ="/edu/getEdu?eduNo="+eduNo;
		         
		      });
		      
		      $( "td:nth-child(2)" ).css("color" , "red");
		      
		});
	
	</script>

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
		
		<div id="header"><h1 class="mt-4">${edu.academy.academyName}</h1></div>
		
		<!-- 여기는 학원정보, 멀티정보등 이동 툴바 -->
		<jsp:include page="../common/toolbar.jsp"></jsp:include>
	        
	        <div class="container">
				<!-- 내용 때려 박으삼 이쁘게 -->
				
				<div class="page-header text-info">
			       <h3>관심수업목록</h3>
			    </div>
			    
			    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
			    <div class="row">
			    
				    <div class="col-md-6 text-left">
				    	<p class="text-primary">
				    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				    	</p>
				    </div>
				    
				    </br></br>
				    
				    <div class="col-md-6 text-right">
					    <form class="form-inline" name="detailForm">
					    
						  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						  <input type="hidden" id="currentPage" name="currentPage" value=""/>
						  
						</form>
			    	</div>
			    	
				</div>
				<!-- table 위쪽 검색 Start /////////////////////////////////////-->
				
				
		      <!--  table Start /////////////////////////////////////-->
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
		          </tr>
		        </thead>
		       
				<tbody>
				
				  <c:set var="i" value="0" />
				  <c:forEach var="pickedu" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center">${ i }</td>
					  <td align="left">${pickedu.pickAcademy.academyName} <input type="hidden" name="eduNo" id="eduNo" value="${pickedu.eduNo}"/> </td>
					  <td align="left">${pickedu.eduName}</td>
					  <td align="left">${pickedu.eduStartDate}</td>
					  <td align="left">${pickedu.eduEndDate}</td>
					  <td align="left">${pickedu.eduGrade}</td>
					  <td align="left">${pickedu.eduSubject}</td>
					  <td align="left">${pickedu.eduPrice}</td>
					</tr>
		          </c:forEach>
		        
		        </tbody>
		      
		      </table>
		      
		   </div>
		   
		   <!-- PageNavigation Start... -->
		   <jsp:include page="../common/pageNavigator_new.jsp"/>
		   <!-- PageNavigation End... -->
      
	</div>

    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
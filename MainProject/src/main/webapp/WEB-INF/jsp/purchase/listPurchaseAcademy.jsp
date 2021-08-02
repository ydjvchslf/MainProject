<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		#panel-color{
			background-color: black !important;
		}
		
		@font-face {
		    font-family: 'TmonMonsori';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
	</style>
	
	<script type="text/javascript">
	
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
		
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/purchaseedu/listPurchaseEdu").submit();
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
		      
		      $( "td:nth-child(2)" ).css("color" , "#FFAB00");
		      
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
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="col-md-12">
						<div id="titlef" class="col-md-12" style="font-size: 38px;" align="center">
			    			${academy.academyName} 
			    		</div>
			    		
			    		<!-- 중간 소제목 시작-->
						<div class="col-sm-12" align="center">
							<h4><strong><span>수업결제목록</span></strong></h4>
						</div><br>
						<br>
						<!-- 중간 소제목 끝-->
						
					  <c:if test="${empty purchaseList}">
				        <div class="col-md-12">
						  <hr>
					   </div>
					  </c:if>
			    		
					</div>
				
				    
				    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
				    <div class="row">
					    
					    <div class="col-md-6 text-right">
						    <form class="form-inline" name="detailForm">
						    
							  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
							  <input type="hidden" id="currentPage" name="currentPage" value=""/>
							  
							</form>
				    	</div>
				    	
					</div>
					<!-- table 위쪽 검색 Start /////////////////////////////////////-->
					
					
			      <!--  table Start /////////////////////////////////////-->
			      
			      <c:if test="${empty purchaseList}">
			      	<div class="col-sm" align="center">
						<span><img src="/image/nothing.png"></span>
					</div>
				  </c:if>
				  
				  <c:if test="${!empty purchaseList}">
			      <table class="table table-hover table-striped" >
			      
			        <thead>
			          <tr>
			            <th align="center">No</th>
			            <th align="left">수업명</th>
			            <th align="left">구매자 이름</th>
			            <th align="left">구매자 전화번호</th>
			            <th align="left">구매일자</th>
			            <th align="left">수강료</th>
			            <th align="left">결제상태</th>
			          </tr>
			        </thead>
			       
					<tbody>
					
					  <c:set var="i" value="0" />
					  <c:forEach var="purchase" items="${purchaseList}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
						  <td align="center">${ i }</td>
						  <td align="left"><strong>${purchase.purchaseEdu.eduName} <input type="hidden" name="eduNo" id="eduNo" value="${purchase.purchaseEdu.eduNo}"/></strong> </td>
						  <td align="left">${purchase.buyer.name}</td>
						  <td align="left">${purchase.buyer.phone}</td>
						  <td align="left">${purchase.payDate}</td>
						  <td align="left">${purchase.purchaseEdu.eduPrice}</td>
						  <td align="left">
						  <c:choose>
								  <c:when test= "${purchase.payState == '0' }">
									구매완료
								  </c:when>
								  <c:when test= "${purchase.payState == '1' }">
									취소완료
								  </c:when>
						  </c:choose>
						  </td>
						</tr>
			          </c:forEach>
			        
			        </tbody>
			      
			      </table>
			      </c:if>
			      
			      <hr>
			      
			      	<div class="row">
						<jsp:include page="../common/pageNavigator_new.jsp"/>
					</div>
			      
					</div>
					
				</div>
	      	</div>
      	
       </div>
      	

    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
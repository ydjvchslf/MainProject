<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	
	   
    @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }
   
   body{
   font-family: ChosunGu;
   }
   
   .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #FFAB00;
    border: 1px solid #FFAB00;
    
   }
	
	
   </style>
	
	<script type="text/javascript">
	
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
			
		function fncGetList(currentPage) {
			
			var acaCode = "${ academy.academyCode }"
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/edu/listEdu?acaCode="+acaCode).submit();
		};
		
		
		$(function() {
			
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncGetList(1);
			});
			
			$( "input:radio" ).on("click" , function() {
				
				fncGetList(1);
			});
			 
		});
		
		$( function() {
		      
	        $( ".btn:contains('삭제')" ).on("click" , function() {
				 
				var eduNo = $(this).find('#eduNo').val()
				var eduState = $(this).find('#eduState').val()
				var acaCode = "${ academy.academyCode }"
				 
				if( eduState == 1 ) {
					
				 	alert ("판매중인 수업은 삭제가 불가능합니다.")
				} else if( eduState == 2 ) {
					alert ("판매완료된 수업은 삭제가 불가능합니다.")
				} else if( eduState == 0 ) {
					$.ajax({
						
					    url : '/edu/json/deleteEdu/'+eduNo ,
					    method : 'POST',
					    dataType : "json",
				     	headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json; charset:UTF-8"
						},
					    success : function(data, status){

					    	alert("수업이 삭제되었습니다.")
					    	
					    	self.location = "/edu/listEdu?acaCode="+acaCode;
					    	
					    }
						
					});
				 }
				 
			})
				
			$( ".btn:contains('등록')").on("click", function() {
				
				var academyCode = "${ academy.academyCode }"
				
				self.location = "/edu/addEdu?academyCode="+academyCode;
				
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
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
					
						<div class="col-md-12">
							<div id="titlef" class="col-md-12" style="font-size: 38px;" align="center">
				    			${academy.academyName} 
				    		</div>
				    		
				    		<!-- 중간 소제목 시작-->
							<div class="col-sm-12" align="center">
								<h4><strong><span>Buy!edu</span></strong></h4>
							</div><br>
							<br>
							<!-- 중간 소제목 끝-->
						</div>
						
						<div class="col-md-12 text-right">
							<form class="form-inline" name="detailForm">
								
								<c:if test="${user.role eq 'academy'}">
									<div class="col-md-12 text-right">
								    	<p>
								    		<span><strong> 판매상태 </strong></span>
								    		<input type="radio" name="searchEduState" id="searchEduState" value="0" > 판매대기중
											<input type="radio" name="searchEduState" id="searchEduState" value="1" > 판매중
								    		<input type="radio" name="searchEduState" id="searchEduState" value="2" > 판매완료
								    	</p>
									</div>
								</c:if>
								 <!-- 수업등록하기 버튼 -->
								  <div class="col-md-6" align="left">
								    	<c:if test="${user.role == 'academy'}">
								    	<button type="button" class="btn btn-primary">수업등록</button>&nbsp;&nbsp;&nbsp;&nbsp;
								    	</c:if>
								  </div>
								  

								<div class="col-md-6 text-right">
								  <div class="form-group">
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>수업명</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>수강료</option>
									</select>
								  </div>
								  
								  <div class="form-group">
								    <label class="sr-only" for="searchKeyword">검색어</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
								    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  </div>
								  
								  <button type="button" class="btn btn-primary">검색</button>
								 
								
								</div>
								
								  <c:if test="${empty eduList}">
							        <hr>
								  </c:if>
								  
								  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
								
								<hr> <!-- 썸네일 윗부분 hr -->
									<br><br>
						</div>
					
					</div>
					
					<div class="row">
					
						<c:if test="${empty eduList}">
							<div class="col-sm-12" align="center">
								<img src="/image/nothing.png"><br>
							</div>
						</c:if>
						
						
						<table class="table table-hover table-striped" >
					      	  	<c:if test="${user.role == 'student' or user.role == 'parents'}">
							      <c:forEach var="edu" items="${eduList}" >
							      	<c:if test="${edu.eduState == '1' }">
							        <div class="col-sm-6 col-md-4">
							          <div class="thumbnail">
							            <img src="/image/BBBB.png" >
							            <div class="caption" align="center">
							              <h2 id="titlef">${ edu.academy.academyName } <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/> </h2>
							              <h5 id="titlef">${ edu.eduName }</h5>
							              <span><img src="/image/won.jpg" width="22px"><strong><fmt:formatNumber value="${edu.eduPrice}" pattern="#,###" />원</strong></span>
							              <p>남은자리 ${edu.eduRest}</p>
							              <p>
							              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&academyCode=${edu.academy.academyCode}" class="btn btn-primary" role="button">상세보기</a> 
							            </div>
							          </div>
							        </div>
							        </c:if>
							      </c:forEach>
							    </c:if>
							    
							    <c:if test="${user.role == 'academy' }">
							    <c:forEach var="edu" items="${eduList}" >
							        <div class="col-sm-6 col-md-4">
							          <div class="thumbnail">
							            <img src="/image/BBBB.png" width="200" height="auto">
							            <div class="caption" align="center">
							              <h2 id="titlef">${ edu.academy.academyName }
								              <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/>
							              </h2>
							              <h4 id="titlef">${ edu.eduName }</h4>
							              <p> <img src="/image/won.jpg" width="22px"><strong><fmt:formatNumber value="${edu.eduPrice}" pattern="#,###" />원</strong></p>
							              <p style="color: red"><strong>남은자리 ${edu.eduRest}</strong></p>
							              <p>
							              	<c:if test="${ edu.eduState == '0' }">
							              	판매 대기중
							              	</c:if>
							              	<c:if test="${ edu.eduState == '1' }">
							              	판매중
							              	</c:if>
							              	<c:if test="${ edu.eduState == '2' }">
							              	<span style="color:blue">판매완료</span>
							              	</c:if>
							              </p>
							              <p>
							              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&academyCode=${edu.academy.academyCode}" class="btn btn-primary" role="button">상세보기</a>
										  <c:if test="${ user.role == 'academy' }">
											  <button type="button" class="btn btn-default">삭제
											  	<input type="hidden" name="eduState" id="eduState" value="${edu.eduState}"/>
											  	<input type="hidden" name="eduNo" id="eduNo" value="${edu.eduNo}"/>
											  </button>
										  </c:if>
							            </div>
							          </div>
							        </div>
							     </c:forEach>
							     </c:if>
				    	</table>
				    	
				    	<div class="col-md-12 text-left">
							<hr>
						</div>
				    
				    	
					</div>
					
					<div class="row">
						<jsp:include page="../common/pageNavigator_new.jsp"/>
					</div>
					
				</div>
				
	      	</div>
	      	
	      <!-- footer 자리 -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
      		
       </div>
      	
	</div>

    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
  
  
  <style>
  
  .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #FFAB00;
    border: 1px solid #FFAB00;
    
   }
  
  </style>
</html>
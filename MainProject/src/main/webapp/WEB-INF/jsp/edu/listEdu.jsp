<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

	
<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
		
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/edu/listEdu").submit();
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
		      
		      $( ".btn:contains('수업삭제')" ).on("click" , function() {
					 
					 var eduNo = $(this).find('input').val()
					 var eduState = $(this).find('#eduState').val()
					 
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
						    }
						});
					 }
					 
				})
		      
		});
		
		
		
	</script>
	
</head>

<body>
	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>수업목록</h3>
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
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <th align="left">
          				<input type="radio" name="searchEduState" value="0"> 판매 대기중
			    		<input type="radio" name="searchEduState" value="1"> 판매중
			    		<input type="radio" name="searchEduState" value="2"> 판매완료
				  </th>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
      
	      <div class="row">
	      
	      	  <c:if test="${user.role == 'student' or user.role == 'parents' }">
			      <c:if test="${edu.eduState == '1' }">
		      		<c:forEach var="edu" items="${list}" >
			        <div class="col-sm-6 col-md-4">
			          <div class="thumbnail">
			            <img src="/image/BBBB.png" width="200" height="auto">
			            <div class="caption" align="center">
			              <h2>${ edu.academy.academyName } <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/> </h2>
			              <h5>${ edu.eduName }</h5>
			              <p>&#8361; ${ edu.eduPrice } 원</p>
			              <p>
			              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&currentPage=${search.currentPage}" class="btn btn-primary" role="button">상세보기</a> 
			            </div>
			          </div>
			        </div>
			       </c:forEach>
			      </c:if>
			    </c:if>
			    <c:forEach var="edu" items="${list}" >
			        <div class="col-sm-6 col-md-4">
			          <div class="thumbnail">
			            <img src="/image/BBBB.png" width="200" height="auto">
			            <div class="caption" align="center">
			              <h2>${ edu.academy.academyName } <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/> </h2>
			              <h5>${ edu.eduName }</h5>
			              <p>&#8361; ${ edu.eduPrice } 원</p>
			              <p>
			              	<c:if test="${ edu.eduState == '0' }">
			              	판매 대기중
			              	</c:if>
			              	<c:if test="${ edu.eduState == '1' }">
			              	판매중
			              	</c:if>
			              	<c:if test="${ edu.eduState == '2' }">
			              	판매완료
			              	</c:if>
			              </p>
			              <p>
			              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&currentPage=${search.currentPage}" class="btn btn-primary" role="button">상세보기</a> 
			            </div>
			          </div>
			        </div>
			       </c:forEach>
		  </div>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
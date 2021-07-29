
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<title>listReview.jsp</title>
<head>
	<meta charset="UTF-8">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/style.css" rel="stylesheet">  
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		
			function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var academyCode=$("input[name='academyCode']").val();
			$("form").attr("method" , "POST").attr("action" , "/review/listReview?academyCode="+academyCode).submit();
			//$("form").submit();
		}
		
		
		
		$(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('글쓰기')" ).on("click" , function() {
				fncAddReviewView();
			});
		});	
		
		
		
		function fncAddReviewView(){
			
			$("form").attr("method" , "POST").attr("action" , "/review/addReviewView").submit();
		}
	</script>

	</head>
	
  <body>
  
  
	
	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> -->
	
	<!-- �޴� -->
	<!-- <form>
	<input type="hidden" name="menu" value="${menu}" />
	-->
	<div class="container">
	
		<div class="page-header text-default">
		<br/><br/><br/>
		
		
							<h3>후기 게시판 </h3> 
						
					


					
	    </div>
	    

	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">

	    
		    <div class="col-md-6 text-left">
		    			 
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 페이지, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" >
			    <input type="hidden" name="searchCategory" id="searchCategory" value="0" />
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="width:120px;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
<br/><br/>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->

		
	
      <!--  table Start /////////////////////////////////////-->
      <div class="row">
<table>
       
   
       
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="review" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
	
			  
			  
			 				 <div class="card black mb-4">
                                <div class="card-header py-3">
                                    <h3 class="m-0 font-weight-bold text-primary">${review.reviewTitle }</h3>
                                    <h5> 작성자 ${review.reviewWriter.email }       ${review.reviewDate }</h5>
                      
                                </div>
                                <div class="card-body">
                                    ${review.reviewContent }
                                </div>
                            </div>
                            
                            
		

			  
		</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
	 
	 유저번호 ${user.userNo} 
	 학원코드 ${academyCode }
	리뷰내용 ${reivewContent }
	리뷰내용 ${review.reviewContent }
	 내용 ${connect }
	 리뷰넘버 ${review.reviewNo}
	 
	  
	 <input type="hidden" name="academyCode" value="${academyCode}" /> 
	  <div class="form-group">
	  	<c:if test="${user.role eq 'student' && connect == '1' }">
		    <div class="col-sm-offset-11  col-sm-1 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		      <a href="/review/addReviewView?academyCode=${academyCode }" >글쓰기</a></button>
		</c:if>	 
		
		<c:if test="${user.role eq 'parents' && connect == '1' }">
		    <div class="col-sm-offset-11  col-sm-1 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		      <a href="/review/addReviewView?academyCode=${academyCode }" >글쓰기</a></button>
		</c:if>
	</div>

 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
<!--  </form> -->
  
  
</body>
</html>
    

<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<title>JENNYSHOP</title>
<head>
	<meta charset="UTF-8">
	
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
   <link href="/css/style.css" rel="stylesheet">  
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		
			function fncGetReviewList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/review/listReview").submit();
			//$("form").submit();
		}
		
		$(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('글쓰기')" ).on("click" , function() {
				fncAddReviewView();
			});
		});	
		
		function fncAddReviewView(){
			
			$("form").attr("method" , "GET").attr("action" , "/review/addReviewView").submit();
		}
	</script>

	</head>
	
  <body>
	
	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> -->
	
	<!-- 메뉴 -->
	<!-- <form>
	<input type="hidden" name="menu" value="${menu}" />
	-->
	<div class="container">
	
		<div class="page-header text-default">
		<br/><br/><br/>
		
		
							<h3>후기 게시판 </h3> 
						
					


					
	    </div>
	    

	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">

	    
		    <div class="col-md-6 text-left">
		    			 
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" >
			    <input type="hidden" name="searchCategory" id="searchCategory" value="0" />
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="width:120px;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>선택하세요.</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
<br/><br/>
				  
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
            <th width="100" align="center">No</th>
            <th width="400" align="center" >후기제목</th>
            <th width="300" align="left">작성자</th>
            <th width="200" align="left">작성일자</th>
            
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="review" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*10}</td>
		
	
		<td id="listtable" align="left"><a href="/review/getReview?reviewNo=${review.reviewNo}">${review.reviewTitle}</a></td>
					  
			  
			  <td id="listtable" align="left">${review.reviewWriter.name}</td>
			  <td id="listtable" align="left">${review.reviewDate}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	
	  <c:if test="${user.role eq 'student' && uesr.role eq 'parents'}">
	  <div class="form-group">
		    <div class="col-sm-offset-11  col-sm-1 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		      <a href="/review/addReviewView" >글쓰기</a></button>
			 
		    </div>
		</div>
	  </c:if>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
<!--  </form> -->
  
  
</body>
</html>
    
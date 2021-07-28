
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
		
			function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var academyCode=$("input[name='academyCode']").val();
			$("form").attr("method" , "POST").attr("action" , "/review/listReview?academyCode="+academyCode).submit();
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
			
			$("form").attr("method" , "POST").attr("action" , "/review/addReviewView").submit();
		}
	</script>

	</head>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/academyMain">Buy! Edu</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
	
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
		

		<td id="listtable" align="left"><a href="/review/getReview?reviewNo=${review.reviewNo}&academyCode=${academyCode}">${review.reviewTitle}</a></td>
					  
			  
			  <td id="listtable" align="left">${review.reviewWriter.email}</td>
			  <td id="listtable" align="left">${review.reviewDate}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	 
	 회원번호 ${user.userNo} 
	 학원코드1 ${academyCode }
	 학원이름 : ${academyName }
	 커넥트 ${connect }
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
		</div>
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
<!--  </form> -->
  
  
</body>
</html>
    
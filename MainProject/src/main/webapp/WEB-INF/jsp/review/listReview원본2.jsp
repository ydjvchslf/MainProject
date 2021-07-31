<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <title>Buy!Edu</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  </head>
  <!-- 스크립트 시작 -->
  <script type="text/javascript">
	function fncGetList(currentPage) {
		alert(currentPage);
		$("input").val(currentPage);
		var academyCode=$("input[name='academyCode']").val();

		 $("form").attr("method" , "POST").attr("action" , "/review/listReview?academyCode='YN82J1X'").submit();
	}
	
	
	

	
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

<!-- 스크립트 종 -->
</head>


<body>
		    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && search.searchCondition==0?"selected":""}>상품번호</option>
						<option value="1" ${!empty search.searchCondition && search.searchCondition==1?"selected":""}>상품명</option>
						<option value="2" ${!empty search.searchCondition && search.searchCondition==2?"selected":""}>가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" name="academyCode" value="${academyCode}" />
				  
				</form>
	    	</div>
	    	
		</div>
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
		  <c:forEach var="review" items="${listR}">
			<c:set var="i" value="${i-1}" />
			<tr>

		

		<td id="listtable" align="left"><a href="/review/getReview?reviewNo=${review.reviewNo}&academyCode=${academyCode}">${review.reviewTitle}</a></td>
					  
			  
			  <td id="listtable" align="left">${review.reviewWriter.email}</td>
			  <td id="listtable" align="left">${review.reviewDate}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>

	<jsp:include page="../common/pageNavigator_new.jsp"></jsp:include>



</body>
</html>
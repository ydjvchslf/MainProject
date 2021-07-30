<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	
	function fncGetList(currentPage) {
	 $("#currentPage").val(currentPage)
	var academyCode=$("input[name='academyCode']").val();
	$("form").attr("method" , "POST").attr("action" , "/review/listReview?academyCode="+academyCode).submit();
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

<!-- 스크립트 종 -->
</head>

<!--스타일 시작부분-->
<style>
.card_box {
    column-gap: 0.25rem;
}

.card_box {
            display: flex;
            margin: 0 70px;
            justify-content : space-between;
            margin-top: 65px;
            flex-wrap: wrap;
       
        }
</style>
<!-- 스타일 종료부분 -->
<body>
<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
	
	        

	         
		        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
        
			<div class="container-fluid"  >
			
 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	         
	        	 <!-- 예쁘게 때려박아주셈!! -->
	        	 <div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
	        	   <form>
	        	   <!-- 학원 이름, 전화번호 -->
					<div id="academytitle" class="row" ></div>
	     
	        	  
	     <!-- 전체게시물 갯수잡는쪽 -->   	  

		  
		    			 
		    	<p class="text-primary">
		    		전체게시물  ${resultPage.totalCount }개, 현재 ${resultPage.currentPage}  페이지
		    	</p>
					

		    
		    <!-- 전체게시물 잡는쪽 종료 -->
		
	        	 <input type="hidden" id="currentPage" name="currentPage" value=""/>
	        	 <!-- 게시물 forEach문 돌아가는쪽 시작 -->
	          <div class="row--fluid">
		 		 <c:set var="i" value="${resultPage.totalCount }" />
		 		 <c:set var="i" value="${i+1}"/>
				    <c:forEach var="review" items="${listc}">
				  
		 	 <div class="row-fruid" style="float: left; width: 50%; padding:10px;">
		 		 	<div class="card shadow mb-4">
                                <div id="card_box" class="card-header bg-dark py-3">
                                    <h3 class="m-0 font-weight-bold text-warning">${review.reviewTitle }</h3>
                                    <h5 class="text-warning"> 작성자 ${review.reviewWriter.email }</h5> <h5 class="text-warning">작성일자 ${review.reviewDate }</h5>
                                   
                                </div>
                                <div class="card-body">
                             <button type="button" class="btn btn-dark">
                                   <a href="/review/getReview?reviewNo=${review.reviewNo}&academyCode=${academyCode }" ><h8 class="text-warning">상세보기</h8></a></button>
                                </div>
                            </div>                        
                    	  </div> 
		 		 </c:forEach>
		 		</div> 
		 		  <!-- 게시물 forEach문 돌아가는쪽 종료 -->
		 		
		 		
	<!-- 글쓰기 버튼 if문 돌아가는곳시작 -->
	<div class="container-fluid">	 
	<input type="hidden" name="academyCode" value="${academyCode}" /> 
	 
	  	<c:if test="${user.role eq 'student' && connect == '1' }">
		    <div class="col-sm-11  col-sm-1 text-center">
		     <button type="button" class="btn btn-dark" > 
		      <a href="/review/addReviewView?academyCode=${academyCode }" ><h8 class="text-warning">글쓰기</h8></button>
		      </div>
		</c:if>	 
		
		<c:if test="${user.role eq 'parents' && connect == '1' }">
		    <div class="col-sm-11  col-sm-1 text-center">
		     <button type="button" class="btn btn-dark"  >
		      <a href="/review/addReviewView?academyCode=${academyCode }" ><h8 class="text-warning">글쓰기</h8></a></button>
		      </div>
		</c:if>


</div>
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
  	 <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>

	<!-- 글쓰기 버튼 if문 돌아가는곳종료 -->
</form> 
</div>	
	        	 <!-- 여기까지 때려박는거인듯!! -->
	        </div>
	    </div>

</div>





</body>
</html>
    
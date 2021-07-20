
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<title>JENNYSHOP</title>
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
			$("form").attr("method" , "POST").attr("action" , "/board/listBoard").submit();
			//$("form").submit();
		}
		
		function enterEvent(){
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		}
		
		$(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		function fncGetList2(currentPage, category) {
			document.getElementById("currentPage").value = currentPage;
			document.getElementById("searchCategory").value = category;
			$("form").attr("method" , "POST").attr("action" , "/board/listBoard").submit();
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('글쓰기')" ).on("click" , function() {
				fncAddBoardView();
			});
		});	
		
		function fncAddBoardView(){
			
			$("form").attr("method" , "GET").attr("action" , "/board/addBoardView").submit();
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
		
		
		<c:choose>
			<c:when test="${search.cateCode eq '0' }">
				<h3>사!교육 공지사항</h3>
			</c:when>
			<c:when test="${search.cateCode eq '1' }">
				<h3>사!교육 Q&A</h3>
			</c:when>
			<c:when test="${search.cateCode eq '2' }">
				<h3>자유 게시판</h3>
			</c:when>
			<c:when test="${search.cateCode eq '3' }">
				<h3>학원 공지사항</h3>
			</c:when>
		</c:choose>					
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
				    <select class="form-control" id="searchConditionb" name="searchConditionb" style="width:120px;">
						<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>제목</option>
						<option value="1"  ${ ! empty search.searchConditionb && search.searchConditionb==1 ? "selected" : "" }>내용</option>
						<option value="2"  ${ ! empty search.searchConditionb && search.searchConditionb==2 ? "selected" : "" }>작성자</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
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
            <th width="400" align="center" >게시글제목</th>
            <th width="300" align="left">작성자</th>
            <th width="200" align="left">작성일자</th>
            <th width="200" align="left">조회수</th>
            
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*10}</td>
		
	
		<td id="listtable" align="left"><a href="/board/getBoard?boardNo=${board.boardNo}">${board.boardTitle} (<span class="commentCount">${board.comment_cnt }</span>)</a></td>
					  
			  
			  <td id="listtable" align="left">${board.email}</td>
			  <td id="listtable" align="left">${board.boardDate}</td>
			  <td id="listtable" align="left">${board.viewCnt}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  카테고리 :  ${search.cateCode}
	  userNo : ${user.userNo}
		    
		   
		 <c:choose>
			<c:when test="${search.cateCode eq '0' && user.userNo eq 140 }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard" >글쓰기</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '1' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard" >글쓰기</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '2' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard" >글쓰기</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '3' && user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard" >글쓰기</a></button>
		    	</div>
			</c:when>
		  </c:choose>	
		</div>
		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
<!--  </form> -->
  
  
</body>
</html>
    
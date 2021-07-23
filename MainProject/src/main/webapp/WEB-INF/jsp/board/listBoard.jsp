
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html>
<title>사!교육</title>
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
			var cateCode=$("input[name='cateCode']").val();
			$("form").attr("method" , "POST").attr("action" , "/board/listBoard?cateCode="+cateCode).submit();
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
		
	
	</script>
	<style>
	#boardHeader{
	vertical-align : top;
	font-size : 0px;
	color : #1F4E79;
	font-family : TmonMonsori;
	}
	
	
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	#recommendPosition{
	background-color : #D4EAFB;
	font-weight : bold;
	
	}
	
	#tableHead{
	background-color : #2E75B6;
	color : white;
	text-align : center;
	font-size : 18px;
	}
	
	@font-face {
     @font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}
}
	
	#totalPosition{
	font-family :NanumBarunGothic;
	}
	
	
	</style>
	</head>
	
	
	
  <body>
  <%@ include file="toolbar.jsp" %>
	
	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> -->
	
	<!-- 메뉴 -->
	<!-- <form>
	<input type="hidden" name="menu" value="${menu}" />
	-->
	<div id="totalPosition">
	<div class="container" id="totalPosition">
	
		<div class="page-header text-default" id="boardHeader">
		<br/><br/><br/>
		
		
		<c:choose>
			<c:when test="${search.cateCode eq '0' }">
				<h3>사!교육 공지사항</h3>
			</c:when>
			<c:when test="${search.cateCode eq '1' }">
				<h3>사!교육 Q&A</h3>
			</c:when>
			<c:when test="${board.cateCode eq '2' }">
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
		    			 
		    	<p class="text-primary" id="boardCountInfo">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    		
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right" id="searchPosition">
			    <form class="form-inline" >
			    <input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
			    
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
      <table class="table table-hover" id="boardTable">
      
        <thead id="tableHead">
          <tr>
            <th width="100" align="center">No</th>
            <th width="400" align="center" >게시글제목</th>
            <th width="300" align="center">작성자</th>
            <th width="200" align="left">작성일자</th>
            <th width="200" align="center">조회수</th>
            <c:if test="${board.cateCode eq '2'}">
            <th width="200" align="center">추천수</th>
            </c:if>
            
        </thead>
       
			<tbody id="recommendPosition">
			<c:if test="${board.cateCode eq '2' }">
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${map}">
		  
			<tr>
			  <td align="left">추천</td>
		
	
		<td id="listtable" align="left"><a href="/board/getBoard?boardNo=${board.BOARD_NO}&cateCode=${board.CATEGORY_CODE}">${board.BOARD_TITLE} (<span class="commentCount">${board.COMMENT_COUNT }</span>)</a></td>
					  
			  
			  <td id="listtable" align="left">${board.EMAIL}</td>
			  <td id="listtable" align="left">
			  <fmt:formatDate value="${board.BOARD_DATE}" pattern="yyyy-MM-dd"/></td>
			  <td id="listtable" align="left">${board.VIEW_COUNT}</td>
			  <td id="listtable" align="left"><span id="recommendCnt">${board.RECNT}</span></td>
			  
			  
			</tr>
          </c:forEach></c:if>
        
        </tbody>
		
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*10}</td>
		
	
		<td id="listtable" align="left"><a href="/board/getBoard?boardNo=${board.boardNo}&cateCode=${board.cateCode}">${board.boardTitle} (<span class="commentCount">${board.comment_cnt }</span>)</a></td>
					  
			  
			  <td id="listtable" align="left">${board.email}</td>
			  <td id="listtable" align="left">
			  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
			  <td id="listtable" align="left">${board.viewCnt}</td>
			  <c:if test="${board.cateCode eq '2'}">
			  <td id="listtable" align="left"><span id="recommendCnt">${board.recommendCnt}</span></td>
			  </c:if>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  
	  카테고리 :  ${search.cateCode}
	  userNo : ${user.userNo}
		<input type="hidden" name="cateCode" value="${search.cateCode}" />	    
		   
		 <c:choose>
			<c:when test="${search.cateCode eq '0' && user.userNo eq 140 }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=0" >글쓰기</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '1' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default" value="${search.cateCode}" >
		     	 <a href="/board/addBoard?cateCode=1" >글쓰기</button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '2' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=2" >글쓰기</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '3' && user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=3" >글쓰기</a></button>
		    	</div>
			</c:when>
		  </c:choose>	
		</div>
		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	</div>
	
<!--  </form> -->
  
  
</body>
</html>
    
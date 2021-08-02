<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

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
  </head>
  	<script type="text/javascript">
  	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var acaWriter=$('input[name="acaWriter"]').val();
				$("form").attr("method" , "POST").attr("action" , "/board/listBoardAcademy?cateCode=3&academyCode="+acaWriter).submit();
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
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	body{
	overflow-x:hidden; overflow-y:visible;
	font-family: 'ChosunGu';
	}
	
	#boardHeader{
	vertical-align : top;
	color : #3A3F43;
	font-size: 38px;
	font-family : TmonMonsori;
	}

	#recommendPosition{
	background-color : #FFF5E1;
	font-weight : bold;
	}
	
	#tableHead{
	background-color : #F8B739;
	color : white;
	text-align : center;
	font-size : 18px;
	}
	
	#searchPosition{
	font-family :NanumBarunGothic;
	position : absolute;
	right : -17%;
	top : 4.7%;
	}
	
	#boardTable{
	width : 110%;
	}
	
	#tablerow{
	border-bottom: 1px solid #85827D;
	}
	
	 #ListboardTitle:hover{
	 text-decoration: underline;
	 }
	 
	 #ListboardTitle{
	 color: black;
	 }
	 
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #F8B739;
    border-color: #F8B739;
	}

	#wrbtn a:link { color: white; text-decoration: none;}
 	#wrbtn a:visited { color: white; text-decoration: none;}
 	#wrbtn a:hover { color: white; text-decoration: underline;}
 	
	</style>
	
	
  <body>
  <div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; width:100%;">
	<!-- left 툴바 -->
	<jsp:include page="../common/left.jsp"></jsp:include>
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- 상단 툴바  -->
	         <jsp:include page="../common/toolbar.jsp" ></jsp:include>
				<!-- 게시판 흰색 박스 부분-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;
					 width : 100%;">
				  <!-- 게시판 title -->
				   <div class="col-md-6 text-left" id="boardHeader">
		    	${academy.academyName}  공지사항<br>
		    </div><br>
		    
		    <div class="col-md-6 text-right" id="searchPosition">
			    <form class="form-inline" >
			    <input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
			    
			    <div class="form-group">
				    <select class="form-control" id="searchConditionb" name="searchConditionb" style="width:120px;">
						<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>제목</option>
					</select>
				 </div>
				  
				 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
			
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
	    	</div>
	    	<div class="col-sm-12" align="center">
			<hr>
			</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
      <!--  table Start /////////////////////////////////////-->
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      
      <c:if test="${empty listb}">
							<div class="col-sm-12" align="center">
								<img src="/image/nothing.png"><br>
							</div>
	  </c:if>
	  
	  <c:if test="${!empty listb}">
							
	  
      <table class="table table-hover" id="boardTable" style="margin-top:20px;">
        <thead id="tableHead">
          <tr>
            <th width=10% align="center"></th>
            <th width=50% align="center" >게시글제목</th>
            <th width=20% align="left">작성일자</th>
            <th width=10% align="left">조회수</th>
        </thead>
		<tbody>
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${listb}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td width=10% align="center">${i+1-(resultPage.currentPage-1)*10}</td>
			  <td width=50% id="listtable" align="left"><a href="/board/getBoardAca?boardNo=${board.boardNo}&cateCode=3">${board.boardTitle} (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
			  <td width=20% id="listtable" align="left">
			  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
			  <td width=10% id="listtable" align="left">&nbsp;&nbsp;&nbsp;&nbsp;${board.viewCnt}</td>
			</tr>
          </c:forEach>
        </tbody>
      </table></c:if>	
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
		<input type="hidden" name="isMine" value="${search.isMine}" />		
		<input type="hidden" name="acaWriter" value="${academy.academyCode}" />	  
		  
			<c:if test="${user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-primary" id="wrbtn"  >
		     	 <a href="/board/addBoard?cateCode=3&academyCode=${academy.academyCode}">글쓰기</a></button>
		    	</div> 
			</c:if>
		
 			<div class="col-sm-12" align="center">
			<hr>
			</div>
			 	<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
		</div>
	</div></div></div>
	
  	</div>
  	 <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>
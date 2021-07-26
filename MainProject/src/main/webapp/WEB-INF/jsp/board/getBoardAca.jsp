<%@page import="com.buyedu.domain.Board"%>
<%@page import="com.buyedu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<title>사!교육</title>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet2" href=https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<style>
		#complainButton{
	      background-color:white;
	      top:-90px; right:-20px;
	      position:relative;
	      z-index:3;
	    }
	    
	    #updateButton{
	      background-color:#E0CEFC;
	      top:-15px; right:-480px;
	      position:relative;
	      z-index:3;
	    }
	    
	    #deleteButton{
	      background-color:#E0CEFC;
	      top:-50px; right:-550px;
	      position:relative;
	      z-index:3;
	    }
	    
	    .heart{
	      background-color:white;
	      top:0px; right:70px;
	      position:relative;
	      z-index:3;
	    }
	    
	    .complainButton{
	      background-color:white;
	      top:-80px; left:550px;
	      position:relative;
	      z-index:3;
	    }
	</style>
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('삭')" ).on("click" , function() {
				if(confirm("삭제하시겠습니까?")==true){
				 var boardNo = $("div").find('button#deleteButton').val();
				 alert(boardNo)
				 var cateCode=$("input[name='cateCode']").val();
					self.location = "/board/deleteBoard?cateCode="+cateCode+"&boardNo="+boardNo
				}else{
					return false;
				}
				});
			 });
		
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('수')" ).on("click" , function() {
					 var boardNo = $("div").find('button#updateButton').val();
						self.location = "/board/updateBoard?boardNo="+boardNo
					});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( ".btn:contains('신')" ).on("click" , function() {
					fncaddComplainBoard();
				});
			});	
		 
		 function fncaddComplainBoard(){
				//Form 유효성 검증
			 	//var name = document.detailForm.prodName.value;
				var title=$("input[name='boardTitle']").val();
				var content=$("textarea[name='boardContent']").val();
				var writer=$("input[name='boardWriter']").val();

				
				/* var detail = document.detailForm.prodDetail.value;
				var manuDate = document.detailForm.manuDate.value;
				var price = document.detailForm.price.value; */
				
				//var cateName = target.options[target.selectedIndex].text;
				
				$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
			}
		
		
	</script>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body>
 <%@ include file="toolbar.jsp" %>

	<!-- ToolBar Start /////////////////////////////////////-->
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
<br/><br/><br/><br/>


				<div class="view-wrap">
				<!-- google_ad_section_start(name=post) -->
				<!-- 본문 타이틀&정보 -->
				<div class="page-header text-default" id="boardHeader">
		
		
				<h3>${board.academyName} 학원 공지사항</h3>
							
	    </div>
					
					
					<h3 id="boardTitle"><b>${board.boardTitle}</h3></b>
					<div class="info">
						<c:if test="${user.role eq 'academy'}">
						<span id="boardWriter"><i class="glyphicon glyphicon-user" ></i> ${board.academyName}</span>
						</c:if>
						<c:if test="${user.role ne 'academy'}">
						<span id="boardWriter"><i class="glyphicon glyphicon-user" ></i> ${board.email}</span>
						</c:if>
						&nbsp;&nbsp;<span id="boardDate"><i class="glyphicon glyphicon-time" ></i> 
						<fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd KK:mm:ss"/></td></td></span>
						&nbsp;&nbsp;<span id="count"><i class="glyphicon glyphicon-eye-open" ></i> ${board.viewCnt+1}</span>
						
						
					</div>
					<hr>
					<div id=boardContent>
					<p>${board.boardContent}</p>
					</br></br>
					</div>
					</div>
					</div>
					
					
<br/>
	


<div class="form-group">
		
		   <input type="hidden" name="cateCode" id="cateCode" value="${board.cateCode}" />
		   <input type="hidden" name="acaWriter" value="${academy.academyCode}" />	 
		   
		  
		    <hr></br>
		    
		    
		    
		    <c:if test="${userNo eq board.boardWriter}">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="updateButton" value="${board.boardNo}">수 &nbsp;정</button>   
		   	</div>
		    
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="deleteButton" value="${board.boardNo}">삭&nbsp;제
			</div>
			</c:if>
		</div>
	</div>
	
	
	<%@ include file="getComment.jsp" %>
	


</body>
</html>
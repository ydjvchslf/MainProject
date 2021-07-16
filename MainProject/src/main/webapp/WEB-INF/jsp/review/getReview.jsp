<%@page import="com.buyedu.domain.Review"%>
<%@page import="com.buyedu.domain.User" %>
<%@page import="com.buyedu.domain.Academy" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<title>사!교육</title>
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
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn:contains('삭')" ).on("click" , function() {
				 var reviewNo = $("div").find('button#confirm').val();
					self.location = "/review/deleteReview?reviewNo="+reviewNo
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('수')" ).on("click" , function() {
					 var reviewNo = $("div").find('button#confirm').val();
						self.location = "/review/updateReview?reviewNo="+reviewNo
					});
			});
		
		
	</script>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
<br/><br/><br/><br/>
<div class="page-header text-default">
<h1 style="font-family:a옛날사진관4;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${review.reviewTitle}</h1>
</div>
<br/>
	<div class="container">
      		<div class="row">
				
		<div class="col-md-1">
		</div>
		
	<div class="col-md-6" >
	<table class="table" >
	<br/><br/>
		<!-- On rows -->
<!--  		<tr height="50" >
			<td id="gettable" class="success" width="280"><b>&nbsp;&nbsp; 제목 </b></td>
			<td id="content" width="825">&nbsp;&nbsp;${review.reviewTitle}</td>
		</tr>
		-->
		<tr height="50" >
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp;작성자</b></td>
			<td id="content" width="825">&nbsp;&nbsp;${review.reviewWriter.name}</td>
		</tr>
		
		<tr height="50">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp; 작성일자</b></td>
			<td width="825">&nbsp;&nbsp;${review.reviewDate}</td> 
		</tr>
		
		<tr height="300">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp;내용</b></td>
			<td id="content" width="825">&nbsp;&nbsp;${review.reviewContent}</td>
		</tr>	
		<%-- <tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;</b></td>
			<img src = "/images/uploadFiles/${ board.fileName }"/>
			<td width="825">&nbsp;&nbsp;</td>
		</tr>	 --%>	
		
		<tr height="50">
			<td width="280"></td>
			<td width="825"></td>
		</tr>	
	</table>
	</div>
	</div>
	</div>
	

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="confirm" value="${review.reviewNo}">수 &nbsp;정</button>
		    </div>
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="confirm2" >삭&nbsp;제
	</div>
	


</body>
</html>
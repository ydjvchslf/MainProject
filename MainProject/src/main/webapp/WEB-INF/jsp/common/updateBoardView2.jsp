<%@page import="com.buyedu.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head> 
<title>JENNYSHOP</title>

 <meta charset="EUC-KR">
	

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="/css/style.css" rel="stylesheet"> 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
 
  
  </script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('수')" ).on("click" , function() {
		fncupdateBoard();
	});
});	

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	

function fncupdateBoard(){
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
</head>

<body>



	<div class="navbar  navbar-default">
	 <div class="container">
        	<a class="navbar-brand" href="/index.jsp">JENNYSHOP</a>
   		</div>
   	</div>
   	
   	<div class="container">
	
		<div class="page-header text-default">
		
		<h3 style="text-align:center;">게시글 수정</h3> 
		</div>
		
	
	<br/><br/>
	
	<form class="form-horizontal">
	<input type="hidden" name="boardNo" value="${board.boardNo}" />
		
 	<div id="updatebrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label">제목</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
		    </div>
		</div>
		
		<div id="updatebrdview" class="form-group">
		    <label for="boardWriter" class="col-sm-offset-1 col-sm-1 control-label">작성자</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="boardWriter" name="boardWriter" value="${board.boardWriter}">
		    </div>
		</div>
			
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label">내용</label>
		    <div class="col-sm-8" height=100px>
		      <textarea class="form-control col-sm-5" rows="5" name="boardContent"
						placeholder="내용" style="resize: none;">${board.boardContent}</textarea>
		    </div>
		</div>
		
		
		
		
		
		
		
		</div>
				
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >수&nbsp;정</button>
			  &nbsp;<a class="btn btn-default" href="#" role="button">취&nbsp;소</a>
		    </div>
		</div>
	

</head>

</form> 
</body>
</html>
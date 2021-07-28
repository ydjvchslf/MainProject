<%@page import="com.buyedu.domain.Review"%>
<%@page import="com.buyedu.domain.User" %>
<%@page import="com.buyedu.domain.Academy" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<title>getReview.jsp</title>
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
	 <script src="https://code.jquery.com/jquery-latest.js"></script> 
	 
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn:contains('삭')" ).on("click" , function() {
				 if(confirm("삭제하시겠습니까?")==true){
					 
				 
				 var reviewNo = $("div").find('button#delete').val();
				 var academyCode=$("input[name='academyCode']").val();
					self.location = "/review/deleteReview?reviewNo="+reviewNo+"&academyCode="+academyCode
				 }else{
					 return false;
				 }
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( ".btn:contains('신')" ).on("click" , function() {
					fncaddComplainReview();
				});
			});	
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('수')" ).on("click" , function() {
					 var reviewNo = $("div").find('button#update').val();
					 var academyCode=$("input[name='academyCode']").val();
						self.location = "/review/updateReview?reviewNo="+reviewNo+"&academyCode="+academyCode
					});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('뒤')" ).on("click" , function() {
					 var reviewNo = $("div").find('button#back').val();
					 var academyCode=$("input[name='academyCode']").val();
						self.location = "/review/listReview?academyCode="+academyCode
					});
			});
		
		
	</script>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>

<title>getReivew.jsp</title>
<style type="text/css">
 
html,body {height:100%,margin:0}
.mw {position:fixed;_position:absolute;top:0;left:0;width:100%;height:100%;display:none;}
.mw .bg {position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
.mw .fg {position:absolute;top:50%;left:50%;width:360px;height:160px;margin:-100px 0 0 -200px;padding:20px;border:3px solid #ccc;background:#fff;}
 
 $color1: #f4f4f4;
$color2: #3197EE;

body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}

.radio {
  margin: 0.5rem;
  input[type="radio"] {
    position: absolute;
    opacity: 0;
    + .radio-label {
      &:before {
        content: '';
        background: $color1;
        border-radius: 100%;
        border: 1px solid darken($color1, 25%);
        display: inline-block;
        width: 1.4em;
        height: 1.4em;
        position: relative;
        top: -0.2em;
        margin-right: 1em; 
        vertical-align: top;
        cursor: pointer;
        text-align: center;
        transition: all 250ms ease;
      }
    }
    &:checked {
      + .radio-label {
        &:before {
          background-color: $color2;
          box-shadow: inset 0 0 0 4px $color1;
        }
      }
    }
    &:focus {
      + .radio-label {
        &:before {
          outline: none;
          border-color: $color2;
        }
      }
    }
    &:disabled {
      + .radio-label {
        &:before {
          box-shadow: inset 0 0 0 4px $color1;
          border-color: darken($color1, 25%);
          background: darken($color1, 25%);
        }
      }
    }
    + .radio-label {
      &:empty {
        &:before {
          margin-right: 0;
        }
      }
    }
  }
}
 
</style>
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
			<td id="content" width="825">&nbsp;&nbsp;${review.reviewWriter.email}</td>
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

작성자 번호 : ${review.reviewWriter.userNo }
유저넘버 : ${ userNo }
학원코드 : ${academyCode }
	 리뷰상태 ${reviewState }
	 리뷰상태 ${review.reviewState }
 <input type="hidden" name="academyCode" value="${academyCode}" /> 
	 <div class="form-group">
	
	   <c:if test="${userNo eq review.reviewWriter.userNo }">
		 <div class="col-sm-offset-4  col-sm-4 text-center">

		      <button class="btn btn-primary" id="update" value="${review.reviewNo}">수 &nbsp;정</button>
		    &nbsp;
		      <button class="btn btn-primary" id="delete" value="${review.reviewNo}">삭&nbsp;제</button>
			&nbsp;
			  <butten class="btn btn-primary" id="back" >뒤&nbsp;로</butten>
		</div>
		</c:if>
		
	
	
	
	<c:if test="${userNo ne review.reviewWriter.userNo }">
   <div class="col-sm-offset-4  col-sm-4 text-center">

		<butten class="btn btn-primary" id="back" >뒤&nbsp;로</butten>
		
		<button class="btn btn-primary" id="complain" value="${review.reviewNo}" onClick="document.getElementById('mw_temp').style.display='block'">신&nbsp;고</button>
	</div>
	
 
 
<div id="mw_temp" class="mw">
    <div class="bg"><!--이란에는 내용을 넣지 마십시오.--></div>
    <div class="fg">
        <p>
		<div class="container">
  <div class="radio">
    <input id="radio-1" name="radio" type="radio" checked>
    <label for="radio-1" class="radio-label">욕설</label>
  </div>

  <div class="radio">
    <input id="radio-2" name="radio" type="radio">
    <label  for="radio-2" class="radio-label">도배,홍보</label>
  </div>

  <div class="radio">
    <input id="radio-3" name="radio" type="radio">
    <label for="radio-3" class="radio-label">음란</label>
  </div>
</div>
		<button onclick="document.getElementById('mw_temp').style.display='none'" type="button">신고하기</button>
		<button onclick="document.getElementById('mw_temp').style.display='none'" type="button">창닫기</button>
   		
    </div>
</div>
	
	</c:if>

	</div>
	</div>
	
	


</body>
</html>
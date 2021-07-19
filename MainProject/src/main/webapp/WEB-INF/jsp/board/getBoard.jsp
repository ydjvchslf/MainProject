<%@page import="com.buyedu.domain.Board"%>
<%@page import="com.buyedu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
				 var boardNo = $("div").find('button#delete').val();
					self.location = "/board/deleteBoard?boardNo="+boardNo
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('수')" ).on("click" , function() {
					 var boardNo = $("div").find('button#update').val();
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

	<!-- ToolBar Start /////////////////////////////////////-->
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
<br/><br/><br/><br/>
<div class="page-header text-default">
<h1 style="font-family:a옛날사진관4;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.boardTitle}</h1>
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
		<tr height="50" >
			<td id="gettable" class="success" width="280"><b>&nbsp;&nbsp; 제목 </b></td>
			<td id="content" width="825">&nbsp;&nbsp;${board.boardTitle}</td>
		</tr>
		<tr height="50" >
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp;작성자</b></td>
			<td id="content" width="825">&nbsp;&nbsp;${board.email}</td>
		</tr>
		
		<tr height="50">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp; 작성일자</b></td>
			<td width="825">&nbsp;&nbsp;${board.boardDate}</td> 
		</tr>
		
		<tr height="50">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp; 조회수</b></td>
			<td width="825">&nbsp;&nbsp;${board.viewCnt+1}</td> 
		</tr>
		<tr height="50">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp; 추천수</b></td>
			<td width="825">&nbsp;&nbsp;${board.recommendCnt}</td> 
		</tr>
		
		<tr height="300">
			<td id="gettable"class="success" width="280"><b>&nbsp;&nbsp;내용</b></td>
			<td id="content" width="825">&nbsp;&nbsp;${board.boardContent}</td>
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
		      <button class="btn success" id="complain" value="${board.boardNo}">신 &nbsp;고</button>
		    </div>
		    <span>세션 : ${user.userNo}</span>
		    <span>세션 : ${board.boardWriter}</span>
		    
		    <c:if test="${userNo eq board.boardWriter}">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="update" value="${board.boardNo}">수 &nbsp;정</button>   
		   	</div>
		    
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn success" id="delete" value="${board.boardNo}">삭&nbsp;제
			</div>
			</c:if>
	</div>
	
	<div style="text-align: center;">
       <a class="btn heart">
           <img id="heart" src="">
       </a>
   </div>

<script>
    $(document).ready(function () {

        var heartval = ${heart};
        alert(heartval)


        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/image/like_after.png");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/image/like_before.png");
            
            $(".heart").prop('name',heartval)
        }

        $(".heart").on("click", function () {

            var that = $(".heart");

            var sendData = {'boardNo' : '${board.boardNo}','heart' : that.prop('name')};
            $.ajax({
                url :'/board/json/heart',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {

                        $('#heart').prop("src","/image/like_after.png");
                    }
                    else{
                        $('#heart').prop("src","/image/like_before.png");
                    }


                }
            });
        });
    });
</script>
	

	</br>
	<%@ include file="getComment.jsp" %>
	


</body>
</html>
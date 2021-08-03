<%@page import="com.buyedu.domain.Board"%>
<%@page import="com.buyedu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

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
	
	<script>
    $(document).ready(function () {
    	
        var heartval = ${heart};

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

	<style>
		
	    
	    .heart{
	      background-color:white;
	      top:0px; right:30px;
	      position:relative;
	      z-index:3;
	    }
	    
	    @font-face {
	    font-family: 'ChosunGu';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
		body{
		overflow-x:hidden; overflow-y:visible;
		font-family: 'ChosunGu';
		}
	    
	</style>
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('��')" ).on("click" , function() {
				if(confirm("�����Ͻðڽ��ϱ�?")==true){
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
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( ".btn:contains('��')" ).on("click" , function() {
			 var boardNo = $("div").find('button#updateButton').val();
			 var cateCode = $(this).find('input').val()
			 
				self.location = "/board/updateBoard?boardNo="+boardNo+"&cateCode="+cateCode
			});
		});
		 
		$(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("a[href='#' ]").on("click" , function() {
					$("form")[0].reset();
				});
			});	
		 
		$(function() {
			$('#ok').on('click', function(){
				var boardNo = ${board.boardNo};
				var reason = $("input[name='complain']:checked").val();
					
				$.ajax({
					 url : '/complain/json/addBoardComplain/'+boardNo,
				     type : 'post',
				     data : {'boardNo' : boardNo, 'reason' : reason},
				     success : function(data){
				    	 location.reload()
						alert("�Ű� �Ϸ� �Ǿ����ϴ�.");
				     }
				});
			})
		})
		
	$(function() {
		$('#deleteComplain').on('click', function(){
			var boardNo = ${board.boardNo};
				
			$.ajax({
				 url : '/complain/json/deleteComplain/'+boardNo,
			     type : 'post',
			     success : function(data){
			    	 location.reload()
					alert("�Ű� ��� �Ǿ����ϴ�.");
			     }
			});
		})
	})
		 
	</script>

<html>
</head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

</head>

<body>
 <div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; width:100%;">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">

	        <div class="container-fluid">
	        
	           <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	<!-- �Խ��� title -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;
					 width : 100%;">
				  <!-- �Խ��� title -->
					
					<h2 id="titlef"><b>${board.boardTitle}</h2></b>
					<div class="info" style="font-size: 15px;">
						<span id="boardWriter"><i class="glyphicon glyphicon-user" ></i> ${board.email}</span>
						&nbsp;&nbsp;<span id="boardDate"><i class="glyphicon glyphicon-time" ></i> 
						<fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd KK:mm:ss"/></td></td></span>
						&nbsp;&nbsp;<span id="count"><i class="glyphicon glyphicon-eye-open" ></i> ${board.viewCnt+1}</span>
						<c:if test="${board.cateCode eq '2'}">
						&nbsp;&nbsp;<span id="recommendCnt"><i class="glyphicon glyphicon-heart" ></i> ${board.recommendCnt}</span>
						</c:if>
						&nbsp;&nbsp; <span id="cateCodeinGetboard"><i class="glyphicon glyphicon-th-list" ></i> 
							<c:choose>
								<c:when test="${board.cateCode eq '0'}">
								 ��!���� ��������
								</c:when>
								<c:when test="${board.cateCode eq '1'}">
								 ��!���� Q&A
								</c:when>
								<c:when test="${board.cateCode eq '2'}">
								  ���� �Խ���
								</c:when>
								<c:when test="${board.cateCode eq '3'}">
								 ${academy.academyName}�п� ��������
								</c:when>
								<c:when test="${isMine eq 'y'}">
								 ���� �� �Խñ�
								</c:when>
							</c:choose>	</span>
					</div>
					<hr>
					<div id=boardContent style="font-size: 18px;">
					<p>${board.boardContent}</p>
					<br/><br/>
					</div>
					
<br/>
	<c:if test="${board.cateCode eq '2'}">
	<div style="text-align: center;">
       <a class="btn heart">
           <img id="heart" src="">
       </a>
   </div></c:if>

<div class="form-group">
		
		   <input type="hidden" name="cateCode" id="cateCode" value="${board.cateCode}" />
		   <input type="hidden" name="acaWriter" value="${academy.academyCode}" />	 
		   <input type="hidden" name="acaWriter" value="${search.isMine}" />	
		    <hr>
		    
		    <div class="row">
		    
		    <div class="col-sm-12 text-right">
		    
		    <!-- �Ű� ��ư ��� -->
		    <c:if test="${complainCount!= 1 && userNo ne board.boardWriter}">
		    <button class="btn btn-primary" id="complainButton" data-toggle="modal" data-target="#complainBrd">�Ű�</button>
		    <div class="modal fade" id="complainBrd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">�Ű� ������ ������ �ּ���</h4>
						      </div>
						      <div class="modal-body">
						      <!-- ��� ���� -->
						        <form>
						            <div class="row">
									  
									  <div class="col-sm-5" align="left" style="padding-left: 50;">
									  	<br/>
									  	<input type="radio" id="1" name="complain" value="1">&nbsp;<label for="1"> �弳 </label>
									  	<br/>
									  	<input type="radio" id="2" name="complain" value="2">&nbsp;<label for="2"> ���� </label>
									  	<br/>
									  	<input type="radio" id="3" name="complain" value="3">&nbsp;<label for="3"> ȫ��, ���� </label>
									  	<br/>
									  	<input type="radio" id="4" name="complain" value="4">&nbsp;<label for="4"> ������ </label>
									  	<br/>
									  	<input type="radio" id="5" name="complain" value="5">&nbsp;<label for="5"> ��Ÿ </label>
									  	<br/>
									  </div>
								
									</div>
								</form>
								
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="ok" class="btn btn-primary">�Ű� �ϱ�</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
						      </div>
						    </div>
						  </div>
						</div>
			</c:if>
			
			
		    <c:if test="${complainCount== 1}">
		    <button class="btn btn-primary" id="complainButton" data-toggle="modal" data-target="#complainBrd">�Ű� ���</button>
		    <div class="modal fade" id="complainBrd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">�̹� �Ű� �� �Խñ� �Դϴ�.</h4>
						      </div>
						      <div class="modal-body" align="center">
						      <!-- ��� ���� -->
									�Ű� ���� �Ͻðڽ��ϱ�?
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="deleteComplain" class="btn btn-primary">�Ű� ��� �ϱ�</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
						      </div>
						    </div>
						  </div>
						</div>
		    </c:if>
		    
		      <button class="btn btn-primary" id="resetButton" value="${board.boardNo}" href="#" onClick="history.back()">�������</button>
		      <c:if test="${userNo eq board.boardWriter}">
		      <button class="btn btn-primary" id="updateButton" value="${board.boardNo}">
		      <input type="hidden" id="updateButton" value="${board.cateCode}"/>�� &nbsp;��</button>   
		      <button class="btn btn-primary" id="deleteButton" value="${board.boardNo}">��&nbsp;��</button></c:if> 
		      
		   	</div>
			</div>
	
	<%@ include file="getComment.jsp" %> 
		</div>
		</div>
		</div></div>
	</div>
 <!--  <script src="/js/jquery.min.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>

</body>
</html>
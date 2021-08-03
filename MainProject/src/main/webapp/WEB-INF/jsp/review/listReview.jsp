<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
<style>
	
	.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px; 
    border-top-right-radius: 0px; 
	}
	
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
	
	body{
	overflow-x:hidden; overflow-y:visible;
	font-family: 'ChosunGu';
	}
	
    #title{
		vertical-align : top;
		font-size : 50px;
		color : #1F4E79;
		font-family : TmonMonsori;
	}
	
	#count{
		vertical-align : bottom;
		font-size : 20px;
		color : #1F4E79;
		font-family : TmonMonsori;
	}
	
	#phone{
		vertical-align : right;
		font-size : 15px;
		color : #1F4E79;
		font-family : TmonMonsori;
	}
	
	#panel-color{
		background-color: black !important;
	}
	
	
	@font-face {
	    font-family: 'TmonMonsori';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
		
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #F8B739;
    border-color: #F8B739;
    }
    
    #reviewBtn a:link { color: white; text-decoration: none;}
 	#reviewBtn a:visited { color: white; text-decoration: none;}
 	#reviewBtn a:hover { color: white; text-decoration: underline;}
	}	
	
		
	</style>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">


					<!-- 학원 이름, 전화번호 -->
					<div id="academytitle" class="row" ></div>
					<div class="col-sm-12" align="center">
		
			</div>
					<div class="row">
						<div class="col-md-12">
						<c:if test="${count == 0 && state == '1'}">
					
					
					<button class="btn btn-primary btn-lg" id="reviewButton" data-toggle="modal" data-target="#addReview">
					  후기작성
					</button>
					
					<div class="modal fade" id="addReview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">학원 후기 작성하기</h4>
						      </div>
						      <div class="modal-body">
						      <!-- 모달 내용 -->
						        <form>
						            <div class="row">
									  
									  <div class="col-xs-12 col-md-12">
									  	<input type="text" name="reviewTitle" placeholder="후기 제목" class="form-control"> <br/><br/>
									  </div>
									  
									  <div class="col-xs-12 col-md-12">
									  	<textarea rows="5" cols="50" id="reviewContent" name="reviewContents" placeholder="후기 내용" class="form-control"></textarea><br/><br/>
									  </div>
								
									</div>
								</form>
								
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						        <button type="button" id="ok" class="btn btn-primary">등록</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						</c:if>
						
						</div>	
					</div>
					
					<div class="row">	
					<div class="col-md-12">
					<form class="form-inline" name="detailForm">	
					<c:if test="${empty listR}">
							<div class="col-sm-12" align="center">
								<hr>
							</div>
							<div class="col-sm-12" align="center">
								<img src="/image/nothing.png"><br>
							</div>
	 				</c:if>
	 				
	 				
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
					<c:if test="${!empty listR}">
						<table class="table">
							 
							 <tbody>
							 
							 <c:forEach var="review" items="${listR}">
				   <div class="row-fruid" style="float: left; width: 50%; padding:10px;">
		 		 	<div class="card shadow mb-4">
                                <div id="card_box" class="card-header bg-dark py-3">
                                    <div class="m-0 font-weight-bold text-warning" style="font-size: 20px;">${review.reviewTitle}
	                                    <div align="right">
		                                      <c:if test="${user.email == review.reviewWriter.email}">
			                                   <a class="btn btn-primary" onclick="deleteReview(${review.reviewNo})"><span style="color:white">삭제</span></a>
			                                  </c:if>
	                                   </div>
	                                </div>   
                                </div>
                                <div class="card-body">
                                  <div> 
                                  	<strong>${review.reviewContent}</strong>
                                  </div>
                                  <div class="col-sm-12" align="right"> 
                                  	${review.reviewDate}&nbsp; by ${review.reviewWriter.email}
                                  </div>
                                </div>
                     </div>                        
                    </div> 
		
							 </c:forEach>

							 </tbody> 
							
						</table></c:if>
					</form>
					</div>
					</div>
			<div class="col-sm-12" align="center">
			
			</div>
			
			<c:if test="${empty listR}">
			<div class="col-sm-12" align="center">
					<hr>
			</div>
			</c:if>
						<jsp:include page="../common/pageNavigator_new.jsp"></jsp:include>
				</div>
	      	</div>
	      	
	      	<!-- footer 자리 -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
	      	
       </div>
	</div>
	
	<script >
	var academyCode = '${academy.academyCode}';
	
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)	
		$("form").attr("method","post").attr("action","/review/listReview?academyCode="+academyCode).submit()	
	}
		
		
		/* function addReview(){
			self.location = "/review/testAddReview?userNo=${user.userNo}&academyCode=${academy.academyCode}"
		} */
		
		function getAcademyInfo(){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 academyInfo = data;
						 
					var b = '';
						b += '<div id="titlef" class="col-md-12" style="" align="center"><span style="font-size:38px;"> &nbsp;&nbsp;'+data.academyName+'&nbsp;&nbsp;후기 </span></div>'
					$("#academytitle").html(b);
						 
				 }							
			});		
		}
		
		function add(){
	 		$("form").attr("method","POST").attr("action","/review/addReview?academyCode=${academy.academyCode}").submit()
	 	}
		
		$(document).ready(function(){
			getAcademyInfo(); 
		});
		
		// 모달 후기 등록
		$(function(){
			$("#ok").on('click',function(){
				
				var academyCode = '${academy.academyCode}';
				var reviewTitle=$("input[name='reviewTitle']").val();
				var reviewContent=$("textarea#reviewContent").val();
				
				
// 용미언니 여기 swal 안먹는다 -----------------------------------------------------------------
				if(reviewTitle == null || reviewTitle.length <1){
					alert("후기 제목을 입력해주세요.");
					return;
				}
				if(reviewContent == null || reviewContent.length <10){
					alert("후기 내용은 최소 10자 이상 입니다.");
					return;
				}
				
				$.ajax({
			        url : '/review/json/addReview/'+academyCode,
			        type : 'POST',
			        data : {'reviewTitle' : reviewTitle, 'reviewContent' : reviewContent},
			        success : function(data){
			        	alert("후기 등록 완료!");
			        	location.reload()
			        }
			    });
				
			});
		});
		
		// 모달 후기 수정
		$(function(){
			$("#update").on('click',function(){
				
				var academyCode = '${academy.academyCode}';
				var reviewTitle=$("input[name='reviewTitle']").val();
				var reviewContent=$("textarea#reviewContent").val();
				
				
// 용미언니 여기 swal 안먹는다 -----------------------------------------------------------------
				if(reviewTitle == null || reviewTitle.length <1){
					alert("후기 제목을 입력해주세요.");
					return;
				}
				if(reviewContent == null || reviewContent.length <10){
					alert("후기 내용은 최소 10자 이상 입니다.");
					return;
				}
				
				$.ajax({
			        url : '/review/json/updateReview/'+reviewNo,
			        type : 'POST',
			        data : {'reviewTitle' : reviewTitle, 'reviewContent' : reviewContent},
			        success : function(data){
			        	alert("후기 등록 완료!");
			        	location.reload()
			        }
			    });
				
			});
		});
		
		function deleteReview(reviewNo){
			if(confirm('후기를 삭제 하시겠습니까?')){
			    $.ajax({
			        url : '/review/json/deleteReview/'+reviewNo,
			        type : 'POST',
			        success : function(data){
			        	alert("후기가 삭제 되었습니다.");
			        	location.reload()
			        }
			    });
			}
		}
		
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
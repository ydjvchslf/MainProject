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
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
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
			<hr>
			</div>
					<div class="row">
						<div class="col-md-12">
						<c:if test="${count == 0 && state == '1'}">
						
					
					
					<button class="btn btn-primary btn-lg" id="reviewButton" data-toggle="modal" data-target="#addReview">
					  후기작성
					</button>
					
					<!-- Modal -->
						<div class="modal fade" id="addAca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">기본정보 입력</h4>
						      </div>
						      <div class="modal-body">
						      <!-- 모달 내용 -->
						        <form>
						            
						            <div class="row">
									  
									  <div class="col-xs-12 col-md-8">
									  	<input type="text" name="academyName" placeholder="학원명" class="form-control"> <br/><br/>
									  </div>
									  
									  <div class="col-xs-6 col-md-4">
									  	<input type="text" name="academyPhone" placeholder="학원전화번호" class="form-control"> <br/><br/>
									  </div>
									</div>
									
									<div class="row">
									  
									  <div class="col-xs-12 col-md-12">
									  	<input class="form-control" type="text" onclick="sample5_execDaumPostcode()" id="sample5_address" name="academyAddr"  placeholder="주소" readonly/> <br/><br/>
									  </div>

								
									</div>
									
									<div class="row">
									  
									  <div class="col-xs-12 col-md-12">
									  	<div id="map" style="width:470;height:300; display:none"></div>
									  </div>

								
									</div>
						
										<input type="hidden" class="form-control" type="text" id="sample5_address_extra" name="academyArea" placeholder="구이름" readonly/>
										<input  type="hidden"  id="lat" name="academyLat"  placeholder="위도" readonly/>
										<input type="hidden" id="lng" name="academyLng"  placeholder="경도" readonly/>

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
								<img src="/image/nothing.png"><br>
							</div>
	 				</c:if>
	 				
	 				
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
					<c:if test="${!empty listb}">
						<table class="table">
							 <thead>
							  											<!-- Modal -->
					<div class="modal fade" id="addReview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title" id="myModalLabel">후기 작성</h4>
					      </div>
					      
					      <form>
					      <div class="modal-body">
					      
					      	<div class="row-fruid">
					        <input name="reviewTitle" style="width:420px;height:50px; color:black;" id="modalReviewTitle"  placeholder="후기제목" >
					        </div>
					       <div class="row-fruid">
					        <input name="reviewContent"  class="form-control" style="width:420px;height:200px;" id="modalReviewContent" placeholder="후기내용">
					        <input name="email" value="${user.email}" type="hidden">
					        </div>
					        
					      </div>
					      </form>
					      
					      <div class="modal-footer">
					      <button type="button" onclick="add()" class="btn btn-primary">등록</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
							 </thead>
							 
							 <tbody>
							 
							 <c:forEach var="review" items="${listR}">
							  <div class="row-fruid" style="float: left; width: 50%; padding:10px;">
		 		 	<div class="card shadow mb-4">
                                <div id="card_box" class="card-header bg-dark py-3">
                                    <h3 class="m-0 font-weight-bold text-warning">${review.reviewTitle }</h3>
                                    <h5 class="text-warning"> 작성자 ${review.reviewWriter.email }</h5> <h5 class="text-warning">작성일자 ${review.reviewDate }</h5>
                                   
                                </div>
                                <div class="card-body">
                             <button type="button" class="btn btn-primary" id=reviewBtn>
                                   <a href="/review/getReview?reviewNo=${review.reviewNo}&academyCode=${academy.academyCode }" ><h8 id="reviewBtn">상세보기</h8></a></button>
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
			<hr>
			</div>
						<jsp:include page="../common/pageNavigator_new.jsp"></jsp:include>
				</div>
	      	</div>
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
						b += '<div id="titlef" class="col-md-4" style=""><h2> &nbsp;&nbsp;'+data.academyName+'&nbsp;&nbsp;후기 </h2></div>'
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
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
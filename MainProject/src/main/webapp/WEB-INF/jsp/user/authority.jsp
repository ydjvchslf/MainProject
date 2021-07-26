<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN, modal ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
	<!-- sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	
  
  
	

	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	/*
		$("#modalBtn").on( "click", function() {
	        
	    });
	*/	
		
		$(function() { 
			
			$("#sweetBtn").on( "click", function() {
			
				swal("오빠 창 이쁘지");
			
	   		 });
	
		});



			
	</script>	
	
	
	
		
    
	</head>
	
		<body>
		
		<!-- modal 구동 버튼 (trigger) -->
		<button type="button" class="btn btn-primary" id="modalBtn" data-toggle="modal" data-target="#myModal">
		   모달버튼
		</button>
		<br><br>
		<!-- sweet alert 버튼 -->
		<button type="button" class="btn btn-primary" id="sweetBtn" >
		   스윗버튼
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		        Modal내용 근데 왜난 엑스자가 저기에있어 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div> 

		
		
			
		</body>
	
	</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesom e/5.8.2/css/all.min.css"/>
	

	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	
	
	
			
	</script>	
		
    
</head>

<body>

	<a data-toggle="modal" href="/user/findEmail" 
  	data-target="#modal-reviewView" role="button" data-backdrop="static" style="padding-bottom:150px">Email찾기</a>	
				//#modal-reviewView 해당주소jsp 띄울 모달영역 id


		<div id="modal-reviewView" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달" >
			<div class="modal-dialog" style="width: 60%; top: 10%; margin:auto;">
				<div class="modal-content"></div>
			</div>
		</div>

	
</body>

</html>
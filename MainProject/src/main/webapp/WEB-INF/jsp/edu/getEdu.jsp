<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			 
			$( ".btn:contains('수업정보수정')" ).on("click" , function() {
				 
				self.location = "/edu/updateEdu?eduNo=${edu.eduNo}"
			});
			
			$( ".btn:contains('수업목록')" ).on("click" , function() {
				 
					self.location = "/edu/listEdu"
			});
			
		});
		
		 $(function() {
			
			 $( ".btn:contains('관심수업등록')" ).on("click" , function() {
				 
				 var eduNo = ${edu.eduNo}
				 var acaCode = "ABC127"
				 
				 $.ajax({
				     url : '/pickedu/json/addPickEdu/${edu.eduNo}/'+acaCode ,
				     method : 'POST',
				     dataType : "json",
				     headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json; charset:UTF-8"
					},
				    success : function(data, status){

				    	alert("관심수업에 등록되었습니다.")
				    }
				});
			})
			
			$( ".btn:contains('관심수업삭제')" ).on("click" , function() {
				 
				 var eduNo = ${edu.eduNo}
				 
				 $.ajax({
				     url : '/pickedu/json/deletePickEdu/${edu.eduNo}' ,
				     method : 'POST',
				     dataType : "json",
				     headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json; charset:UTF-8"
					},
				    success : function(data, status){

				    	alert("관심수업에서 삭제되었습니다.")
				    }
				});
			})
		 })
		
	</script>
	
</head>

<body>


	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">수업상세보기 화면</h3>
	       <h5 class="text-muted">수업정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>수 업 명</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>강 사 명</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduTeacher}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>수업 시작 날짜</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduStartDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>수강료</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>간략한 수업 내용</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduIntro}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>수업 요일</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduDay}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">수업정보수정</button>
	  			<button type="button" class="btn btn-primary">수업목록</button>
	  			<button type="button" class="btn btn-primary">관심수업등록</button>
	  			<button type="button" class="btn btn-primary">관심수업삭제</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>
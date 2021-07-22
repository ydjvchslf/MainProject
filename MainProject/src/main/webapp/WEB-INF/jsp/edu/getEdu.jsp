<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
 		body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 70px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			 
			$( ".btn:contains('수업정보수정')" ).on("click" , function() {
				 
				var eduState = ${edu.eduState}
				
				if(eduState==1) {
					alert("판매중인 수업은 수정이 불가능합니다.")
				} else {
					self.location = "/edu/updateEdu?eduNo=${edu.eduNo}"
				}
				
			});
			
			$( ".btn:contains('수업목록')" ).on("click" , function() {
				
				self.location = "/edu/listEdu?acaCode=${edu.academy.academyCode}"
			});
			
			$( ".btn:contains('수업구매')" ).on("click" , function() {
				
				var eduNo = ${edu.eduNo}
				self.location = "/purchaseedu/addPurchaseEdu?eduNo="+eduNo
			});
			
		});
		
		 $(function() {
			
			 $( ".btn:contains('관심수업등록')" ).on("click" , function() {
				 
				 $.ajax({
				     url : '/pickedu/json/addPickEdu/${edu.eduNo}/${edu.academy.academyCode}' ,
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
	       <h5 class="text-muted">판매중, 판매완료된 수업은 <strong class="text-danger">수정, 삭제</strong>가 불가능합니다.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>수 업 명</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduName}</div>
			<div class="col-xs-4 col-md-2"><strong>강 사 명</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduTeacher}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>수업 시작 날짜</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduStartDate}</div>
			<div class="col-xs-4 col-md-2 "><strong>수업 종료 날짜</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduEndDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>수강료</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduPrice} 원</div>
			<div class="col-xs-4 col-md-2 "><strong>총 인원</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduMember} 명</div>
		</div>
		
		
		
		<hr/>
		
		<div class="row">
			<div class="col-md-2 "><strong>수업 시작 시간</strong></div>
			<div class="col-md-4">${edu.eduStartTime}</div>
			<div class="col-xs-4 col-md-2 "><strong>수업 요일</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduDay}</div>
			<div class="col-md-2 "><strong>수업 종료 시간</strong></div>
			<div class="col-md-4">${edu.eduEndTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-2 "><strong>수업 대상학년</strong></div>
			<div class="col-md-4">${edu.eduGrade}</div>
			<div class="col-xs-4 col-md-2 "><strong>수업 과목</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduSubject}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-2 "><strong>간략한 수업 내용</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduIntro}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">수업정보수정</button>
	  			<button type="button" class="btn btn-primary">수업목록</button>
	  			<button type="button" class="btn btn-primary">관심수업등록</button>
	  			<button type="button" class="btn btn-primary">관심수업삭제</button>
	  			<c:choose>
					  <c:when test= "${edu.eduState == '1' }">
						 <button type="button" class="btn btn-primary">수업구매</button>
					  </c:when>
					  <c:when test= "${edu.eduState == '2' }">
					  </c:when>
				</c:choose>

	  		</div>
		</div>
		
		<br/>
		
 	</div>

</body>

</html>
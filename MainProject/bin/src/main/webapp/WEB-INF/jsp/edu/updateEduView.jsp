<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
	
		 $(function() {
			 
			$( "button.btn.btn-primary" ).on("click" , function() {
				
				fncUpdateEdu();
				
			});
		});	
		
		$(function() {
			
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		$( function() {
			
			   $('#eduStartDate').datepicker( { dateFormat : "yy-mm-dd" } );
			   
			   $('#eduEndDate').datepicker( { dateFormat : "yy-mm-dd" } );
			   
		})
		
		function fncUpdateEdu() {
				
			$("form").attr("method" , "POST").attr("action" , "/edu/updateEdu").submit();
		}
		
	</script>
	
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">수업정보수정</h3>
	       <h5 class="text-muted">수업 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<input type="hidden" name="eduNo" value="${edu.eduNo}"/>
		
		  <div class="form-group">
		    <label for="eduName" class="col-sm-offset-1 col-sm-3 control-label">수업명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduName" name="eduName" value="${edu.eduName}">
		      <c:if test="${edu.eduState == 0}">
		      	<input type="radio" name="eduState" value="1"> 판매중
		      </c:if>
		      <c:if test="${edu.eduState == 1}">
		      	<input type="radio" name="eduState" value="1" checked="checked"> 판매중
		      </c:if>
		    </div>
		  </div>
		
		  
		  
		  <div class="form-group">
		    <label for="eduTeacher" class="col-sm-offset-1 col-sm-3 control-label">강사명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduTeacher" name="eduTeacher" value="${edu.eduTeacher}" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduPrice" class="col-sm-offset-1 col-sm-3 control-label">수강료</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduPrice" name="eduPrice"  value="${edu.eduPrice}" placeholder="변경휴대폰번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartDate" class="col-sm-offset-1 col-sm-3 control-label">수업 시작 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduStartDate" name="eduStartDate"  value="${edu.eduStartDate}" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduEndDate" class="col-sm-offset-1 col-sm-3 control-label">수업 종료 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduEndDate" name="eduEndDate"  value="${edu.eduEndDate}" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduDay" class="col-sm-offset-1 col-sm-3 control-label">수업 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduDay" name="eduDay" value="${edu.eduDay}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduMember" class="col-sm-offset-1 col-sm-3 control-label">수업 총 인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduMember" name="eduMember" value="${edu.eduMember}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartTime" class="col-sm-offset-1 col-sm-3 control-label">수업 시작 시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduStartTime" name="eduStartTime" value="${edu.eduStartTime}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduEndTime" class="col-sm-offset-1 col-sm-3 control-label">수업 종료 시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduEndTime" name="eduEndTime" value="${edu.eduEndTime}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduGrade" class="col-sm-offset-1 col-sm-3 control-label">수업 대상학년</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduGrade" name="eduGrade" value="${edu.eduGrade}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduSubject" class="col-sm-offset-1 col-sm-3 control-label">수업 과목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduSubject" name="eduSubject" value="${edu.eduSubject}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduIntro" class="col-sm-offset-1 col-sm-3 control-label">수업 맛보기</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduIntro" name="eduIntro" value="${edu.eduIntro}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>
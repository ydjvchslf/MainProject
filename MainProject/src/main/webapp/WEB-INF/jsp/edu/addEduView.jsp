<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<script type="text/javascript">
	
	   function fncAddProduct(){
	   
	      $('form').attr("method", "POST").attr("action", "/edu/addEdu").submit();
	   }
	   
	   $( function() {
	      
	      $( ".btn:contains('등')").on("click", function() {
	         
	         fncAddProduct();
	      });
	      
	   });
	   
	   $( function() {
	      
	      $( ".btn btn-primary btn:contains('취소')").on("click", function() {
	          
	    	  window.history.back();
	      });
	      
	   });
	   
	   $( function() {
		
		   $('#eduStartDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
		   $('#eduEndDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
	   })
	   
	
	</script>
	</head>
	
	<body>
   	
   	<div class="container">
	
		<h1 class="bg-primary text-center">수 업 등 록</h1>
	
	<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="eduName" class="col-sm-offset-1 col-sm-3 control-label">수 업 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduName" name="eduName" placeholder="수업명을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduTeacher" class="col-sm-offset-1 col-sm-3 control-label">강 사 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduTeacher" name="eduTeacher" placeholder="강사명을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduPrice" class="col-sm-offset-1 col-sm-3 control-label">수 강 료</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduPrice" name="eduPrice" placeholder="수강료를 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartDate" class="col-sm-offset-1 col-sm-3 control-label">수업 시작 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduStartDate" name="eduStartDate" placeholder="수업 시작날짜를 선택해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduEndDate" class="col-sm-offset-1 col-sm-3 control-label">수업 종료 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduEndDate" name="eduEndDate" placeholder="수업 종료날짜를 선택해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduDay" class="col-sm-offset-1 col-sm-3 control-label">수업 날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduDay" name="eduDay" placeholder="수업날짜를 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduMember" class="col-sm-offset-1 col-sm-3 control-label">수업 총 인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduMember" name="eduMember" placeholder="수업 총정원을 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartTime" class="col-sm-offset-1 col-sm-3 control-label">수업 시작 시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduStartTime" name="eduStartTime" placeholder="수업 시작 시간을 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduEndTime" class="col-sm-offset-1 col-sm-3 control-label">수업 종료 시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduEndTime" name="eduEndTime" placeholder="수업 종료 시간을 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduGrade" class="col-sm-offset-1 col-sm-3 control-label">수업 대상학년</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduGrade" name="eduGrade" placeholder="수업 대상학년을 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduSubject" class="col-sm-offset-1 col-sm-3 control-label">수업 과목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduSubject" name="eduSubject" placeholder="수업 과목을 입력해주세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduIntro" class="col-sm-offset-1 col-sm-3 control-label">수업 맛보기</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="eduIntro" name="eduIntro" placeholder="수업 맛보기를 입력해주세요."/>
		    </div>
		  </div>
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" name="add">등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
	
	</form>
	</div>
	
</body>
</html>
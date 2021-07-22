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
            margin-top: 70px;
        }
    </style>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<script type="text/javascript">
	
	   function fncAddProduct(){
	   
	      $('form').attr("method", "POST").attr("action", "/edu/addEdu").submit();
	   }
	   
	   $( function() {
	      
	      $( ".btn:contains('등 록')").on("click", function() {
	         
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
	
		<h1 class="text-center">수 업 등 록</h1>
	
	<form class="form-horizontal" enctype="multipart/form-data">
		
		
		  <div class="form-group">
		    <label for="eduName" class="col-sm-offset-1 col-sm-1 control-label">수 업 명</label>
		    <div class="col-lg-3">
		      <input type="text" class="form-control" id="eduName" name="eduName" placeholder="수업명을 입력해주세요.">
		    </div>
		    <label for="eduTeacher" class="col-sm-1 control-label">강 사 명</label>
		    <div class="col-lg-2">
		      <input type="text" class="form-control" id="eduTeacher" name="eduTeacher" placeholder="강사명을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduPrice" class="col-sm-offset-1 col-sm-1 control-label">수 강 료</label>
		    <div class="col-lg-3">
		      <input type="text" class="form-control" id="eduPrice" name="eduPrice" placeholder="수강료를 입력해주세요.">
		      <span style = "color:red">숫자만 입력해주세요.</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="eduStartDate" class="col-sm-2 control-label">수업 시작 날짜</label>
			    <div class="col-lg-3">
			      <input type="text" class="form-control" id="eduStartDate" name="eduStartDate" placeholder="수업 시작날짜를 선택해주세요."/>
			    </div>
		    <label for="eduEndDate" class="col-sm-2 control-label">수업 종료 날짜</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="eduEndDate" name="eduEndDate" placeholder="수업 종료날짜를 선택해주세요."/>
			    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduDay" class="col-sm-2 control-label">수업 날짜</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduDay" name="eduDay" placeholder="수업날짜를 입력해주세요."/>
		    </div>
		    <label for="eduMember" class="col-sm-2 control-label">수업 총 인원</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduMember" name="eduMember" placeholder="수업 총정원을 입력해주세요."/>
		      <span style = "color:red">숫자만 입력해주세요.</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartTime" class="col-sm-2 control-label">수업 시작 시간</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduStartTime" name="eduStartTime" placeholder="EX) 오전 9시 , AM 9:00"/>
		    </div>
		    <label for="eduEndTime" class="col-sm-2 control-label">수업 종료 시간</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduEndTime" name="eduEndTime" placeholder="EX) 오후 9시 , PM 9:00"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduIntro" class="col-sm-2 control-label">수업 맛보기</label>
		    <div class="col-sm-3">
		      <textarea rows="8" cols="62" name="eduIntro", id="eduIntro">"바깥부분에 값을 넣어준다!</textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduGrade" class="col-sm-2 control-label">수업 대상학년</label>
		    <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="초등">초등
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="중등">중등
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="고1~고2">고1~고2
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="고3">고3
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="N수">N수
			 </label>
		  </div>
		  
		  <div class="form-group">
		  <label for="eduSubject" class="col-sm-2 control-label">수업 과목</label>
		     <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="국어">국어
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="영어">영어
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="수학">수학
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="사회">사회
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="과학">과학
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="제 2외국어">제 2외국어
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="예체능">예체능
			 </label>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="add">등 록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  
	</form>
	</div>
	
</body>
</html>
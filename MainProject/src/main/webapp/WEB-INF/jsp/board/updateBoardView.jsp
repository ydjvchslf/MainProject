<%@page import="com.buyedu.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>

<head>

    	<title>Buy Edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<script type="text/javascript">
		$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn:contains('수')" ).on("click" , function() {
			fncupdateBoard(); 
			});
		});	

		function fncupdateBoard(){
			//Form 유효성 검증
		 	//var name = document.detailForm.prodName.value;
			var title=$("input[name='boardTitle']").val();
			var content=$("textarea[name='boardContent']").val();
			var writer=$("input[name='boardWriter']").val();
			var cateCode=$('input[name="cateCode"]').val();
			var acaWriter=$('input[name="acaWriter"]').val();
			alert(acaWriter)
			alert(cateCode)
			
			if(title == null || title.length <1){
				alert("글 제목을 입력해주세요.");
				return;
			}
		
			if(cateCode =='3'){
				$("form").attr("method" , "POST").attr("action" , "/board/updateBoardAca").submit();
				} else {
				$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();	
				}
		}
			
		$(document).ready(function() {
	    	 $('#summernote').summernote({
	    	        placeholder: 'Hello Bootstrap 4',
	    	        tabsize: 2,
	    	        height: 500,
	    	        lang: "ko-KR",
	    	  	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	    	  	  focus : true,
	    	  	  toolbar: [
	    	  		    // 글꼴 설정
	    	  		    ['fontname', ['fontname']],
	    	  		    // 글자 크기 설정
	    	  		    ['fontsize', ['fontsize']],
	    	  		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    	  		    // 글자색
	    	  		    ['color', ['forecolor','color']],
	    	  		    // 표만들기
	    	  		    ['table', ['table']],
	    	  		    // 글머리 기호, 번호매기기, 문단정렬
	    	  		    ['para', ['ul', 'ol', 'paragraph']],
	    	  		    // 줄간격
	    	  		    ['height', ['height']],
	    	  		    // 그림첨부, 링크만들기, 동영상첨부
	    	  		    ['insert',['picture','link','video']],
	    	  		    // 코드보기, 확대해서보기, 도움말
	    	  		    ['view', ['codeview','fullscreen', 'help']]
	    	  		  ],
	    	  		  // 추가한 글꼴
	    	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	    	  		 // 추가한 폰트사이즈
	    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	    	  		callbacks: {	//이미지 첨부하는 부분
	 	               onImageUpload : function(files) {
	 	                    uploadSummernoteImageFile(files[0],this);
	 	                }
	 	            }
	    	      });
	    });
	    
	    function uploadSummernoteImageFile(file, editor) {
	    	
	        data = new FormData();
	        data.append("file", file);
	        $.ajax({
	            data : data,
	            type : "POST",
	            url : "/board/uploadSummernoteImageFile",
	            contentType : false,
	            processData : false,
	            success : function(data) {
	                //항상 업로드된 파일의 url이 있어야 한다.
	                $(editor).summernote('insertImage', data.url);
	            }
	        , error:function(request,status,error){
	        	alert("code : " + request.status + " / msg : " + request.responseText + " / error : " + error);
	        
	        }
	        });
	        
	    }

	</script>
	
		<style>
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

<body>
 <div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; width:100%;">
	<!-- left 툴바 -->
	<jsp:include page="../common/left.jsp"></jsp:include>
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- 상단 툴바  -->
	         <jsp:include page="../common/toolbar.jsp"></jsp:include> 
				<!-- 게시판 흰색 박스 부분-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
				  <!-- 게시판 title -->
				  <div class="row" id="titlef">
					<c:choose>
					
						<c:when test="${board.cateCode eq '0' }">
						  <h2>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h2>
						</c:when>
						<c:when test="${board.cateCode eq '1' }">
						  <h2>&nbsp;&nbsp;&nbsp;&nbsp;Q&A</h2>
						</c:when>
						<c:when test="${board.cateCode eq '2' }">
						  <h2>&nbsp;&nbsp;&nbsp;&nbsp;자유 게시판</h2>
						</c:when>
						<c:when test="${board.cateCode eq '3' }">
						  <h2>&nbsp;&nbsp;&nbsp;&nbsp;학원 공지사항</h2>
						</c:when>
				
					</c:choose>	
	 			  </div><br>
	
				<form class="form-horizontal">
					<input type="hidden" name="boardNo" value="${board.boardNo}" />
					<input type="hidden" name="cateCode" value="${board.cateCode}" />
					<input type="hidden" name="acaWriter" value="${list}" />
						
				 		<div id="updatebrdview" class="form-group">
						    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label"></label>
						    <div class="col-sm-12">
						      <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
						    </div>
						</div>
							
					 	<div class="form-group">
						    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label"></label>
						    <div class="col-sm-12" height=100px>
						      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="boardContent"
										placeholder="내용" style="resize: none;">${board.boardContent}</textarea>
						    </div>
						</div>
						
						<div class="form-group">
						    <div class="col-sm-offset-4  col-sm-4 text-center">
						      &nbsp;&nbsp;<button type="button" class="btn btn-primary"  >수&nbsp;정</button>
							  &nbsp;<a class="btn btn-primary" href="#" onClick="history.back()" role="button">취&nbsp;소</a>
						    </div>
						</div>
						  <div id="summernote"></div>
					  </form>
		     </div> <!-- 게시판 흰색 부분  -->  
		   </div> <!-- container-fluid -->
		  </div> <!-- content -->
	</div> <!-- wrapper -->
	

</body>
</html>
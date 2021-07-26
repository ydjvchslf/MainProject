<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<head>
  <title>게시글 쓰기</title>
 
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<script type="text/javascript">
//============= "가입"  Event 연결 =============
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('등')" ).on("click" , function() {
		fncAddBoard();
	});
});	
//============= "취소"  Event 처리 및  연결 =============

function fncAddBoard(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	var title= $('input[name="boardTitle"]').val();
	var content=$('textarea[name="boardContent"]').val();
	var boardWriter=$('input[name="boardWriter"]').val();
	var cateCode=$('input[name="cateCode"]').val();
	var acaWriter=$('input[name="acaWriter"]').val();
	alert(acaWriter)
	
	if(title == null || title.length <1){
		alert("글 제목을 입력해주세요.");
		return;
	}
	$("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
}
</script>

<style>
	#addButton{
	position : absolute;
	top : 86%;
	right : 42.3%;
	}
</style>

<body>
	
	<div class="card shadow mb-4">
		<!-- 게시글 작성 title -->
		<div class="card-header py-3">
		    <h3 class="m-0 font-weight-bold text-primary">게시글 작성</h3>
		</div>
		
	<!-- 게시글 작성 form -->
	<div>
	<form>
		<input type="hidden" name="boardWriter" value="${user.userNo}" />
		<input type="hidden" name="cateCode" value="${board.cateCode}" />
		<input type="hidden" name="acaWriter" value="${board.acaWriter}" />
			search.cateCode : ${search.cateCode}
			board.cateCode : ${board.cateCode}
			board.acaWriter : ${board.acaWriter}
		<div id="addbrdview" class="form-group">
		    <label for="boardTitle" class="col-md-12 text-right"></label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요.">
		    </div>
		</div>
		
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-md-12 text-right"></label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="boardContent"
						placeholder="내용" style="resize: none"></textarea>
		    </div>
		</div>
		<div id="summernote"></div>
	</form>
	</div>	
	</div>
		
		<div class="form-group">
		    <div class="col-md-12 text-right" id="addButton">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >등 &nbsp;록</button>
			  &nbsp;<a class="btn btn-default" href="/board/listBoard" role="button">취&nbsp;소</a>
		 	</div>
		</div>

  
  <script>
    $(document).ready(function() {
    	 $('#summernote').summernote({
    	        placeholder: '내용을 입력해주세요.',
    	        tabsize: 2,
    	        height: 500,
    	        lang: "ko-KR",
    	        maximumImageFileSize : 20 * 1024 * 1024,
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
    
</body>
</html>
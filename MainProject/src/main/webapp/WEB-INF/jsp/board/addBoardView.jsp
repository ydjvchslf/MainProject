<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<head>

  <title>Summernote</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	
function fncAddBoard(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	var title= $('input[name="boardTitle"]').val();
	alert(title)
	var content=$('textarea[name="boardContent"]').val();
	alert(content)
	
	/* var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value; */
	//var target = document.getElementById("cate");
	//var cateName = target.options[target.selectedIndex].text;
	//var cateName = $("#cate option:checked").text();
	//console.log('name : ' + cateName)
	//document.getElementById("cateName").value = cateName;
	

	
	$("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
}
</script>

<body>

	
   	</br></br></br>
   	
   	<div class="container">
	
		<div class="page-header text-default"> 
		
		<h3 style="text-align:center;">글쓰기</h3> 
		</div>
	<br/><br/>
	
	<div class="container-fluid">
	<form class="form-horizontal">
	<input type="hidden" name="cateName" id="cateName" value="" />
		
	 	<div id="addbrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요.">
		    </div>
		</div>
		
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="boardContent"
						placeholder="내용" style="resize: none"></textarea>
		    </div>
		</div>
		
</form>
		
		</div>	
				
		</div>
		
	 	
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >등 &nbsp;록</button>
			  &nbsp;<a class="btn btn-default" href="#" role="button">취&nbsp;소</a>
		    </div>
		
		</div>
		
	</div>

  <div id="summernote"></div>
  <script>
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
    	  	  
           });
    });	 
      
    	 </script>
    
</body>
</html>
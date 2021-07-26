<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<head>

  <title>게시글 쓰기</title>
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
<form name = "selectchoose">
         <h2><font color= red> 신고 사유를 입력하세요 </font></h2>
         <select name="color">
		    <input type="radio" name="fruit" value="0"/>사과
			<input type="radio" name="fruit" value="1"/>딸기
			<input type="radio" name="fruit" value="2"/>레몬
			<input type="radio" name="fruit" value="3"/>망고
			<input type="radio" name="fruit" value="4"/>메론
         </select>
         <button onclick="test()">체크된 객체 value 가져오기</button>
</form>   
  <script>
  function test() {
      var obj_length = document.getElementsByName("fruit").length;

      for (var i=0; i<obj_length; i++) {
          if (document.getElementsByName("fruit")[i].checked == true) {
              alert(document.getElementsByName("fruit")[i].value);
          }
      }
  }
      
    	 </script>
    
</body>
</html>
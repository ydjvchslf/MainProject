<%@page import="com.buyedu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 	<style>
		#cmtcontent{
	      width : 100%;
	      heigt : 200px;
	    }
	    
	    #commentInsert{
	      width : 100px;
	      height : 34px;
	    }
	    
	    #buttons{
	      text-align : right;
	    }
	    
	    #commentwriterpr{
	      color : #F4A403;
	    }
	    
	    #commentDate{
	      color : black;
	    }
	    
	    #upbu:link { color: blue; text-decoration: none;}
 		#upbu:visited { color: blue; text-decoration: none;}
 		#upbu:hover { color: red; text-decoration: underline;}
	    
	   </style>
 </br></br>
 <body>
 	  <div class="container-fluid">
       <div style="font-size:16px;"> 댓글 <span class="commentCount" style="font-size:16px;"></span>
        <form name="commentInsertForm" onsubmit="return false">
            <div class="input-group">
               <input type="hidden" name="boardNo" value="${board.boardNo}"/>
               <input type="textarea" class="form-control" onkeyup="enterEvent()" id="cmtcontent" name="content" placeholder="내용을 입력하세요." >
               <span class="input-group-btn">
                    <button id="commentInsert" class="btn btn-primary" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
              </br></br>
        </form>
    </div>
    
    <div class="container-fluid">
    	
    
        <div class="commentList"></div>
    </div>
</div>

	
<script>
var boardNo = '${board.boardNo}'; //게시글 번호



$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
//댓글 목록 

function commentList(){
    $.ajax({
        url : '/board/json/listComment/'+boardNo,
        method : 'GET',
        dataType : "json",
        headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
        success : function(data, status){

            var a =''; 
            var cnt = data[0].commentCount;
           
			var sessionId = "<%=((User)session.getAttribute("user")).getUserNo() %>"
            
            
            $(".commentCount").html(cnt);
            console.log(cnt)
       		
            $.each(data, function(key, value){ 
            	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px; font-size:16px">';
               
                a += '<div id="commentwriterpr" class="commentInfo'+value.COMMENT_NO+'">'+value.EMAIL;
                a += '&nbsp;&nbsp;&nbsp;&nbsp;'
                
                a += '<span id="commentDate" class="commentDate'+value.COMMENT_NO+'">'+value.COMMENT_DATE+'</span></div>';
                <fmt:formatDate value="${COMMENT_DATE}" var="date" pattern="yyyyMMdd" />
                a += '<div id="buttons">'
                
                if (sessionId == value.COMMENT_WRITER){
                a += '<a id="upbu" onclick="commentUpdate('+value.COMMENT_NO+',\''+value.COMMENT_CONTENT+'\');"> 수정 </a>';
                a += '<a id="upbu" onclick="commentDelete('+value.COMMENT_NO+');"> 삭제 </a>';
                } 
                if (sessionId != value.COMMENT_WRITER){
                a += '<a id="upbu" onclick="commentComplain('+value.COMMENT_NO+');"> 신고 </a>';
                }
        		a += '</div>'
                a += '<div class="commentContent'+value.COMMENT_NO+'"> <p> '+value.COMMENT_CONTENT+'</p>';
                a += '</div></div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}

 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/board/json/addComment',
        type : 'post',
        data : insertData,
        success : function(data){
        	console.log(data)
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
                
            }
        }
    });
}

function enterEvent(){
	if(window.event.keyCode == 13){
		var insertData = $('[name=commentInsertForm]').serialize(); 
		commentInsert(insertData);
	}
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(commentNo, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="cmtcontent" name="content_'+commentNo+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-primary" id="commentInsert" type="button" onclick="commentUpdateProc('+commentNo+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+commentNo).html(a);
}
 
//댓글 수정
function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    
    $.ajax({
        url : '/board/json/updateComment',
        type : 'post',
        data : {'content' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 1) commentList(boardNo); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(commentNo){
	if(confirm('삭제하시겠습니까?')){
		
	    $.ajax({
	    	
	        url : '/board/json/deleteComment/'+commentNo,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(boardNo);
	            location.reload();
	          //댓글 삭제후 목록 출력 
	        }
	    });
	}else{
		return false;
	}
}

// 댓글 신고
function commentComplain(commentNo){
	if(confirm('신고 하시겠습니까?')){
	    $.ajax({
	        url : '/complain/json/addCommentComplain/'+boardNo,
	        type : 'POST',
	        data : {'reason' : reason, 'commentNo' : commentNo},
	        success : function(data){
	        	alert("신고가 완료 되었습니다.")
	            location.reload(); 
	          //댓글 삭제후 목록 출력 
	        }
	    });
	}
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


 
</body>
</html>

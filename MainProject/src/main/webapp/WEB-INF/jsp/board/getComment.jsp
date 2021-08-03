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
       <div style="font-size:16px;"> ��� <span class="commentCount" style="font-size:16px;"></span>
        <form name="commentInsertForm" onsubmit="return false">
            <div class="input-group">
               <input type="hidden" name="boardNo" value="${board.boardNo}"/>
               <input type="textarea" class="form-control" onkeyup="enterEvent()" id="cmtcontent" name="content" placeholder="������ �Է��ϼ���." >
               <span class="input-group-btn">
                    <button id="commentInsert" class="btn btn-primary" type="button" name="commentInsertBtn">���</button>
               </span>
              </div>
              </br></br>
        </form>
    </div>
    
    <div class="container-fluid">
    	
    
        <div class="commentList"></div>
    </div>
</div>

<!-- �Ű� ��� �˾� -->     
		    <div class="modal fade" id="complainCmd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">��� �Ű� ������ ������ �ּ���</h4>
						      </div>
						      <div class="modal-body">
						      <!-- ��� ���� -->
						        <form>
						            <div class="row">
									  
									  <div class="col-sm-5" align="left" style="padding-left: 50;">
									  	<br/>
									  	<input type="radio" id="c1" name="complainc" value="1">&nbsp;<label for="c1"> �弳 </label>
									  	<br/>
									  	<input type="radio" id="c2" name="complainc" value="2">&nbsp;<label for="c2"> ���� </label>
									  	<br/>
									  	<input type="radio" id="c3" name="complainc" value="3">&nbsp;<label for="c3"> ȫ��, ���� </label>
									  	<br/>
									  	<input type="radio" id="c4" name="complainc" value="4">&nbsp;<label for="c4"> ������ </label>
									  	<br/>
									  	<input type="radio" id="c5" name="complainc" value="5">&nbsp;<label for="c5"> ��Ÿ </label>
									  	<br/>
									  </div>
								
									</div>
								</form>
								
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="okC" class="btn btn-primary">�Ű� �ϱ�</button>
						        <button type="button" id="modalClose" class="btn btn-default" data-dismiss="modal">���</button>
						      </div>
						    </div>
						  </div>
						</div>
				
		    <button class="btn btn-primary" id="complainButton" data-toggle="modal" data-target="#complainBrd">�Ű� ���</button>
		    <div class="modal fade" id="complainBrd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title" id="myModalLabel">�̹� �Ű� �� �Խñ� �Դϴ�.</h4>
						      </div>
						      <div class="modal-body" align="center">
						      <!-- ��� ���� -->
									�Ű� ���� �Ͻðڽ��ϱ�?
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="deleteComplain" class="btn btn-primary">�Ű� ��� �ϱ�</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
						      </div>
						    </div>
						  </div>
						</div>
			
	
<script>
var boardNo = '${board.boardNo}'; //�Խñ� ��ȣ

$('[name=commentInsertBtn]').click(function(){ //��� ��� ��ư Ŭ���� 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
});
 
//��� ��� 

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
                a += '<a id="upbu" onclick="commentUpdate('+value.COMMENT_NO+',\''+value.COMMENT_CONTENT+'\');"> ���� </a>';
                a += '<a id="upbu" onclick="commentDelete('+value.COMMENT_NO+');"> ���� </a>';
                } 
                if (sessionId != value.COMMENT_WRITER){
                a += '<a id="upbu" data-toggle="modal" href="#complainCmd" onclick="getNo('+value.COMMENT_NO+')")> �Ű� </a>';
                
                }
        		a += '</div>'
                a += '<div class="commentContent'+value.COMMENT_NO+'"> <p> '+value.COMMENT_CONTENT+'</p>';
                a += '</div></div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}

 
//��� ���
function commentInsert(insertData){
    $.ajax({
        url : '/board/json/addComment',
        type : 'post',
        data : insertData,
        success : function(data){
        	console.log(data)
            if(data == 1) {
                commentList(); //��� �ۼ� �� ��� ��� reload
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
 
//��� ���� - ��� ���� ����� input ������ ���� 
function commentUpdate(commentNo, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="cmtcontent" name="content_'+commentNo+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-primary" id="commentInsert" type="button" onclick="commentUpdateProc('+commentNo+');">����</button> </span>';
    a += '</div>';
    
    $('.commentContent'+commentNo).html(a);
}
 
//��� ����
function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    
    $.ajax({
        url : '/board/json/updateComment',
        type : 'post',
        data : {'content' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 1) commentList(boardNo); //��� ������ ��� ��� 
        }
    });
}
 
//��� ���� 
function commentDelete(commentNo){
	if(confirm('�����Ͻðڽ��ϱ�?')){
		
	    $.ajax({
	    	
	        url : '/board/json/deleteComment/'+commentNo,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(boardNo);
	            location.reload();
	          //��� ������ ��� ��� 
	        }
	    });
	}else{
		return false;
	}
}

let commentNo = "";

function getNo(test){
	commentNo = test
}

// ��� �Ű�
$(function() {
	$('#okC').on('click', function(){
		console.log(commentNo)
		var reason = $("input[name='complainc']:checked").val();
		if(confirm('�Ű� �Ͻðڽ��ϱ�?')){	
			$.ajax({
				 url : '/complain/json/addCommentComplain/'+boardNo,
			     type : 'post',
			     data : {'boardNo' : boardNo, 'reason' : reason, 'commentNo' : commentNo},
			     success : function(res){
			    	 
			    	 if(res==0){
			    		 location.reload();
							alert("�Ű� �Ϸ� �Ǿ����ϴ�.");
			    	 }else{
			    		 location.reload();
			    		 alert("�̹� �Ű��� ����Դϴ�.");
			    	 }
			     }
			});
		}
	})
})
 
 
 
 
$(document).ready(function(){
    commentList(); //������ �ε��� ��� ��� ��� 
});
 
 
 
</script>


 
</body>
</html>

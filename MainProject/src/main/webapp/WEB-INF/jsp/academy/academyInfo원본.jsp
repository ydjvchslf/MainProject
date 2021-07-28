<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/css/style.css">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		
		<style>
		    .btn{  <!-- 모든 버튼에대한 css설정 -->
		      text-decoration: none;
		      font-size:20px;
		      font-weight:bolder;
		      color:white;
		      padding:5px 10px 5px 10px;
		      margin:20px;
		      display:inline-block;
		      border-radius: 50px;
		      transition:all 0.1s;
		      font-family: 'Nanum Pen Script', cursive;
		    }
		    .btn:active{
		      transform: translateY(3px);
		    }
		    .btn.blue{
		      background-color: #1f75d9;
		      border-bottom:5px solid #165195;
		    }
		    .btn.blue:active{
		      border-bottom:2px solid #165195;
		    }
		    
		    #header{
				vertical-align : top;
				font-size : 0px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}

 		</style>

	<title>Academy Info</title>	
    </head>
    <body>

        <div id="layoutSidenav" class="wrapper d-flex align-items-stretch">
        
        <jsp:include page="../common/left.jsp"></jsp:include>
        
            <!-- 여기가 가운데 들어갈 화면 (바뀌는 곳) -->
            <div id="layoutSidenav_content" class="p-4 p-md-5">
            
            <div id="academytitle"></div>
            
            <jsp:include page="../common/toolbar.jsp"></jsp:include>  
            
                <main>
                    <div class="container-fluid px-4">
                        <div id="academyInfo" class="card-body"></div>
        
            <div class="row">

		    <div class="col-md-6 text-left" id="header">
		    	<h3>학원 공지사항</h3>
		    </div>
		    
		    <div class="col-md-6 text-right" id="searchPosition">
			    <form class="form-inline" >
			    <input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
			    
			    <div class="form-group">
				    <select class="form-control" id="searchConditionb" name="searchConditionb" style="width:120px;">
						<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>제목</option>
						<option value="1"  ${ ! empty search.searchConditionb && search.searchConditionb==1 ? "selected" : "" }>내용</option>
					</select>
				 </div>
				  
				 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
<br/><br/>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover" id="boardTable">
      
        <thead id="tableHead">
          <tr>
            <th width="100" align="center">No</th>
            <th width="400" align="center" >게시글제목</th>
            <th width="200" align="left">작성일자</th>
            <th width="200" align="center">조회수</th>
            
        </thead>
		
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${listb}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*5}</td>
	
		<td id="listtable" align="left"><a href="/board/getBoardAca?boardNo=${board.boardNo}&cateCode=3&academyCode=${academy.academyCode}">${board.boardTitle} (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
					  
			  
			
			  <td id="listtable" align="left">
			  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
			  <td id="listtable" align="left">${board.viewCnt}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  
	  userNo : ${user.userNo}    
	  아카데미 코드 : ${academy.academyCode}
		<input type="hidden" name="isMine" value="${search.isMine}" />		
		<input type="hidden" name="acaWriter" value="${academy.academyCode}" />	  
		  
			<c:if test="${user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 
		     	 <a href="/board/addBoard?cateCode=3&academyCode=${academy.academyCode}">글쓰기</a></button>
		    	</div> 
			</c:if>
		</div>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	 
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
	<div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                   		 </main>
                    </div>
                </div>

	
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
		var academyCode = '${academy.academyCode}';
		var role = '${user.role}';
		var academyInfo = {};
		
		function getAcademyInfo(){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 academyInfo = data;
					 
					 var a = ''
						 a += '<ul style="list-style: none;"><li style="float: left;">'
						 a += '<img alt="학생수" src="/image/studentcount.png" height="20">'
						 a += '<span>'+ data.count+'명 &nbsp;&nbsp;&nbsp;</span></li>'
						 a += '<li style="float: left;">'
						 a += '<img alt="강좌수" src="/image/educount.png" height="20">'
						 a += '<span>'+ data.count2+'개 </span></li></ul>'
						 
					 	 a += '<br/>학원 번호 : ' + data.academyPhone
				 		 a += '<br/>학원 주소 : ' + data.academyAddr
				 		 a += '<br/>지역구 : ' + data.academyArea
				 	 	 a += '<div id="AcademyIntro" style="white-space: pre;">'
				 	 	 a += '학원 소개 : <br/>' + data.academyIntro
				 	 	 
				 	 if(role == 'academy'){
				 	 	 a += '<a class="btn blue" onclick="updateIntro(\''+data.academyCode+'\')"> 수 정 </a>'
				 	 }
				 		 a += '</div>'
				 		 a += '<div id="AcademyHistory" style="white-space: pre;">'
				 		 a += '학원 실적 : <br/>' + data.academyHistory
				 		 
				 	if(role == 'academy'){
						 a += '<a class="btn blue" onclick="updateHistory(\''+data.academyCode+'\')"> 수 정 </a>'
				 	}
						 a += '</div>'
						 
				 					
					var b = '';
						b += '<div id="header"><h1 class="mt-4">'+data.academyName+'</h1></div>'
						
				            	
						 
					$("#academyInfo").html(a);
					$("#academytitle").html(b);
						 
				 }							
			});		
		}
		
		// 소개글 텍스트 area 변경
		function updateIntro(academyCode){
		    var intro ='';
		    
		    alert("코드 = " + academyCode + "소개글 = "+academyInfo.academyIntro);
		    
		    	intro += '<div id="AcademyIntro">';
		    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="100">'+academyInfo.academyIntro+'</textarea>'
		   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveIntro(\''+academyCode+'\');">저장</button> </span>';
		   	 	intro += '</div>';
		    
		    $('#AcademyIntro').html(intro);
		    
		}
		 
		// 소개글 수정
		function saveIntro(academyCode){
		    var updateIntro = $('[name=academy_'+academyCode+']').val();
		    
		    $.ajax({
		        url : '/academy/json/updateIntro/'+academyCode,
		        type : 'POST',
		        data : {'academyCode' : academyCode, 'updateIntro' : updateIntro},
		        success : function(data){
		        	alert("수정 완료!");
		        	getAcademyInfo();
		        }
		    });
		}
		
		// 실적글 텍스트 area 변경
		function updateHistory(academyCode){
		    var intro ='';
		    
		    alert("코드 = " + academyCode + "실적글 = "+academyInfo.academyHistory);
		    
		    	intro += '<div id="AcademyHistory">';
		    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="100">'+academyInfo.academyHistory+'</textarea>'
		   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveHistory(\''+academyCode+'\');">저장</button> </span>';
		   	 	intro += '</div>';
		    
		    $('#AcademyHistory').html(intro);
		    
		}
		 
		// 실적글 수정
		function saveHistory(academyCode){
		    var updateHistory = $('[name=academy_'+academyCode+']').val();
		    
		    $.ajax({
		        url : '/academy/json/updateHistory/'+academyCode,
		        type : 'POST',
		        data : {'academyCode' : academyCode, 'updateHistory' : updateHistory},
		        success : function(data){
		        	alert("수정 완료!");
		        	getAcademyInfo();
		        }
		    });
		}

		$(document).ready(function(){
			getAcademyInfo(); 
		});
		
		// 학원 공지사항
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var acaWriter=$('input[name="acaWriter"]').val();
				$("form").attr("method" , "POST").attr("action" , "/academy/academyInfo?academyCode="+acaWriter).submit();
		}
		
		function enterEvent(){
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		}
		
		$(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
	
		</script>
        
    </body>
</html>
    
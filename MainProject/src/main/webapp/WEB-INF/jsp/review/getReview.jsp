<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<title>getReview.jsp</title>
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	 <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>
	
	 
	<script type="text/javascript">
	var academyCode = '${academyCode}'
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn:contains('삭')" ).on("click" , function() {
				 if(confirm("삭제하시겠습니까?")==true){
					 
				 
				 var reviewNo = $("div").find('button#delete').val();
					self.location = "/review/deleteReview?reviewNo="+reviewNo+"&academyCode=${academyCode}"
				 }else{
					 return false;
				 }
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( ".btn:contains('신')" ).on("click" , function() {
					fncaddComplainReview();
				});
			});	
		
		  /* $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('수')" ).on("click" , function() {
					 var reviewNo = $("div").find('button#update').val();
						self.location = "/review/updateReview?reviewNo="+reviewNo+"&academyCode=${academyCode}"
					});
			}); */
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".btn:contains('뒤')" ).on("click" , function() {
					 var reviewNo = $("div").find('button#back').val();
					 var academyCode=$("input[name='academyCode']").val();
						self.location = "/review/listReview?academyCode="+academyCode
					});
			});
		 
		 function getAcademyInfo(){
				$.ajax({
					 url : '/academy/json/getacademyInfo/'+academyCode,
				     method : 'GET',
				     dataType : "json",
					 success : function(data){
						 console.log(data);
						 academyInfo = data;
							 
						var b = '';
							b += '<div id="title" class="col-md-4" style="">'+data.academyName+'</div>'
							b += '<div id="count" class="col-md-5" > 학생 수 : '+data.count+'개 &nbsp;&nbsp; 수업 수 : '+data.count2+'명</div>'
					        b += '<div id="phone" class="col-md-3" align="right"> <img alt="전화번호" src="/image/phone_icon.png" height="20">&nbsp;'+data.academyPhone+'</div>'
							 
						$("#academytitle").html(b);
							 
					 }							
				});		
			}
			
			
			$(document).ready(function(){
				getAcademyInfo(); 
			});
		
		
	</script>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        

	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
			body{
				overflow-x:hidden; overflow-y:visible;
				font-family: 'ChosunGu';
			}
	
		    #title{
				vertical-align : top;
				font-size : 50px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			#count{
				vertical-align : bottom;
				font-size : 20px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			#phone{
				vertical-align : right;
				font-size : 15px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			#panel-color{
				background-color: black !important;
			}
			
			
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
 
</style>

<title>getReivew.jsp</title>
<style type="text/css">
 
html,body {height:100%,margin:0}
.mw {position:fixed;_position:absolute;top:0;left:0;width:100%;height:100%;display:none;}
.mw .bg {position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
.mw .fg {position:absolute;top:50%;left:50%;width:360px;height:160px;margin:-100px 0 0 -200px;padding:20px;border:3px solid #ccc;background:#fff;}
 
 $color1: #f4f4f4;
$color2: #3197EE;

body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}

.radio {
  margin: 0.5rem;
  input[type="radio"] {
    position: absolute;
    opacity: 0;
    + .radio-label {
      &:before {
        content: '';
        background: $color1;
        border-radius: 100%;
        border: 1px solid darken($color1, 25%);
        display: inline-block;
        width: 1.4em;
        height: 1.4em;
        position: relative;
        top: -0.2em;
        margin-right: 1em; 
        vertical-align: top;
        cursor: pointer;
        text-align: center;
        transition: all 250ms ease;
      }
    }
    &:checked {
      + .radio-label {
        &:before {
          background-color: $color2;
          box-shadow: inset 0 0 0 4px $color1;
        }
      }
    }
    &:focus {
      + .radio-label {
        &:before {
          outline: none;
          border-color: $color2;
        }
      }
    }
    &:disabled {
      + .radio-label {
        &:before {
          box-shadow: inset 0 0 0 4px $color1;
          border-color: darken($color1, 25%);
          background: darken($color1, 25%);
        }
      }
    }
    + .radio-label {
      &:empty {
        &:before {
          margin-right: 0;
        }
      }
    }
  }
}
 
</style>
</head>

<body>

	<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">




					<!-- 학원 이름, 전화번호 -->
					<div id="title" class="row" >후기상세보기</div>
					
	

	<div class="container">
	
<br/><br/><br/><br/>

<br/>
	<div class="container">
      		<div class="row">
				
		<div class="col-md-1">
		</div>
							 <div class="row-fruid" style="float: left; width: 50%; padding:10px;">
								<div class="card shadow mb-4">
                                <div id="card_box" class="card-header bg-dark py-3">
                                    <h3 class="m-12 font-weight-bold text-warning">${review.reviewTitle }</h3>
                                    <h5 class="text-warning"> 작성자 ${review.reviewWriter.email }</h5> <h5 class="text-warning">작성일자 ${review.reviewDate }</h5>
                                   
                                </div>
                                <!-- 카드 바디시작 -->
                                <div class="card-body">
                             <div class="form-group">
	 <h3 class="m-12 font-weight-bold text">${review.reviewContent }</h3>
	   <c:if test="${userNo eq review.reviewWriter.userNo }">
		 <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button class="btn btn-dark" id="delete" value="${review.reviewNo}"><h6 class="text-warning">삭&nbsp;제</h6></button>
			&nbsp;
			  <button class="btn btn-dark" id="back" ><h6 class="text-warning">뒤&nbsp;로</h6></button>
		</div>
		</c:if>
		
	
	
	
	<c:if test="${userNo ne review.reviewWriter.userNo }">
   <div class="col-sm-offset-4  col-sm-4 text-center">

		<button class="btn btn-dark" id="back" >뒤&nbsp;로</button>
	</c:if>
		</div>
		
	</div>
                                </div>
                                <!-- 카드바디 끝 -->
                                
                                </div>
                                </div>
		<!-- On rows -->
<!--  		<tr height="50" >
			<td id="gettable" class="success" width="280"><b>&nbsp;&nbsp; 제목 </b></td>
			<td id="content" width="825">&nbsp;&nbsp;${review.reviewTitle}</td>
		</tr>
		-->
		
		<%-- <tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;</b></td>
			<img src = "/images/uploadFiles/${ board.fileName }"/>
			<td width="825">&nbsp;&nbsp;</td>
		</tr>	 --%>	
		
		<tr height="50">
			<td width="280"></td>
			<td width="825"></td>
		</tr>	
	</table>
	</div>
	</div>
    </div>


 <input type="hidden" name="academyCode" value="${academyCode}" /> 
	 
	

</div>
</div>
</div>
	</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Academy Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
	
	<style>
	
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
					<div id="academytitle" class="row" > </div>
					
					
					
					<!-- 학원 정보 -->
					<div id="academyInfo" class="row" style="margin-top: 30px;"></div>	
					
					<div class="row" style="margin-top: 30px;">
						<div class="col-md-12" >
							<div id="map" style="width:auto;height:400px; border:3px solid gold; "></div>
						</div>
					</div>
					
					
 
						    
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${academy.academyLat}, ${academy.academyLng}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커 이미지의 이미지 주소입니다
	var imageSrc =  "/image/marker2.png";
	
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
	var latlng = new kakao.maps.LatLng(${academy.academyLat},${academy.academyLng});
	
	// 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: latlng, // 마커를 표시할 위치
        image : markerImage // 마커 이미지 
    }); 
	
	
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
					 
				 	 a += '<div class="col-sm-6" id="AcademyIntro">'
				 	 a += '<div class="panel panel-default">'
				 	 a += '<div id="panel-color" class="panel-heading">'
			 	 	 a += '<h3 class="panel-title">학원 소개</h3>'
			 	 if(role == 'academy'){	 
			 	 	 a += '<h3 class="m-0 font-weight-bold text-primary" align="right"><a onclick="updateIntro(\''+data.academyCode+'\')"><img src="/image/modify.png" height="30"></a></h3>' 
			 	 }
			 	 	 a += '</div>'
			 	 	 a += '<div class="panel-body" style="white-space: pre; height: 200px; overflow: auto;">'
			 	 	 a += data.academyIntro +'</div>'
			 		 a += '</div></div>'
			 		 
			 		 
			 		 a += '<div class="col-sm-6" id="AcademyHistory">'
			 		 a += '<div class="panel panel-default">'
					 a += '<div id="panel-color" class="panel-heading">'
			 		 a += '<h3 class="panel-title">학원 실적</h3>'
			 	if(role == 'academy'){
			 		 a += '<h3 class="m-0 font-weight-bold text-primary" align="right"><a onclick="updateHistory(\''+data.academyCode+'\')"><img src="/image/modify.png" height="30"></a></h3>'
			 	}
			 		 a += '</div>' 
				 	 a += '<div class="panel-body" style="white-space: pre; height: 200px; overflow: auto;">'
			 		 a += data.academyHistory+'</div>'
					 a += '</div></div>'
						
					 
				var b = '';
					b += '<div id="title" class="col-md-3" style="">'+data.academyName+'</div>'
					b += '<div id="count" class="col-md-6" > 학생 수 : '+data.count+'개 &nbsp;&nbsp; 수업 수 : '+data.count2+'명</div>'
			        b += '<div id="phone" class="col-md-3" > <img alt="전화번호" src="/image/phone_icon.png" height="20">&nbsp;'+data.academyPhone+'</div>'
					 
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
	    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="40">'+academyInfo.academyIntro+'</textarea>'
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
	    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="40">'+academyInfo.academyHistory+'</textarea>'
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
	<!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
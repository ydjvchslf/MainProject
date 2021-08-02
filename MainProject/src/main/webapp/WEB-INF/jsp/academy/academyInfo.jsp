<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy!edu</title>
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
	
	.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px; 
    border-top-right-radius: 0px; 
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
	
	body{
		overflow-x:hidden; overflow-y:visible;
		font-family: 'ChosunGu';
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
	
	#chatBtn{
		position: relative;
		top: -2%;
		right: 0%;
		z-index: 1;
	}
	
	.half{
	background: linear-gradient(to top, #FFD889 50%, transparent 50%);
	}
			
	</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC;">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid">
	        	 
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
					
					<div class="col-sm-2"> <!-- 3 부분 -->
					</div>
					<div class="col-sm-8"> <!-- 본문 부분 -->
				
						<div class="row" id="chatBtn">
							<div align="right" class="col-md-12">
								<br>
								<button id="chat" class="btn btn-primary" style="background-color:#FFCA77;" align="left">Academy Talk</button>
							</div>
						</div>
					
						<!-- 학원 이름, 전화번호 -->
						<div id="academytitle" class="row" style="margin-top: -55px"></div>
						
						
						<!-- 학원 정보 -->
						<div id="academyInfo" class="row" style="margin-top: 30px;"></div>
							<br>
							<div style="font-size: 15px;"><span class="half"><strong>오시는 길</strong></span></div>
						<div class="row" style="margin-top: 30px;">
							<div class="col-md-12" >
								<div id="map" style="width:auto;height:400px;"></div>
							</div>
						</div>
					
					</div>
					<div class="col-sm-2"> <!-- 3 부분 -->
					</div>
					
						    
				</div>
	      	</div>
	      	
       </div><!-- fluid -->
       
       <!--footer 자리 -->
       <jsp:include page="../common/footer.jsp"></jsp:include> 
      
	</div><!-- content -->
	
	</div>
	
	
	<script>
	
	$('#chat').on('click', function(){
		var url = "https://academy-chat.herokuapp.com/chat.html?username=${user.name}&room=${academy.academyCode}&roomname=${academy.academyName}";
		var name = "Chat"
		var option = "width=800, height=600, location=no,toolbars=no,status=no"
		window.open(url,name,option);
	})
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${academy.academyLat}, ${academy.academyLng}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커 이미지의 이미지 주소입니다
	var imageSrc =  "/image/marker2.png";
	
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35, 35); 
    
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
				 	 a += '<div class="panel" style="border:1px solid #ECECEC;">'
				 	 a += '<div class="panel-heading" style="background-color:#ECECEC;">'
			 	 	 a += '<h3 class="panel-title" id="titlef" style="font-size: 23px;">학원 소개</h3>'
			 	 if(role == 'academy'){	 
			 	 	 a += '<h3 class="m-0 font-weight-bold text-primary" align="right"><a onclick="updateIntro(\''+data.academyCode+'\')"><img src="/image/modify.png" height="30"></a></h3>' 
			 	 }
			 	 	 a += '</div>'
			 	 	 a += '<div class="panel-body" style="white-space: pre; height: 200px; overflow: auto; font-size: 15px;">'
			 	 	 a += data.academyIntro +'</div>'
			 		 a += '</div></div>'
			 		 
			 		 
			 		 a += '<div class="col-sm-6" id="AcademyHistory">'
			 		 a += '<div class="panel" style="border:1px solid #ECECEC;">'
					 a += '<div class="panel-heading" style="background-color:#ECECEC;">'
			 		 a += '<h3 class="panel-title" id="titlef" style="font-size: 23px;">학원 실적</h3>'
			 	if(role == 'academy'){
			 		 a += '<h3 class="m-0 font-weight-bold text-primary" align="right"><a onclick="updateHistory(\''+data.academyCode+'\')"><img src="/image/modify.png" height="30"></a></h3>'
			 	}
			 		 a += '</div>' 
				 	 a += '<div class="panel-body" style="white-space: pre; height: 200px; overflow: auto; font-size: 15px;">'
			 		 a += data.academyHistory+'</div>'
					 a += '</div></div>'
						
					 
				var b = '';
					b += '<div id="titlef" class="col-md-12" style="font-size: 38px;" align="center">'+data.academyName+'</div>'
					b += '<div></div>'
					b += '<div class="col-md-6" style="font-size: 15px;" align="left"><strong> 학생 수 : '+data.count+'명 &nbsp;&nbsp; 수업 수 : '+data.count2+'개 </strong></div>'
			        b += '<div class="col-md-6" align="right"><strong><img alt="전화번호" src="/image/phone_icon.png" height="20">&nbsp;'+data.academyPhone+'</strong></div>'
					 
				$("#academyInfo").html(a);
				$("#academytitle").html(b);
			 }							
		});		
	}
	
	// 소개글 텍스트 area 변경
	function updateIntro(academyCode){
	    var intro ='';
	    
	    	intro += '<div class="col-sm-12" id="AcademyIntro">';
	    	intro += '<div class="panel" style="border:1px solid #ECECEC;">'
	    	intro += '<div class="panel-heading" style="background-color:#ECECEC;">'
	    	intro += '<h3 class="panel-title">학원 소개</h3>'
	    	intro += '</div>'
	    	intro += '<textarea name="academy_'+academyCode+'" rows="10" cols="55" style="margin-left: 5; margin-top: 5; padding-left: 15; padding-top: 10;">'+academyInfo.academyIntro+'</textarea>'
	   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveIntro(\''+academyCode+'\');">저장</button> </span>';
	   	 	intro += '</div></div>';
	    
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
	        	alert("수정 완료되었습니다.");
	        	getAcademyInfo();
	        }
	    });
	}
	
	// 실적글 텍스트 area 변경
	function updateHistory(academyCode){
	    var history ='';
	    
	    //alert("코드 = " + academyCode + "실적글 = "+academyInfo.academyHistory);
	    
	    	history += '<div class="col-sm-12" id="AcademyHistory">';
	    	history += '<div class="panel" style="border:1px solid #ECECEC;">'
	    	history += '<div class="panel-heading" style="background-color:#ECECEC;">'
	    	history += '<h3 class="panel-title">학원 실적</h3>'
	    	history += '</div>'
	    	history += '<textarea name="academy_'+academyCode+'" rows="10" cols="55" style="margin-left: 5; margin-top: 5; padding-left: 15; padding-top: 10;">'+academyInfo.academyHistory+'</textarea>'
	    	history += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveHistory(\''+academyCode+'\');">저장</button> </span>';
	    	history += '</div></div>';
	    
	    $('#AcademyHistory').html(history);
	    
	}
	 
	// 실적글 수정
	function saveHistory(academyCode){
	    var updateHistory = $('[name=academy_'+academyCode+']').val();
	    
	    $.ajax({
	        url : '/academy/json/updateHistory/'+academyCode,
	        type : 'POST',
	        data : {'academyCode' : academyCode, 'updateHistory' : updateHistory},
	        success : function(data){
	        	alert("수정 완료되었습니다.");
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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
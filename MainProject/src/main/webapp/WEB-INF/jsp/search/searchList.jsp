<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy!edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  
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
  
      	<c:if test="${lat == null}">
			<jsp:forward page="../common/noResult.jsp"/>
		</c:if>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
						     <form>
								<div class="row" style=" position:absolute; right:100px;  top:80px; z-index:2;" >
								  <div class="col-md-3">
								  	<input type="text" name="searchAcademyName" class="form-control" placeholder="학원명 입력" >
								  </div>
		
								  <div class="col-md-3">
									<select name="searchAcademyAddr" class="form-control" >
								  		<option value="">지역</option>
								  		<option value="종로구">종로구</option>
								  		<option value="중구">중구</option>
								  		<option value="용산구">용산구</option>
								  		<option value="성동구">성동구</option>
								  		<option value="광진구">광진구</option>
								  		<option value="동대문구">동대문구</option>
								  		<option value="중랑구">중랑구</option>
								  		<option value="성북구">성북구</option>
								  		<option value="강북구">강북구</option>
								  		<option value="도봉구">도봉구</option>
								  		<option value="노원구">노원구</option>
								  		<option value="은평구">은평구</option>
								  		<option value="서대문구">서대문구</option>
								  		<option value="마포구">마포구</option>
								  		<option value="양천구">양천구</option>
								  		<option value="강서구">강서구</option>
								  		<option value="금천구">금천구</option>
								  		<option value="영등포구">영등포구</option>
								  		<option value="동작구">동작구</option>
								  		<option value="관악구">관악구</option>
								  		<option value="서초구">서초구</option>
								  		<option value="강남구">강남구</option>
								  		<option value="송파구">송파구</option>
								  		<option value="강동구">강동구</option>
								  	</select>
								  </div>
		
								  <div class="col-md-2">
									<select name="searchAcademyGrade" class="form-control" >
								  		<option value="">학년</option>
								  		<option value="초등">초등</option>
								  		<option value="중등">중등</option>
								  		<option value="고등">고등</option>
								  		<option value="고3">고3</option>
								  		<option value="N수">N수</option>
								  	</select>
								  </div>
		
								  <div class="col-md-3">
									<select name="searchAcademySubject" class="form-control">
								  		<option value="">과목</option>
								  		<option value="국어">국어</option>
								  		<option value="영어">영어</option>
								  		<option value="수학">수학</option>
								  		<option value="사회">사회</option>
								  		<option value="과학">과학</option>
								  		<option value="제2외국어">외국어</option>
								  		<option value="예체능">예체능</option>
								  	</select>
								  </div>
								  
								  <div class="col-md-1" >
								  	<button type="button" id="search" class="btn btn-primary">검색</button>
								  </div>
								</div>	
							</form>
								
								<div id="map" style="width:auto;height:600px; border:3px solid white; position:relative; z-index:1; "></div>
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption);
		
			// 마커 이미지의 이미지 주소입니다
			var imageSrc =  "/image/marker2.png";
		
			 <c:forEach var="academy" items="${list}">
		
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(35, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    var latlng = new kakao.maps.LatLng(${academy.academyLat},${academy.academyLng});
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: latlng, // 마커를 표시할 위치
			        title : "${academy.academyName} / ${academy.academyAddr}",
			        image : markerImage // 마커 이미지 
			    }); 
			    
			    
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커 위에 인포윈도우를 표시합니다
			        self.location = "/academy/academyInfo?academyCode="+"${academy.academyCode}"
			  	});

			    
			 </c:forEach>
			 
			 $("#search").on('click',function(){
				
				$("form").attr("method","POST").attr("action","/search/searchAcademy").submit();
			 });
			 
			
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
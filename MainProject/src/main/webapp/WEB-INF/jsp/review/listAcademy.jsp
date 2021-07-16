<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
</head>
<body>
	
	<c:if test="${lat == null}">
 		<jsp:forward page="../noData.jsp"/>
	</c:if>
	
	
	<form>

	<div id="map" style="width:100%;height:560px;"></div>
	
  	<input type="text" name="searchAcademyName" placeholder="학원명 입력" >
  	<input type="text" name="searchAcademyAddr" placeholder="구 이름 입력">
  	<input type="text" name="searchAcademyGrade" placeholder="학년 입력">
  	<input type="text" name="searchAcademySubject" placeholder="과목 입력">
	
	<button type="button">검색</button>
	
	</form>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0"></script>

	<script >
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
		// 마커 이미지의 이미지 주소입니다
		var imageSrc =  "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
		 <c:forEach var="academy" items="${list}">
	
			// 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
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
		        alert("${academy.academyName} 로 이동!"); 
		  	});
		    
		 </c:forEach>
		 
		 $("button").on('click',function(){
			
			$("form").attr("method","POST").attr("action","/academy/listAcademy").submit();
		 });
		
	</script>
	

	
</body>
</html>

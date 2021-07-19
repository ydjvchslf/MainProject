<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>searchList</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    </head>
    <body>
    	
    	<c:if test="${lat == null}">
			<jsp:forward page="../noData.jsp"/>
		</c:if>
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/userMain">Buy! Edu</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/user/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">search</div>
                            <a class="nav-link" href="/search/searchAcademy">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                학원검색
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                내 정보 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/getUser?email=${user.email}">내 정보 보기</a>
                                    <a class="nav-link" href="/user/updatePassword?email=${user.email}">비밀번호 변경</a>
                                    <a class="nav-link" href="/user/outUser?email=${user.email}">탈퇴 하기</a>
                                    <a class="nav-link" href="#">내가 작성한 후기</a>
                                    <a class="nav-link" href="/user/listConnect">내가 다니는 학원</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                내 수업 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">관심 수업</a>
                                    <a class="nav-link" href="#">구매 목록</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">board</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">공지사항</a>
                                	<a class="nav-link" href="#">QnA 게시판</a>
                                    <a class="nav-link" href="/board/listBoard">자유게시판</a>
                                    <a class="nav-link" href="#">학원 공지사항</a>
                                    <a class="nav-link" href="#">내가 작성한 게시글</a>
                                    <a class="nav-link" href="#">내가 작성한 댓글</a>
                                </nav>
                            </div>
                        </div>
                    </div>

                </nav>
            </div>
            <!-- 여기가 가운데 들어갈 화면 (바뀌는 곳) -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">학원 검색하기</h1>
                        <ol class="breadcrumb mb-4">
                          <form>
								<div class="row" >
								  <div class="col-md-4">
								  	<input type="text" name="searchAcademyName" class="form-control" placeholder="학원명 입력" >
								  </div>
		
								  <div class="col-md-2">
									<select name="searchAcademyAddr" class="selectpicker" data-width="100px" data-style="btn-info">
								  		<option value="" >서울 전체</option>
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
									<select name="searchAcademyGrade" class="selectpicker" data-width="100px" data-style="btn-info">
								  		<option value="" >전체 학년</option>
								  		<option value="초등">초등</option>
								  		<option value="중등">중등</option>
								  		<option value="고등">고등</option>
								  		<option value="고3">고3</option>
								  		<option value="N수">N수</option>
								  	</select>
								  </div>
		
								  <div class="col-md-2">
									<select name="searchAcademySubject" class="selectpicker" data-width="100px" data-style="btn-info">
								  		<option value="" >전체 과목</option>
								  		<option value="국어">국어</option>
								  		<option value="영어">영어</option>
								  		<option value="수학">수학</option>
								  		<option value="사회">사회</option>
								  		<option value="과학">과학</option>
								  		<option value="제2외국어">제2외국어</option>
								  		<option value="예체능">예체능</option>
								  	</select>
								  </div>
								  
								  <div class="col-md-2" >
								  	<button type="button" id="search" >검색</button>
								  </div>
								</div>		
							</form>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    <div id="map" style="width:100%;height:560px;"></div>
                                </p>
                            </div>
                        </div>
                      </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0"></script>
        
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
			        self.location = "/search/searchInfo?academyCode="+"${academy.academyCode}"
			  	});

			    
			 </c:forEach>
			 
			 $("#search").on('click',function(){
				
				$("form").attr("method","POST").attr("action","/search/searchAcademy").submit();
			 });
			 
			
		</script>
    </body>
</html>
    
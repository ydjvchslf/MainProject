<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html >
    <head>
  	   <title>Buy!edu</title>
   	    <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		

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
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/userMain">Buy! Ed</a>
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
                                ????????
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ?? ???? ????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/getUser?email=${user.email}">?? ???? ????</a>
                                    <a class="nav-link" href="/user/updatePassword?email=${user.email}">???????? ????</a>
                                    <a class="nav-link" href="/user/outUser?email=${user.email}">???? ????</a>
                                    <a class="nav-link" href="/review/addReviewView">???? ????????</a>
                                    <a class="nav-link" href="/user/listConnect">???? ?????? ????</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                ?? ???? ????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">???? ????</a>
                                    <a class="nav-link" href="#">???? ????</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">board</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ??????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">????????</a>
                                	<a class="nav-link" href="#">QnA ??????</a>
                                    <a class="nav-link" href="/board/listBoard">??????????</a>
                                    <a class="nav-link" href="#">???? ????????</a>
                                    <a class="nav-link" href="#">???? ?????? ??????</a>
                                    <a class="nav-link" href="#">???? ?????? ????</a>
                                </nav>
                            </div>
                        </div>
                    </div>

                </nav>
            </div>
            <!-- ?????? ?????? ?????? ???? (?????? ??) -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">${academy.academyName }</h1>
                        <a href="https://academy-chat.herokuapp.com/chat.html?username=${user.email}&room=${academy.academyName}">????</a>

                        <div class="card mb-4">
                            <div class="card-header">
                                ???? ????
                            </div>
                            <div class="card-body">
                                <p class="mb-0">
                                    ???? ????	: ${academy.academyPhone}<br/>
                                    ????	: ${academy.academyIntro }<br/>
                                    ???? : ${academy.academyHistory }<br/>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                ???? ????
                            </div>
                            <div class="card-body">
                                <p class="mb-0">
                                    ???? ???? : ${academy.academyAddr}<br/>
                                    ???? ?? : ${academy.academyArea }<br/>
                                    <div id="map" style="width:100%;height:400px;"></div>
                            </div>
                        </div>               
                    </div>
                </main>
            </div>
        </div>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        
        <script >
		
			var mapContainer = document.getElementById('map'), // ?????? ?????? div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${academy.academyLat}, ${academy.academyLng}), // ?????? ????????
		        level: 3 // ?????? ???? ????
		    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption);
		
			// ???? ???????? ?????? ??????????
			var imageSrc =  "/image/marker2.png";
		
			// ???? ???????? ?????? ???? ??????
			var imageSize = new kakao.maps.Size(35, 35); 
			    
			// ???? ???????? ??????????    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			var latlng = new kakao.maps.LatLng(${academy.academyLat},${academy.academyLng});
			    
			// ?????? ??????????
			var marker = new kakao.maps.Marker({
		        map: map, // ?????? ?????? ????
		        position: latlng, // ?????? ?????? ????
		        title : "${academy.academyName} / ${academy.academyAddr}",
		        image : markerImage // ???? ?????? 

			}); 

		</script>
        
    </body>
</html>
    
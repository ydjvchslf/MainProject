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
        <title>academyInfo</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
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

 		</style>

	<title>Academy Info page</title>	
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/user/loginacademy?email=${user.email}">Buy! Edu</a>
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
                        <li><a class="dropdown-item" href="/">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                           <div class="sb-sidenav-menu-heading">update</div>
                            <a class="nav-link" href="/academy/addAcademyView">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                학원 등록 하기
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
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">academy</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAcademy" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                학원 정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseAcademy" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="/user/loginacademy?email=${user.email}">프로필 선택</a>
                                    <a class="nav-link" href="/academy/academyInfo?academyCode=${academy.academyCode}">기본 정보</a>
                                    <a class="nav-link" href="/academy/academySampleEdu?academyCode=${academy.academyCode}">멀티미디어 정보</a>
                                    <a class="nav-link" href="/review/listReview?academyCode=${academy.academyCode}">학원 후기 보기</a>
                                    <a class="nav-link" href="/academy/academyConnects?academyCode=${academy.academyCode}">원생 관리</a>
                                    <a class="nav-link" href="/user/deleteacademy?email=${user.email}">학원 프로필 삭제</a>
                                </nav>
                            </div>                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                수업 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/edu/addEdu?academyCode=${academy.academyCode}">수업 등록</a>
                                    <a class="nav-link" href="#">수업 목록</a>
                                    <a class="nav-link" href="#">결제 목록</a>
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
                        <h1 class="mt-4">${academy.academyName}</h1>
                        <h5 class="mt-4">&nbsp;학원 전화 번호 : ${academy.academyPhone}</h5>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        
                        <div id="academyInfo" class="card-body">
                        	
                        </div>
                            
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
		var academyCode = '${academy.academyCode}';
		var role = '${user.role}';
		
		 alert("학원 코드 = "+academyCode);
			
		
		function getAcademyInfo(){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 
					 var a = ''
					 	 a += '학원 번호 : ' + data.academyPhone
				 		 a += '<br/>학원 주소 : ' + data.academyAddr
				 		 a += '<br/>지역구 : ' + data.academyArea
				 	 	 a += '<div id="AcademyIntro">'
				 	 	 a += '학원 소개 : ' + data.academyIntro
				 	 	 
				 	 if(role == 'academy'){
				 	 	 a += '<a class="btn blue" onclick="updateIntro(\''+data.academyCode+'\',\''+data.academyIntro+'\')"> 수 정 </a>'
				 	 }
				 		 a += '</div>'
				 		 a += '<div id="AcademyHistory">'
				 		 a += '학원 실적 : ' + data.academyHistory
				 		 
				 	if(role == 'academy'){
						 a += '<a class="btn blue" onclick="updateHistory(\''+data.academyCode+'\',\''+data.academyHistory+'\')"> 수 정 </a>'
				 	}
						 a += '</div>'
				 					
					$("#academyInfo").html(a);
				 }							
			});		
		}
		
		// 소개글 텍스트 박스 변경
		function updateIntro(academyCode, academyIntro){
		    var intro ='';
		    
		    alert("코드 = " + academyCode + "소개글 = "+academyIntro);
		    
		    	intro += '<div id="AcademyIntro">';
		   	 	intro += '<input type="text" class="form-control" name="academy_'+academyCode+'" value="'+academyIntro+'"/>';
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
		
		// 실적글 텍스트 박스 변경
		function updateHistory(academyCode, academyHistory){
		    var intro ='';
		    
		    alert("코드 = " + academyCode + "실적글 = "+academyHistory);
		    
		    	intro += '<div id="AcademyHistory">';
		   	 	intro += '<input type="text" class="form-control" name="academy_'+academyCode+'" value="'+academyHistory+'"/>';
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
		
		
		</script>
        
    </body>
</html>
    
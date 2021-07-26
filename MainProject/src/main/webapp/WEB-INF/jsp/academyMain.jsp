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
        <title>academyMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		

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
                                    <a class="nav-link" href="#">기본 정보</a>
                                    <a class="nav-link" href="#">멀티미디어 정보</a>
                                    <a class="nav-link" href="/review/addReviewView">학원 후기 보기</a>
                                    <a class="nav-link" href="#">원생 관리</a>
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
                                    <a class="nav-link" href="/edu/addEdu">수업 등록</a>
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
                                	<a class="nav-link" href="/board/listBoard?cateCode=0">공지사항</a>
                                	<a class="nav-link" href="/board/listBoard?cateCode=1">QnA 게시판</a>
                                    <a class="nav-link" href="/board/listBoard?cateCode=2">자유게시판</a>
                                    <a class="nav-link" href="#">학원 공지사항</a>
                                    <a class="nav-link" href="/board/listBoard?isMine=y">내가 작성한 게시글</a>
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
                        <h1 class="mt-4">여기가 여러분의 jsp가 들어갑니다 (학원메인)</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    
                                    <div class="panel panel-primary">
									<div class="panel-heading">
											<i class="glyphicon glyphicon-briefcase"></i> 학원 프로필
				         			</div>
				         			<br/>
				         			
							<ul class="academyList"></ul>
						       		 </div>
						        
                                </p>
                            </div>
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
        
        var userno = '${user.userNo}';
        var role = '${user.role}';
        
        function academyList(){
        	$.ajax({
        		url : '/academy/json/academyProfile/${user.userNo}',
        		type : 'get',
        		success : function(data){
        			console.log(data);
        			$.each(data, function(key,value){
        				
        				var a = '';
        				
        				if(value.length<=2){
    						a += '<li class="list-group-item">'
    						a += '<a href="/academy/addAcademyView"> >> 학원 등록 하기 << </a>'
    						a += '</li>'
    					}
        				
        				for(var i=0; i<value.length;i++){
        					
        					a += '<li class="list-group-item">'
        					a += '<a href="/academy/academyInfo?academyCode='+(value[i].academyCode)+'" >'+value[i].academyName+'</a>'
        					a += '</li>'
        				}
        				
            			$(".academyList").html(a);
        				
        			});
        		}
        	});
        }
        
        $(document).ready(function(){
            academyList();
        });
        
        </script>
        
        
        
    </body>
</html>
    
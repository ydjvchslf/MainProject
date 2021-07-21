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
		
		<script>
		
		//  인증 요청 수락
		function updateConnect(connectNo){
			if(confirm('인증 하시겠습니까?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/updateConnect/'+connectNo,
			        type : 'post',
			        success : function(){
			        	alert("인증 되었습니다!")
			        }
			    });
			}
			
			location.reload();
		}
		
		//  인증 요청 거절 -> 데이터 삭제?
		function deleteConnect(connectNo){
			if(confirm('인증 요청을 삭제 하시겠습니까?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/deleteConnect/'+connectNo,
			        type : 'post',
			        success : function(){
			        	alert("삭제 되었습니다!")
			        }
			    });
			}
			
			location.reload();
		}
		
		
		</script>
		
	<title>Academy - Student Connect page</title>	
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
                                    <a class="nav-link" href="#">학원 후기 보기</a>
                                    <a class="nav-link" href="/academy/academyConnect?academyCode=${academy.academyCode}">원생 관리</a>
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
                    
				       <form class="form-horizontal">
						  
						<table class="table table-hover table-striped" >
							<br/><br/>
				     		<h4>인증 신청한 학생 보기</h4>	
				     		
				     			<c:choose>
								  <c:when test= "${empty connect}">
									<span><h5>
										<img src="/image/crying.png">
										인증 신청한 학생이 없습니다.!</h5></span>
								  </c:when>
								  <c:otherwise>
								  	<thead>
							          <tr>
							          	<th align="center">No</th>
							            <th align="center">학생이름</th>
							            <th align="center">인증상태</th>
							            <th align="center">인증취소</th>
							          </tr>
							        </thead>
							        
							        <tbody>
									  <c:set var="i" value="0" />
									  <c:forEach var="connect" items="${connect}">
										<c:set var="i" value="${ i+1 }" />
										<tr>
										  <td align="left">${ i }</td>
										  <td align="left">
										  	<span class="cntStudentName" name="cntStudentName">${connect.user.name}</span>
										  	<input type="hidden" name="cntUserNo" value="${connect.user.userNo}">
										  </td>
										  <td align="left">
											  <c:choose>
												  <c:when test= "${connect.connectState == '0'}">
													<a onclick="updateConnect(${connect.connectNo})">인증 대기중 입니다.</a>
												  </c:when>
												  <c:when test= "${connect.connectState == '1'}">
													재학생
												  </c:when>
											  </c:choose>
										  </td>
										  <td align="left">
										  		<c:choose>
												  <c:when test= "${connect.connectState == '0'}">
													<a onclick="deleteConnect(${connect.connectNo})">인증 거부</a>
												  </c:when>
												  <c:when test= "${connect.connectState == '1'}">
													<a onclick="deleteConnect(${connect.connectNo})">원생 삭제</a>
												  </c:when>
											  </c:choose>
										  </td>
										</tr>
							          </c:forEach>
							        </tbody>
								  </c:otherwise>
							  	</c:choose>
				    	  </table>
						</form>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        
        
    </body>
</html>
    
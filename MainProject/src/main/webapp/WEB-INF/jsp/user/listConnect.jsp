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
        <title>userMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<script type="text/javascript">
				
				//인증하기 버튼 event
				 $(function() {
					 $(".addConnect").on("click" , function() {
						
						alert("잘접근?");
						var userNo = ${user.userNo};
						var academyCode = $("#academyCode").val();
						
						console.log("userNo=> "+userNo);
						console.log("academyCode=> "+academyCode);
							
							$.ajax( 
									{
										url : "/user/json/addConnect/${user.userNo}/"+academyCode,
										method : "GET" ,
										dataType : "json" ,
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData, status) {
											
											console.log(JSONData)
		
												if (JSONData.message == "no") {
													
													$(".connect_text").val("")
													displayValue = "최대 인증 갯수를 초과했습니다."
													$(".connect_text").css("color", "red");
													
												}else if(JSONData.message == "ok"){
													
													$(".connect_text").val("")
													displayValue = "정상등록 되었습니다."
													$(".connect_text").css("color", "blue");
													self.location = "/user/listConnect"
													
												}else if(JSONData.message == "duplication"){
													
													$(".connect_text").val("")
													displayValue = "이미 등록된 학원입니다."
													$(".connect_text").css("color", "red");
													
												}else if(JSONData.message == "notExist"){
													
													$(".connect_text").val("")
													displayValue = "유효하지 않은 학원코드입니다."
													$(".connect_text").css("color", "red");
													
												}
											
											$("#academyCode").val("");
											$(".connect_text").append(displayValue);
											
										}
							});
						 
						});
				 });
				
				//인증취소 버튼 event
				
				$(function() {
					
					$('input[name="delete"]').on("click" , function() {
						
						if (confirm("학원 인증을 취소하시겠습니까?")) {
				           //alert("yes 누름")
				           var userNo = ${user.userNo};
				           var academyCode = $('input[name="cntAcademyCode"]').val();
				           
				           console.log("userNo=> "+userNo);
						   console.log("academyCode=> "+academyCode);
				           
						   $.ajax( 
									{
										url : "/user/json/deleteConnect/${user.userNo}/"+academyCode,
										method : "GET" ,
										dataType : "json" ,
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData, status) {
											
											console.log(JSONData)
		
												if (JSONData.message == "ok") {
													alert("학원 인증을 취소하였습니다.")
													
													self.location = "/user/listConnect"
												}
											
										}
							});
				           
				        } 
						
					});
					
				});
				
				 $(function() {
					 $('span[name="cntAcademyName"]').on("click" , function() {
						 //alert("접근 ㅇㅋ?")
						 //self.location = "/user/listConnect"
					 })
					 
				 })
					 
				
				
				
		</script>
		

    </head>
    <body>
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
                            <a class="nav-link" href="/academy/listSearch">
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
				       <form class="form-horizontal">
						  
						  <div class="form-group">
						    <h4><span class="label label-primary">우리학원 인증하기</span></h4>
						    <div class="col-sm-4">
						      <input type="hidden" value="${user.userNo}">
						      <input type="text" class="form-control" id="academyCode" name="academyCode" placeholder="*학원코드 입력(인증 최대 3개)">
						    </div>
						    <input type="button" class="addConnect" value="인증하기">
						    <span id="helpBlock" class="help-block">
						      	<strong class="connect_text"></strong>
						     </span>
						  </div>
						  
						  </br></br>
						  
					<table class="table table-hover table-striped" >
				     	<h4>인증 학원 보기</h4>
				     	
								<!-- <span><h5>학원을 인증해주세요!</h5></span>  -->
				     	
								<thead>
						          <tr>
						          	<th align="center">No</th>
						            <th align="center">학원이름</th>
						            <th align="center">인증상태</th>
						            <th align="center">인증취소</th>
						          </tr>
						        </thead>
						        
						        <tbody>
								  <c:set var="i" value="0" />
								  <c:forEach var="connect" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									<tr>
									  <td align="left">${ i }</td>
									  <td align="left">
									  	<span name="cntAcademyName"><u>${connect.academy.academyName}</u></span>
									  	<input type="hidden" name="cntAcademyCode" value="${connect.academy.academyCode}">
									  </td>
									  <td align="left">
										  <c:choose>
											  <c:when test= "${connect.connectState eq '0'}">
												인증신청
											  </c:when>
											  <c:when test= "${connect.connectState eq '1'}">
												인증됨
											  </c:when>
										  </c:choose>
									  </td>
									  <td align="left">
										<input type="button" name="delete" value="인증취소">							  
									  </td>
									</tr>
						          </c:forEach>
						        </tbody>	
						  
				     	
				      </table>
						
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    
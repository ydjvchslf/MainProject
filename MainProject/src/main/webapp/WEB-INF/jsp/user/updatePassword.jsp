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
		
		
		var passwordDuplicationCheck = false;
		
		//수정하기 눌렀을때 모든 true 값 체크 메서드
		function fncCheckAll() {
			
			var valid = false;
			
			if( fncCheckPw() ){
				valid = true;
			}
			
			return valid;
		}
		
		
		//event 함수
		$(function() {
			
			//수정하기 event 연결
			$( ".updatePw" ).on("click" , events.click.updatePw);
			//현재비밀번호 변화 event
			$("#password0").on("change" , events.change.password0);
			//비밀번호1 변화 event
			$('#password').on("change", events.change.password);
			//비밀번호2 변화 event
			$('#password2').on("change", events.change.password2);
			
		});
		
		
		var events = {
				
			click : {
				
				updatePw : function() {
					//alert("1접근")
					if(fncCheckAll()){
						fncUpdatePassword();
					}
				}
			},
			
			change : {
				
				password0 : function() {
					//alert("2접근")
					passwordChange();
				},
				
				password : function(){
					//alert("3접근")
					fncCheckPw("first");
				},
				
				password2 : function(){
					//alert("4접근")
					fncCheckPw("second");
				}
			
			}
		}
		
		
		
		function passwordChange() {
			
			var password = $("#password0").val();
			
			// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
			if (password) {
				
				fncCheckCurrentPassword();
				
			}else{
				$(".password_check").text("비밀번호를 입력하세요.");
				$(".password_check").css("color", "red");
			}
			
		}
		
		
		
		//비밀번호 수정하기 함수
		function fncUpdatePassword() {
					
			$("form").attr("method" , "POST").attr("action" , "/user/updatePassword").submit();
		}
		

		
		
		//현재 비밀번호 맞는지 확인 ajax
		function fncCheckCurrentPassword() {
			 
			var email = $("#email").val();
			var password = $("#password0").val();
			
			console.log(email);
			console.log(password);
		
			$.ajax( 
					{
						url : "/user/json/checkPassword",
						method : "POST" ,
						data : JSON.stringify({
							email : email,
							password: password,
						}),
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							
							//alert("성공!");
	
							if (JSONData.result == "no") {
								console.log("비번 NO");
								
								passwordDuplicationCheck = false;
								$(".password_check").text("비밀번호가 맞지 않습니다");
								$(".password_check").css("color", "red");
								
							} else if (JSONData.result == "ok") {
								console.log("비번 OK");
								
								passwordDuplicationCheck = true;
								$(".password_check").text("비밀번호가 맞습니다");
								$(".password_check").css("color", "blue");
							}
						}
			});
				
		}
		
		
		//첫번째,두번째 비밀번호 조건 함수
		function fncCheckPw(passwordType){
			
			var passwordTarget = passwordType == "first" ? "password" : "password2";
			var passwordCompare = passwordType == "first" ? "password2" : "password";
			
			
			var pw = $("#" + passwordTarget).val();
			var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			
			console.log(pw);
			
			if(reg.test(pw)) {
				
				var pw2 = $("#" + passwordCompare).val();
				
				if( pw == pw2 ){
					
					$(".text_password").text("비밀번호가 일치합니다.");
					$(".text_password").css("color", "blue");
					
					return true;
					
				}else{
					
					$(".text_password").text("비밀번호가 일치하지 않습니다.");
					$(".text_password").css("color", "red");
				}
				
			}else {
				
				var str = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				$('.text_password').text(str).css("color", "red");
				$("#password").focus();
			}
			return false;
		}
			
		
			
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
						  <input type="hidden" id="email" name="email" value="${user.email}">
						    <label for="current" class="col-sm-offset-1 col-sm-3 control-label">현재 비밀번호</label>
						    <div class="col-sm-4">
						      <input type="password" class="form-control" id="password0" name="password0" placeholder="현재 비밀번호">
						       <span id="helpBlock" class="help-block">
						      	<strong class="password_check"></strong>
						      </span>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">새 비밀번호</label>
						    <div class="col-sm-4">
						      <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호" >
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
						    <div class="col-sm-4">
						      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
						     	<span id="helpBlock" class="help-block">
						      	  <strong class="text_password"></strong>
						      	</span>
						  	</div>
						  </div>
						  
						  
						  <div class="form-group">
						    <div class="col-sm-offset-4  col-sm-4 text-center">
						      <button type="button" class="updatePw">수정하기</button>
						    </div>
						  </div>
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
    
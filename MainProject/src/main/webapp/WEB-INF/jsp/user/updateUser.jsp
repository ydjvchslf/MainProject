<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>userMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<script type="text/javascript">
		
		var duplicationCheck = false;
				
		//가입버튼 눌렀을때 모든 true 값 체크 메서드
		function fncCheckAll() {
			
			var valid = false;
			
			if( fncCheckName() && fncCheckPhone ){
				valid = true;
			}
			
			return valid;
		}
		
		
		$(function() {
			
			//수정하기 event
			$("#update").on("click" , events.click.update);
			
			//뒤로가기 event 
			$("#back").on("click" , events.click.back);
			
			//이름 변화 event
			$("#name").on("change", events.change.name);
			
			//핸드폰 변화 event
			$("#phone").on("change", events.change.phone);
			
		});	
		
		
	
		var events = {
				
				click : {
					
					update : function() {
						if(fncCheckAll()){
							
							fncUpdateUser();
						}
					},
					
					back : function() {
						window.history.back();
					}
				},
			
				change : {
	
					name : function(){
						fncCheckName();
					},
					
					phone : function(){
						fncCheckPhone();
					}
				}
			}
		
		
		
		//이름 체크 함수
	    function fncCheckName() {
			
			var name = $("#name").val();
			
	        if(name){
	        	var nameRegExp = /^[가-힣]{2,20}$/;
	        	
	        	if(nameRegExp.test(name)){
	        		$(".text_name").text("올바른 이름 형식입니다.");
					$(".text_name").css("color", "blue");
	        		return true;
	        	}else{
	        		$(".text_name").text("올바른 이름 형식이 아닙니다");
					$(".text_name").css("color", "red");
	        	}
	        } else{
	        	$(".text_name").text("이름을 필수로 입력하세요!");
				$(".text_name").css("color", "red");
	        }
	        return false; 
	    }
		
		

		//핸드폰 체크 함수 
	    function fncCheckPhone(){
	    	
	    	var phone = $("#phone").val();
	    	
	    	if(phone){
	    		
	    		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	    		
	    		if(regExp.test(phone)){
	    			
	    			$(".text_phone").text("올바른 휴대폰 형식입니다.");
					$(".text_phone").css("color", "blue");
					
					return true;
					
	    		}else{
	    			
	    			$(".text_phone").text("올바르지 않은 휴대폰 형식입니다.");
					$(".text_phone").css("color", "red");
	    			
	    		}
	    	}else{
	    		
	    		$(".text_phone").text("휴대폰번호를 필수로 적어주세요!");
				$(".text_phone").css("color", "red");
	    		
	    	}
	    	return false;
	    }
		
		
		
		//수정하기 함수
		function fncUpdateUser() {
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
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
				        <div class="page-header text-center">
					       <h3 class=" text-info">회원정보수정</h3>
					       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
					    </div>
					    
					    <!-- form Start /////////////////////////////////////-->
						<form class="form-horizontal" id="myform">
						
						  <div class="form-group">
						    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="중복확인하세요"  readonly>
						       <span id="helpBlock" class="help-block">
						      	<strong class="text-danger">아이디는 수정불가</strong>
						      </span>
						    </div>
						  </div>
						
						  
						  
						  <div class="form-group">
						    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
						    <div class="col-sm-4">
						      <input type="hidden" name="userNo" value="${user.userNo}">
						      <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="변경회원이름">
							    <span id="helpBlock" class="help-block">
							      <strong class="text_name"></strong>
							    </span>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호( - 포함)</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="phone" name="phone"  value="${user.phone}" placeholder="변경휴대폰번호">
						      <span id="helpBlock" class="help-block">
							     <strong class="text_phone"></strong>
							  </span>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-4  col-sm-4 text-center">
						      <button type="button" id="update" name="update" class="btn btn-primary">수정하기</button>
						      <button type="button" id="back" name="back" class="btn btn-primary">뒤로가기</button>
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
    
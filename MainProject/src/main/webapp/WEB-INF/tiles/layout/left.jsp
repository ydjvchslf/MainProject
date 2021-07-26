<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<script type="text/javascript">

	let x = document.cookie;
				 
	 const words = x.split("; ");
	 
	 var loginType = "";
	 
	 for(var i=0; i < words.length; i++ ){
		 
		if( words[i].split("=")[0] === "loginAccountType" ){
			 console.log( words[i].split("=")[1] )
			 loginAccountType = words[i].split("=")[1];
			 //alert(loginAccountType)
		}
	 }

</script>


<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
	    <img src="/image/buyeduicon.png" width="140px">
	</a>
	
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
		<c:choose>
		  <c:when test= "${user.role eq 'academy'}">
			<!-- role : 아카데미일때 -->
			<li class="nav-item active">
			    <a class="nav-link" href="/academy/addAcademyView">
			        <i class="fas fa-fw fa-tachometer-alt"></i>
			        <span>학원등록</span></a>
			</li>
		  </c:when>
		  <c:otherwise>
	  	  <!-- role : 비회원 포함 all 검색가능-->
			<li class="nav-item active">
			    <a class="nav-link" href="/search/searchAcademy">
			       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
					  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
						<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
					  </svg>
			        <span> 학원검색</span>
			    </a>
			</li>
		  </c:otherwise>
  		</c:choose>
	
	
		  <c:if test= "${user.role eq 'student' || user.role eq 'parents'}">
			<!-- role: 학생 / 학부모만 -->
			<!-- Heading -->
			  <div class="sidebar-heading">
				    BuyEdu
			  </div>
				<li class="nav-item">
				    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
				        aria-expanded="true" aria-controls="collapseTwo">
				        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-half" viewBox="0 0 16 16">
						  <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
						</svg>
				        <span>MY EDU</span>
				    </a>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
				        <div class="bg-white py-2 collapse-inner rounded">
				            <a class="collapse-item" href="/review/addReviewView">후기 작성</a>
				            <a class="collapse-item" href="/pickedu/listPickEdu">관심 수업</a>
				            <a class="collapse-item" href="/purchaseedu/listPurchaseEdu">구매 목록</a>
				        </div>
				    </div>
				</li>
		  </c:if>
		  
		  <c:if test= "${user.role eq 'academy'}">
			<!-- role: 학원만 -->
				<li class="nav-item">
				    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
				        aria-expanded="true" aria-controls="collapseTwo">
				        <i class="fas fa-fw fa-cog"></i>
				        <span>수업관리</span>
				    </a>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
				        <div class="bg-white py-2 collapse-inner rounded">
				            <a class="collapse-item" href="/edu/addEdu">수업등록</a>
				            <a class="collapse-item" href="#">수업목록</a>
				            <a class="collapse-item" href="#">결제목록</a>
				        </div>
				    </div>
				</li>
			</c:if>
			
			<c:if test= "${!empty user.role}">	
			<!-- Divider -->
			<hr class="sidebar-divider">
			
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#aa"
			        aria-expanded="true" aria-controls="collapseUtilities">
			        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
			        <span>BOARD</span>
			    </a>
			    <div id="aa" class="collapse" aria-labelledby="headingTwo"
			        data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <a class="collapse-item" href="#">공지사항</a>
			            <a class="collapse-item" href="#">QnA</a>
			            <a class="collapse-item" href="#">학원공지사항</a>
			            <a class="collapse-item" href="/board/listBoard">자유게시판</a>
			            <a class="collapse-item" href="#">내가 작성한 게시글</a>
			            <a class="collapse-item" href="#">내가 작성한 댓글</a>
			        </div>
			    </div>
			</li>
		  </c:if>
  		
		<c:choose>
		  <c:when test= "${user.role eq 'admin'}">
		   <!-- Divider -->
			<hr class="sidebar-divider">
			<!-- role : admin -->
			<div class="sidebar-heading">
			    ADMIN
			</div>
			<!-- Nav Item - Pages Collapse Menu -->
			 <li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
			        aria-expanded="true" aria-controls="collapsePages">
			        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
					  <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
					</svg>
			        <span>ADMIN</span>
			    </a>
			    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <h6 class="collapse-header">Users:</h6>
			            <a class="collapse-item" href="/user/listUser?title=전체회원보기">전체회원보기</a>
			            <a class="collapse-item" href="/chart/getChart">사이트현황보기</a>
			            <div class="collapse-divider"></div>
			            <h6 class="collapse-header">Process:</h6>
			            <a class="collapse-item" href="404.html">신고게시글</a>
			            <a class="collapse-item" href="404.html">신고댓글</a>
			            <a class="collapse-item" href="404.html">신고후기</a>
			        </div>
			    </div>
			</li>
		  </c:when>
  		</c:choose>
	
	
	<!-- 맨하단 Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	
	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
	    <button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>



</ul>
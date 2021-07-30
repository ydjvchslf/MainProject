<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
	        <nav class="navbar navbar-expand-lg navbar-light bg-light">
	        
	          <div class="container-fluid">
	
	            <button type="button" id="sidebarCollapse" class="btn btn-primary">
	              <i class="fa fa-bars"></i>
	              <span class="sr-only">Toggle Menu</span>
	            </button>
	            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                <i class="fa fa-bars"></i>
	            </button>
	
	            <div class="collapse navbar-collapse" id="navbarSupportedContent">
	              <ul class="nav navbar-nav ml-auto">
	                <li class="nav-item active">
	                    <a class="nav-link" href="/academy/academyInfo?academyCode=${academy.academyCode}">학원 정보</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/academy/academySampleEdu?academyCode=${academy.academyCode}">멀티미디어 정보</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/edu/listEdu?acaCode=${academy.academyCode}">수업</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/review/listReview?academyCode=${academy.academyCode}">후기</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/board/listBoardAcademy?cateCode=3&academyCode=${academy.academyCode}">공지사항</a>
	                </li>
	                
	                <c:if test="${user.role == 'academy'}">
	                <li class="nav-item">
	                    <a class="nav-link" href="/academy/academyConnects?academyCode=${academy.academyCode}">원생관리</a>
	                </li>
	                </c:if>
	                
	                <c:if test="${user.role == 'academy'}">
	                <li class="nav-item">
	                    <a class="nav-link" href="/purchaseedu/listPurchaseAcademy?academyCode=${academy.academyCode}">결제목록</a>
	                </li>
	                </c:if>
	                
	              </ul>
	            </div>
	          
	          </div>
	          
	        </nav>

</body>
</html>


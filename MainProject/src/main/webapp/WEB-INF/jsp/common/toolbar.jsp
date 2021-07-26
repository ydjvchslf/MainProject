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
	                    <a class="nav-link" href="#">학원 정보</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">멀티미디어 정보</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/edu/listEdu?acaCode=${academy.academyCode}">수업</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/review/listReview?academyCode=${academy.academyCode}">후기</a>
	                </li>
	              </ul>
	            </div>
	          
	          </div>
	          
	        </nav>

</body>
</html>


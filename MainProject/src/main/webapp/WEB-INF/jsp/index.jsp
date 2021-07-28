<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

#buyEdu {
font-family : Lobster;
color : #F5C129;
}

a {
	text-decoration-line: none;
}

@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#buyeduInfo {
font-family : 'ChosunGu';
}

@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url('https://fonts.googleapis.com/css2?family=Merienda&display=swap');

.hover-me a {font-size : 57px;
}

.hover-me:hover{
font-size: 0;
}

.hover-me:hover:after{
content : 'login';
font-size: 57px;
font-family: lobster;
}


</style>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Buy! Edu</title>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body >
        <!-- Background Video-->
        <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"><source src="assets/mp4/main.mp4" type="video/mp4" /></video>
        <!-- Masthead-->
        <div class="masthead">
            <div class="masthead-content text-white" >
                <div class="container-fluid px-4 px-lg-0" >
                    <h1 class="fst-italic lh-1 mb-4" id="buyEdu"><a class="hover-me" href="/user/login" style="color:#F5C129;" >Buy! edu</a></h1>
                    <p class="mb-5" id="buyeduInfo" style="color:#DFDEDA;">모든 학생들이 자신에게 최적화된 학원을 찾을 수 있는<br>
                    모든 원장님들이 편리하게 수업을 관리할 수 있는<br>
                    <span style="color : #F5C129; font-size : 25px;">플랫폼</span>을 제공합니다<br><br>
                    <span style="color : #FCDE85; font-family: lobster; font-size : 19px;">Think 10 minutes later and 10 years later at the same time.</span> <br>
                    <span style="font-family: ChosunGu; font-size : 17px;"><span style="font-family: Lobster;">Buy!edu</span>를 통해 당신의 10년 후를 꿈꿔보세요</span></p>
                </div>
            </div>
        </div>
        <!-- Social Icons-->
        <!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->
        <div class="social-icons">
            <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
            	<div class="fw-bolder" style="color:white">Developer</div>
            	<a class="btn btn-dark m-3" id="moon"><img class="image" alt="없음" src="/image/moon.jpg"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="없음" src="/image/kim.png"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="없음" src="/image/mk.jpg"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="없음" src="/image/jenny.jpg"></a>
                <a class="btn btn-dark m-3" ><img class="image" alt="없음" src="/image/rea.jpg"></a>
                <a class="btn btn-dark m-3" ><img class="image" alt="없음" src="/image/jeawoo.jpg"></a>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script type="text/javascript">
        $(".btn.btn-dark").on("click",function(){
        	alert("나중에 프로필 띄우기");
        })
        
        </script>
        
        
    </body>
</html>

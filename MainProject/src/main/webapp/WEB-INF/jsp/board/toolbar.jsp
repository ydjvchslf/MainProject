<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<style >
	
	
	body {
  font-family: "Lato", sans-serif;
  padding-top: 130px;
}

.sidebar {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 12.6%;
  left: 0;
  background-color: #1F4E79;
  overflow-x: hidden;
  transition: 0.05s;
  padding-top: 70px;
}

.sidebar a, .dropdown-btn {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #E7EAEC;
  display: block;
  transition: 0.3s;
  background: #1F4E79;
  width: 100%;
  text-align: left;
  cursor: pointer;
  font-family: paybooc-Bold;
  
}

#ex{
  text-align: right;
}

.sidebar a:hover, .dropdown-btn:hover{
  color: white;
}

.sidebar .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #111;
  color: white;
  padding: 10px 15px;
  border: none;
}

.openbtn:hover {
  background-color: #444;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
  background-color: white;
  color:black;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

.topnav {
  background-color: white;
  overflow: hidden;
  height: 120px;
  display: flex;
  position: fixed;
  top: 0;
  /* width: 100% */
  left: 0;
  right: 0;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: red;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}



/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}

/* Change the color of links on hover */


/* Add a color to the active/current link */


#logoutButton{
position: absolute;
  top: 0; 
  right: 10px;
}

.active {
  background-color: none;
  color: white;
}

.dropdown-container {
  display: none;
  background-color: #1F4E79;
  padding-left: 10px;
}

.dropdown-container a{
font-size: 18px;
font-family: paybooc-Bold;
}


@font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	</style>

</head>
<body>

<div class="topnav">
  
  <a class="active" href="#home"><img src="/image/logo.JPG"></a> 
  <button id="main" class="openbtn" onclick="openNav()"><i class="glyphicon glyphicon-menu-hamburger"></i></button>
  <a id="logoutButton" href="/user/logout"><i class="glyphicon glyphicon-off"></i>>logout</a>
</div>

<div id="mySidebar" class="sidebar">
  <a id="ex" href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a></span>
  <a href="/search/searchAcademy">학원검색</a>
  <br>
  <a class="dropdown-btn">내 정보 관리 &nbsp;&nbsp;&nbsp;&nbsp;
    <i class="glyphicon glyphicon-menu-right"></i>
  </a>
  <div class="dropdown-container">
    <a href="/user/getUser?email=${user.email}">내 정보 보기</a>
    <a href="/user/updatePassword?email=${user.email}">비밀번호 변경</a>
    <a href="/user/outUser?email=${user.email}">탈퇴 하기</a>
    <a href="/review/addReviewView">후기 작성하기</a>
    <a href="/user/listConnect">내가 다니는 학원</a>
    <a href="/board/listBoard?isMine=y">내가 쓴 게시글 보기</a>
    <a href="#">내가 쓴 댓글 보기</a>
  </div>
  <br>
  <a class="dropdown-btn">내 수업 관리 &nbsp;&nbsp;&nbsp;&nbsp;
    <i class="glyphicon glyphicon-menu-right"></i>
  </a>
  <div class="dropdown-container">
    <a href="#">관심 수업</a>
    <a href="#">구매 목록</a>
  </div>
  <br>
  <a class="dropdown-btn">게시판 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <i class="glyphicon glyphicon-menu-right"></i>
  </a>
  <div class="dropdown-container">
    <a href="/board/listBoard?cateCode=0">공지사항</a>
    <a href="/board/listBoard?cateCode=1">QnA 게시판</a>
    <a href="/board/listBoard?cateCode=2">자유게시판</a>
    <a href="/board/listBoard?cateCode=3">학원 공지사항</a>
  </div>

</div>




<script>
function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("content").style.marginLeft = "250px";
  
}

function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("content").style.marginLeft= "0";
  
}

var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>
</html>
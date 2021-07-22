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
        <title>사!교육</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    </head>
    <style>

    .img {

        height: 100vh;

        background-image: url("image/mainImage.jpg");

            background-repeat: no-repeat;

            background-position: center;

            background-size: cover;

        background: url("image/mainImage.jpg") no-repeat center/cover;

    }
    
    .img .addUserButton{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-107%, 125%);                                                                   
     font-size:5rem;
     color: white;
     z-index: 2;
     text-align: center;
}

    .img .loginButton{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(7%, 125%);                                                                   
     font-size:5rem;
     color: white;
     z-index: 2;
     text-align: center;
}

 	.userMain{
 	position: absolute;
    top:10%;
    left:83%;
    font-size: 20px;
 	}
 	
 	.academyMain{
 	position: absolute;
    top:10%;
    left:90%;
    font-size: 20px;
 	}
 	
 	.adminMain{
 	position: absolute;
    top:10%;
    left:95%;
    font-size: 20px;
 	}
    

</style>


   <body>  
   
   	<span class="userMain"><a href="/main/userMain">학생,학부모</a></span>
   	<span class="academyMain"><a href="/main/academyMain">원장님</a></span>
    <span class="adminMain"><a href="/main/adminMain">관리자</a></span>
   
    <div class="img">
        <div class="addUserButton">
        <a href="/user/addUser">
            <img src="image/addUserButton.jpg" width="300", height="100"></a>
        </div>
        <div class="loginButton">
        <a href="/user/login">
            <img src="image/loginButton.jpg" width="300", height="100"></a>
        </div>
        <div class="img-cover"></div>
    </div>
     
    
    </body>
</html>
    
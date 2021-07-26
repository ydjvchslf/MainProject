<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>


<body>
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/student.png);"></a>
	        <ul class="list-unstyled components mb-5">
	        
	        <c:if test="${user.role == 'academy'}">
	          <li>
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내 학원</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">

			<c:if test="${list.size()<=2}">
				<li>
					<a href="#">학원 등록</a>
				</li>
			</c:if> 
			
			<c:forEach var="academy" items="${list}">
				
				<li>
					<a href="/academy/academyInfo?academyCode=${academy.academyCode}" >${academy.academyName}</a>		 
				</li>	
			</c:forEach>			




	            </ul>
	          </li>
	         </c:if> 
	          
	          <li>
	              <a href="/user/getUser?email=${user.email}">내 정보</a>
	          </li>
	          
	         <c:if test="${user.role != 'academy'}"> 
	          <li>
	              <a href="/search/searchAcademy">학원검색</a>
	          </li>
	         </c:if> 
	         
	         <c:if test="${user.role == 'admin'}">  
	          <li>
	            <a href="#siteSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">사이트 관리</a>
	            <ul class="collapse list-unstyled" id="siteSubmenu">
                <li>
                    <a href="/user/listUser">회원 목록</a>
                </li>
                <li>
                    <a href="#">현황 차트</a>
                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#comSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">신고관리</a>
              <ul class="collapse list-unstyled" id="comSubmenu">
                <li>
                    <a href="#">후기 신고</a>
                </li>
                <li>
                    <a href="#">게시글 신고</a>
                </li>
                <li>
                    <a href="#">댓글 신고</a>
                </li>
              </ul>
	          </li>	          
	         </c:if> 
	          
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">게시판</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="/board/listBoard?cateCode=2">자유게시판</a>
                </li>
                <li>
                    <a href="/board/listBoard?cateCode=0">공지사항</a>
                </li>
                <li>
                    <a href="/board/listBoard?cateCode=1">QnA</a>
                </li>
                <li>
                    <a href="/board/listBoard?isMine=y">내 게시글 보기</a>
                </li>
              </ul>
	          </li>
	          
	         <c:if test="${user.role == 'student' || user.role =='parents'}">  
	          <li>
              <a href="#eduSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">수업</a>
              <ul class="collapse list-unstyled" id="eduSubmenu">
                <li>
                    <a href="/pickedu/listPickEdu?userNo=${user.userNo}">관심수업</a>
                </li>
                <li>
                    <a href="/purchaseedu/listPurchaseEdu?userNo=${user.userNo}">구매수업</a>
                </li>
              </ul>
	          </li>
	         </c:if> 
	          
	        </ul>

	        <div class="footer">
	        	<a href="/user/logout">로그아웃</a>
	        </div>

	      </div>
    	</nav>

</body>
</html>


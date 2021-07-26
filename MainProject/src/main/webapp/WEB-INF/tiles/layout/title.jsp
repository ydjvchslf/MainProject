<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">
    	<c:choose>
    		<c:when test="${empty param.title }">내정보보기</c:when>
    		<c:otherwise>${param.title }</c:otherwise>
    	</c:choose>
    </h1>
</div>
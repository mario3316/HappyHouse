<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-Error page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template -->
	<link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link href="${root}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template -->
	<link href="${root}/css/landing-page.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<br><br><br><br>
<div class="container">
  <div class="jumbotron">
    <h1>처리중 에러가 발생했습니다.</h1>      
    <p>${msg}</p>
  </div>  
  <p><a href="${root}">메인으로 가기</a></p>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
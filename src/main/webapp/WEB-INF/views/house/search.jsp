<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HAPPY HOUSE | 실거래가</title>

<!-- Bootstrap core CSS -->
<link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${root}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="${root}/css/landing-page.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">Happy House 아파트 실거래 정보를 찾아보세요</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form method="post" action="${root}/house/searchBy">
						<div class="form-row">
							<div class="col-12 col-md-3 mt-1 mb-2 mb-md-0">
								<input type="hidden" name="act" value="searchBy"> <select class="form-control" name="by">
									<option value="dong">동이름
									<option value="aptname">아파트이름
								</select>
							</div>
							<div class="col-12 col-md-6 mt-1 mb-2 mb-md-0">
								<input type="text" class="form-control" placeholder="" name="keyword" id="initSearch">
							</div>
							<div class="col-12 col-md-3">
								<input type="submit" id="btn-search" class="btn btn-block btn-lg btn-outline-light" value="검색">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- 디자인 -->
	<div class="container">
	
	
	<div align="center">
		<form>
			<h4 class="mt-3">상세 설명을 보려면 아파트 이름을 클릭하세요.</h4>
			<table class="table table-dark" border='1'>
				<tr>
					<th>no</th>
					<th>동 이름</th>
					<th>아파트 이름</th>
					<th>거래금액</th>
					<th>거래종류</th>
				</tr>
				<hr/>
				<c:forEach begin="0" end="10" step="1" items="${houses }" var="houseDeal">
					<tr>
						<td>${houseDeal.no }</td>
						<td>${houseDeal.dong }</td>
						<td><a href="<c:url value='/house/detail?no=${houseDeal.no}' />">${houseDeal.aptName}</a></td>
						<td>${houseDeal.dealAmount }</td>

						<td><c:if test="${houseDeal.type == '1'}">
					아파트 매매
					</c:if> <c:if test="${houseDeal.type == '2'}">
					연립 다세세 매매
					</c:if> <c:if test="${houseDeal.type == '3'}">
					아파트 전월세 
					</c:if> <c:if test="${houseDeal.type == '4'}">
					연립 다세세 전월세
					</c:if></td>

					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
</c:if>
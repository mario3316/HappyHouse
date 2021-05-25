<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HAPPY HOUSE | 공지글 작성</title>
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
  <script type="text/javascript">
  $(document).ready(function() {
	  $("#writeBtn").click(function() {
			if($("#subject").val() == "") {
				alert("제목 입력!!!");
				return;
			} else if($("#content").val() == "") {
				alert("내용 입력!!!");
				return;
			} else {
				$("#writeform").attr("action", "${root}/notice/write").submit();
			}
		});
	});
  </script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container" align="center">
	<br><br><br><br>
	<h2>공지 글쓰기</h2>
	<form id="writeform" method="post" enctype="multipart/form-data" action="">
		<div class="form-group" align="left">
			<label for="subject">제목:</label>
			<input type="text" class="form-control" id="subject" name="subject">
		</div>
		<div class="form-group" align="left">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="15" id="content" name="content"></textarea>
		</div>
		<div class="form-group" align="left">
			<label for="file">파일:</label>
			<input type="file" class="form-control-file border" name="upfile" multiple="multiple">
		</div>
		<button type="button" id="writeBtn" class="btn btn-primary">글작성</button>
		<button type="reset" class="btn btn-warning">초기화</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
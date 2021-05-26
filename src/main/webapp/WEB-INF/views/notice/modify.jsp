<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HAPPY HOUSE | 공지수정</title>
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
	<!-- CKEditor5 -->
	<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
	
  <script type="text/javascript">
  $(document).ready(function() {
	  $("#modifyBtn").click(function() {
			if($("#subject").val() == "") {
				alert("제목 입력!!!");
				return;
			} else if($("#content").val() == "") {
				alert("내용 입력!!!");
				return;
			} else {
				$("#modifyform").attr("action", "${root}/notice/modify").submit();
			}
		});
	});
  </script>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container" align="center">
	<br><br><br><br>
	<h2>공지사항</h2>
	
	<form id="modifyform" method="post" enctype="multipart/form-data" action="">
        <input type="hidden" name="no" id="no" value="${notice.no}">
		<table class="table mt-4 mb-2">
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control" id="subject" name="subject" value="${notice.subject}"></td>
			</tr>
			<tr>
				<th></th>
				<td>
					<textarea class="form-control" rows="15" id="content" name="content">${notice.content }</textarea>
					<script>
						let editor;
						ClassicEditor.create(document.querySelector('#content')) 
							.then(function(newEditor) {
						    	editor = newEditor;
						    	editor.ui.view.editable.element.style.height = '300px';
							}).catch(function(error) { 
								console.error(error); 
						});
					</script>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" class="form-control-file border" name="upfile" multiple="multiple"></td>
			</tr>
		</table>
		<div class="mb-4" align="right">
			<button type="button" id="modifyBtn" class="btn btn-light">수정</button>
			<a href="javascript:history.back();" class="btn btn-light">취소</a>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
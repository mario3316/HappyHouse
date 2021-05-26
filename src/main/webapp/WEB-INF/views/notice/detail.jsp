<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>HAPPY HOUSE | 공지</title>
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
			//file download
            $('.filedown').click(function() {
        		$(document).find('[name="sfolder"]').val($(this).attr('sfolder'));
        		$(document).find('[name="ofile"]').val($(this).attr('ofile'));
        		$(document).find('[name="sfile"]').val($(this).attr('sfile'));
        		$('#downform').attr('action', '${root}/notice/download').attr('method', 'get').submit();
        	});
			
		});
		</script>
	</head>
	<body>	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<form id="downform">
		<input type="hidden" name="sfolder">
		<input type="hidden" name="ofile">
		<input type="hidden" name="sfile">
	</form>
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" align="center">
	  <br><br><br>
	  <h2>공지사항</h2>
	
		
		<table class="table mt-4 mb-2">
			<tr>
				<th style="width: 20%">제목</th>
				<td>${notice.subject}</td>
			</tr>
			<tr>
				<th style="width: 20%">작성자</th>
				<td>${notice.userid}</td>
			</tr>
			<tr>
				<th style="width: 20%">작성일</th>
				<td>${notice.regtime}</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="mt-4 mb-4">
						${notice.content}
					</div>
				</td>
			</tr>
		    <c:if test="${!empty notice.fileInfos}">
		    	<tr>
		        	<td colspan="2">
						<div class="row">
						<c:forEach var="file" items="${notice.fileInfos}">
						<ul class="list-group list-group-horizontal mr-2">
								<li class="list-group-item">
								<a href="#" class="filedown text-dark" sfolder="${file.saveFolder}" sfile="${file.saveFile}" ofile="${file.originFile}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
	  							<path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>
								</svg>${file.originFile} [다운로드]
								</a>
						</ul>
						</c:forEach>
						</div>
					</td>
		      	</tr>
			</c:if>
			
	    	<tr>
	        	<td colspan="3">
	        		<div class="d-flex">
	        		<div class="mr-auto p-2">
						<a href="javascript:history.back();" class="btn btn-light">뒤로가기</a>
	        		</div>
					
			    	<c:if test="${userinfo.userid == notice.userid}">
		        		<div class="p-2">
							<a href="${root}/notice/modify?noticeno=${notice.no}" class="btn btn-light">수정</a>
							<a href="${root}/notice/delete?noticeno=${notice.no}" class="btn btn-light">삭제</a>
		        		</div>
				   	</c:if>
	        		</div>
				</td>
	   		</tr>
		</table>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	  
	</body>
</html>
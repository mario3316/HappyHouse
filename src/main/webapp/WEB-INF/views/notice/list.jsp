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
			
			$('#mvWriteBtn').focusin(function() {
				$(location).attr("href", "${root}/notice/write");
			});
			
			$("#searchBtn").click(function() {
				
				if($("#sword").val() == "") {
					alert("모든 목록 조회!!");
				} 
				$("#searchform").attr("action", "${root}/notice/list").submit();
			});
			
			$(".page-item").click(function() {
				$("#pg").val(($(this).attr("data-pg")));
				$("#pageform").attr("action", "${root}/notice/list").submit();
			});
			
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
	
	<div class="d-flex">
		<div class="form-inline mr-auto mt-3 mb-3">
 			<form id="searchform" method="get" class="form-inline" action="">
 				<input type="hidden" name="pg" id="pg" value="1">
				<div class="float-left">
			  		<select class="form-control" name="key" id="skey">
				    	<option value="userid" selected="selected">아이디</option>
				    	<option value="no">글번호</option>
				    	<option value="subject">제목</option>
					</select>
					<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
					<button type="button" id="searchBtn" class="btn btn-outline-primary">검색</button>
  				</div>
 			</form>		  
		</div>
	    <div class="p-2 mt-3 mb-3">
	 		<button type="button" id="mvWriteBtn" class="btn btn-outline-primary">글쓰기</button>
	    </div>
	</div>

	  <c:if test="${notices.size() != 0}">
		  <table class="table table-hover">
	  		<colgroup>
	            <col width="120">
	            <col width="*">
	            <col width="120">
	            <col width="180">
	        </colgroup>
		  	<thead>
		  		<tr>
		  			<th class="text-center">NO</th>
		  			<th class="text-center">제목</th>
		  			<th class="text-center">작성자</th>
		  			<th class="text-center">날짜</th>
	  			</tr>
		  	</thead>
		  	
		  	<tbody>
		  		<c:forEach var="notice" items="${notices}">
			  		<tr>
			  			<td class="text-center">${notice.no}</td>
			  			<td><a href="${root}/notice/detail?noticeno=${notice.no}" class="text-secondary link-primary">${notice.subject}</a></td>
			  			<td class="text-center">${notice.userid}</td>
			  			<td class="text-center">${notice.regtime}</td>
			  		</tr>
			  	</c:forEach>
		  	</tbody>
		  </table>
	  	<table>
	  	<tr>
	  	<td>
	  	${navigation.navigator}
	  	</td>
	  	</tr>
	  	</table>
	  </c:if>
	  <c:if test="${notices.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	  
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	  
	</body>
</html>
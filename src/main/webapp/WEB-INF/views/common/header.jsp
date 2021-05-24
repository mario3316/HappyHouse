<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	function intlogin() {
		if (document.getElementById("muserid").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("muserpwd").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			$("#loginform").attr("action", "${root}/user/login").submit();
		}
	}
</script>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand mx-auto" style="width: 200px;" href="${root}">Happy House</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	    </button>
	    
		<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active">
		    		<a class="nav-link" href="${root }">Home <span class="sr-only">(current)</span></a>
		    	</li>
		    	<li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Search
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		     			<a class="dropdown-item" href="${root}/user/register">test</a>
		     			<a class="dropdown-item" href="${root}/house/mvsearch">실거래 정보</a>
		     			<a class="dropdown-item" href="${root}/search">상권 정보</a>
		     		</div>
			    </li>
			    <li class="nav-item">
				    <a class="nav-link" href="${root}/notice/list?pg=1&key=&word=">Notice</a>
			    </li>
			    <li class="nav-item">
			    </li>
			    
				<c:if test="${userinfo.role == 'admin'}">
			    <li class="nav-item">
			    	<a class="nav-link" href="${root}/user/list">Admin</a>
			    </li>
			    </c:if>
			</ul>
		
		    <div class="text-right">
				<c:if test="${userinfo == null}">
					<a class="btn btn-outline-info" id="btn-login" data-toggle="modal"
						data-target="#loginModal">로그인</a>
					<a class="btn btn-outline-primary" id="btn-signup"
						href="${root}/user/register">회원가입</a>
				</c:if>
				<c:if test="${userinfo != null}">
					<strong>${userinfo.username}</strong>님 환영합니다.
					<a class="btn btn-outline-info" id="btn-logout" href="${root}/user/logout">로그아웃</a>
					
				</c:if>
			</div>
		</div>
	</div>
</nav>


<!-- Login Modal Start -->
<div class="modal" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Login</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form id="loginform" method="post" action="">
					<div class="form-group">
						<label for="id">ID:</label> <input type="text"
							class="form-control" name="muserid" id="muserid"
							placeholder="Enter ID" value="${saveid}">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" name="muserpwd" id="muserpwd"
							placeholder="Enter Password">
					</div>
					<div class="form-group form-check" align="right">
					    <label class="form-check-label">
					      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장 
					    </label>
					</div>
					<button type="button" id="login" class="btn btn-primary btn-block"
						onclick="javascript=intlogin();">Login</button>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<p>
					Not a member? <a href="${root}/user/register">Sign Up</a>
				</p>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<!-- Login Modal End -->
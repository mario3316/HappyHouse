<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- Navigation -->
<nav class="navbar navbar-light bg-light static-top ">
	<div class="container">
		<a class="navbar-brand" href="${root}">Happy House</a>
		<div class="text-right">
			<c:if test="${userinfo == null}">
				<a class="btn btn-outline-info" id="btn-login" data-toggle="modal"
					data-target="#loginModal">로그인</a>
				<a class="btn btn-outline-primary" id="btn-signup"
					href="${root}/user/register">회원가입</a>
			</c:if>
			<c:if test="${userinfo != null}">
				<strong>${userinfo.username}</strong>님 환영합니다.
					<a class="btn btn-outline-info" id="btn-logout"
					href="${root}/user/logout">로그아웃</a>
				<c:if test="${userinfo.role == 'admin'}">
				<a class="btn btn-outline-primary" id="btn-member"
					href="${root}/user/list">회원정보</a>
				</c:if>
				<a class="btn btn-outline-primary" id="btn-admin"
					href="${root}/notice/list?pg=1&key=&word=">공지사항</a>
			</c:if>
		</div>
	</div>
</nav>
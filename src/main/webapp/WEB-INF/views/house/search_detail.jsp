<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 상세 정보</title>
<style type="text/css">
	#container {
		width: 800px;
		padding: 20px;
		margin: 0 auto;
		text-align: center;
	}
	header {
		padding: 20px;
		margin-bottom: 20px;
	}
	aside {
		width: 400px;
		margin-bottom: 20px;
		float: right;
	}
	section {
		width: 350px;
		margin-bottom: 20px;
		float: left;
		text-align: left;
	}
	footer{
		clear: both;
	}
</style>
</head>
<body>
<div id=container>
	<header><h1>아파트 상세 정보</h1></header>
	<section>
		<table>
		<tr>
			<td><b>주택명</b></td>
			<td>${house.aptName }</td>
		</tr> 
		<tr>
			<td><b>건축연도</b></td>
			<td>${house.buildYear }</td>
		</tr>
		<tr>
			<td><b>법정동</b></td>
			<td>${house.dong }</td>
		</tr>
		<tr>
			<td><b>지번</b></td>
			<td>${house.jibun }</td>
		</tr>
		<tr>
			<td><b>위도</b></td>
			<td id="lat">${house.lat }</td>
		</tr>
		<tr>
			<td><b>경도</b></td>
			<td id="lng">${house.lng }</td>
		</tr>
	</table>
	</section>

	<footer>
	
<div id="map" style="width: 50%; height: 500px; margin: auto;"></div>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNsJy7d_yesjenAEdxqXGy-Jx_nN0sLdQ&callback=initMap"></script>
<script>
	let lat_ = parseFloat(document.querySelector("#lat").innerText);
	let lng_ = parseFloat(document.querySelector("#lng").innerText);
	
	var multi = {lat : lat_, lng: lng_};
	var map;
	
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 17
		});
		var marker = new google.maps.Marker({position: multi, map: map});
	}
</script>

	<p><a href="${pageContext.request.contextPath}">메인으로 가기</a></p>	
	</footer>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:eval expression="@environment.getProperty('google.maps.api.key')" var="googleMapsApiKey" />
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

<title>HAPPY HOUSE | 역세권 정보 검색</title>

<!-- Bootstrap core CSS -->
<link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${root}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="${root}/css/landing-page.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=${googleMapsApiKey}&callback=initMap" async defer></script>
<script type="text/javascript">
	
	let map;
	let housemarkers = [];
	let markers = [];
	var lat = 37.606991;
	var lng = 127.0232185;
	var zoom = 14;
	
	function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : lat,
				lng : lng
			},
			zoom : zoom,
		});
	}
	
	$(document).ready(function() {
		let searchinfo;
		
		// 검색 버튼 클릭 시
		$("#searchBtn").click(search);
		// 키보드 엔터를 눌렀을 경우
		$("#word").keydown(function(key) {
			if (key.keyCode == 13) 
				search();
		});
		
	});
	
	// 상권 정보 검색(엔터/버튼)
	function search() {
		if ($("#word").val() == "") {
			alert("검색할 동을 입력해주세요!");
			return;
		}
		
		searchinfo = JSON.stringify({
			"by" : $("#key").val(), 
			"keyword" : $("#word").val(),
		});
		
		beforeDelete();
		getDeals(searchinfo);
		deleteMarker();
		getLatLng();
		setMapOnAll(map);
	}
	
	// 검색 전 이전 데이터 지우기
	function beforeDelete() {
		housemarkers = [];
	}
	
	// 행정동 위도/경도 받아오기
	function getLatLng() {
		$.ajax({
			url: '${root}/search/' + $("#word").val(),  
			type: 'GET',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			success: function(latlng) {
				map.setCenter({
					lat: parseFloat(latlng.lat),
					lng: parseFloat(latlng.lng),
				});
				map.setZoom(14);
			},
			error: function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			}	
		});			
	}
	
	// data 받아오기
	function getDeals(searchinfo) {
		$.ajax({
			url: '${root}/subway/searchBy',
			type: 'POST',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			data: searchinfo,
			success: function(datas) {
				makeTable(datas);
				addMarker(datas);
			},
			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			}	
		});		
	}
	
	// 상세 정보 받아오기
	function getDetail(detailInfo) {
		jsondata = JSON.stringify({
				"dong" : $(detailInfo).attr("dong"), 
				"aptname" : $(detailInfo).attr("aptname"),
		});
		
		$.ajax({
			url: '${root}/house/detail',  
			type: 'POST',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			data: jsondata,
			success: function(datas) {
				makeDetailTable(datas);
			},
			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			}	
		});
	}
	
	function makeDetailTable(data){
		var html = '';
		
		html += '<table class="table table-dark">';
		html += '<thead>';
		html += '<tr>';
		html += '<th>아파트 명</th>';
		html += '<th>동</th>';
		html += '<th>주소</th>';
		html += '<th>건축년도</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '<td>'+data.aptName+'</td>';
		html += '<td>'+data.dong+'</td>';
		html += '<td>'+data.jibun+'</td>';
		html += '<td>'+data.buildYear+'</td>';
		html += '</tr>';
		html += '</tbody>';
		html += '</table>';
		
		$("#DetailBody").empty();
		$("#DetailBody").append(html);
	}
	
	function makeTable(datas){
		var html = '';
		
		for(key in datas){
			detailInfo = JSON.stringify({
				"dong" : datas[key].dong, 
				"aptname" : datas[key].aptName,
			});
			
			html += '<tr onClick="getDetail(this)" dong=' + datas[key].dong + '  aptname=' + datas[key].aptName + '>';
			html += '<td>'+datas[key].no+'</td>';
			html += '<td>'+datas[key].dong+'</td>';
			html += '<td>'+datas[key].aptName+'</td>';
			html += '<td>'+datas[key].jibun+'</td>';
			html += '<td>'+datas[key].subway+'</td>';
			html += '</tr>';
		}
		
		$("#SubwayBody").empty();
		$("#SubwayBody").append(html);
	}
	
	// marker에 정보 추가
	function addMarker(datas) {
		
		var infowindow = new google.maps.InfoWindow();
		
		$(datas).each(function(i, data) {

			const marker = new google.maps.Marker({
				id: i,
				title: data.aptName,
				label: data.aptName,
				position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
				map: map
			});

			// click listener
			google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent("[" + marker.title + "] " + " " + data.dong);
				infowindow.open(map, marker);
				map.setZoom(15);
				map.setCenter(marker.getPosition());
			});
			
			housemarkers.push(marker);
		});
		markers.push(...housemarkers);
	}
	
	// 지도에 markers 표시
	function setMapOnAll(map) {
		for (let i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}	
	}
	
	// 지도에서 markers 삭제
	function deleteMarker() {
		setMapOnAll(null);
		markers = [];
	}
</script>

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
					<form method="post" action="${root}/subway/searchBy">
						<div class="form-row">
							<div class="col-12 col-md-3 mt-1 mb-2 mb-md-0">
								<input type="hidden" name="act" value="searchBy">
								<select class="form-control" id="key" name="by">
									<option value="dong">동이름
								</select>
							</div>
							<div class="col-12 col-md-6 mt-1 mb-2 mb-md-0">
								<input type="text" class="form-control" placeholder="" name="keyword" id="word">
							</div>
		                     <div class="col-12 col-md-3">
                          		<button type="button" id="searchBtn" class="btn btn-block btn-lg btn-outline-light">검색</button>
                     		</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- 디자인 -->
	<div class="container">
	
		<!-- 디자인 -->
	<div class="container">
	
    <!-- map start -->
   	<div class="main col-lg-12 order-lg-2 ml-xl-auto">
      <div class="row girde-space-10">
         <div class="col-12 justify-content-center" id="map" style="width: 400px; height: 600px"></div>
      </div>
   	</div>   
   	<!-- map end -->
	
	
	<div align="center">
		<form>
			<h4 class="mt-3">상세 설명을 보려면 아파트 이름을 클릭하세요.</h4>
			<table class="table table-dark" border='1'>
				<thead>
				<tr>
					<th>no</th>
					<th>동 이름</th>
					<th>아파트 이름</th>
					<th>주소</th>
					<th>지하철역</th>
				</tr>
				</thead>
				<tbody id="SubwayBody">
				</tbody>
			</table>
		</form>
	</div>
	
	<div id="DetailBody"></div>
	
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>


</body>

	</html>
</c:if>
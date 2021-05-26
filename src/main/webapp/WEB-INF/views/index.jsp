<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>HAPPY HOUSE</title>
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="css/landing-page.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNsJy7d_yesjenAEdxqXGy-Jx_nN0sLdQ&callback=initMap" async defer></script>

<script type="text/javascript">	
	var locations = [];
	locations = [ [ '도봉구', 37.6658609, 127.0317674 ],
			[ '은평구', 37.6176125, 126.9227004 ],
			[ '동대문구', 37.5838012, 127.0507003 ],
			[ '동작구', 37.4965037, 126.9443073 ],
			[ '금천구', 37.4600969, 126.9001546 ],
			[ '구로구', 37.4954856, 126.858121 ],
			[ '종로구', 37.5990998, 126.9861493 ],
			[ '강북구', 37.6469954, 127.0147158 ],
			[ '중랑구', 37.5953795, 127.0939669 ],
			[ '강남구', 37.4959854, 127.0664091 ],
			[ '강서구', 37.5657617, 126.8226561 ],
			[ '중구', 37.5579452, 126.9941904 ],
			[ '강동구', 37.5492077, 127.1464824 ],
			[ '광진구', 37.5481445, 127.0857528 ],
			[ '마포구', 37.5622906, 126.9087803 ],
			[ '서초구', 37.4769528, 127.0378103 ],
			[ '성북구', 37.606991, 127.0232185 ],
			[ '노원구', 37.655264, 127.0771201 ],
			[ '송파구', 37.5048534, 127.1144822 ],
			[ '서대문구', 37.5820369, 126.9356665 ],
			[ '양천구', 37.5270616, 126.8561534 ],
			[ '영등포구', 37.520641, 126.9139242 ],
			[ '관악구', 37.4653993, 126.9438071 ],
			[ '성동구', 37.5506753, 127.0409622 ],
			[ '용산구', 37.5311008, 126.9810742 ] ];

	let map;
	var lat = 37.606991;
	var lng = 127.0232185;
	var zoom = 11;

	var move = function(option1, search1) {
		location.href = "AreaTrade.html?" + option1 + '/' + search1;
	};

	function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : lat,
				lng : lng
			},
			zoom : zoom,
		});

		var infowindow = new google.maps.InfoWindow();

		var marker, i;
		for (i = 0; i < locations.length; i++) {
			marker = new google.maps.Marker({
				id : i,
				title : locations[i][0],
				label : locations[i][0],
				position : new google.maps.LatLng(locations[i][1],
						locations[i][2]),
				map : map
			});

			marker.setMap(map);
			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					}));

			if (marker) {
				marker.addListener('click', function() {
					console.log(this.title);
					map.setZoom(15);
					map.panTo(this.getPosition());
				});
			}
		}
	};

	/// 현재 위치를 최초위치로.
	function showLocation(position) {
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
		//alert("Latitude : " + latitude + " Longitude: " + longitude);
		//현재 위치 정보를 center로 지정하기 위해 객체 생성
		var hear = new google.maps.LatLng(latitude, longitude);
		map.panTo(hear); //위치 정보를 통해 맵에 표시 
	}

	function errorHandler(err) {
		if (err.code == 1) {
			alert("Error: Access is denied!");
		} else if (err.code == 2) {
			alert("Error: Position is unavailable!");
		} else if (err.code == 3) {
			alert("Erro : Time out");
		}
	}

	function getLocation() {
		if (navigator.geolocation) {
			var options = {
				timeout : 60000,
				enabledHighAccuracy : true
			};
			navigator.geolocation.getCurrentPosition(showLocation,
					errorHandler, options);
		} else {
			alert("Sorry, browser does not support geolocation!");
		}
	}
</script>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-12 mx-auto">
					<h1 class="mb-5">Happy House 실거래 정보를 찾아보세요</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto" align="center">
					<a class="btn btn-block btn-lg btn-outline-light"
						style="width: 200px" id="btn-logout"
						href="${pageContext.request.contextPath}/house/mvsearch">검색</a>
				</div>
			</div>
		</div>
	</header>

	<div class="container mt-4 mb-4">
		<div style="width: 100%; height: 450px;" class="mb-lg-5 mt-lg-5"
			id="map"></div>
	</div>
	<!-- Icons Grid -->
	<!-- section class="features-icons bg-light text-center">
    <div class="container-fluid">
        <div class="col-lg-11">
          <div class="mx-auto">
          </div>
        </div>
    </div>
  </section -->

	<!-- Image Showcases -->
	<!--
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">
        <div class="col-lg26 order-lg-2 text-white showcase-img" style="background-image: url('img/bg-showcase-1.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>Fully Responsive Design</h2>
          <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
        </div>
      </div>
    </div>
  </section>
   -->
   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
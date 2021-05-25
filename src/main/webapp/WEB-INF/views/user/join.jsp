<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HAPPY HOUSE | 회원가입</title>
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
<!-- 다음 주소검색 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btn-login").css("display", "none");
	$("#btn-signup").css("display", "none");
	
	$("#registerBtn").click(function() {
		if ($("#username").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if ($("#userpwd").val() != $("#pwdcheck").val()) {
			alert("비밀번호 불일치!!!");
			return;
	    } else if ($("#email").val() == "") {
			alert("이메일 입력!!!");
			return;
		} else if ($("#address").val() == "") {
			alert("주소 입력!!!");
			return;
		} else {
			var email = $("#email").val() + "@" + $("#emaildomain").val();
			$("#email").val(email);
			var address = $("#postcode").val() + " " + $("#address").val() + $("#detailAddress").val();
			$("#address").val(address);
			$("#memberform").attr("action", "${root}/user/register").submit();
		}
	});
	
	$(document).on("blur", "#userid", function() {
		let userid = $(this).val();
		$.ajax({
			url:'${root}/user/' + userid,  
			type:'GET',
			contentType:'application/json; charset=utf-8',
			success:function(msg) {
				checkId(msg);
			},
			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			}
		});			
	});
	
	$(document).on("blur", "#pwdcheck", function() {
		 if ($("#userpwd").val() != $("#pwdcheck").val()) {
			$("#pwdcheckmsg").html("비밀번호가 일치하지 않습니다.");
			$("#pwdcheckmsg").css("color", "#ff0000");
		 } else {
			$("#pwdcheckmsg").html("");
		 }
	});
});

function checkId(msg) {
	if (msg.message == 'EXIST') {
		//alert(msg.message);
		$("#check").html("사용할 수 없는 아이디입니다.");
		$("#check").css("color", "#ff0000");		
	} else {
		//alert(msg.message);
		$("#check").html("사용 가능한 아이디입니다.");
		$("#check").css("color", "#0000ff");		
	}
}

function execDaumPostcode() {
    daum.postcode.load(function() {
        new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
              $("#postcode").val(data.zonecode);
              $("#address").val(data.roadAddress);
              
              var extraRoadAddr = ''; // 참고 항목 변수

              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraRoadAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== '' && data.apartment === 'Y') {
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              $("#detailAddress").val(extraRoadAddr);
            }
        }).open();
    });
}
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container" align="center">
	<br><br><br><br>
	<h2>회원 등록</h2>
	
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="">
			<div class="form-group" align="left">
				<label for="name">이름&nbsp;<span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="username" name="username" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="userid">아이디&nbsp;<span class="text-danger">*&nbsp;</span></label>
				<label id="check"></label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="userpwd">비밀번호&nbsp;<span class="text-danger">*</span></label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="pwdcheck">비밀번호 재입력&nbsp;<span class="text-danger">*</span></label>
				<label id="pwdcheckmsg"></label>
				<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="email">이메일&nbsp;<span class="text-danger">*</span></label><br>
				<div class="custom-control-inline">
				<input type="text" class="form-control" id="email" name="email" placeholder="" size="25"> @
				<select class="form-control" id="emaildomain" name="emaildomain">
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="hanmail.net">hanmail.net</option>
				</select>
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="address">주소&nbsp;<span class="text-danger">*</span></label><br>
				<div id="addressdiv" class="custom-control-inline">
					<input type="text" class="form-control" id="postcode" name="postcode" placeholder="" size="7" maxlength="5" readonly>
				</div>
				    <button type="button" class="btn btn-outline-info" onclick="execDaumPostcode()">우편번호</button>
				<input type="text" class="form-control" id="address" name="address" placeholder="도로명주소" readonly>
				<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
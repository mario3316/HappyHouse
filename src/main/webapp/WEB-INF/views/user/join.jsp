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
<script type="text/javascript">
$(document).ready(function() {
	$("#btn-login").css("display", "none");
	$("#btn-signup").css("display", "none");
	
	$("#registerBtn").click(function() {
		if($("#username").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if($("#userpwd").val() != $("#pwdcheck").val()) {
			alert("비밀번호 확인!!!");
			return;
		} else if ($("#email").val() == "") {
			alert("이메일 입력!!!");
			return;
		} else {
			var emailid = $("#email").val();
			var emaildomain = $("#emaildomain").val();
			var email = emailid + "@" + emaildomain;
			$("#email").val(email);
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
	
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
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
</script>
</head>
<body>

<div class="container" align="center">
	<%@ include file="/WEB-INF/views/user/header.jsp" %>
	
	<br><br><br><br>
	<h2>회원 등록</h2>
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="">
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<label id="check"></label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호 재입력</label>
				<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="email">이메일</label><br>
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
				<label for="">주소</label><br>
				<div id="addressdiv" class="custom-control-inline">
					<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" size="7" maxlength="5" readonly="readonly">
					<!--<button type="button" class="btn btn-primary" onclick="javascript:">우편번호</button>-->
				</div>
				<input type="text" class="form-control" id="address" name="address" placeholder="">
				<input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

<div id="zipModal" class="modal fade" role="dialog">
<h5 class="modal-title" id="myModalLabel">우편번호검색</h5>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>    
            <div class="modal-body text-center">
            	<form id = "zip_codeForm">
            		<div align="center">
            			<label>도로명 주소검색</label>
            		</div>
					<div class="input-group" align="left">
						<input type="text" class="form-control" id="doro" name="doro" placeholder="검색 할 도로명 입력(예: 대왕판교로, 학하서로)">
						<span class="input-group-btn">
						<input type="submit" class="btn btn-warning" value="검색" id="searchBtn">
						</span>
					</div>
                </form>
                <div style="width:100%; height:200px; overflow:auto">
                	<table class = "table text-center">
                		<thead>
                		<tr>
                			<th style="width:150px;">우편번호</th>
                			<th style="width:600px;">주소</th>
                		</tr>
                		</thead>
                		<tbody id="zip_codeList"></tbody>
                	</table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
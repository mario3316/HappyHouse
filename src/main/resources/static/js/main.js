

  $(document).ready(function() {
  	 var status_login = false;
  	 
	 $('#login').click(function() {
		$.ajax({
			url: 'xml/userlist.xml',
			type: 'GET',
			dataType: 'xml',
			success: function (response) {
				login(response);
			},
			error: function (xhr, status, msg) {
				console.log('상태값 : ' + status + ' Http에러메시지 : ' + msg);
			},
		});
	});
	
	$('#btn-logout').click(function() {
		status_login = false;
		status();
	});
	 
	function login(data) {
		var exist = false;
		$(data).find('user').each(function(index, item) {
			if ($('#id').val() == $(this).find('id').text()) {
				exist = true;
				
				if ($('#pwd').val() == $(this).find('password').text()) {
					alert('로그인에 성공하셨습니다.');
					status_login = true;
					$('.modal').modal("hide");
					status();
					$('#id').val('');
					$('#pwd').val('');
				} else alert('비밀번호가 일치하지 않습니다.');
			}
		});
		
		if (!exist) alert('존재하지 않는 아이디입니다.');
	};
	
	function status() {
		if (status_login) {
			$('#btn-login').css("display", "none");
			$('#btn-logout').css("display", "");
			$('#btn-signup').css("display", "none");
			$('#btn-member').css("display", "");			
		} else {
			$('#btn-logout').css("display", "none");
			$('#btn-login').css("display", "");
			$('#btn-member').css("display", "none");
			$('#btn-signup').css("display", "");
		}
	 }
  });
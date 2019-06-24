$(document).ready(function(){
	$('#reg-nickCkeck').click(function(){
		var data = {
			nickname : $('#reg-nick').val()
		};
		
		if ($('#reg-nick').val() == '') {
			alert('공백은 허용 되지 않습니다.');
			$('#reg-nick').focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '/member/nickNameCheck',
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			success : function(data){
				console.log(data);
				if (data == 0) {
					$('#reg-nickCkeck').html('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>확인완료');
				} else {
					$('#reg-nickCkeck').html("중복확인");
					$('.hideRegNickCheck').css('display','block');
				}
			},
			error : function(error){
				console.log(error);
			}
		});
	});
	
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		var pwd1 = $("#reg-pwd").val();
		var pwd2 = $("#reg-pwd_ck").val();
		if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
				passwordComfirm = true;
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
				passwordComfirm = false;
			}
		}
	});
	
	$('#reg-submit').click(function(){
		
		if($('#reg-nick').val() == ""){
			$('.hideRegNick').css('display','block');
			
			return false;
		}
		
		if($('#reg-phone').val() == ""){
			$('.hideRegPhone').css('display','block');
			
			return false;
		}
		
		if($('#reg-pwd').val() == ""){
			return false;
		}
		
		if($('#reg-email').val() == ""){
			$('.hideRegEmail').css('display','block');
			
			return false;
		}
		
		if($("#reg-acc_num").val() == "" || $("#reg-acc_name").val() == ""){
			$('hideRegAcc').css('display','block');
			
			return false;
		}
		
		var reg = {
				nickname : $('#reg-nick').val(),
				phone : $('#reg-phone').val(),
				m_password : $("#reg-pwd").val(),
				email : $("#reg-email").val(),
				acc_num : $("#reg-acc_num").val(),
				acc_name : $("#reg-acc_name").val()
		}
		
		$.ajax({
			type : 'post',
			url : '/member/register',
			data : JSON.stringify(reg),
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data == 1){
					window.location.reload();
				}else{
					alert('실패');
					window.location.reload();
				}
			},
			error : function(error){
				console.log(error);
			}
		});
	});
});
/**
 * register 스크립트 부분 처리 완료
 */

// 이용약관 동의
var doc = document;
var form1 = doc.getElementById('form1');
var inputs = form1.getElementsByTagName('INPUT');

var passwordComfirm = false;
var nickNameCheck = false;

var form1_data = {
	"c1" : false,
	"c2" : false,
	"c3" : false
};
var c1 = doc.getElementById('c1');
var c2 = doc.getElementById('c2');
var c3 = doc.getElementById('c3');
function checkboxListener() {
	form1_data[this.name] = this.checked;
	if (this.checked) {
		// submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분.
		this.parentNode.style.color = "#000";
	}
}
c1.onclick = c2.onclick = c3.onclick = checkboxListener;
var all = doc.getElementById('all');
all.onclick = function() {
	if (this.checked) {
		setCheckbox(form1_data, true);
	} else {
		setCheckbox(form1_data, false);
	}
};
function setCheckbox(obj, state) {
	for ( var x in obj) {
		obj[x] = state;
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox") {
				inputs[i].checked = state;
			}
		}
	}
}

// 비밀번호 체크
$(function() {

	var finalSignal2 = false; // 약관 필수 체크

	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		var pwd1 = $("#pwd").val();
		var pwd2 = $("#pwd_ck").val();
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

	// 닉네임 체크 및 핸드폰 번호
	$('#nicknameCkeck').click(function() {
		var nicknameControl = true;
		var nickname = $('#nickname');

		if (nickname.val() == '') {
			alert('공백은 허용 되지 않습니다.');
			nickname.focus();
			nicknameControl = false;
		}
		if (nicknameControl == true) {
			var query = JSON.stringify({
				nickname : $('#nickname').val()
			});
			$.ajax({
				type : 'POST',
				url : "nickNameCheck",
				data : query,
				dataType : 'json',
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					console.log(data);
					if (data.signal == 'SUCCESS') {
						$('#nicknameCkeck').html('확인완료');
						nickNameCheck = true;
					} else {
						alert('닉네임이 중복 됩니다.');
						$('#nicknameCkeck').html('중복확인');
						nickNameCheck = false;
					}
				}
			});
		}
	})

	// finalSignal 처리 함수
	function finalSignal() {
		if (form1_data["c1"] && form1_data["c2"]) {
			/*
			 * alert("c1:" + form1_data["c1"]); alert("c2:" + form1_data["c2"]);
			 */
			finalSignal2 = true;
		}
	}

	var formObj = $("form[role='form']");
	var phoneNull = true;
	// 회원 가입
	$('#submit').click(
			function() {
				var phone = $('#phone');
				if (phone.val() == '') {
					alert('핸드폰 공백을 허용하지 않습니다.');
					phoneNull = false;
					phone.focus();
				} else {
					phoneNull = true;
				}

				finalSignal();
				/*
				 * alert(finalSignal2); alert(nickNameCheck);
				 * alert(passwordComfirm);
				 */
				if (nickNameCheck == false) {
					alert("닉네임 중복확인 하세요");
				}
				if (passwordComfirm == false) {
					alert("비밀번호가 일치하는지 다시한번 확인해봐요");
				}
				if (finalSignal2 == false) {
					alert("필수 약관을 체크 하셔야 합니다.");
				}

				if (finalSignal2 == true && nickNameCheck == true
						&& passwordComfirm == true && phoneNull == true) {
					/* alert("모두 완료"); */

					formObj.submit();
				}

			})

});
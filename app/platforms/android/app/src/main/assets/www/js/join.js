$(document).ready(function() {

    $('#back').click(function() {
        window.location.href="login.html";
    });

    // 이용약관 동의
    var doc = document;
    var form1 = doc.getElementById('form1');
    var inputs = form1.getElementsByTagName('input');

    var passwordComfirm = false;
    var nickNameCheck = false;

    var form1_data = {
    	"list1" : false,
    	"list2" : false,
    	"list3" : false
    };
    var list1 = doc.getElementById('list1');
    var list2 = doc.getElementById('list2');
    var list3 = doc.getElementById('list3');
    function checkboxListener() {
    	form1_data[this.name] = this.checked;
    	if (this.checked) {
    		// submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분.
    		this.parentNode.style.color = "#000";
    	}
    }
    list1.onclick = list2.onclick = list3.onclick = checkboxListener;
    var agreebtn = doc.getElementById('agreebtn');
    agreebtn.onclick = function() {
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

    	var finalSignal2 = false; // 약관 필수 체크

    	$("#alert-success").hide();
    	$("#alert-danger").hide();
    	$("input").keyup(function() {
    		var pwd1 = $("#password2").val();
    		var pwd2 = $("#passwordcf2").val();
    		if (pwd1 != "" || pwd2 != "") {
    			if (pwd1 == pwd2) {
    				$("#alert-success").show();
    				$("#alert-danger").hide();
    				$("#joinbtn").removeAttr("disabled");
    				passwordComfirm = true;
    			} else {
    				$("#alert-success").hide();
    				$("#alert-danger").show();
    				$("#joinbtn").attr("disabled", "disabled");
    				passwordComfirm = false;
    			}
    		}
    	});
    $('#nickbtn').click(function(){

        var nicknameControl = true;
        var nickname = $('#name2');

        if(nickname.val() == ''){
            alert('공백은 허용 되지 않습니다.');
            nickname.focus();
            nicknameControl = false;
        }
        if(nicknameControl == true){
            var query = JSON.stringify({
                nickname : $('#name2').val()
            });
            $.ajax({
                type : 'post',
                url : 'http://39.127.7.47:8080/app/mnickNameCheck',
                data : query,
                contentType : 'application/json;charset=utf-8',
                success : function (data){
                    console.log(data);
                    alert(data.nickname);
                    alert($('#name2').val());
                    if(data.signal == "nonuse"){
                        alert('닉네임이 중복됩니다.');
                        nickNameCheck = false;
                    }else{
                        alert('사용가능한 아이디입니다.');
                        nickNameCheck = true;
                    }
                }
            });
        }
    });
    $('#joinbtn').click(function() {
            alert("뀨>.<");

            var phone = $('#phone2');
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
                					return false;
                				}
                				if (passwordComfirm == false) {
                					alert("비밀번호가 일치하는지 다시한번 확인해봐요");
                					return false;
                				}
                				if (finalSignal2 == false) {
                					alert("필수 약관을 체크 하셔야 합니다.");
                					return false;
                				}
                                alert(finalSignal2 + nickNameCheck + passwordComfirm);
                				if (finalSignal2 == true && nickNameCheck == true
                						&& passwordComfirm == true && phoneNull == true) {
                					alert("모두 완료");

                				}


        var nick = $('#name2').val();
        var pno = $('#phone2').val();
        var pw = $('#password2').val();
        var pwcf = $('#passwordcf2').val();
        var email = $('#email2').val();
        var acc_num = $('#bankAccountNo').val();
        var acc_name = $('#bankName option:selected').val();
        alert(nick + pno + pw + pwcf + email + acc_num + acc_name);



        var param = {
            'nickname' : nick,
            'phone' : pno,
            'm_password' : pw,
            'email' : email,
            'acc_name' : acc_name,
            'acc_num' : acc_num
        };
        console.log(param);
        var joindata = JSON.stringify(param);
        console.log(joindata);
        console.log(typeof joindata);

        $.ajax({
            type : 'post',
            url : 'http://39.127.7.47:8080/app/mregister',
            data : joindata,
            contentType : "application/json; charset=UTF-8",
            success : function(result){
                window.location.href="index.html";
            },
            error : function(req, sta, err){
                alert('123456eeorerre!!!!!', err);
                console.log(req.status);
                console.log(req.responseText);
                console.log(err);
            }
        })
    });
    function finalSignal() {
        		if (form1_data['list1'] && form1_data['list2']) {
        			/*
        			 * alert("c1:" + form1_data["c1"]); alert("c2:" + form1_data["c2"]);
        			 */
        			finalSignal2 = true;
        		}
        	}
    var formObj = $("form[role='form']");
    var phoneNull = true;

    // 회원 가입
});
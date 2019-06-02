$(document).ready(function(){
    $('#login').click(function(){
//        e.preventDefault();
        var id = $('#id').val();
        var pw = $('#pw').val();
        alert(id);
        var param = {
            'nickname' : id,
            'm_password' : pw
        };
        console.log(typeof param);
        console.log(JSON.stringify(param));
        var test= JSON.stringify(param);
        console.log(typeof test);
        $.ajax({
            type : 'post',
            url : 'http://39.127.7.47:8080/app/mlogin',
            data : test,
            contentType : "application/json; charset=UTF-8",
            success : function(result){

                alert(result.signal);
                if(result.signal == "success"){
                    console.log(result.json);
                    console.log(result);


                    sessionStorage.setItem("member", result.json);
                    console.log("1"+sessionStorage.member);
                    console.log("2"+sessionStorage.member.nickname);
                    var json2 = JSON.parse(result.json);
                    var temp = json2.nickname;
                    
                    //토큰이 있다면 있는 토큰 사용하고 없다면 새 토큰 생성.
                    
                        //토큰 생성 시작
                        FCMPlugin.getToken(function(token){
                            localStorage.setItem("token", token);
                            console.log("TOKEN FIREBASE : " + token + 'nickname :' + json2.nickname);
                            alert('nickname :' + json2.nickname + "\n TOKEN FIREBASE : " + token );
                            $.ajax({
                                type : 'post',
                                url : 'http://39.127.7.47:3000/api/push/updateToken',
                                data : { nickname : json2.nickname, token : token  } 
                            });
                        }, function (error) {
                            console.error(error);
                        });
                        //토큰생성 끝

                    
                    //입력된 정보로 로그인정보 및 토큰생성정보를 각각 sessionStorage localStorage 에 저장한다.
                    //그 후 index 페이지로 이동.
                    window.location.href="index.html";
                }else
                    window.location.reload();
                /*if(result=='ok'){
                window.location= 'index.html';
                }else{
                    window.alert('error 발생')
                   window.location.reload();
                }*/
            },
            error : function(request){
                console.log(request);
                console.log(request.responseText);
                $('#loginForm').parent().html(request.responseText);
            }
        })
    })
    $('#join').click(function() {
        window.location.href="join.html";
    });

})
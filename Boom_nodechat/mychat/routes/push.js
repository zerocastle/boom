var express = require('express');
var router = express.Router();
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
var FCM = require('fcm-node');
var serverKey = 'AAAAhMJliMM:APA91bGealuQmtYLism-ypKkPEoR8VEVCFqvWsDBdpt9G7WvRZVX06u_QhIoEcebreTeLgyBp8DyqyfHWCQz9Mut8LNXPhiRf4lfInRsQHNCOGKnvgRRUCoMHNdRROX8Q6mEkpf5KfSj';
var fcm = new FCM(serverKey);
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
<<<<<<< Updated upstream
    user: "tom", //DB-name
    password: "tom", //DB-password
  connectString:"localhost/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
=======
    user:"zicple", //DB-name
    password:"gnslwld12", //DB-password
    connectString:"zicple.cfefxah21brd.ap-northeast-2.rds.amazonaws.com/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
>>>>>>> Stashed changes
    if(err){//에러가 있다면 실행
      console.log("접속에러",err);
    }
    conn=con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});
var pushTokenBuyer = function(sellerToken, buyerToken, message, title, sender, res, fcm){
    var push_data = {
        // 수신대상
        to: buyerToken,
        notification: {
            title: title,
            body: sender +' : '+message,
            sound: "default",
            click_action: "FCM_PLUGIN_ACTIVITY",
            icon: "pushicon.png"
        },
        // 메시지 중요도
        // "to":"/topics/all",
        priority: "high",
        // App 패키지 이름
        restricted_package_name: "kr.yjc.wd3", //config.xml 의 id
        // App에게 전달할 데이터
        "data": {
            "title": title, //chat.js의 184번 라인
            "message": sender +' : '+message, //chat.js의 184번 라인
            "param1": "value1", //Any data to be retrieved in the notification callback 
            "param2": "value2",
        }
    };
    /** 아래는 푸시메시지 발송절차 */
    
    fcm.send(push_data, function (err, response) {
        if (err) {
            console.error('Buyer Push메시지 발송에 실패했습니다.');
            console.error(err);
            return;
        }
        console.log('Buyer Push메시지가 발송되었습니다.');
        console.log(response);
        
    });
    res.send();
}
var pushTokenSeller = function(sellerToken, buyerToken, message, title, sender, res, fcm){
    var FCM = require('fcm-node');
    var serverKey = 'AAAAhMJliMM:APA91bGealuQmtYLism-ypKkPEoR8VEVCFqvWsDBdpt9G7WvRZVX06u_QhIoEcebreTeLgyBp8DyqyfHWCQz9Mut8LNXPhiRf4lfInRsQHNCOGKnvgRRUCoMHNdRROX8Q6mEkpf5KfSj';
    var push_data = {
        // 수신대상
        to: sellerToken,
        notification: {
            title: title,
            body: sender +' : '+message,
            sound: "default",
            click_action: "FCM_PLUGIN_ACTIVITY",
            icon: "pushicon.png"
        },
        // 메시지 중요도
        // "to":"/topics/all",
        priority: "high",
        // App 패키지 이름
        restricted_package_name: "kr.yjc.wd3", //config.xml 의 id
        // App에게 전달할 데이터
        "data": {
            "title": title, //chat.js의 184번 라인
            "message": sender +' : '+message, //chat.js의 184번 라인
            "param1": "value1", //Any data to be retrieved in the notification callback 
            "param2": "value2",
        }
    };
    /** 아래는 푸시메시지 발송절차 */
    
    fcm.send(push_data, function (err, response) {
        if (err) {
            console.error('Seller Push메시지 발송에 실패했습니다.');
            console.error(err);
            return;
        }
        console.log('Seller Push메시지가 발송되었습니다.');
        console.log(response);
        
    });
    return pushTokenBuyer(sellerToken, buyerToken, message, title, sender, res, fcm);
    
}

router.post('/qrToken', function(req,res){
    console.log(req.body);
    var qrTokenSql = "select token, nickname from member where nickname = '"+req.body.seller+"' or nickname ='"+ req.body.buyer+ "'";
    conn.execute(qrTokenSql, function(err, result){
        if(err){
            console.log('qrTokenSql 에러 : ' , err);
        }else {
            console.log('qrTokenSql 성공' , result);
            if(result){
                if(result.rows[0][1] == req.body.seller){
                    var sellerToken = result.rows[0][0];
                    var sellerNick = result.rows[0][1];
                    var buyerToken = result.rows[1][0];
                    var buyerNick = result.rows[1][1];
                } else {
                    var sellerToken = result.rows[1][0];
                    var sellerNick = result.rows[1][1];
                    var buyerToken = result.rows[0][0];
                    var buyerNick = result.rows[0][1];
                }
                console.log('seller : ' + sellerNick+ ',  sellerToken : '+sellerToken);
                console.log('buyer : ' + buyerNick + ',  buyerToken : ' + buyerToken);
                return pushTokenSeller(sellerToken, buyerToken, req.body.message, req.body.title, req.body.sender, res, fcm);
            }
        }
    });
});






//푸시알림전송 : 토큰값을 입력해줘야한다. 현 파일내 총 길이 17 ~ 114번 라인
router.post('/', function(req,res) {
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log(req.body);  
    console.log(req.body.data);
    /*
    client에서 아래과 같은 json data와 url로 post ajax통신을 요청하면
    지정한 수신자의 스마트폰으로 푸시알림이 전송되게 된다.
    $.ajax({
    type : 'post',
    url : 'http://localhost:3000/api/push',
    dataType : 'json',
    data : { 
        token:'수신자의 토큰',
        message : '내용',
        title : '제목',
        sender : '발신자'},
            },
    success : function(){
        console.log('서버에서 반환되는 데이터가 없으므로 그냥 성공했다고 콘솔이나 찍어주자');
    }
    

    수진자의 토큰정보를 얻기 위해선 별도의 통신을 시도해야한다.
    채팅방 이동후 상대방의 토큰정보를 display:none; 과 같이 숨기는 트릭을 사용할 것이다.
    해당 트릭을 위해 
    chatRoom.html $(document).ready(function(){ ... });
    위의 document.ready 콜백함수 속에 서버와 통신을 시도할 것이다.
    해당 통신은 회원의 닉네임을 매개변수로
    토큰정보를 반환하는 함수의 형태를 띌것이며
    ajax를 통해 얻은 결과는 위의 트릭에 넣을 것이다.
     
    해당 함수는 다양한 곳에서 사용할 예정.(모듈화 필수)
    */

    var message = req.body.sender +' : '+ req.body.message;
    console.log(req.body.title, req.body.message, req.body.sender);
    var FCM = require('fcm-node');

    /** Firebase(구글 개발자 사이트)에서 발급받은 서버키 */
    var serverKey = 'AAAAhMJliMM:APA91bGealuQmtYLism-ypKkPEoR8VEVCFqvWsDBdpt9G7WvRZVX06u_QhIoEcebreTeLgyBp8DyqyfHWCQz9Mut8LNXPhiRf4lfInRsQHNCOGKnvgRRUCoMHNdRROX8Q6mEkpf5KfSj';

    /** 안드로이드 단말에서 추출한 token값 */
    // 안드로이드 App이 적절한 구현절차를 통해서 생성해야 하는 값이다.
    // 안드로이드 단말에서 Node server로 POST방식 전송 후,
    // Node서버는 이 값을 DB에 보관하고 있으면 된다.
    
    //var client_token = 'fisgUMGsMLE:APA91bFIWBYRt0g_L2-rNuF_HI6-3zFkiCFYhl4mRSn9pzon9PYJSyhpT3p-EdG-A8UaTP_BDQm3b5aUqq7xlZVFOB5x3N_10iuWhKjh5YvcVzOTlM5OREn-f7EAAh_qujLwm3cDdMEI';
    //에뮬레이터 FCM토큰
    //var client_token='ezeIWyjBT0E:APA91bHZZJRmjVZVZrU1m2UilXvGbLHFYYDuxzCnVbzdUqzCj1o483I_S7BVpcqnfLbmzybYJfpqY_-_-gqkUOHYHz0tfuLsPJfXWl4mspNZ0ur4NEjsWQ5cZFfK_KBKHx2S2Uxq8_D-';
    //일단내폰 FCM토큰 ㅎㅎ;; 원래 채팅방의 상대의 토큰값을 가져와야합니다.
    //따라서 토큰값을 DB에 저장할 필요가 있으며
    
    //ajax 요청시 지정한 토큰으로 전송합니다.
    var client_token = req.body.data;



    /** 발송할 Push 메시지 내용 */
    var push_data = {
        // 수신대상
        to: client_token,
      
        notification: {
            title: req.body.title,
            body: message,
            sound: "default",
            click_action: "FCM_PLUGIN_ACTIVITY",
            icon: "pushicon.png"
        },
        // 메시지 중요도
        // "to":"/topics/all",
        priority: "high",
        // App 패키지 이름
        restricted_package_name: "kr.yjc.wd3", //config.xml 의 id
        // App에게 전달할 데이터
        "data": {
            "title": req.body.title, //chat.js의 184번 라인
            "message": req.body.message, //chat.js의 184번 라인
            "param1": "value1", //Any data to be retrieved in the notification callback 
            "param2": "value2",
        }
    };

    /** 아래는 푸시메시지 발송절차 */
    var fcm = new FCM(serverKey);


    fcm.send(push_data, function (err, response) {
        if (err) {
            console.error('Push메시지 발송에 실패했습니다.');
            console.error(err);
            return;
        }
        console.log('Push메시지가 발송되었습니다.');
        console.log(response);
    });

});
//푸시알림전송 : 토큰값을 입력해줘야한다.


//로그인할때 클라이언트에서 토큰값을 생성. 이 updateToken에 해당 멤버의 닉네임과 토큰값을 전달할것이다.
//그럼 그것들을 이용해 DB member테이블의 token 값을 업데이트 할 예정.
//Member 테이블에 지정한 회원의 토큰정보 업데이트
//1회 발송이 되게끔 해야함
router.post('/updateToken', function(req,res) {
    var memberNickname = req.body.nickname;
    var memberToken = req.body.token;
    var updateMemberTokenSql = "update member set token = '" + memberToken + "' where nickname = '" + memberNickname + "'";
    console.log('updateMemberTokenSql update 실행' + updateMemberTokenSql);
    conn.execute(updateMemberTokenSql, function(err, result){
        if(err){
            console.log('updateMemberTokenSql 에러 : ' , err);
        }else {
            console.log('updateMemberTokenSql 성공' , result);//update 라 적용된 row 수를 반환한다. 아마 1이겠지.
        }
    });
});
//Member 테이블에 지정한 회원의 토큰정보 업데이트






//멤버 FCM토큰 가져오기.필요 데이터는 멤버닉네임.
router.post('/getToken', function(req,res) {
    /*  --사용법
    
    $('.tt').click(function(){
        $.ajax({
            type : 'post',
            url : 'http://localhost:3000/api/push/getToken',
            data : { nickname : 'jack'  },
            success : function(result){
                        console.log(result);
            },
            error : function(err){
                        console.log(err);
            }
        });
    });
       // 복붙해서 사용하시면 됩니다.

    */

    console.log('/getToken 접근' + req.body.nickname);
    var getTokenSql = "select token from member where nickname ='" + req.body.nickname + "'";
    var resultToken;
    conn.execute(getTokenSql, function (err, result) {
        console.log(getTokenSql);
        if(err){
            console.log('/getToken err : ' + err);
        }else{
            if(result.rows.length == 0){
                
            }
            resultToken = result.rows[0][0];
            console.log('/getToken 결과 : ' + req.body.nickname + '의 토큰 ' + resultToken);
            res.send(resultToken);
        }
    });
    
});
//멤버 FCM토큰 가져오기









module.exports = router;
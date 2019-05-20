var express = require('express');
var router = express.Router();


router.post('/', function(req,res) {
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log('토큰토큰토큰토큰토큰토큰토큰토큰토큰');  
    console.log(req.body);  
    console.log(req.body.data);
    var message = req.body.sender +' : '+ req.body.message;
    console.log(req.body.title, req.body.message, req.body.sender);
    var FCM = require('fcm-node');
    /** Firebase(구글 개발자 사이트)에서 발급받은 서버키 */
    
    var serverKey = 'AAAAhMJliMM:APA91bGealuQmtYLism-ypKkPEoR8VEVCFqvWsDBdpt9G7WvRZVX06u_QhIoEcebreTeLgyBp8DyqyfHWCQz9Mut8LNXPhiRf4lfInRsQHNCOGKnvgRRUCoMHNdRROX8Q6mEkpf5KfSj';

    /** 안드로이드 단말에서 추출한 token값 */
    // 안드로이드 App이 적절한 구현절차를 통해서 생성해야 하는 값이다.
    // 안드로이드 단말에서 Node server로 POST방식 전송 후,
    // Node서버는 이 값을 DB에 보관하고 있으면 된다.
    
    var client_token = 'fisgUMGsMLE:APA91bFIWBYRt0g_L2-rNuF_HI6-3zFkiCFYhl4mRSn9pzon9PYJSyhpT3p-EdG-A8UaTP_BDQm3b5aUqq7xlZVFOB5x3N_10iuWhKjh5YvcVzOTlM5OREn-f7EAAh_qujLwm3cDdMEI';
    //에뮬레이터 FCM토큰
    //var client_token='ezeIWyjBT0E:APA91bHZZJRmjVZVZrU1m2UilXvGbLHFYYDuxzCnVbzdUqzCj1o483I_S7BVpcqnfLbmzybYJfpqY_-_-gqkUOHYHz0tfuLsPJfXWl4mspNZ0ur4NEjsWQ5cZFfK_KBKHx2S2Uxq8_D-';
    //일단내폰 FCM토큰 ㅎㅎ;; 원래 채팅방의 상대의 토큰값을 가져와야합니다.
    //따라서 토큰값을 DB에 저장할 필요가 있으며
    //


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



})


module.exports = router;
var express = require('express');
var router = express.Router();
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
var FCM = require('fcm-node');
var serverKey = 'AAAAhMJliMM:APA91bGealuQmtYLism-ypKkPEoR8VEVCFqvWsDBdpt9G7WvRZVX06u_QhIoEcebreTeLgyBp8DyqyfHWCQz9Mut8LNXPhiRf4lfInRsQHNCOGKnvgRRUCoMHNdRROX8Q6mEkpf5KfSj';
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
  user:"zicple", //DB-name
  password:"gnslwld12", //DB-password
  connectString:"zicple.cfefxah21brd.ap-northeast-2.rds.amazonaws.com/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
    if(err){//에러가 있다면 실행
      console.log("접속에러",err);
    }
    conn=con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});
//oracledb.outFormat = oracledb.OBJECT; // 되는거긴 한데 라우터쪽에서 이미 outFormat을 JSON이 아니라 array로 지정했기때문에 걍 default값인 array로 진행함.
// 다음에 진행할 프로젝트에서 nodejs - oracledb간 연동은 위와 같은 환경설정 하에 진행해야 편할듯 ..ㅎㅎㅎㅎㅎ
var schedule = require('node-schedule'); 
var rule = new schedule.RecurrenceRule(); 
var timerCount = 0;

function pushTimer(client_token, title, msg){
    var push_data = {
        // 수신대상
        to: client_token,
        notification: {
            title: title,
            body: msg,
            sound: "default",
            click_action: "FCM_PLUGIN_ACTIVITY",
            icon: "pushicon.png"
        },
        android: {
            ttl: 3600 * 1000,
            notification: {
            icon: "pushicon.png",
            color: '#f45342',
            },
        },
        // 메시지 중요도
        // "to":"/topics/all",
        priority: "high",
        // App 패키지 이름
        restricted_package_name: "kr.yjc.wd3", //config.xml 의 id
        // App에게 전달할 데이터
        "data": {
            "title": title, //chat.js의 184번 라인
            "message": msg, //chat.js의 184번 라인
            "timer": 'true', //Any data to be retrieved in the notification callback 
            "param2": "value2",
            "content-available": '1'
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
}


//날짜포맷 변경하는 함수.
function GetFormattedDate(date) {
    var todayTime = new Date(date);
    var month = todayTime.getMonth() + 1;
    var day = todayTime.getDate();
    var year = todayTime.getFullYear();
    var hour = todayTime.getHours();
    var minute = todayTime.getMinutes();
    
    //            19/07/17 18:11
    return year + "/" + month + "/" + day + " " + hour + ":" + minute;
}

// * * * * * *
// ┬ ┬ ┬ ┬ ┬ ┬
// │ │ │ │ │ │
// │ │ │ │ │ └ day of week (0 - 7) (0 or 7 is Sun)
// │ │ │ │ └───── month (1 - 12)
// │ │ │ └────────── day of month (1 - 31)
// │ │ └─────────────── hour (0 - 23)
// │ └──────────────────── minute (0 - 59)
// └───────────────────────── second (0 - 59, OPTIONAL)
// * * 3 * * * 매일 3시 00분 00초 부터 3시 59분 59초까지 1초간격으로 실행
// * 24 * * * * 매일 매시 24분 00초부터 24분 59초까지 1초간격으로 실행
// */1 * * * * * 매초 마다 실행되는 코드
// 0 0 * * * * 매시 00분 00초마다 실행되는 코드 -> 매시 정각에 1회 실행
schedule.scheduleJob('0 * * * * *', function() {  //테스트용 매분 0초마다 실행한다.
      console.log("1시간마다 한번씩 실행됩니다. : 서버가 켜지고 " + timerCount + '회 실행하였습니다.'); 
      timerCount++; 
      
      // timer : 결제일 + 7일 또는 입고일 + 7일 timer 이내로 입출고가 되지 않으면 거래 취소
      // 입고일 또는 출고일 기간내에 입출고 되지않은 채팅방 목록을 불러온다.
      // 해당 채팅방에 거래취소메시지 전송 및 fcm push알림, timer 초기화, 상품거래상태 초기화 동작.
      var searchTimeoverSQL = "select chatroom.*, (select nickname from member where m_num = seller_num) seller, (select state_msg from production where pro_num = chatroom.pro_num) msg, (select token from member where m_num = seller_num) s_num, (select token from member where m_num = buyer_num) b_num, (select title from production where pro_num = chatroom.pro_num) tt  from chatroom  where timer < TO_DATE(SYSDATE,'YY/MM/DD HH24:MI')";
      console.log('searchTimeoverSQL : ' + searchTimeoverSQL);
      conn.execute(searchTimeoverSQL, function(err,result){
        console.log(result);
        var arr = [];
        var msg = '';
        for(var i = 0 ; i < result.rows.length; i++){
            arr[i] = new Promise(function (resolve, reject) {//동기적 처리를 위한 Promise 사용.
                if(result.rows[i][9] == '1'){
                    msg = '입고기간 내 입고절차가 이루어지지 않아 거래가 취소되었습니다.';
                }else if(result.rows[i][9] == '2'){
                    msg = '출고기간 내 출고절차가 이루어지지 않아 거래가 취소되었습니다.';
                }
                var num = result.rows[i][0];
                var timerInsertSQL = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = 'System'), " + num + ", '" + msg + "')";
                var json = {
                    pro_num : result.rows[i][6],
                    b_token : result.rows[i][11],//jack- 에뮬
                    s_token : result.rows[i][10],//tom- 내폰
                    title : result.rows[i][12],
                    msg : msg
                }
                console.log(json);
                console.log(timerInsertSQL);
                conn.execute(timerInsertSQL, function (err2, result2) { //해당 채팅방에 경고메시지를 보내준다.
                    if (err2) {
                      console.log("timerInsertSQL 메시지 입력에러", err2);
                    } else {
                      console.log("timerInsertSQL result : ", result2);
                    }   
                    resolve(json);
                });
            }).then(function(result){//상품 상태값을 기본값으로 바꾼다 -> 입출고기간이 지난 상품을 거래 이전 상태로 돌린다.
                conn.execute('update production set state_msg = null where pro_num = ' + result.pro_num,function(err3, result3){
                    if (err3) {
                        console.log("update production state_msg 업데이트", err3);
                      } else {
                        console.log("타이머업데이트result : ", result3);
                      }
                      
                });
                return result;
            }).then(function(result){//timer 설정을 다시 기본값(null)으로 바꾼다. -> 입출고기간이 지난 채팅방을 거래 이전상태로 돌린다.
                conn.execute('update chatroom set timer = null where pro_num = ' + result.pro_num,function(err3, result3){
                    if (err3) {
                        console.log("update roomchat timer 업데이트", err3);
                      } else {
                        console.log("타이머업데이트result : ", result3);
                      }
                });
                return result;
            }).then(function(result){
                var client_token = result.b_token;///buyer token
                var title = result.title;
                var message = 'System : ' + result.msg;
                /** 발송할 Push 메시지 내용 */
                pushTimer(client_token, title, message);
                return result;
            }).then(function(result){
                var client_token = result.s_token;///seller token
                var title = result.title;
                var message = 'System : ' + result.msg;
                /** 발송할 Push 메시지 내용 */
                pushTimer(client_token, title, message);
                return result;
            });
        }
        Promise.all(arr).then(function (values) {/// 모든 promise가 완료.
            console.log("모두 완료됨", values);
        });

    });
});

router.get('/', function(req,res) {
    console.log('어서와 테스트페이지야. 하는거 없고 쿼리결과 정상출력이나 날짜타입 데이터들 포맷 건드리는거 테스트할려고 만든 처리부분이야.');
    var jsonArr = [];
    var searchTimeoverSQL = "select TO_DATE(timer,'YY/MM/DD HH24:MI') timer, (select nickname from member where m_num = seller_num) overNickname from chatroom where timer < TO_DATE(SYSDATE,'YY/MM/DD HH24:MI')";
      console.log('searchTimeoverSQL : ' + searchTimeoverSQL);
      conn.execute(searchTimeoverSQL, function(err,result){

        // oracle outFormat.OBJECT 라면 실행가능한 코드들... result.rows가 JSONArray 형태라 사용하기 편하다.
        // if(err){
        //     console.log('searchTimeoverSQL error : ', err);
        // }else {
        //     jsonArr = result.rows;
        //     for(var i = 0; i < result.rows.length ; i++){
        //         jsonArr[i].OVERTIME;
        //     }
        //     console.log('searchTimeoverSQL success : ' , result.rows[0].OVERTIME);
        //     console.log('searchTimeoverSQL success : ' , result.rows[0].OVERNICKNAME);
        // }

        if(err){
            console.log('searchTimeoverSQL error : ', err);
        }else {
            console.log('searchTimeoverSQL success : 닉네임 : ' , result.rows[0][1] + '  기한 : '+ GetFormattedDate(result.rows[0][0]));
        }

    });
});


router.post('/', function(req,res) {
    console.log('결제가 완료되어 결제타이머 시작, 1주일 이내로 상품 입고 해야합니다.');
    console.log('접근한 Data : ',  req.body.room_id);
    var timerSQL = "update chatroom set timer = TO_DATE(SYSDATE+7,'YY/MM/DD HH24:MI') where room_id = " + req.body.room_id;
    console.log('timerSQL : ' , timerSQL);
    conn.execute(timerSQL, function(err,result){
        if(err){
            console.log('timerSQL error : ', err);
        }else {
            console.log('timerSQL success : ' + result);
        }
    });
});






module.exports = router;
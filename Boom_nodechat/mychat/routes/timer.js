var express = require('express');
var router = express.Router();
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
  user:"tom", //DB-name
  password:"tom", //DB-password
  connectString:"localhost/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
    if(err){//에러가 있다면 실행
      console.log("접속에러",err);
    }
    conn=con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});
//oracledb.outFormat = oracledb.OBJECT; // 되는거긴 한데 라우터쪽에서 이미 outFormat을 JSON이 아니라 array로 지정했기때문에 걍 default값인 array로 진행함.
// 다음에 진행할 프로젝트에서 nodejs - oracledb간 연동은 위와 같은 환경설정 하에 진행해야 편할듯 ..ㅎㅎㅎㅎㅎ
var schedule = require('node-schedule'); 
var rule = new schedule.RecurrenceRule(); 
var num = 0;

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
schedule.scheduleJob('0 0 * * * *', function() {  
      console.log("1시간마다 한번씩 실행됩니다. : 서버가 켜지고 " + num + '회 실행하였습니다.'); 
      num++; 
      // timer : 결제일 + 7일. timer 이내로 입고가 되지 않으면 거래 취소
      var searchTimeoverSQL = "select chatroom.*, (select nickname from member where m_num = seller_num) seller from chatroom  where timer < TO_DATE(SYSDATE,'YY/MM/DD HH24:MI')";
      console.log('searchTimeoverSQL : ' + searchTimeoverSQL);
      conn.execute(searchTimeoverSQL, function(err,result){
        
        // oracle outFormat.OBJECT 라면 실행가능한 코드들... result.rows가 JSONArray 형태라 사용하기 편하다.
        // if(err){
        //     console.log('searchTimeoverSQL error : ', err);
        // }else {
        //     for(var i = 0 ; i < result.rows.length ; i++){
        //         console.log('searchTimeoverSQL success : ' , result.rows[i].SELLER);
        //     }
        // }

        

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
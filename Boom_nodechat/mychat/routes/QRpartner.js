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


router.post('/', function(req,res) {
    console.log('QR큐알QR큐알QR큐알QR큐알QR큐알QR큐알');  
    console.log('QR큐알QR큐알QR큐알QR큐알QR큐알QR큐알');  
    console.log(req.body.nickname + req.body.pro_num);
    
    var QR_partnerSql = "select pd.state_msg from production pd, payment py where pd.pro_num = py.pro_num and py.pro_num = "+req.body.pro_num+" and SUBSTR(py.place_pick, 1, (instr(py.place_pick,'-')-1)) in (select part_name from partner where m_num = (select m_num from member where nickname = '"+req.body.nickname+"'))";
                      
    console.log('QR_partnerSql 쿼리 실행 : ' + QR_partnerSql);
    conn.execute(QR_partnerSql, function (err, result) {
        if(err){
            console.log('QR_partnerSql 쿼리 에러' + err);
            res.send({nickname : 'null',state_msg : 'null', state : 'error'});
        }else {
            if(result.rows.length ==0){
                console.log('QR_partnerSql 쿼리 결과가 없다. : 0 row.');
                res.send({nickname : 'null',state_msg : 'null', state : 'false'});
            }else {
                console.log('QR_partnerSql 쿼리 성공' + result.rows);
                console.log('QR_partnerSql ajax-post에 응답할 데이터 : ' + result.rows[0][0] );
                res.send({state_msg : result.rows[0][0], state : 'success'});
            }
        }
    });

});




//
router.post('/accept', function(req,res) {
    console.log(req.body.pro_num +'///' + req.body.state );
    var promiseAccept = function (req){
        return new Promise(function (resolve, reject) {
            if(req.body.state == 2){
                conn.execute('update chatroom set timer = sysdate +7 where room_id = ' + req.body.room_id, function(err, result){
                    if(err){
                        console.log('입고 후 출고타이머 재설정 업데이트 에러', err);
                    }else {
                        console.log('입고 후 출고타이머 재설정 업데이트 성공', result);
                    }
                    resolve(req);
                });
            }
        });
    }
    promiseAccept(req).then(
        function(req){
            var acceptSql = "update production set state_msg = '"+req.body.state+"' where pro_num = " + req.body.pro_num;
            console.log('acceptSql : ' + acceptSql);
            conn.execute(acceptSql, function(err,result){
                if(err){
                    console.log(err);
                } else {
                    console.log("acceptSql's accepted rows : " + result);
                    res.send({data: 'success'});
                }
            })
        }, function(error){
            console.log(error);
        }
    )
});


router.post('/getRoomid', function(req,res) {
    var seller = req.body.seller;
    var buyer = req.body.buyer;
    var pro_num = req.body.pro_num;
    var getRoomidSql = "select room_id from chatroom where pro_num = " + pro_num +" and seller_num = (select m_num from member where nickname = '"+seller+"') and  buyer_num = (select m_num from member where nickname = '"+buyer+"')";

    conn.execute(getRoomidSql, function(err,result){
        if(result.rows.length == 0){
            console.log('에러발생 getRoomidSql');
            res.send({'room_id':'error'});
        } else {
            var room_id = result.rows[0][0];
            console.log('채팅방 아이디는 : '+ room_id);
            res.send({'room_id':room_id})
        }
    });
    
});




module.exports = router;
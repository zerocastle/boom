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
    console.log(req.body.place + req.body.pro_num);
    ////  되는거//var QR_partnerSql = "select nickname from member where m_num = (select m_num from partner where part_name = '"+req.body.place+"')";
    var QR_partnerSql = "select m.nickname, p.state_msg from member m,production p where m.m_num = (select m_num from partner where part_name = '"+req.body.place+"') and m.m_num = "+req.body.pro_num;
                      //"select nickname from member where m_num = (select m_num from partner where part_name = '"+tomsjack+"')";
                      //"select m.nickname, p.state_msg from member m,production p where m.m_num = (select m_num from partner where part_name = '"+req.body.place+"')"and m.m_num = p.m_num";
                      //"select m.nickname, p.state_msg from member m,production p where m.m_num = (select m_num from partner where part_name = '"+req.body.place+"')"and m.m_num = p.m_num";
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
                console.log('QR_partnerSql ajax-post에 응답할 데이터 : + ' + result.rows[0][0] + result.rows[0][1]);
                res.send({nickname : result.rows[0][0],state_msg : result.rows[0][1], state : 'success'});
            }
        }
    });

});









module.exports = router;
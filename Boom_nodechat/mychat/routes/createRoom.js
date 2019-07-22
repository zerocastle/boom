var express = require('express');
var router = express.Router();
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
    user: "tom", //DB-name
    password: "tom", //DB-password
  connectString:"localhost/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
    if(err){//에러가 있다면 실행
      console.log("접속에러",err);
    }
    conn=con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});



/***
 * 바로 아래(24번라인, 39번라인) 두 함수 findRoom_func(req,res,conn)와 createRoom_func(req,res,conn)의 세가지 매개변수들은 
 * 각각 요청객체 응답객체 DB커넥션 객체다. 
 * 전역변수에 있는걸 끌어다쓸려니 종종 에러가 발생함(undefined 에러). 
 * 따라서 매개변수로 받아 쓸거야 삽질히히.
 */
var createRoom_func = function(req,res,conn){ // 방을 생성하는 함수.
    var createRoomSql = "insert into chatroom(room_id, pro_num, seller_num, buyer_num) values (chatroom_seq.nextval, " + req.body.pro_num + " , " + req.body.seller_num + ", (select m_num from member where nickname = '" +req.body.buyer_nickname+ "'))";
    console.log(createRoomSql);
    conn.execute(createRoomSql,function(err,result){
        if(err){
            console.log('createRoomSql 에러 : ' + err);
        }else {
            console.log('createRoomSql 성공 '); //방이 생성되었다면 findRoom_func를 다시 시도하여 방을 탐색한다. 
            return findRoom_func(req,res,conn);
        }
    })
    
}

//방을 찾는 함수. 상품번호와 구매자, 판매자 정보로 탐색한다. 
var findRoom_func = function(req,res,conn){
    var findRoomSql = "select room_id, seller_num, buyer_num, pro_num,(select nickname from member where m_num = seller_num ), (select nickname from member where m_num = buyer_num )   from chatroom where buyer_num = (select m_num from member where nickname = '"+req.body.buyer_nickname+"') and seller_num = "+req.body.seller_num+" and pro_num = " + req.body.pro_num;
    //판매자의 번호와 구매자의 닉네임, 상품번호로 탐색.
    console.log(findRoomSql);
    conn.execute(findRoomSql,function(err,result){
        if(err){
            console.log('findRoomSql 에러 : ' + err);
        }else {
            if(result.rows.length == 0){//결과가 없다면 --> 방이 없음..
                console.log('findRoomSql 방이 없네요.');
                return createRoom_func(req,res,conn);//없다면 방생성을 시도한다.
            }else {//있다면 해당 방에 접속하기 위한 쿼리스트링을 작성한다.
                if(result.rows[0][1] == null || result.rows[0][2] == null){
                    var str = 'room_id='+result.rows[0][0]+'&talker=out&seller='+result.rows[0][4]+'&buyer='+result.rows[0][5]+'&pro_num='+result.rows[0][3]+'&mobile=1';
                }
                else {
                    var str = 'room_id='+result.rows[0][0]+'&talker=in&seller='+result.rows[0][4]+'&buyer='+result.rows[0][5]+'&pro_num='+result.rows[0][3]+'&mobile=1';
                }
                console.log('findRoomSql 방이 있네요 : '+str);
                res.send({'url':str});//쿼리스트링을 전달한다. productview.html의 790번 라인 참조.
            }
        }
    });

    
}
router.post('/', function(req,res) {
    console.log('http://경로~~~:3000/api/createRoom/ Welcome!' , req.body);
    findRoom_func(req,res,conn);

});


module.exports = router;
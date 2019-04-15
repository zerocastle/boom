//한글깨져? can you read korean words? 한글안깨져?
/* socket\room_chat\app.js */
var express = require('express'); // express 서버 import
var app = express(); // 서버 객체 생성
const http = require('http').Server(app); // http 통신규약 import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis의 connection 객체가 될 변수
app.use(session({ // 세션사용을 위한 절차
	secret: '12sdfwerwersdfserwerwef', //keboard cat (랜덤한 값)
	resave: false,
	saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource파일들의 경로설정을 위한 절차
app.set('view engine', 'ejs'); //뷰 템플릿 지정. .ejs 로 작성되어야한다. 
app.set('views', './views'); //경로지정. view단의 파일들은 해당 경로에 저장되어야 한다.


let room = [];//socketIO의 방 객체가 담길 배열
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
  user:"tom", //DB-name
  password:"tom", //DB-password
  connectString:"39.127.7.47/orcl"},function(err,con){ //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
    if(err){//에러가 있다면 실행
      console.log("접속에러",err);
    }
    conn=con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});

var sRoom;//방넘버를 공유하기 위해 전역변수로 지정함.

//목록중 하나를 클릭하였을때 실행
app.get('/roomchat', (req, res) => {//localhost:3000/roomchat 으로 접근시 실행 
  console.log("언놈이 들어왔노 :", req.session)//request객체의 세션값 읽음
  console.log("언놈이 들어왔노 :", req.session.nickname)//세션의 nickname변수에 저장된 값을 찍어본다.
  sRoom = req.query.room_id;////--쿼리스트링 값을 받아온다. req.query.변수명;
  if(req.session.nickname==undefined){//세션에 닉네임이 없다면 실행
    res.render('tomson');//에러처리페이지인 tomson.ejs로 이동한다.
  }
  if(sRoom == undefined){//쿼리스트링값이 없다면
  sRoom = req.query.room_id;} // 쿼리스트링 값을 받아온다.
  console.log("입장합니다! : "+sRoom);
  
  //console.log 활용법
  // var inttt = 5; 정수 값을 가진 변수를 선언
  //console.log('메시지', inttt) 정수로서 사용된다. 쉼표를 찍으면 해당 변수의 원본 데이터타입이 유지된다.
  //console.log('메시지' + inttt) 문자열로서 사용된다. 타입캐스팅이 이루어진다.


//select문의 result 객체 다루는 법
// result는 JSON으로 전달되며 . metaData, rows 라는 key를 가지고 있다. {metaData는 다룰일이 없어 기술하지않음}
            // [metaData:{key:value}][rows:['1301015','김재근','010-4241-1101']['1600243','박땡땡','010-4447-2663']...]
            // result.rows는 select문의 결과집합을 가지고 있으며 이중배열의 형태로 반환된다.
            // result.rows       --> [['1301006' ,'김재근'], ['1500222', '박뭐뭐'], ['1711111', '하하']
            // result.rows[0]    --> ['1301006', '김재근'] 와 같은 형식
            // result.rows[1][1] --> ['박뭐뭐']
            // result.rows[x][y] --> x : row를 선택,  y:column을 선택



  //목록의 방번호를 이용해 해당하는 디비의 메시지내역을 불러온다.
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('입장한 방번호:'+sRoom);
  if(err){//에러가 발생한다면 실행
      console.log("/ROOMCHAT : 등록중 에러가 발생", err);
  }else{//정상작동시
    console.log("result: "+result);
    console.log("result: ",result.rows);
    //roomchat2.ejs 로 이동한다. //이동할때 key:value형태로 쿼리결과, 세션의 닉네임, 방번호를 전달한다. 
    res.render('roomchat2',{result:JSON.stringify(result), nickname:req.session.nickname, roomid:sRoom  });
  }
  });
});


// 방목록 불러오기
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat 으로 접근시 실행
  client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
    client.get("user", function(err, val) {//스프링에서 저장한 redis객체에 "user"라는 키의 값을 찾아 함수실행
    testdata=val;
    req.session.nickname = val;//세션의 nickname 변수에 redis객체에서 받아온 값을 넣어준다.
    console.log('찍어봅시다 : ' , val) // 채팅서버에 접속한 유저의 nickname을 찍어본다.
    if(val === null) {//값이 없다면 요거하고 땡
      console.log('>>>>> result : null ');
    }
    else {//값이 있다면 실행
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //닉네임으로 유저의 회원번호 알아내어 해당 번호가 구매자 또는 판매자로 존재하는 채팅방을 검색한다.
      conn.execute(loglogsql,function(err, result){ // 긴 쿼리문을 실행한다.
        if(result == 'undefined'){
          console.log('결과값이 undefined입니다. 실행이 정상동작하지 않습니다.');
        }
        else if(err){
          console.log("/jackchat : 에러가 발생했어요!! ", err);
        }else if(!result.rows.length){// 0은 false라고 판단하는것을 이용, row가 0이 아니라면 다시말해 rows가 1이상이라면.
          console.log("result.rows: 리저어어얼트로우",result.rows); //결과값 확인용 찍어본다.
          res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{  
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DB쿼리문- if else 
      });//if else- redis의 값
      }//client.get 함수
    });//redis create 함수
});//app.get함수

io.on('connection', (socket) => {//socketIO연결이 되며 소켓에 전송되는 문자열이 일치하는 메소드를 실행한다.

  socket.on('disconnect', () => {//socket에 disconnect라는 메시지가 전송되면 실행
    console.log('user disconnected');// ㅎㅎ 이거 하는거 없음 ㅎㅎ
  });

  //내가 좀더 찾아봐야할 부분이라 제거하지 않음. 사용되어지진 않는다.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  //roomchat2.ejs에서 방나가기 버튼 클릭시 실행된다.
  socket.on('room_out', (num,name) => {
    console.log(name+'회원이 No.'+num+'방을 나가셨습니다.' ); //서버콘솔에 나간 회원을 찍어본다.
//    select seller_num, buyer_num from chatroom where room_id = 442;
    var m_num1;
    var buyer;
    var upnull;
    conn.execute("select m_num from member where nickname = '"+name+"'", function(err, result){
      m_num1 = result.rows[0][0];
      console.log("마! 이게 m_num이다!",m_num1);
    });
    conn.execute("select buyer_num from chatroom where room_id = "+num+"",function(err,result){
      buyer = result.rows[0][0];
      console.log("마! 이게 구매자이다!",buyer);
    });
    if(m_num1==buyer && m_num1!=undefined){
      console.log('와 구매자가 튀었네예!');
      upnull = "update chatroom set buyer_num = null where room_id = "+num;
    } else {
      console.log('와 판매자가 튀었네예!');
      upnull = "update chatroom set seller_num = null where room_id = "+num;
    }
    conn.execute(upnull,function(err,result){
      console.log("그분이 나가셨어요 ㅜㅜ",result);
    });



//    update chatroom set seller_num = null where room_id = 422;
//    update chatroom set buyer_num = null where room_id = 422;
    
    //var room_outSql = "delete from chatroom where room_id = "+num+" ";
    //입장한 채팅방을 나가며 연관된 메시지 테이블의 내용도 일부 제거된다. - 메시지 테이블 생성시 delete on cascade 키워드를 추가했기에 가능하다.
    
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //상품테이블의 채팅방 갯수를 줄인다. - (방번호를 이용해 방의 상품번호를 알아낸다.) - 알아낸 상품번호의 채팅방갯수를 하나 줄인다.
    
    conn.execute(change_countSql,function(err,result){//업데이트문 실행
      if(err){
        console.log("change_countSql 에러 :",err);
      } else {  
      console.log('상품 테이블에 채팅방갯수 줄이기', result); // 적용된 row 수 반환
      }
    });



/*
    conn.execute(room_outSql,function(err,result){//딜리트문 실행
      if(err){
        console.log("room_outSql 에러 :",err);
      } else {
      console.log('채팅방 지우기' , result); // 적용된 row 수 반환
    }      
    });

    

*/

    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, "+num+", '상대방이 채팅방을 나갔습니다.')",function(err,result){
      if(err){
          console.log("등록중 에러가 발생했어요!! 메시지 입력에러", err);
      }else{
          console.log("result : ",result);
      }
    });


    // 한 회원이 나가기를 실행했다는 사실을 남은 회원에게 알려주기 위해 룸챗으로 room_out신호를 보낸다
    io.to(room[num]).emit('room_out', num, name);
  });

  //방에 입장한다면 실행
  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {//socket의 방 배열 중 num번째 방에 입장한다.
      console.log(name + ' join a ' + num);
      io.to(room[num]).emit('joinRoom', num, name);//입장한 방에 입장신호를 보낸다.
    });
  });


  socket.on('chat message', (num, name, msg) => {//채팅 신호가 온다면
    a = num; //왜했지 이걸

    console.log('회원 '+name+'의 메시지전달 : num :', num, msg);//정상적인지 찍어보기
    
    //insert 실행
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("등록중 에러가 발생했어요!! 메시지 입력에러", err);
      }else{
          console.log("result : ",result);
      }
    });
    io.to(room[num]).emit('chat message', name, msg);//해당 방에 이름과 메시지를 전송
  });
});




http.listen(3000, () => { // 서버를 실행시킨다.
  console.log('Connect at 3000');
});
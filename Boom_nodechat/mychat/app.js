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


let room = [];//방 객체 테스트용으로 만듬
let a = 0;

var conn;
var oracledb = require("oracledb");
oracledb.autoCommit = true;
oracledb.getConnection({
  user:"tom",
  password:"tom",
  connectString:"39.127.7.47/orcl"},function(err,con){
    if(err){
      console.log("접속에러",err);
    }
    conn=con;

    

});

app.get('/', (req, res) => {
  res.render('chat');
});
var sRoom;
//목록중 하나를 클릭하였을때
app.get('/roomchat', (req, res) => {
  console.log("언놈이 들어왔노 :", req.session)
  console.log("언놈이 들어왔노 :", req.session.nickname)
  sRoom = req.query.room_id;
  if(req.session.nickname==undefined){
    res.render('tomson');
  }
  if(sRoom == undefined){
  sRoom = req.query.room_id;} // 쿼리스트링 값을 받아온다.
  console.log("입장합니다! : "+sRoom);
  //INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('못읽:?'+sRoom);
  if(err){
      console.log("/ROOMCHAT : 등록중 에러가 발생음 못읽..ㅠㅠ", err);
  }else{
    console.log("result: "+result);
    console.log("result: ",result.rows); 
    res.render('roomchat2',{result:JSON.stringify(result),nickname:req.session.nickname,roomid:sRoom });
  }
  });
});

app.get('/menutest', (req, res) => {
  res.render('test');
});





// 방목록 불러오기
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat 으로 접근시 실행
  client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
    client.get("user", function(err, val) {//스프링에서 저장한 redis객체에 "user"라는 키의 값을 찾아 함수실행
    testdata=val;
    req.session.nickname = val;
    console.log('찍어봅시다 : ' , val) // 채팅서버에 접속한 유저의 nickname을 찍어본다.
    
    if(val === null) {//값이 없다면 요거하고 땡
      console.log('>>>>> result : null ');
    }
    else {//값이 있다면 실행 select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title        from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'jackson') or      buyer_num = (select m_num from member where nickname = 'jackson'));
    //select c.room_id, (select nickname from member where m_num = c.buyer_num), (select nickname from member where m_num = c.seller_num), c.pro_num, o.title from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'tom') or      buyer_num = (select m_num from member where nickname = 'tom'));
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //conn.execute("select room_id, room_title from test_room where buyer_id = '"+val+"' or seller_id = '"+val+"'",
      conn.execute(loglogsql,
      function(err, result){
        if(result == 'undefined'){
            console.log('결과값이 비어있어 실행이 정상동작하지 않습니다.')
        }
        
      //conn.execute("select room_id, room_title from test_room where buyer_id = 'tom' or seller_id = 'tom'",function(err,result){ 이게 실행이됩니다.
        else if(err){
            console.log("/jackchat : 등록중 에러가 발생했어요!! ", err);
        }else if(!result.rows.length){
        console.log("result: 리저어어얼트",result);
        console.log("result.rows: 리저어어얼트로우",result.rows);
        console.log("result의 길이값 @@@@@@@@@@   "+result.rows.length);
            console.log("/jackchat : ROws가 0이다. ");
            res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{
            
            // result는 JSON으로 전달되며 . metaData, rows 라는 key를 가지고 있다. {metaData는 다룰일이 없어 기술하지않음}
            // [metaData:{key:value}][rows:['1301015','김재근','010-4241-1101']['1600243','박땡땡','010-4447-2663']...]
            // result.rows는 select문의 결과집합을 가지고 있으며 이중배열의 형태로 반환된다.
            // result.rows       --> [['1301006' ,'김재근'], ['1500222', '박뭐뭐'], ['1711111', '하하']
            // result.rows[0]    --> ['1301006', '김재근'] 와 같은 형식
            // result.rows[1][1] --> ['박뭐뭐']
            // result.rows[x][y] --> x : row를 선택,  y:column을 선택
              
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DB쿼리문- if else 
      });//if else- redis의 값
      }//client.get 함수
    });//redis create 함수
});//app.get함수

io.on('connection', (socket) => {//socketIO연결이 되며 소켓에 전송되는 문자열이 일치하는 메소드를 실행한다.
  socket.on('disconnect', () => {//socket에 disconnect라는 메시지가 전송되면 실행
    console.log('user disconnected');
  });


  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  socket.on('room_out', (num,name) => {
    console.log(name+'회원이 No.'+num+'방을 나가셨습니다.' );
    var room_outSql = "delete from chatroom where room_id = "+num+" ";
    //입장한 채팅방을 나가며 연관된 메시지 테이블의 내용도 일부 제거된다.
    
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //상품테이블의 채팅방 갯수를 줄인다. - (방번호를 이용해 방의 상품번호를 알아낸다.) - 알아낸 상품번호의 채팅방갯수를 하나 줄인다.
    
    conn.execute(change_countSql,function(err,result){//업데이트문 실행
      if(err){
        console.log("change_countSql 에러 :",err);
      } else {  
      console.log('상품 테이블에 채팅방갯수 줄이기', result);
      }
    });

    conn.execute(room_outSql,function(err,result){//딜리트문 실행
      if(err){
        console.log("room_outSql 에러 :",err);
      } else {
      console.log('채팅방 지우기' , result);
    }      
    });


    io.to(room[num]).emit('room_out', num, name);
  });

  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {
      console.log(name + ' join a ' + num);
      io.to(room[num]).emit('joinRoom', num, name);
    });
  });


  socket.on('chat message', (num, name, msg) => {
    a = num;

    console.log('회원 '+name+'의 메시지전달 : num :', num, msg);
    
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("등록중 에러가 발생했어요!! 메시지 입력에러", err);
      }else{

          console.log("result : ",result);
      }
    });
    io.to(room[num]).emit('chat message', name, msg);
  });
});




http.listen(3000, () => {
  console.log('Connect at 3000');
});
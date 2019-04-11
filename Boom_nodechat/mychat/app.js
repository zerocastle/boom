/* socket\room_chat\app.js */
const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);
var redis = require("redis");
const v = require('voca');
var session = require('express-session');
var client;
var testdata;
app.use(session({
	secret: '12sdfwerwersdfserwerwef', //keboard cat (랜덤한 값)
	resave: false,
	saveUninitialized: true
}));


app.set('view engine', 'ejs');
app.set('views', './views');


let room = ['room1', 'room2'];
let a = 0;

var conn;
var oracledb = require("oracledb");
oracledb.autoCommit = true;
oracledb.getConnection({
  user:"tom",
  password:"tom",
  connectString:"localhost/orcl"},function(err,con){
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
    res.render('roomchat',{result:JSON.stringify(result),nickname:req.session.nickname,roomid:sRoom });
  }
  });
});






// 방목록 불러오기
//select room_id, room_title from test_room where buyer_id = 'jack' or seller_id = 'jack';
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat 으로 접근시 실행
  client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
    client.get("user", function(err, val) {//redis객체에 "user"라는 키의 값을 찾아 함수실행
    testdata=val;//해당 키의 값을 넣어주고
    req.session.nickname = val;
    var arr = [];
    if(val === null) {//값이 없다면 요거하고 땡
      console.log('>>>>> result : null ');
    }
    else {//값이 있다면 실행 select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title        from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'jackson') or      buyer_num = (select m_num from member where nickname = 'jackson'));
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title        from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"'))";
      //conn.execute("select room_id, room_title from test_room where buyer_id = '"+val+"' or seller_id = '"+val+"'",
      conn.execute(loglogsql,
      function(err, result){
        console.log("result: 리저어어얼트"+result);
        console.log("result.rows: 리저어어얼트로우",result.rows);
        console.log("result의 길이값 @@@@@@@@@@   "+result.rows.length);
      //conn.execute("select room_id, room_title from test_room where buyer_id = 'tom' or seller_id = 'tom'",function(err,result){ 이게 실행이됩니다.
        if(err){
            console.log("/jackchat : 등록중 에러가 발생했어요!! ", err);
        }else if(!result.rows.length){
            console.log("/jackchat : ROws가 0이다. ");
            res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{
            //result는 metaData등 많은 정보를 포함하고있다.
            //result.rows는 select문의 결과집합을 가지고있으며 이중배열의 형태로 반환된다.
            // result.rows       --> [['1301006' ,'김재근'], ['1500222', '박뭐뭐'], ['1711111', '하하']
            // result.rows[0]    --> ['1301006', '김재근'] 와 같은 형식
            // result.rows[1][1] --> ['박뭐뭐']
            // result.rows[x][y] --> x : row를 선택,  y:column을 선택
            /*
            var jsonoobj = {};
            for(var i = 0; i < result.rows.length; i++){
              jsonoobj = {
                  room_id : result.rows[i][0],
                  room_title : result.rows[i][1]
              }
              console.log("JSON으로 만듬 : ", jsonoobj);
              var realJson = JSON.parse(JSON.stringify(jsonoobj));
              var stringjack = JSON.stringify(jsonoobj);
              arr.push(realJson);
              console.log("arr로 만듬 : ", arr);
            }
            console.log("JSON배열화 종료", arr);*/
              
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});          //  res.render('roomlist', arr);
        }//DB쿼리문- if else 
      });//if else- redis의 값이 없는게 아니라면
      }//client.get 함수
    });//redis create 함수
});//app.get함수

io.on('connection', (socket) => {
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });


  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {
      console.log(name + ' join a ' + room[num]);
      /*  //방입장시 하는건데 필요없음
      conn.execute("insert into test_user(USER_ID) values('"+name+"')",function(err,result){
        if(err){
            console.log("등록중 에러가 발생했어요!!", err);
           
        }else{
            console.log("result : ",result);
          
        }
      });
      */

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
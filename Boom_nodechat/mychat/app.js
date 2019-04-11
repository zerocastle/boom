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
	secret: '12sdfwerwersdfserwerwef', //keboard cat (?��?��?�� �?)
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
  user:"kys",
  password:"kys",
  connectString:"bon300-11/orcl"},function(err,con){
    if(err){
      console.log("?��?��?��?��",err);
    }
    conn=con;

    

});

app.get('/', (req, res) => {
  res.render('chat');
});
var sRoom;
//목록�? ?��?���? ?���??��???��?��
app.get('/roomchat', (req, res) => {
  console.log("?��?��?�� ?��?��?��?�� :", req.session)
  console.log("?��?��?�� ?��?��?��?�� :", req.session.nickname)
  sRoom = req.query.room_id;
  if(req.session.nickname==undefined){
    res.render('tomson');
  }
  if(sRoom == undefined){
  sRoom = req.query.room_id;} // 쿼리?��?���? 값을 받아?��?��.
  console.log("?��?��?��?��?��! : "+sRoom);
  //INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('못읽:?'+sRoom);
  if(err){
      console.log("/ROOMCHAT : ?��록중 ?��?���? 발생?�� 못읽..?��?��", err);
  }else{
    console.log("result: "+result);
    console.log("result: ",result.rows); 
    res.render('roomchat2',{result:JSON.stringify(result),nickname:req.session.nickname,roomid:sRoom });
  }
  });
});






// 방목�? 불러?���?
//select room_id, room_title from test_room where buyer_id = 'jack' or seller_id = 'jack';
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ?���? ?��근시 ?��?��
  client = redis.createClient(6379, "localhost");//localhost6379?��?��?�� redis객체?�� ?��근한?��.
    client.get("user", function(err, val) {//redis객체?�� "user"?��?�� ?��?�� 값을 찾아 ?��?��?��?��
    testdata=val;//?��?�� ?��?�� 값을 ?��?��주고
    req.session.nickname = val;
    var arr = [];
    if(val === null) {//값이 ?��?���? ?��거하�? ?��
      console.log('>>>>> result : null ');
    }
    else {//값이 ?��?���? ?��?�� select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title        from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'jackson') or      buyer_num = (select m_num from member where nickname = 'jackson'));
    //select c.room_id, (select nickname from member where m_num = c.buyer_num), (select nickname from member where m_num = c.seller_num), c.pro_num, o.title from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'tom') or      buyer_num = (select m_num from member where nickname = 'tom'));
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"'))";
      //conn.execute("select room_id, room_title from test_room where buyer_id = '"+val+"' or seller_id = '"+val+"'",
      conn.execute(loglogsql,
      function(err, result){
        console.log("result: 리�??��?��?��?��",result);
        console.log("result.rows: 리�??��?��?��?��로우",result.rows);
        console.log("result?�� 길이�? @@@@@@@@@@   "+result.rows.length);
      //conn.execute("select room_id, room_title from test_room where buyer_id = 'tom' or seller_id = 'tom'",function(err,result){ ?���? ?��?��?��?��?��?��.
        if(err){
            console.log("/jackchat : ?��록중 ?��?���? 발생?��?��?��!! ", err);
        }else if(!result.rows.length){
            console.log("/jackchat : ROws�? 0?��?��. ");
            res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{
            // 
            // result?�� JSON Type. metaData, rows ?��?�� key�? �?�?�? ?��?��. {metaData?�� ?��룰일?�� ?��?�� 기술?���??��?��}
            // [metaData:{key:value}][rows:['1301015','�??���?','010-4241-1101']['1600243','박땡?��','010-4447-2663']...]
            // result.rows?�� select문의 결과집합?�� �?�?�? ?��?���? ?��중배?��?�� ?��?���? 반환?��?��.
            // result.rows       --> [['1301006' ,'�??���?'], ['1500222', '박뭐�?'], ['1711111', '?��?��']
            // result.rows[0]    --> ['1301006', '�??���?'] ?? 같�? ?��?��
            // result.rows[1][1] --> ['박뭐�?']
            // result.rows[x][y] --> x : row�? ?��?��,  y:column?�� ?��?��
            /*
            var jsonoobj = {};
            for(var i = 0; i < result.rows.length; i++){
              jsonoobj = {
                  room_id : result.rows[i][0],
                  room_title : result.rows[i][1]
              }
              console.log("JSON?���? 만듬 : ", jsonoobj);
              var realJson = JSON.parse(JSON.stringify(jsonoobj));
              var stringjack = JSON.stringify(jsonoobj);
              arr.push(realJson);
              console.log("arr�? 만듬 : ", arr);
            }
            console.log("JSON배열?�� 종료", arr);*/
              
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});         //  res.render('roomlist', arr);
        }//DB쿼리�?- if else 
      });//if else- redis?�� 값이 ?��?���? ?��?��?���?
      }//client.get ?��?��
    });//redis create ?��?��
});//app.get?��?��

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
      /*  //방입?��?�� ?��?��건데 ?��?��?��?��
      conn.execute("insert into test_user(USER_ID) values('"+name+"')",function(err,result){
        if(err){
            console.log("?��록중 ?��?���? 발생?��?��?��!!", err);
           
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

    console.log('?��?�� '+name+'?�� 메시�??��?�� : num :', num, msg);
    
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("?��록중 ?��?���? 발생?��?��?��!! 메시�? ?��?��?��?��", err);
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
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
	secret: '12sdfwerwersdfserwerwef', //keboard cat (?œ?¤?•œ ê°?)
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
  connectString:"39.127.7.47/orcl"},function(err,con){
    if(err){
      console.log("? ‘?†?—?Ÿ¬",err);
    }
    conn=con;

    

});

app.get('/', (req, res) => {
  res.render('chat');
});
var sRoom;
//ëª©ë¡ì¤? ?•˜?‚˜ë¥? ?´ë¦??•˜???„?•Œ
app.get('/roomchat', (req, res) => {
  console.log("?–¸?†ˆ?´ ?“¤?–´?™”?…¸ :", req.session)
  console.log("?–¸?†ˆ?´ ?“¤?–´?™”?…¸ :", req.session.nickname)
  sRoom = req.query.room_id;
  if(req.session.nickname==undefined){
    res.render('tomson');
  }
  if(sRoom == undefined){
  sRoom = req.query.room_id;} // ì¿¼ë¦¬?Š¤?Š¸ë§? ê°’ì„ ë°›ì•„?˜¨?‹¤.
  console.log("?…?¥?•©?‹ˆ?‹¤! : "+sRoom);
  //INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('ëª»ì½:?'+sRoom);
  if(err){
      console.log("/ROOMCHAT : ?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?Œ ëª»ì½..?… ?… ", err);
  }else{
    console.log("result: "+result);
    console.log("result: ",result.rows); 
    res.render('roomchat2',{result:JSON.stringify(result),nickname:req.session.nickname,roomid:sRoom });
  }
  });
});






// ë°©ëª©ë¡? ë¶ˆëŸ¬?˜¤ê¸?
//select room_id, room_title from test_room where buyer_id = 'jack' or seller_id = 'jack';
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ?œ¼ë¡? ? ‘ê·¼ì‹œ ?‹¤?–‰
  client = redis.createClient(6379, "localhost");//localhost6379?¬?Š¸?˜ redisê°ì²´?— ? ‘ê·¼í•œ?‹¤.
    client.get("user", function(err, val) {//redisê°ì²´?— "user"?¼?Š” ?‚¤?˜ ê°’ì„ ì°¾ì•„ ?•¨?ˆ˜?‹¤?–‰
    testdata=val;//?•´?‹¹ ?‚¤?˜ ê°’ì„ ?„£?–´ì£¼ê³ 
    req.session.nickname = val;
    var arr = [];
    if(val === null) {//ê°’ì´ ?—†?‹¤ë©? ?š”ê±°í•˜ê³? ?•¡
      console.log('>>>>> result : null ');
    }
    else {//ê°’ì´ ?ˆ?‹¤ë©? ?‹¤?–‰ select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title        from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'jackson') or      buyer_num = (select m_num from member where nickname = 'jackson'));
    //select c.room_id, (select nickname from member where m_num = c.buyer_num), (select nickname from member where m_num = c.seller_num), c.pro_num, o.title from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = 'tom') or      buyer_num = (select m_num from member where nickname = 'tom'));
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"'))";
      //conn.execute("select room_id, room_title from test_room where buyer_id = '"+val+"' or seller_id = '"+val+"'",
      conn.execute(loglogsql,
      function(err, result){
        console.log("result: ë¦¬ì??–´?–´?–¼?Š¸",result);
        console.log("result.rows: ë¦¬ì??–´?–´?–¼?Š¸ë¡œìš°",result.rows);
        console.log("result?˜ ê¸¸ì´ê°? @@@@@@@@@@   "+result.rows.length);
      //conn.execute("select room_id, room_title from test_room where buyer_id = 'tom' or seller_id = 'tom'",function(err,result){ ?´ê²? ?‹¤?–‰?´?©?‹ˆ?‹¤.
        if(err){
            console.log("/jackchat : ?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!! ", err);
        }else if(!result.rows.length){
            console.log("/jackchat : ROwsê°? 0?´?‹¤. ");
            res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{
            // 
            // result?Š” JSON Type. metaData, rows ?¼?Š” keyë¥? ê°?ì§?ê³? ?ˆ?‹¤. {metaData?Š” ?‹¤ë£°ì¼?´ ?—†?–´ ê¸°ìˆ ?•˜ì§??•Š?Œ}
            // [metaData:{key:value}][rows:['1301015','ê¹??¬ê·?','010-4241-1101']['1600243','ë°•ë•¡?•¡','010-4447-2663']...]
            // result.rows?Š” selectë¬¸ì˜ ê²°ê³¼ì§‘í•©?„ ê°?ì§?ê³? ?ˆ?œ¼ë©? ?´ì¤‘ë°°?—´?˜ ?˜•?ƒœë¡? ë°˜í™˜?œ?‹¤.
            // result.rows       --> [['1301006' ,'ê¹??¬ê·?'], ['1500222', 'ë°•ë­ë­?'], ['1711111', '?•˜?•˜']
            // result.rows[0]    --> ['1301006', 'ê¹??¬ê·?'] ?? ê°™ì? ?˜•?‹
            // result.rows[1][1] --> ['ë°•ë­ë­?']
            // result.rows[x][y] --> x : rowë¥? ?„ ?ƒ,  y:column?„ ?„ ?ƒ
            /*
            var jsonoobj = {};
            for(var i = 0; i < result.rows.length; i++){
              jsonoobj = {
                  room_id : result.rows[i][0],
                  room_title : result.rows[i][1]
              }
              console.log("JSON?œ¼ë¡? ë§Œë“¬ : ", jsonoobj);
              var realJson = JSON.parse(JSON.stringify(jsonoobj));
              var stringjack = JSON.stringify(jsonoobj);
              arr.push(realJson);
              console.log("arrë¡? ë§Œë“¬ : ", arr);
            }
            console.log("JSONë°°ì—´?™” ì¢…ë£Œ", arr);*/
              
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});         //  res.render('roomlist', arr);
        }//DBì¿¼ë¦¬ë¬?- if else 
      });//if else- redis?˜ ê°’ì´ ?—†?Š”ê²? ?•„?‹ˆ?¼ë©?
      }//client.get ?•¨?ˆ˜
    });//redis create ?•¨?ˆ˜
});//app.get?•¨?ˆ˜

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
      /*  //ë°©ì…?¥?‹œ ?•˜?Š”ê±´ë° ?•„?š”?—†?Œ
      conn.execute("insert into test_user(USER_ID) values('"+name+"')",function(err,result){
        if(err){
            console.log("?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!!", err);
           
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

    console.log('?šŒ?› '+name+'?˜ ë©”ì‹œì§?? „?‹¬ : num :', num, msg);
    
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!! ë©”ì‹œì§? ?…? ¥?—?Ÿ¬", err);
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
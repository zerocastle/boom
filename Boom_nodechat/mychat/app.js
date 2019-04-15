/* socket\room_chat\app.js */
var express = require('express'); // express ?„œë²? import
var app = express(); // ?„œë²? ê°ì²´ ?ƒ?„±
const http = require('http').Server(app); // http ?†µ?‹ ê·œì•½ import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis?˜ connection ê°ì²´ê°? ?  ë³??ˆ˜
app.use(session({ // ?„¸?…˜?‚¬?š©?„ ?œ„?•œ ? ˆì°?
	secret: '12sdfwerwersdfserwerwef', //keboard cat (?žœ?¤?•œ ê°?)
	resave: false,
	saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource?ŒŒ?¼?“¤?˜ ê²½ë¡œ?„¤? •?„ ?œ„?•œ ? ˆì°?
app.set('view engine', 'ejs'); //ë·? ?…œ?”Œë¦? ì§?? •. .ejs ë¡? ?ž‘?„±?˜?–´?•¼?•œ?‹¤. 
app.set('views', './views'); //ê²½ë¡œì§?? •. view?‹¨?˜ ?ŒŒ?¼?“¤?? ?•´?‹¹ ê²½ë¡œ?— ???ž¥?˜?–´?•¼ ?•œ?‹¤.


let room = [];//socketIO?˜ ë°? ê°ì²´ê°? ?‹´ê¸? ë°°ì—´
var conn; // DB connection ê°ì²´ê°? ?  ë³??ˆ˜
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//?ž?™ì»¤ë°‹
oracledb.getConnection({// ì»¤í…?…˜ ê°ì²´ ?ƒ?„±
  user:"tom", //DB-name
  password:"tom", //DB-password
  connectString:"39.127.7.47/orcl"},function(err,con){ //ì½œë°±?•¨?ˆ˜. url/sidë¥? ?†µ?•´ ? ‘ê·¼í•˜ë©? ?„±ê³µì‹œ con ?´?¼?Š” ì»¤ë„¥?…˜ ê°ì²´ ë°˜í™˜. 
    if(err){//?—?Ÿ¬ê°? ?žˆ?‹¤ë©? ?‹¤?–‰
      console.log("? ‘?†?—?Ÿ¬",err);
    }
    conn=con; //?•ž?„œ ? „?—­ë³??ˆ˜ë¡? ?„ ?–¸?•œ conn?— ì§??—­ë³??ˆ˜ ì»¤ë„¥?…˜ ê°ì²´ con?„ ?„£?–´ì¤??‹¤.
});

var sRoom;//ë°©ë„˜ë²„ë?? ê³µìœ ?•˜ê¸? ?œ„?•´ ? „?—­ë³??ˆ˜ë¡? ì§?? •?•¨.

//ëª©ë¡ì¤? ?•˜?‚˜ë¥? ?´ë¦??•˜???„?•Œ ?‹¤?–‰
app.get('/roomchat', (req, res) => {//localhost:3000/roomchat ?œ¼ë¡? ? ‘ê·¼ì‹œ ?‹¤?–‰ 
  console.log("?–¸?†ˆ?´ ?“¤?–´?™”?…¸ :", req.session)//requestê°ì²´?˜ ?„¸?…˜ê°? ?½?Œ
  console.log("?–¸?†ˆ?´ ?“¤?–´?™”?…¸ :", req.session.nickname)//?„¸?…˜?˜ nicknameë³??ˆ˜?— ???ž¥?œ ê°’ì„ ì°ì–´ë³¸ë‹¤.
  sRoom = req.query.room_id;////--ì¿¼ë¦¬?Š¤?Š¸ë§? ê°’ì„ ë°›ì•„?˜¨?‹¤. req.query.ë³??ˆ˜ëª?;
  if(req.session.nickname==undefined){//?„¸?…˜?— ?‹‰?„¤?ž„?´ ?—†?‹¤ë©? ?‹¤?–‰
    res.render('tomson');//?—?Ÿ¬ì²˜ë¦¬?Ž˜?´ì§??¸ tomson.ejsë¡? ?´?™?•œ?‹¤.
  }
  if(sRoom == undefined){//ì¿¼ë¦¬?Š¤?Š¸ë§ê°’?´ ?—†?‹¤ë©?
  sRoom = req.query.room_id;} // ì¿¼ë¦¬?Š¤?Š¸ë§? ê°’ì„ ë°›ì•„?˜¨?‹¤.
  console.log("?ž…?ž¥?•©?‹ˆ?‹¤! : "+sRoom);
  
  //console.log ?™œ?š©ë²?
  // var inttt = 5; ? •?ˆ˜ ê°’ì„ ê°?ì§? ë³??ˆ˜ë¥? ?„ ?–¸
  //console.log('ë©”ì‹œì§?', inttt) ? •?ˆ˜ë¡œì„œ ?‚¬?š©?œ?‹¤. ?‰¼?‘œë¥? ì°ìœ¼ë©? ?•´?‹¹ ë³??ˆ˜?˜ ?›ë³? ?°?´?„°???ž…?´ ?œ ì§??œ?‹¤.
  //console.log('ë©”ì‹œì§?' + inttt) ë¬¸ìž?—´ë¡œì„œ ?‚¬?š©?œ?‹¤. ???ž…ìºìŠ¤?Œ…?´ ?´ë£¨ì–´ì§„ë‹¤.


//selectë¬¸ì˜ result ê°ì²´ ?‹¤ë£¨ëŠ” ë²?
// result?Š” JSON?œ¼ë¡? ? „?‹¬?˜ë©? . metaData, rows ?¼?Š” keyë¥? ê°?ì§?ê³? ?žˆ?‹¤. {metaData?Š” ?‹¤ë£°ì¼?´ ?—†?–´ ê¸°ìˆ ?•˜ì§??•Š?Œ}
            // [metaData:{key:value}][rows:['1301015','ê¹??ž¬ê·?','010-4241-1101']['1600243','ë°•ë•¡?•¡','010-4447-2663']...]
            // result.rows?Š” selectë¬¸ì˜ ê²°ê³¼ì§‘í•©?„ ê°?ì§?ê³? ?žˆ?œ¼ë©? ?´ì¤‘ë°°?—´?˜ ?˜•?ƒœë¡? ë°˜í™˜?œ?‹¤.
            // result.rows       --> [['1301006' ,'ê¹??ž¬ê·?'], ['1500222', 'ë°•ë­ë­?'], ['1711111', '?•˜?•˜']
            // result.rows[0]    --> ['1301006', 'ê¹??ž¬ê·?'] ?? ê°™ì? ?˜•?‹
            // result.rows[1][1] --> ['ë°•ë­ë­?']
            // result.rows[x][y] --> x : rowë¥? ?„ ?ƒ,  y:column?„ ?„ ?ƒ



  //ëª©ë¡?˜ ë°©ë²ˆ?˜¸ë¥? ?´?š©?•´ ?•´?‹¹?•˜?Š” ?””ë¹„ì˜ ë©”ì‹œì§??‚´?—­?„ ë¶ˆëŸ¬?˜¨?‹¤.
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('?ž…?ž¥?•œ ë°©ë²ˆ?˜¸:'+sRoom);
  if(err){//?—?Ÿ¬ê°? ë°œìƒ?•œ?‹¤ë©? ?‹¤?–‰
      console.log("/ROOMCHAT : ?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ", err);
  }else{//? •?ƒ?ž‘?™?‹œ
    console.log("result: "+result);
    console.log("result: ",result.rows);
    //roomchat2.ejs ë¡? ?´?™?•œ?‹¤. //?´?™?• ?•Œ key:value?˜•?ƒœë¡? ì¿¼ë¦¬ê²°ê³¼, ?„¸?…˜?˜ ?‹‰?„¤?ž„, ë°©ë²ˆ?˜¸ë¥? ? „?‹¬?•œ?‹¤. 
    res.render('roomchat2',{result:JSON.stringify(result), nickname:req.session.nickname, roomid:sRoom  });
  }
  });
});


// ë°©ëª©ë¡? ë¶ˆëŸ¬?˜¤ê¸?
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ?œ¼ë¡? ? ‘ê·¼ì‹œ ?‹¤?–‰
  client = redis.createClient(6379, "localhost");//localhost6379?¬?Š¸?˜ redisê°ì²´?— ? ‘ê·¼í•œ?‹¤.
    client.get("user", function(err, val) {//?Š¤?”„ë§ì—?„œ ???ž¥?•œ redisê°ì²´?— "user"?¼?Š” ?‚¤?˜ ê°’ì„ ì°¾ì•„ ?•¨?ˆ˜?‹¤?–‰
    testdata=val;
    req.session.nickname = val;//?„¸?…˜?˜ nickname ë³??ˆ˜?— redisê°ì²´?—?„œ ë°›ì•„?˜¨ ê°’ì„ ?„£?–´ì¤??‹¤.
    console.log('ì°ì–´ë´…ì‹œ?‹¤ : ' , val) // ì±„íŒ…?„œë²„ì— ? ‘?†?•œ ?œ ???˜ nickname?„ ì°ì–´ë³¸ë‹¤.
    if(val === null) {//ê°’ì´ ?—†?‹¤ë©? ?š”ê±°í•˜ê³? ?•¡
      console.log('>>>>> result : null ');
    }
    else {//ê°’ì´ ?žˆ?‹¤ë©? ?‹¤?–‰
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //?‹‰?„¤?ž„?œ¼ë¡? ?œ ???˜ ?šŒ?›ë²ˆí˜¸ ?•Œ?•„?‚´?–´ ?•´?‹¹ ë²ˆí˜¸ê°? êµ¬ë§¤?ž ?˜?Š” ?Œë§¤ìžë¡? ì¡´ìž¬?•˜?Š” ì±„íŒ…ë°©ì„ ê²??ƒ‰?•œ?‹¤.
      conn.execute(loglogsql,function(err, result){ // ê¸? ì¿¼ë¦¬ë¬¸ì„ ?‹¤?–‰?•œ?‹¤.
        if(result == 'undefined'){
          console.log('ê²°ê³¼ê°’ì´ undefined?ž…?‹ˆ?‹¤. ?‹¤?–‰?´ ? •?ƒ?™?ž‘?•˜ì§? ?•Š?Šµ?‹ˆ?‹¤.');
        }
        else if(err){
          console.log("/jackchat : ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!! ", err);
        }else if(!result.rows.length){// 0?? false?¼ê³? ?Œ?‹¨?•˜?Š”ê²ƒì„ ?´?š©, rowê°? 0?´ ?•„?‹ˆ?¼ë©? ?‹¤?‹œë§í•´ rowsê°? 1?´?ƒ?´?¼ë©?.
          console.log("result.rows: ë¦¬ì??–´?–´?–¼?Š¸ë¡œìš°",result.rows); //ê²°ê³¼ê°? ?™•?¸?š© ì°ì–´ë³¸ë‹¤.
          res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{  
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DBì¿¼ë¦¬ë¬?- if else 
      });//if else- redis?˜ ê°?
      }//client.get ?•¨?ˆ˜
    });//redis create ?•¨?ˆ˜
});//app.get?•¨?ˆ˜

io.on('connection', (socket) => {//socketIO?—°ê²°ì´ ?˜ë©? ?†Œì¼“ì— ? „?†¡?˜?Š” ë¬¸ìž?—´?´ ?¼ì¹˜í•˜?Š” ë©”ì†Œ?“œë¥? ?‹¤?–‰?•œ?‹¤.

  socket.on('disconnect', () => {//socket?— disconnect?¼?Š” ë©”ì‹œì§?ê°? ? „?†¡?˜ë©? ?‹¤?–‰
    console.log('user disconnected');// ?…Ž?…Ž ?´ê±? ?•˜?Š”ê±? ?—†?Œ ?…Ž?…Ž
  });

  //?‚´ê°? ì¢??” ì°¾ì•„ë´ì•¼?•  ë¶?ë¶„ì´?¼ ? œê±°í•˜ì§? ?•Š?Œ. ?‚¬?š©?˜?–´ì§?ì§? ?•Š?Š”?‹¤.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  //roomchat2.ejs?—?„œ ë°©ë‚˜ê°?ê¸? ë²„íŠ¼ ?´ë¦??‹œ ?‹¤?–‰?œ?‹¤.
  socket.on('room_out', (num,name) => {
    console.log(name+'?šŒ?›?´ No.'+num+'ë°©ì„ ?‚˜ê°??…¨?Šµ?‹ˆ?‹¤.' ); //?„œë²„ì½˜?†”?— ?‚˜ê°? ?šŒ?›?„ ì°ì–´ë³¸ë‹¤.
//    select seller_num, buyer_num from chatroom where room_id = 442;
    var m_num1;
    var buyer;
    var upnull;
    conn.execute("select m_num from member where nickname = '"+name+"'", function(err, result){
      m_num1 = result.rows[0][0];
      console.log("ë§?! ?´ê²? m_num?´?‹¤!",m_num1);
    });
    conn.execute("select buyer_num from chatroom where room_id = "+num+"",function(err,result){
      buyer = result.rows[0][0];
      console.log("ë§?! ?´ê²? êµ¬ë§¤?ž?´?‹¤!",buyer);
    });
    if(m_num1==buyer && m_num1!=undefined){
      console.log('?? êµ¬ë§¤?žê°? ???—ˆ?„¤?˜ˆ!');
      upnull = "update chatroom set buyer_num = null where room_id = "+num;
    } else {
      console.log('?? ?Œë§¤ìžê°? ???—ˆ?„¤?˜ˆ!');
      upnull = "update chatroom set seller_num = null where room_id = "+num;
    }
    conn.execute(upnull,function(err,result){
      console.log("ê·¸ë¶„?´ ?‚˜ê°??…¨?–´?š” ?…œ?…œ",result);
    });



//    update chatroom set seller_num = null where room_id = 422;
//    update chatroom set buyer_num = null where room_id = 422;
    
    //var room_outSql = "delete from chatroom where room_id = "+num+" ";
    //?ž…?ž¥?•œ ì±„íŒ…ë°©ì„ ?‚˜ê°?ë©? ?—°ê´??œ ë©”ì‹œì§? ?…Œ?´ë¸”ì˜ ?‚´?š©?„ ?¼ë¶? ? œê±°ëœ?‹¤. - ë©”ì‹œì§? ?…Œ?´ë¸? ?ƒ?„±?‹œ delete on cascade ?‚¤?›Œ?“œë¥? ì¶”ê??–ˆê¸°ì— ê°??Š¥?•˜?‹¤.
    
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //?ƒ?’ˆ?…Œ?´ë¸”ì˜ ì±„íŒ…ë°? ê°??ˆ˜ë¥? ì¤„ì¸?‹¤. - (ë°©ë²ˆ?˜¸ë¥? ?´?š©?•´ ë°©ì˜ ?ƒ?’ˆë²ˆí˜¸ë¥? ?•Œ?•„?‚¸?‹¤.) - ?•Œ?•„?‚¸ ?ƒ?’ˆë²ˆí˜¸?˜ ì±„íŒ…ë°©ê°¯?ˆ˜ë¥? ?•˜?‚˜ ì¤„ì¸?‹¤.
    
    conn.execute(change_countSql,function(err,result){//?—…?°?´?Š¸ë¬? ?‹¤?–‰
      if(err){
        console.log("change_countSql ?—?Ÿ¬ :",err);
      } else {  
      console.log('?ƒ?’ˆ ?…Œ?´ë¸”ì— ì±„íŒ…ë°©ê°¯?ˆ˜ ì¤„ì´ê¸?', result); // ? ?š©?œ row ?ˆ˜ ë°˜í™˜
      }
    });



/*
    conn.execute(room_outSql,function(err,result){//?”œë¦¬íŠ¸ë¬? ?‹¤?–‰
      if(err){
        console.log("room_outSql ?—?Ÿ¬ :",err);
      } else {
      console.log('ì±„íŒ…ë°? ì§??š°ê¸?' , result); // ? ?š©?œ row ?ˆ˜ ë°˜í™˜
    }      
    });

    

*/

    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, "+num+", '?ƒ??ë°©ì´ ì±„íŒ…ë°©ì„ ?‚˜ê°”ìŠµ?‹ˆ?‹¤.')",function(err,result){
      if(err){
          console.log("?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!! ë©”ì‹œì§? ?ž…? ¥?—?Ÿ¬", err);
      }else{
          console.log("result : ",result);
      }
    });


    // ?•œ ?šŒ?›?´ ?‚˜ê°?ê¸°ë?? ?‹¤?–‰?–ˆ?‹¤?Š” ?‚¬?‹¤?„ ?‚¨?? ?šŒ?›?—ê²? ?•Œ? ¤ì£¼ê¸° ?œ„?•´ ë£¸ì±—?œ¼ë¡? room_out?‹ ?˜¸ë¥? ë³´ë‚¸?‹¤
    io.to(room[num]).emit('room_out', num, name);
  });

  //ë°©ì— ?ž…?ž¥?•œ?‹¤ë©? ?‹¤?–‰
  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {//socket?˜ ë°? ë°°ì—´ ì¤? numë²ˆì§¸ ë°©ì— ?ž…?ž¥?•œ?‹¤.
      console.log(name + ' join a ' + num);
      io.to(room[num]).emit('joinRoom', num, name);//?ž…?ž¥?•œ ë°©ì— ?ž…?ž¥?‹ ?˜¸ë¥? ë³´ë‚¸?‹¤.
    });
  });


  socket.on('chat message', (num, name, msg) => {//ì±„íŒ… ?‹ ?˜¸ê°? ?˜¨?‹¤ë©?
    a = num; //?™œ?–ˆì§? ?´ê±?

    console.log('?šŒ?› '+name+'?˜ ë©”ì‹œì§?? „?‹¬ : num :', num, msg);//? •?ƒ? ?¸ì§? ì°ì–´ë³´ê¸°
    
    //insert ?‹¤?–‰
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("?“±ë¡ì¤‘ ?—?Ÿ¬ê°? ë°œìƒ?–ˆ?–´?š”!! ë©”ì‹œì§? ?ž…? ¥?—?Ÿ¬", err);
      }else{
          console.log("result : ",result);
      }
    });
    io.to(room[num]).emit('chat message', name, msg);//?•´?‹¹ ë°©ì— ?´ë¦„ê³¼ ë©”ì‹œì§?ë¥? ? „?†¡
  });
});




http.listen(3000, () => { // ?„œë²„ë?? ?‹¤?–‰?‹œ?‚¨?‹¤.
  console.log('Connect at 3000');
});
/* socket\room_chat\app.js */
var express = require('express'); // express ?λ²? import
var app = express(); // ?λ²? κ°μ²΄ ??±
const http = require('http').Server(app); // http ?΅? κ·μ½ import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis? connection κ°μ²΄κ°? ?  λ³??
app.use(session({ // ?Έ??¬?©? ?? ? μ°?
	secret: '12sdfwerwersdfserwerwef', //keboard cat (??€? κ°?)
	resave: false,
	saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource??Ό?€? κ²½λ‘?€? ? ?? ? μ°?
app.set('view engine', 'ejs'); //λ·? ??λ¦? μ§?? . .ejs λ‘? ??±??΄?Ό??€. 
app.set('views', './views'); //κ²½λ‘μ§?? . view?¨? ??Ό?€?? ?΄?Ή κ²½λ‘? ???₯??΄?Ό ??€.


let room = [];//socketIO? λ°? κ°μ²΄κ°? ?΄κΈ? λ°°μ΄
var conn; // DB connection κ°μ²΄κ°? ?  λ³??
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//??μ»€λ°
oracledb.getConnection({// μ»€ν? κ°μ²΄ ??±
  user:"tom", //DB-name
  password:"tom", //DB-password
  connectString:"39.127.7.47/orcl"},function(err,con){ //μ½λ°±?¨?. url/sidλ₯? ?΅?΄ ? κ·Όνλ©? ?±κ³΅μ con ?΄?Ό? μ»€λ₯? κ°μ²΄ λ°ν. 
    if(err){//??¬κ°? ??€λ©? ?€?
      console.log("? ???¬",err);
    }
    conn=con; //?? ? ?­λ³??λ‘? ? ?Έ? conn? μ§??­λ³?? μ»€λ₯? κ°μ²΄ con? ?£?΄μ€??€.
});

var sRoom;//λ°©λλ²λ?? κ³΅μ ?κΈ? ??΄ ? ?­λ³??λ‘? μ§?? ?¨.

//λͺ©λ‘μ€? ??λ₯? ?΄λ¦?????? ?€?
app.get('/roomchat', (req, res) => {//localhost:3000/roomchat ?Όλ‘? ? κ·Όμ ?€? 
  console.log("?Έ??΄ ?€?΄??Έ :", req.session)//requestκ°μ²΄? ?Έ?κ°? ?½?
  console.log("?Έ??΄ ?€?΄??Έ :", req.session.nickname)//?Έ?? nicknameλ³??? ???₯? κ°μ μ°μ΄λ³Έλ€.
  sRoom = req.query.room_id;////--μΏΌλ¦¬?€?Έλ§? κ°μ λ°μ?¨?€. req.query.λ³??λͺ?;
  if(req.session.nickname==undefined){//?Έ?? ??€??΄ ??€λ©? ?€?
    res.render('tomson');//??¬μ²λ¦¬??΄μ§??Έ tomson.ejsλ‘? ?΄???€.
  }
  if(sRoom == undefined){//μΏΌλ¦¬?€?Έλ§κ°?΄ ??€λ©?
  sRoom = req.query.room_id;} // μΏΌλ¦¬?€?Έλ§? κ°μ λ°μ?¨?€.
  console.log("??₯?©??€! : "+sRoom);
  
  //console.log ??©λ²?
  // var inttt = 5; ? ? κ°μ κ°?μ§? λ³??λ₯? ? ?Έ
  //console.log('λ©μμ§?', inttt) ? ?λ‘μ ?¬?©??€. ?Ό?λ₯? μ°μΌλ©? ?΄?Ή λ³??? ?λ³? ?°?΄?°????΄ ? μ§???€.
  //console.log('λ©μμ§?' + inttt) λ¬Έμ?΄λ‘μ ?¬?©??€. ???μΊμ€??΄ ?΄λ£¨μ΄μ§λ€.


//selectλ¬Έμ result κ°μ²΄ ?€λ£¨λ λ²?
// result? JSON?Όλ‘? ? ?¬?λ©? . metaData, rows ?Ό? keyλ₯? κ°?μ§?κ³? ??€. {metaData? ?€λ£°μΌ?΄ ??΄ κΈ°μ ?μ§???}
            // [metaData:{key:value}][rows:['1301015','κΉ??¬κ·?','010-4241-1101']['1600243','λ°λ‘?‘','010-4447-2663']...]
            // result.rows? selectλ¬Έμ κ²°κ³Όμ§ν©? κ°?μ§?κ³? ??Όλ©? ?΄μ€λ°°?΄? ??λ‘? λ°ν??€.
            // result.rows       --> [['1301006' ,'κΉ??¬κ·?'], ['1500222', 'λ°λ­λ­?'], ['1711111', '??']
            // result.rows[0]    --> ['1301006', 'κΉ??¬κ·?'] ?? κ°μ? ??
            // result.rows[1][1] --> ['λ°λ­λ­?']
            // result.rows[x][y] --> x : rowλ₯? ? ?,  y:column? ? ?



  //λͺ©λ‘? λ°©λ²?Έλ₯? ?΄?©?΄ ?΄?Ή?? ?λΉμ λ©μμ§??΄?­? λΆλ¬?¨?€.
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('??₯? λ°©λ²?Έ:'+sRoom);
  if(err){//??¬κ°? λ°μ??€λ©? ?€?
      console.log("/ROOMCHAT : ?±λ‘μ€ ??¬κ°? λ°μ", err);
  }else{//? ????
    console.log("result: "+result);
    console.log("result: ",result.rows);
    //roomchat2.ejs λ‘? ?΄???€. //?΄?? ? key:value??λ‘? μΏΌλ¦¬κ²°κ³Ό, ?Έ?? ??€?, λ°©λ²?Έλ₯? ? ?¬??€. 
    res.render('roomchat2',{result:JSON.stringify(result), nickname:req.session.nickname, roomid:sRoom  });
  }
  });
});


// λ°©λͺ©λ‘? λΆλ¬?€κΈ?
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ?Όλ‘? ? κ·Όμ ?€?
  client = redis.createClient(6379, "localhost");//localhost6379?¬?Έ? redisκ°μ²΄? ? κ·Όν?€.
    client.get("user", function(err, val) {//?€?λ§μ? ???₯? redisκ°μ²΄? "user"?Ό? ?€? κ°μ μ°Ύμ ?¨??€?
    testdata=val;
    req.session.nickname = val;//?Έ?? nickname λ³??? redisκ°μ²΄?? λ°μ?¨ κ°μ ?£?΄μ€??€.
    console.log('μ°μ΄λ΄μ?€ : ' , val) // μ±ν?λ²μ ? ?? ? ??? nickname? μ°μ΄λ³Έλ€.
    if(val === null) {//κ°μ΄ ??€λ©? ?κ±°νκ³? ?‘
      console.log('>>>>> result : null ');
    }
    else {//κ°μ΄ ??€λ©? ?€?
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //??€??Όλ‘? ? ??? ??λ²νΈ ???΄?΄ ?΄?Ή λ²νΈκ°? κ΅¬λ§€? ?? ?λ§€μλ‘? μ‘΄μ¬?? μ±νλ°©μ κ²????€.
      conn.execute(loglogsql,function(err, result){ // κΈ? μΏΌλ¦¬λ¬Έμ ?€???€.
        if(result == 'undefined'){
          console.log('κ²°κ³Όκ°μ΄ undefined???€. ?€??΄ ? ????μ§? ??΅??€.');
        }
        else if(err){
          console.log("/jackchat : ??¬κ°? λ°μ??΄?!! ", err);
        }else if(!result.rows.length){// 0?? false?Όκ³? ??¨??κ²μ ?΄?©, rowκ°? 0?΄ ???Όλ©? ?€?λ§ν΄ rowsκ°? 1?΄??΄?Όλ©?.
          console.log("result.rows: λ¦¬μ??΄?΄?Ό?Έλ‘μ°",result.rows); //κ²°κ³Όκ°? ??Έ?© μ°μ΄λ³Έλ€.
          res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{  
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DBμΏΌλ¦¬λ¬?- if else 
      });//if else- redis? κ°?
      }//client.get ?¨?
    });//redis create ?¨?
});//app.get?¨?

io.on('connection', (socket) => {//socketIO?°κ²°μ΄ ?λ©? ?μΌμ ? ?‘?? λ¬Έμ?΄?΄ ?ΌμΉν? λ©μ?λ₯? ?€???€.

  socket.on('disconnect', () => {//socket? disconnect?Ό? λ©μμ§?κ°? ? ?‘?λ©? ?€?
    console.log('user disconnected');// ?? ?΄κ±? ??κ±? ?? ??
  });

  //?΄κ°? μ’?? μ°Ύμλ΄μΌ?  λΆ?λΆμ΄?Ό ? κ±°νμ§? ??. ?¬?©??΄μ§?μ§? ???€.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  //roomchat2.ejs?? λ°©λκ°?κΈ? λ²νΌ ?΄λ¦?? ?€???€.
  socket.on('room_out', (num,name) => {
    console.log(name+'???΄ No.'+num+'λ°©μ ?κ°??¨?΅??€.' ); //?λ²μ½?? ?κ°? ??? μ°μ΄λ³Έλ€.
//    select seller_num, buyer_num from chatroom where room_id = 442;
    var m_num1;
    var buyer;
    var upnull;
    conn.execute("select m_num from member where nickname = '"+name+"'", function(err, result){
      m_num1 = result.rows[0][0];
      console.log("λ§?! ?΄κ²? m_num?΄?€!",m_num1);
    });
    conn.execute("select buyer_num from chatroom where room_id = "+num+"",function(err,result){
      buyer = result.rows[0][0];
      console.log("λ§?! ?΄κ²? κ΅¬λ§€??΄?€!",buyer);
    });
    if(m_num1==buyer && m_num1!=undefined){
      console.log('?? κ΅¬λ§€?κ°? ????€?!');
      upnull = "update chatroom set buyer_num = null where room_id = "+num;
    } else {
      console.log('?? ?λ§€μκ°? ????€?!');
      upnull = "update chatroom set seller_num = null where room_id = "+num;
    }
    conn.execute(upnull,function(err,result){
      console.log("κ·ΈλΆ?΄ ?κ°??¨?΄? ??",result);
    });



//    update chatroom set seller_num = null where room_id = 422;
//    update chatroom set buyer_num = null where room_id = 422;
    
    //var room_outSql = "delete from chatroom where room_id = "+num+" ";
    //??₯? μ±νλ°©μ ?κ°?λ©? ?°κ΄?? λ©μμ§? ??΄λΈμ ?΄?©? ?ΌλΆ? ? κ±°λ?€. - λ©μμ§? ??΄λΈ? ??±? delete on cascade ?€??λ₯? μΆκ??κΈ°μ κ°??₯??€.
    
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //????΄λΈμ μ±νλ°? κ°??λ₯? μ€μΈ?€. - (λ°©λ²?Έλ₯? ?΄?©?΄ λ°©μ ??λ²νΈλ₯? ???Έ?€.) - ???Έ ??λ²νΈ? μ±νλ°©κ°―?λ₯? ?? μ€μΈ?€.
    
    conn.execute(change_countSql,function(err,result){//??°?΄?Έλ¬? ?€?
      if(err){
        console.log("change_countSql ??¬ :",err);
      } else {  
      console.log('?? ??΄λΈμ μ±νλ°©κ°―? μ€μ΄κΈ?', result); // ? ?©? row ? λ°ν
      }
    });



/*
    conn.execute(room_outSql,function(err,result){//?λ¦¬νΈλ¬? ?€?
      if(err){
        console.log("room_outSql ??¬ :",err);
      } else {
      console.log('μ±νλ°? μ§??°κΈ?' , result); // ? ?©? row ? λ°ν
    }      
    });

    

*/

    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, "+num+", '???λ°©μ΄ μ±νλ°©μ ?κ°μ΅??€.')",function(err,result){
      if(err){
          console.log("?±λ‘μ€ ??¬κ°? λ°μ??΄?!! λ©μμ§? ?? ₯??¬", err);
      }else{
          console.log("result : ",result);
      }
    });


    // ? ???΄ ?κ°?κΈ°λ?? ?€???€? ?¬?€? ?¨?? ???κ²? ?? €μ£ΌκΈ° ??΄ λ£Έμ±?Όλ‘? room_out? ?Έλ₯? λ³΄λΈ?€
    io.to(room[num]).emit('room_out', num, name);
  });

  //λ°©μ ??₯??€λ©? ?€?
  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {//socket? λ°? λ°°μ΄ μ€? numλ²μ§Έ λ°©μ ??₯??€.
      console.log(name + ' join a ' + num);
      io.to(room[num]).emit('joinRoom', num, name);//??₯? λ°©μ ??₯? ?Έλ₯? λ³΄λΈ?€.
    });
  });


  socket.on('chat message', (num, name, msg) => {//μ±ν ? ?Έκ°? ?¨?€λ©?
    a = num; //??μ§? ?΄κ±?

    console.log('?? '+name+'? λ©μμ§?? ?¬ : num :', num, msg);//? ?? ?Έμ§? μ°μ΄λ³΄κΈ°
    
    //insert ?€?
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("?±λ‘μ€ ??¬κ°? λ°μ??΄?!! λ©μμ§? ?? ₯??¬", err);
      }else{
          console.log("result : ",result);
      }
    });
    io.to(room[num]).emit('chat message', name, msg);//?΄?Ή λ°©μ ?΄λ¦κ³Ό λ©μμ§?λ₯? ? ?‘
  });
});




http.listen(3000, () => { // ?λ²λ?? ?€???¨?€.
  console.log('Connect at 3000');
});
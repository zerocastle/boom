/* socket\room_chat\app.js */
var express = require('express'); // express ?���? import
var app = express(); // ?���? 객체 ?��?��
const http = require('http').Server(app); // http ?��?��규약 import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis?�� connection 객체�? ?�� �??��
app.use(session({ // ?��?��?��?��?�� ?��?�� ?���?
	secret: '12sdfwerwersdfserwerwef', //keboard cat (?��?��?�� �?)
	resave: false,
	saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource?��?��?��?�� 경로?��?��?�� ?��?�� ?���?
app.set('view engine', 'ejs'); //�? ?��?���? �??��. .ejs �? ?��?��?��?��?��?��?��. 
app.set('views', './views'); //경로�??��. view?��?�� ?��?��?��?? ?��?�� 경로?�� ???��?��?��?�� ?��?��.


let room = [];//socketIO?�� �? 객체�? ?���? 배열
var conn; // DB connection 객체�? ?�� �??��
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//?��?��커밋
oracledb.getConnection({// 커텍?�� 객체 ?��?��
  user:"kys", //DB-name
  password:"kys", //DB-password
  connectString:"39.127.7.51/orcl"},function(err,con){ //콜백?��?��. url/sid�? ?��?�� ?��근하�? ?��공시 con ?��?��?�� 커넥?�� 객체 반환. 
    if(err){//?��?���? ?��?���? ?��?��
      console.log("?��?��?��?��",err);
    }
    conn=con; //?��?�� ?��?���??���? ?��?��?�� conn?�� �??���??�� 커넥?�� 객체 con?�� ?��?���??��.
});

var sRoom;//방넘버�?? 공유?���? ?��?�� ?��?���??���? �??��?��.

//목록�? ?��?���? ?���??��???��?�� ?��?��
app.get('/roomchat', (req, res) => {//localhost:3000/roomchat ?���? ?��근시 ?��?�� 
  console.log("?��?��?�� ?��?��?��?�� :", req.session)//request객체?�� ?��?���? ?��?��
  console.log("?��?��?�� ?��?��?��?�� :", req.session.nickname)//?��?��?�� nickname�??��?�� ???��?�� 값을 찍어본다.
  sRoom = req.query.room_id;////--쿼리?��?���? 값을 받아?��?��. req.query.�??���?;
  if(req.session.nickname==undefined){//?��?��?�� ?��?��?��?�� ?��?���? ?��?��
    res.render('tomson');//?��?��처리?��?���??�� tomson.ejs�? ?��?��?��?��.
  }
  if(sRoom == undefined){//쿼리?��?��링값?�� ?��?���?
  sRoom = req.query.room_id;} // 쿼리?��?���? 값을 받아?��?��.
  console.log("?��?��?��?��?��! : "+sRoom);
  
  //console.log ?��?���?
  // var inttt = 5; ?��?�� 값을 �?�? �??���? ?��?��
  //console.log('메시�?', inttt) ?��?��로서 ?��?��?��?��. ?��?���? 찍으�? ?��?�� �??��?�� ?���? ?��?��?��???��?�� ?���??��?��.
  //console.log('메시�?' + inttt) 문자?��로서 ?��?��?��?��. ???��캐스?��?�� ?��루어진다.


//select문의 result 객체 ?��루는 �?
// result?�� JSON?���? ?��?��?���? . metaData, rows ?��?�� key�? �?�?�? ?��?��. {metaData?�� ?��룰일?�� ?��?�� 기술?���??��?��}
            // [metaData:{key:value}][rows:['1301015','�??���?','010-4241-1101']['1600243','박땡?��','010-4447-2663']...]
            // result.rows?�� select문의 결과집합?�� �?�?�? ?��?���? ?��중배?��?�� ?��?���? 반환?��?��.
            // result.rows       --> [['1301006' ,'�??���?'], ['1500222', '박뭐�?'], ['1711111', '?��?��']
            // result.rows[0]    --> ['1301006', '�??���?'] ?? 같�? ?��?��
            // result.rows[1][1] --> ['박뭐�?']
            // result.rows[x][y] --> x : row�? ?��?��,  y:column?�� ?��?��



  //목록?�� 방번?���? ?��?��?�� ?��?��?��?�� ?��비의 메시�??��?��?�� 불러?��?��.
  conn.execute('select message_num, sender_num,member.nickname, room_id, content from message, member where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc',function(err,result){
    console.log('?��?��?�� 방번?��:'+sRoom);
  if(err){//?��?���? 발생?��?���? ?��?��
      console.log("/ROOMCHAT : ?��록중 ?��?���? 발생", err);
  }else{//?��?��?��?��?��
    console.log("result: "+result);
    console.log("result: ",result.rows);
    //roomchat2.ejs �? ?��?��?��?��. //?��?��?��?�� key:value?��?���? 쿼리결과, ?��?��?�� ?��?��?��, 방번?���? ?��?��?��?��. 
    res.render('roomchat2',{result:JSON.stringify(result), nickname:req.session.nickname, roomid:sRoom  });
  }
  });
});


// 방목�? 불러?���?
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ?���? ?��근시 ?��?��
  client = redis.createClient(6379, "localhost");//localhost6379?��?��?�� redis객체?�� ?��근한?��.
    client.get("user", function(err, val) {//?��?��링에?�� ???��?�� redis객체?�� "user"?��?�� ?��?�� 값을 찾아 ?��?��?��?��
    testdata=val;
    req.session.nickname = val;//?��?��?�� nickname �??��?�� redis객체?��?�� 받아?�� 값을 ?��?���??��.
    console.log('찍어봅시?�� : ' , val) // 채팅?��버에 ?��?��?�� ?��???�� nickname?�� 찍어본다.
    if(val === null) {//값이 ?��?���? ?��거하�? ?��
      console.log('>>>>> result : null ');
    }
    else {//값이 ?��?���? ?��?��
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //?��?��?��?���? ?��???�� ?��?��번호 ?��?��?��?�� ?��?�� 번호�? 구매?�� ?��?�� ?��매자�? 존재?��?�� 채팅방을 �??��?��?��.
      conn.execute(loglogsql,function(err, result){ // �? 쿼리문을 ?��?��?��?��.
        if(result == 'undefined'){
          console.log('결과값이 undefined?��?��?��. ?��?��?�� ?��?��?��?��?���? ?��?��?��?��.');
        }
        else if(err){
          console.log("/jackchat : ?��?���? 발생?��?��?��!! ", err);
        }else if(!result.rows.length){// 0?? false?���? ?��?��?��?��것을 ?��?��, row�? 0?�� ?��?��?���? ?��?��말해 rows�? 1?��?��?��?���?.
          console.log("result.rows: 리�??��?��?��?��로우",result.rows); //결과�? ?��?��?�� 찍어본다.
          res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{  
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DB쿼리�?- if else 
      });//if else- redis?�� �?
      }//client.get ?��?��
    });//redis create ?��?��
});//app.get?��?��

io.on('connection', (socket) => {//socketIO?��결이 ?���? ?��켓에 ?��?��?��?�� 문자?��?�� ?��치하?�� 메소?���? ?��?��?��?��.

  socket.on('disconnect', () => {//socket?�� disconnect?��?�� 메시�?�? ?��?��?���? ?��?��
    console.log('user disconnected');// ?��?�� ?���? ?��?���? ?��?�� ?��?��
  });

  //?���? �??�� 찾아봐야?�� �?분이?�� ?��거하�? ?��?��. ?��?��?��?���?�? ?��?��?��.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });


  //roomchat2.ejs?��?�� 방나�?�? 버튼 ?���??�� ?��?��?��?��.
  socket.on('room_out', (num,name) => {
    console.log(name+'?��?��?�� No.'+num+'방을 ?���??��?��?��?��.' ); //?��버콘?��?�� ?���? ?��?��?�� 찍어본다.
//    select seller_num, buyer_num from chatroom where room_id = 442;
    var m_num1;
    var buyer;
    var upnull;
    conn.execute("select m_num from member where nickname = '"+name+"'", function(err, result){
      m_num1 = result.rows[0][0];
      console.log("�?! ?���? m_num?��?��!",m_num1);
    });
    conn.execute("select buyer_num from chatroom where room_id = "+num+"",function(err,result){
      buyer = result.rows[0][0];
      console.log("�?! ?���? 구매?��?��?��!",buyer);
    });
    if(m_num1==buyer && m_num1!=undefined){
      console.log('?? 구매?���? ???��?��?��!');
      upnull = "update chatroom set buyer_num = null where room_id = "+num;
    } else {
      console.log('?? ?��매자�? ???��?��?��!');
      upnull = "update chatroom set seller_num = null where room_id = "+num;
    }
    conn.execute(upnull,function(err,result){
      console.log("그분?�� ?���??��?��?�� ?��?��",result);
    });



//    update chatroom set seller_num = null where room_id = 422;
//    update chatroom set buyer_num = null where room_id = 422;
    
    //var room_outSql = "delete from chatroom where room_id = "+num+" ";
    //?��?��?�� 채팅방을 ?���?�? ?���??�� 메시�? ?��?��블의 ?��?��?�� ?���? ?��거된?��. - 메시�? ?��?���? ?��?��?�� delete on cascade ?��?��?���? 추�??��기에 �??��?��?��.
    
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //?��?��?��?��블의 채팅�? �??���? 줄인?��. - (방번?���? ?��?��?�� 방의 ?��?��번호�? ?��?��?��?��.) - ?��?��?�� ?��?��번호?�� 채팅방갯?���? ?��?�� 줄인?��.
    
    conn.execute(change_countSql,function(err,result){//?��?��?��?���? ?��?��
      if(err){
        console.log("change_countSql ?��?�� :",err);
      } else {  
      console.log('?��?�� ?��?��블에 채팅방갯?�� 줄이�?', result); // ?��?��?�� row ?�� 반환
      }
    });



/*
    conn.execute(room_outSql,function(err,result){//?��리트�? ?��?��
      if(err){
        console.log("room_outSql ?��?�� :",err);
      } else {
      console.log('채팅�? �??���?' , result); // ?��?��?�� row ?�� 반환
    }      
    });

    

*/

    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, "+num+", '?��??방이 채팅방을 ?��갔습?��?��.')",function(err,result){
      if(err){
          console.log("?��록중 ?��?���? 발생?��?��?��!! 메시�? ?��?��?��?��", err);
      }else{
          console.log("result : ",result);
      }
    });


    // ?�� ?��?��?�� ?���?기�?? ?��?��?��?��?�� ?��?��?�� ?��?? ?��?��?���? ?��?��주기 ?��?�� 룸챗?���? room_out?��?���? 보낸?��
    io.to(room[num]).emit('room_out', num, name);
  });

  //방에 ?��?��?��?���? ?��?��
  socket.on('joinRoom', (num, name) => {
    socket.join(room[num], () => {//socket?�� �? 배열 �? num번째 방에 ?��?��?��?��.
      console.log(name + ' join a ' + num);
      io.to(room[num]).emit('joinRoom', num, name);//?��?��?�� 방에 ?��?��?��?���? 보낸?��.
    });
  });


  socket.on('chat message', (num, name, msg) => {//채팅 ?��?���? ?��?���?
    a = num; //?��?���? ?���?

    console.log('?��?�� '+name+'?�� 메시�??��?�� : num :', num, msg);//?��?��?��?���? 찍어보기
    
    //insert ?��?��
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("?��록중 ?��?���? 발생?��?��?��!! 메시�? ?��?��?��?��", err);
      }else{
          console.log("result : ",result);
      }
    });
    io.to(room[num]).emit('chat message', name, msg);//?��?�� 방에 ?��름과 메시�?�? ?��?��
  });
});




http.listen(3000, () => { // ?��버�?? ?��?��?��?��?��.
  console.log('Connect at 3000');
});
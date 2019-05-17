//한글깨져? can you read korean words? 한글안깨져?
/* socket\room_chat\app.js */
var express = require('express'); // express 서버 import


var app = express(); // 서버 객체 생성

var cors = require('cors'); // 채팅앱을 위한 설정 -상세내용 http://guswnsxodlf.github.io/enable-CORS-on-express
app.use(cors());            //                  -상세내용2 https://forums.adobe.com/thread/2197794
const http = require('http').Server(app); // http 통신규약 import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis의 connection 객체가 될 변수
var bodyParser = require('body-parser');
app.use(bodyParser());

app.use(session({ // 세션사용을 위한 절차
  secret: '12sdfwerwersdfserwerwef', //keboard cat (랜덤한 값)
  resave: false,
  saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource파일들의 경로설정을 위한 절차
app.set('view engine', 'ejs'); //뷰 템플릿 지정. .ejs 로 작성되어야한다. 
app.set('views', './views'); //경로지정. view단의 파일들은 해당 경로에 저장되어야 한다.
app.use('/api/daumJuso', require('./routes/daumJuso'));//모바일 주소 출력용

let room = [10000];//socketIO의 방 객체가 담길 배열
var conn; // DB connection 객체가 될 변수
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//자동커밋
oracledb.getConnection({// 커텍션 객체 생성
  user: "kys", //DB-name
  password: "kys", //DB-password
  connectString: "localhost/orcl"
}, function (err, con) { //콜백함수. url/sid를 통해 접근하며 성공시 con 이라는 커넥션 객체 반환. 
  if (err) {//에러가 있다면 실행
    console.log("접속에러", err);
  }
  conn = con; //앞서 전역변수로 선언한 conn에 지역변수 커넥션 객체 con을 넣어준다.
});

var sRoom;//방넘버를 공유하기 위해 전역변수로 지정함.
var status;
var c_address;
var c_datetime;
var seller;
var buyer;

//결제 포스트
app.post('/payment', (req, res) => {
  console.log("요청됨");
  console.log(req.body);
  var imp = req.body.imp_uid;
  var mnumSql = "insert into payment(merchant_uid,imp_uid,place_pick,cate_code,quality,card_name,pg_tid,title,buyer_name,seller_name,price,pro_num) values ('" + req.body.merchant_uid + "','" + req.body.imp_uid + "','" + req.body.addr + "','" + req.body.cate_code + "','" + req.body.quality + "','" + req.body.card_name + "','" + req.body.pg_tid + "','" + req.body.title + "','" + req.body.buyer_name + "','" + req.body.seller + "'," + req.body.price + "," + req.body.pro_num + ")";
  var updateState = "update production set state_msg = '1' where pro_num =" + req.body.pro_num;
  console.log(mnumSql);
  console.log(updateState + '/업데이트 query');
  conn.execute(mnumSql, function (err, result) {
    //흐흐 디비 저장용
    console.log(result);
    console.log(err);
    if (result.rowsAffected == 1) {

      // 결제가 완료 되면 결제 내역을 담고 상품에 대한 정보를 수정한다.
      conn.execute(updateState, function (err, result) {
        console.log(err + "상품에 대한 정보를 수정");
        console.log(result + '상품 정보 수정 결과 값');

        if(result.rowAffected == 1){
          console.log("완전한 상품 처리 끝");
        }

      })

    }

  });

})

//============ 결제 끝 ==============================================


app.get('/doChat2', (req, res) => {
  //redis작업
  //순서 : func_redisDoChat -> func_selectDochat 채팅방에 없다면 -> func_buyerNum -> func_insertDoChat ->render('doChat')
  //                        -> func_selectDochat 채팅방 이 있다면 -> render('doChat')
  var func_redisDoChat = function (res, req, redis, conn) {
    client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
    client.get("user", function (err, val) {//스프링에서 저장한 redis객체에 "user"라는 키의 값을 찾아 함수실행
      testdata = val;
      req.session.nickname = val;//세션의 nickname 변수에 redis객체에서 받아온 값을 넣어준다.
      console.log('찍어봅시다 : ', val) // 채팅서버에 접속한 유저의 nickname을 찍어본다.
      if (val === null) {//값이 없다면 요거하고 땡
        console.log('>>>>> result : null ');
      } else {
        return func_selectDochat(res, req, conn);
      } 0
    });

  }


  //redis작업
  var func_selectDochat = function (res, req, conn) {
    var seller_num = req.query.m_num;
    var pro_num = req.query.pro_num;
    console.log(seller_num, "판매자번호와 상품번호", pro_num);
    var doChatselectSql = "select room_id, (select nickname from member where m_num = seller_num), (select nickname from member where m_num = buyer_num), pro_num from chatroom where pro_num = " + pro_num + " and buyer_num = (select m_num from member where nickname = '" + req.session.nickname + "')";
    conn.execute(doChatselectSql, function (err, result) {
      console.log('마지막인가요');
      if (err) {
        console.log('doChatselectSql 에러발생', err);
      } else {
        console.log(result.rows.length);
        if (result.rows.length == 0) {
          console.log(req.session.nickname + '이 직톡하기를 클릭했지만 ' + req.session.nickname + '은(는) 구매자이며 해당 상품번호를 가진 채팅방갯수가 0이므로 인서트함수 실행 ');
          return func_buyerNum(res, req, conn, pro_num, req.query.m_num);
        } else {
          console.log(req.session.nickname
            + '은 이미 해당 상품에 구매자로 참여중이므로 채팅방으로 이동합니다.');
          var room_id = result.rows[0][0];
          var seller_num = result.rows[0][1];
          var buyer_num = result.rows[0][2];
          //                      /roomchat?room_id=44&talker=in&seller=grid&buyer=tom&pro_num=21
          ///                     roomchat?room_id=44&talker=in&seller=21&buyer=3&pro_num=21'
          //http://localhost:3000/roomchat?room_id=2&talker=in&seller=tom&buyer=jack&pro_num=2;
          console.log("/roomchat?room_id=" + room_id + "&talker=in&seller=" + seller_num + "&buyer=" + buyer_num + "&pro_num=" + req.query.pro_num);


          res.render('doChat', { room_id: room_id, seller_num: seller_num, buyer_num: buyer_num, pro_num: req.query.pro_num, nickname: req.session.nickname });
        }
      }
    });
  }
  var func_buyerNum = function (res, req, conn, pro_num, seller_num) {
    var mnumSql = "(select m_num, (chatroom_seq.nextval+1) ppap from member where nickname = '" + req.session.nickname + "')";
    conn.execute(mnumSql, function (err, result) {
      if (err) {
        console.log('mnumSql 에러발생', err);
      } else {
        console.log(result.rows[0]);
        var buyer_num = result.rows[0][0];
        var room_id = result.rows[0][1];
        return func_insertDochat(room_id, res, req, conn, pro_num, seller_num, buyer_num);
      }
    });
  }
  var func_insertDochat = function (room_id, res, req, conn, pro_num, seller_num, buyer_num) {

    var doChatinsertSql = "insert into chatroom(room_id, pro_num, seller_num, buyer_num) values (chatroom_seq.nextval, " + pro_num + ", " + seller_num + ", (select m_num from member where nickname = '" + req.session.nickname + "'))";
    console.log(req.session.nickname + '이 방생성을 시도합니다@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2' + doChatinsertSql);
    conn.execute(doChatinsertSql, function (err, result) {
      if (err) {
        console.log('doChatinsertSql 에러발생', err);
      } else {
        console.log('채팅방 생성 성공, 생성된 채팅방으로 이동합니다');
        console.log("/roomchat?room_id=" + room_id + "&talker=in&seller=" + seller_num + "&buyer=" + buyer_num + "pro_num=" + pro_num);


        res.render('doChat', { room_id: room_id, seller_num: seller_num, buyer_num: buyer_num, pro_num: req.query.pro_num, nickname: req.session.nickname });
      }
    });
  }


  func_redisDoChat(res, req, redis, conn);


});
app.get('/testQR', (req, res) => {
  console.log('@@@@@@@@@@@@@@@@@@@@@   QR코드를 통한 접근  @@@@@@@@@@@@@@');
  console.log('@@@@@@@@@@@@@@@@@@@@@   접근한 세션의 닉네임 @@@@@@@@@@@@@' + req.session.nickname);
  console.log('@@@@@@@@@@@@@판매@@판매@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@' + req.query.seller);
  console.log('@@@@@@@@@@@@@@@@@구매@@@@구매@@@@@@@@@@@@@@@@@@@@@@@@@@@@' + req.query.buyer);
  console.log('@@@@@@@@@@@@@@@@@@@@@상품번@호@@@@@@@@@@@@@@@@@@@@@@@@@@@' + req.query.pro_num);
  var QRsql = "select pro_num, place_pick, title, content, price, p_quality, c.cate_name from production p, category c where c.cate_code = p.cate_code and pro_num =" + req.query.pro_num;
  //--상품번호 거래장소 상품제목 상품내용 상품가격 상품품질 카테고리

  conn.execute(QRsql, function (err, result) {
    if (err) {

    } else {
      var place_pick = result.rows[0][1];
      var title = result.rows[0][2];
      var content = result.rows[0][3];
      var price = result.rows[0][4];
      var p_quality = result.rows[0][5];
      var cate_name = result.rows[0][6];
      var sendData = {
        seller: req.query.seller,
        buyer: req.query.buyer,
        pro_num: req.query.pro_num,
        place_pick: place_pick,
        title: title,
        content: content,
        price: price,
        p_quality: p_quality,
        cate_name: cate_name
      }
      res.render('goTestQR', sendData);
    }
  });
});


app.get('/tom', (req, res) => {
  res.render('tomson');
});
app.get('/roomchat', (req, res) => {//목록중 하나를 클릭하였을때 실행
  console.log('roomchat 접근........................................................');

  sRoom = req.query.room_id;////--쿼리스트링 값을 받아온다. req.query.변수명;
  status = req.query.talker; //상대방이 채팅방에 존재하는가에 대한 여부//in 과 out이 있다.
  seller = req.query.seller;
  buyer = req.query.buyer;
  pro_num = req.query.pro_num;
  mobile = req.query.mobile;//접속경로가 모바일이라면 render()가 아니라 데이터만 전달한다.
  console.log('roomchat 쿼리스트링받아옴........................................................');
  if (req.session.nickname == undefined) {//세션에 닉네임이 없다면 실행
    console.log('뭐이');
    client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
    client.get("user", function (err, val) {//스프링에서 저장한 redis객체에 "user"라는 키의 값을 찾아 함수실행
      testdata = val;
      req.session.nickname = val;//세션의 nickname 변수에 redis객체에서 받아온 값을 넣어준다.
      if (err) {
        console.log('웰컴!225웰컴!', err)
        if (mobile == 0) {
          console.log('웹접속이지만 닉이 없다.!');
          res.render('tomson');//닉네임이 비었다면 에러처리페이지인 tomson.ejs로 이동한다.
        }
        else {
          console.log('모바일접속!');
          req.session.nickname = 'Anonymous-Mobile-Guest'//
        }

      } else {//에러가 아니라면
        console.log('html이면1 ejs면0');
        console.log(mobile);
        req.session.nickname = 'Anonymous-Mobile-Guest';//아직까진 폰접속은 무조건 익명임
        console.log('왜 형이 여기서 나와?', req.session.nickname);
      }
    });
  } if (true) {
    console.log("방에 입장 :", req.session)//request객체의 세션값 읽음
    console.log("입장한 닉네임 :", req.session.nickname)//세션의 nickname변수에 저장된 값을 찍어본다.
    if (status == undefined) {
      status = req.query.talker;
    }
    if (sRoom == undefined) {//쿼리스트링값이 없다면
      sRoom = req.query.room_id;
    } // 쿼리스트링 값을 받아온다.
    console.log("입장합니다! : " + sRoom + "번방의 상태 : " + status);
    var prod_inf = function (c_address, c_datetime, pro_num) {
      var prodsql = "select pro_num, place_pick, title, content, price, p_quality, c.cate_name from production p, category c where c.cate_code = p.cate_code and pro_num =" + pro_num;
      //--상품번호 거래장소 상품제목 상품내용 상품가격 상품품질 카테고리
      conn.execute(prodsql, function (err, result) {
        if (err) {
          console.log('prod_inf 함수 에러 ', err);
        } else {
          var place_pick = result.rows[0][1];
          var title = result.rows[0][2];
          var content = result.rows[0][3];
          var price = result.rows[0][4];
          var p_quality = result.rows[0][5];
          var cate_name = result.rows[0][6];
          var sendData = {
            seller: req.query.seller,
            buyer: req.query.buyer,
            pro_num: req.query.pro_num,
            place_pick: place_pick,
            title: title,
            content: content,
            price: price,
            p_quality: p_quality,
            cate_name: cate_name
          }
          return renderMessage(c_address, c_datetime, sendData);
        }
      });
    }
    var renderMessage = function (c_address, c_datetime, sendData) {
      var searchMessage = 'select message_num, sender_num,member.nickname, room_id, content from message, member' +
        ' where message.sender_num = member.m_num and room_id = ' + parseInt(sRoom) + ' order by message_num asc';
      conn.execute(searchMessage, function (err, result) {
        console.log('입장한 방번호:' + sRoom);
        if (err) {//에러가 발생한다면 실행
          console.log("/ROOMCHAT : 등록중 에러가 발생", err);
        } else {//정상작동시
          console.log("result: ", result.rows);
          //roomchat2.ejs 로 이동한다. //이동할때 key:value형태로 쿼리결과, 세션의 닉네임, 방번호를 전달한다. 
          if (mobile == 0) {
            res.render('roomchat2', { result: JSON.stringify(result), nickname: req.session.nickname, roomid: sRoom, rstatus: status, datetime: c_datetime, address: c_address, seller: seller, buyer: buyer, pro_num: pro_num, pro_data: JSON.stringify(sendData) });// 방에다가 던져주자
          } else {
            console.log('');
            console.log('');
            console.log(sendData);
            console.log('');
            console.log('');
            res.send({ result: JSON.stringify(result), nickname: 'Anonymous-Mobile-Guest', roomid: sRoom, rstatus: status, datetime: c_datetime, address: c_address, seller: seller, buyer: buyer, pro_num: pro_num, pro_data: JSON.stringify(sendData) });
          }
        }
      });
    }
    conn.execute("select c_datetime, c_address from chatroom where room_id = (" + sRoom + ")", function (err, result) {
      console.log('select : 장소와 시간' + result.rows);

      c_datetime = result.rows[0][0];
      c_address = result.rows[0][1];
      c_pro_num = pro_num;
      if (c_address == null) { c_address = '약속장소 선정' }
      else {
        console.log('약속장소는 ' + c_address);
      }
      if (c_datetime == null) { c_datetime = '약속시간 선정' }
      else {
        console.log('약속시간약속시간은 ' + c_datetime);
      }
      console.log('파ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ티피플', c_address, c_datetime);
      return prod_inf(c_address, c_datetime, c_pro_num);
    });
  }//redis-if else
});



//목록의 방번호를 이용해 해당하는 디비의 메시지내역을 불러온다.




// 방목록 불러오기
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat 으로 접근시 실행
  client = redis.createClient(6379, "localhost");//localhost6379포트의 redis객체에 접근한다.
  client.get("user", function (err, val) {//스프링에서 저장한 redis객체에 "user"라는 키의 값을 찾아 함수실행
    testdata = val;
    req.session.nickname = val;//세션의 nickname 변수에 redis객체에서 받아온 값을 넣어준다.
    console.log('찍어봅시다 : ', val) // 채팅서버에 접속한 유저의 nickname을 찍어본다.
    if (val === null) {//값이 없다면 요거하고 땡
      console.log('>>>>> result : null ');
    }
    else {//값이 있다면 실행
      console.log('목록1');
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '" + val + "') or      buyer_num = (select m_num from member where nickname = '" + val + "')) order by room_id asc";
      console.log('목록2');
      //닉네임으로 유저의 회원번호 알아내어 해당 번호가 구매자 또는 판매자로 존재하는 채팅방을 검색한다.
      conn.execute(loglogsql, function (err, result) { // 긴 쿼리문을 실행한다.
        console.log('목록3');
        if (result == 'undefined') {
          console.log('결과값이 undefined입니다. 실행이 정상동작하지 않습니다.');
        }
        else if (err) {
          console.log("/jackchat : 에러가 발생했어요!! ", err);
        } else if (!result.rows.length) {// 0은 false라고 판단하는것을 이용, row가 0이 아니라면 다시말해 rows가 1이상이라면.
          console.log("result.rows: 리저어어얼트로우", result.rows); //결과값 확인용 찍어본다.
          res.render('roomlist', { result: JSON.stringify(result), nickname: req.session.nickname });
        } else {
          res.render('roomlist', { result: JSON.stringify(result), nickname: req.session.nickname });
        }//DB쿼리문- if else 
      });//if else- redis의 값
    }//client.get 함수
  });//redis create 함수
});//app.get함수

io.on('connection', (socket) => {//socketIO연결이 되며 소켓에 전송되는 문자열이 일치하는 메소드를 실행한다.
  //내가 좀더 찾아봐야할 부분이라 제거하지 않음. 사용되어지진 않는다.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(num, () => {
      console.log(name + ' leave a ' + room[num]);
      console.log(name + ' leave a ' + num);
      io.to(num).emit('leaveRoom', num, name);
    });
  });


  socket.on('QRsend', (num, name, tag) => {
    console.log(num, name, tag);
    var QRsql2 = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + name + "'), " + num + ", '" + tag + "')";
    conn.execute(QRsql2, function (err, result) {
      if (err) {
        console.log('QR메시지 인서트 에러', err);
      } else {
        io.to(num).emit('QRsend', num, name, tag);
      }
    });

  });
  //roomchat2.ejs에서 방나가기 버튼 클릭시 실행된다.
  socket.on('room_out', (num, name) => {
    console.log(name + '회원이 No.' + num + '방을 나가셨습니다.'); //서버콘솔에 나간 회원을 찍어본다.
    //    select seller_num, buyer_num from chatroom where room_id = 442;     
    var m_num;
    var buyer;
    // 함수 선언식 funtion A() { ~~~ } - 브라우저 실행시 호이스팅에 의해 상단으로 끌어올려진다. -위치에 구애받지 않고 함수 사용 가능.
    // 함수 표현식 var A = function(){ ~~~ } - 위치에 구애받는다, 콜백으로 사용(함수의 인자로 사용)
    // 함수 표현식- 클로저 : return 함수를 두어 함수가끝나면 다음 함수가 실행되는식
    // 함수 표현식- 콜백 : 함수의 인자로 함수를 받는것

    //callbackM()콜백함수를 이용해 시작한다. 
    function callbackM(callback, name, num) {
      console.log('start log :', name, num)
      return callback(name, num);
    }
    var firstCall = function (name, num) {
      conn.execute("select m_num from member where nickname = '" + name + "'", function (err, result) {
        m_num = result.rows[0][0];
        console.log('방나감first', m_num, buyer, name, num);
        return secondCall(m_num, num);//질의결과를 인자로 전달하며 클로져 함수 사용
      });
    }
    var secondCall = function (m_num, num) {
      conn.execute("select buyer_num from chatroom where room_id = " + num + "", function (err, result) {
        buyer = result.rows[0][0];
        console.log('방나감second', m_num, buyer, num);
        return thirdCall(m_num, buyer, num);
      });
    }
    var thirdCall = function (m_num, buyer, num) {
      if (m_num == buyer) {//나간 회원의 번호와 구매자의 번호를 대조. 같으면 나간사람은 구매자. 아니라면 나간사람은 판매자.
        console.log('방나감third-buyer', m_num, buyer, ' Room', num);
        upnull = "update chatroom set buyer_num = null where room_id = " + num;
        conn.execute(upnull, function (err, result) {
          console.log('Buyer Logout  // his Meber-number is ' + buyer);
        });
      } else {
        //현재 디비상으로 모든 판매자는 Jack이다. 
        upnull = "update chatroom set seller_num = null where room_id = " + num;
        console.log('third-seller', m_num, buyer, ' Room', num);
        conn.execute(upnull, function (err, result) {
          console.log('Seller Logout // his Meber-number is ' + buyer);
        });
      }
    }
    callbackM(firstCall, name, num); //콜백함수를 이용해 시작한다. 이후 내포한 모든 함수들은 클로저에 의해 순서대로 진행된다.  
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = " + num + ")";
    //상품테이블의 채팅방 갯수를 줄인다. - (방번호를 이용해 방의 상품번호를 알아낸다.) - 알아낸 상품번호의 채팅방갯수를 하나 줄인다.
    conn.execute(change_countSql, function (err, result) {//업데이트문 실행
      if (err) {
        console.log("change_countSql 에러 :", err);
      } else {
        console.log('상품 테이블에 채팅방갯수 줄이기', result); // 적용된 row 수 반환
      }
    });

    //시스템메시지를 삽입한다.
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, " + num + ", '상대방이 채팅방을 나갔습니다.')", function (err, result) {
      if (err) {
        console.log("등록중 에러가 발생했어요!! 메시지 입력에러", err);
      } else {
        console.log("result : ", result);
      }
    });


    // 한 회원이 나가기를 실행했다는 사실을 남은 회원에게 알려주기 위해 룸챗으로 room_out신호를 보낸다
    io.to(num).emit('room_out', num, name);
  });//룸 아웃 완료

  //방에 입장한다면 실행
  socket.on('joinRoom', (num, name) => {//DB에 저장된 room_id가 num이 된다.
    socket.join(num, () => {//socket의 방 배열 만개 중에서 num번째 방에 입장한다.
      console.log(name + ' join a ' + num);
      io.to(num).emit('joinRoom', num, name);//입장한 방에 입장신호를 보낸다.
    });
  });


  // Address 정보처리 Start
  var func_messageNum_a = function (num, address, name) {
    var sSql = "select message_seq.NEXTVAL-1 from dual";
    conn.execute(sSql, function (err, result) {
      if (err) {
        console.log("에러난 메시지아이디 셀렉트", err);
      } else {
        var message_id = result.rows[0][0];
        console.log("성공한 메시지아이디 셀렉트: ", result, sSql);
        console.log("성공한 메시지아이디 셀렉트: ", message_id);
        io.to(num).emit('socket_address', num, address, name, message_id);
      }
    });
  }

  socket.on('socket_sendAcc', (num, name, tag) => {
    var insertSql = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + name + "'), " + num + ", '" + tag + "')";
    conn.execute(insertSql, function (err, result) {
      if (err) {
        console.log(err, '인서트실퓨ㅐ')
      } else {
        console.log(result, '인서트성공')
        io.to(num).emit('socket_sendAcc', num, name, tag);
      }
    });

  });

  socket.on('socket_address', (num, address, name) => {//일정전송 신호가 서버로 들어올때 실행.
    var buttonSet = "<button class=''Ayes''>수락</button><button class=''Ano'' value='''||TO_CHAR(message_seq.NEXTVAL)||'''>거절</button>";
    var insertDate = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + name + "'), " + num + ", '장소협의 - " + name + "님에 의해 약속장소가 선정되었습니다 :<br><i class=''addressP''>" + address + "</i><br>" + buttonSet + "')";
    conn.execute(insertDate, function (err, result) {
      if (err) {
        console.log("소켓약속일시 insert 에러", err);
      } else {
        console.log("성공한 인서트 : ", result, insertDate);
        return func_messageNum_a(num, address, name);
      }
    });
  });

  socket.on('addressNo', (addressP, num, message_id) => {//거절버튼을 누른다면
    message_id = Number(message_id);
    var noSql = "update message set content = '<i>거절하셨습니다</i><br>" + addressP + "' where message_num = " + message_id;
    conn.execute(noSql, function (err, result) {
      if (err) {
        console.log("거절 에러", err);
      } else {
        console.log(noSql);
        console.log("거절 업데이트 성공! : ", result);
        io.to(num).emit('ref');
      }
    });
  });


  socket.on('addressYes', (addressP, num) => {//일정수락 신호가 온다면
    var updateDate = "update chatroom set c_address = '" + addressP + "' where room_id=" + num + "";
    conn.execute(updateDate, function (err, result) {
      if (err) {
        console.log("소켓약속일시 update 에러", err);
      } else {
        console.log("업데이트 성공! : ", result);
      }
    });

    console.log(addressP);
    console.log('하하하하');
    var yesSql = "update message set content = '<i>수락하셨습니다.</i><br>" + addressP + "' where content like '장소협의%' and room_id = " + num;
    conn.execute(yesSql, function (err, result) {
      if (err) {
        console.log("하히히하하하하 예쓰에러", err);
      } else {
        console.log("예ㅖㅖㅖㅖㅖㅖㅖ쓰업데이트 성공! : ", result);
        io.to(num).emit('ref');
      }
    });

  });
  // Address 정보처리 End
  // Date 정보처리 Start
  var func_messageNum = function (num, date, name) {
    var sSql = "select message_seq.NEXTVAL-1 from dual";
    conn.execute(sSql, function (err, result) {
      if (err) {
        console.log("에러난 메시지아이디 셀렉트", err);
      } else {
        var message_id = result.rows[0][0];
        console.log("성공한 메시지아이디 셀렉트: ", result, sSql);
        console.log("성공한 메시지아이디 셀렉트: ", message_id);
        io.to(num).emit('socket_date', num, date, name, message_id);
      }
    });
  }

  //conn.execute(change_countSql,function(err,result){
  //일정전송 신호가 서버로 들어올때 실행.
  socket.on('socket_date', (num, date, name) => {
    var buttonSet = "<button class=''yes''>수락</button><button class=''no'' value='''||TO_CHAR(message_seq.NEXTVAL)||'''>거절</button>";
    var insertDate = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + name + "'), " + num + ", '시간협의 - " + name + "님에 의해 약속일정이 선정되었습니다 :<i class=''dateP''>" + date + "</i><br>" + buttonSet + "')";
    conn.execute(insertDate, function (err, result) {
      if (err) {
        console.log("소켓약속일시 insert 에러", err);
      } else {
        console.log("성공한 인서트 : ", result, insertDate);
        return func_messageNum(num, date, name);
      }
    });
  });

  socket.on('dateNo', (dateP, num, message_id) => {//거절버튼을 누른다면
    message_id = Number(message_id);
    var noSql = "update message set content = '<i>거절하셨습니다</i><br>" + dateP + "' where message_num = " + message_id;
    conn.execute(noSql, function (err, result) {
      if (err) {
        console.log("거절 에러", err);
      } else {
        console.log(noSql);
        console.log("거절 업데이트 성공! : ", result);
        io.to(num).emit('ref');
      }
    });
  });


  socket.on('dateYes', (dateP, num) => {//일정수락 신호가 온다면
    var updateDate = "update chatroom set c_datetime = '" + dateP + "' where room_id=" + num + "";
    conn.execute(updateDate, function (err, result) {
      if (err) {
        console.log("소켓약속일시 update 에러", err);
      } else {
        console.log("업데이트 성공! : ", result);
      }
    });

    console.log(dateP);
    console.log('하하하하');
    var yesSql = "update message set content = '<i>수락하셨습니다.</i><br>" + dateP + "' where content like '시간협의%' and room_id = " + num;
    conn.execute(yesSql, function (err, result) {
      if (err) {
        console.log("하히히하하하하 예쓰에러", err);
      } else {
        console.log("예ㅖㅖㅖㅖㅖㅖㅖ쓰업데이트 성공! : ", result);
        io.to(num).emit('ref');
      }
    });

  });
  // Date 정보처리 End

  socket.on('chat message phone', (num, name, msg) => {
    console.log(name + ' (' + num + '): ' + msg);
    io.to(num).emit('chat message phone', name, msg);//해당 방에 이름과 메시지를 전송
  });


  socket.on('chat message', (num, name, msg) => {//채팅 신호가 온다면
    a = num; //왜했지 이걸

    console.log('회원 ' + name + '의 메시지전달 : num :', num, msg);//정상적인지 찍어보기

    //insert 실행
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + name + "'), " + num + ", '" + msg + "')", function (err, result) {
      if (err) {
        console.log("등록중 에러가 발생했어요!! 메시지 입력에러", err);
      } else {
        console.log("result : ", result);
      }
    });
    io.to(num).emit('chat message', name, msg);//해당 방에 이름과 메시지를 전송
  });

  //결제 영수증 퐁
  socket.on('receipt', function (room_id, buyer_name, tag) {
    console.log(room_id + "fucking=============");
    console.log(buyer_name + "sibal =================");
    console.log(tag + "tatatatatatatata=============");
    var insertSql = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '" + buyer_name + "'), " + room_id + ", '" + tag + "')";
    console.log(insertSql);
    conn.execute(insertSql, function (err, result) {
      if (err) {
        console.log(err, '인서트실퓨ㅐ')
      } else {
        console.log(result, '인서트성공')
        io.to(room_id).emit('receipt', (room_id, buyer_name, tag));
      }
    });

  });


});


http.listen(3000, () => { // 서버를 실행시킨다.
  console.log('Connect at 3000');

});
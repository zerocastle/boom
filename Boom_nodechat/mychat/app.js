//�ѱ۱���? can you read korean words? �ѱ۾ȱ���?
/* socket\room_chat\app.js */
var express = require('express'); // express ���� import
var app = express(); // ���� ��ü ����
const http = require('http').Server(app); // http ��űԾ� import
const io = require('socket.io')(http); // socket.io import
var redis = require("redis"); //redis import
var session = require('express-session'); //express-session import
var client; //redis�� connection ��ü�� �� ����
app.use(session({ // ���ǻ���� ���� ����
   secret: '12sdfwerwersdfserwerwef', //keboard cat (������ ��)
   resave: false,
   saveUninitialized: true
}));
app.use(express.static(__dirname + '/public')); // resource���ϵ��� ��μ����� ���� ����
app.set('view engine', 'ejs'); //�� ���ø� ����. .ejs �� �ۼ��Ǿ���Ѵ�. 
app.set('views', './views'); //�������. view���� ���ϵ��� �ش� ��ο� ����Ǿ�� �Ѵ�.


let room = [10000];//socketIO�� �� ��ü�� ��� �迭
var conn; // DB connection ��ü�� �� ����
var oracledb = require("oracledb"); //oracleDB import
oracledb.autoCommit = true;//�ڵ�Ŀ��
oracledb.getConnection({// Ŀ�ؼ� ��ü ����
  user:"kys", //DB-name
  password:"kys", //DB-password
  connectString:"39.127.7.51/orcl"},function(err,con){ //�ݹ��Լ�. url/sid�� ���� �����ϸ� ������ con �̶�� Ŀ�ؼ� ��ü ��ȯ. 
    if(err){//������ �ִٸ� ����
      console.log("���ӿ���",err);
    }
    conn=con; //�ռ� ���������� ������ conn�� �������� Ŀ�ؼ� ��ü con�� �־��ش�.
});

var sRoom;//��ѹ��� �����ϱ� ���� ���������� ������.
var status;
var c_address;
var c_datetime;
app.get('/testQR', (req,res) => {
console.log('�� QR�ڵ� �ݰ�����!');
    res.render('goTestQR');
});
app.get('/roomchat', (req, res) => {//����� �ϳ��� Ŭ���Ͽ����� ����
  console.log("�濡 ���� :", req.session)//request��ü�� ���ǰ� ����
  console.log("������ �г��� :", req.session.nickname)//������ nickname������ ����� ���� ����.
  sRoom = req.query.room_id;////--������Ʈ�� ���� �޾ƿ´�. req.query.������;
  status = req.query.talker; //������ ä�ù濡 �����ϴ°��� ���� ����//in �� out�� �ִ�.
  if(req.session.nickname==undefined){//���ǿ� �г����� ���ٸ� ����
    res.render('tomson');//�г����� ����ٸ� ����ó���������� tomson.ejs�� �̵��Ѵ�.
  }
  if(status== undefined){
    status = req.query.talker;
  }
  if(sRoom == undefined){//������Ʈ������ ���ٸ�
  sRoom = req.query.room_id;} // ������Ʈ�� ���� �޾ƿ´�.
  console.log("�����մϴ�! : "+sRoom+"������ ���� : " + status);
  var renderMessage = function(c_address, c_datetime){
    
    var searchMessage = 'select message_num, sender_num,member.nickname, room_id, content from message, member' +
    ' where message.sender_num = member.m_num and room_id = '+parseInt(sRoom)+' order by message_num asc';
    conn.execute(searchMessage,function(err,result){
      console.log('������ ���ȣ:'+sRoom);
    if(err){//������ �߻��Ѵٸ� ����
        console.log("/ROOMCHAT : ����� ������ �߻�", err);
    }else{//�����۵���
      console.log('������Ҵ� ' + c_address);
      console.log('�����ð��� ' + c_datetime);
      console.log("result: "+result);
      console.log("result: ",result.rows);
      //roomchat2.ejs �� �̵��Ѵ�. //�̵��Ҷ� key:value���·� �������, ������ �г���, ���ȣ�� �����Ѵ�. 
      res.render('roomchat2',{result:JSON.stringify(result), nickname:req.session.nickname, roomid:sRoom ,rstatus : status, datetime : c_datetime, address : c_address });// �濡�ٰ� ��������
    }

    });
  }

  conn.execute("select c_datetime, c_address from chatroom where room_id = ("+sRoom+")", function(err,result){
    console.log('select : ��ҿ� �ð�' + result.rows);
    c_datetime = result.rows[0][0];
    c_address = result.rows[0][1];
    if(c_address == null){c_address = '������ ����'}
    else {
      console.log('�����Ҵ� ' + c_address);
    }
    if (c_datetime == null){c_datetime = '��ӽð� ����'}
    else {
      console.log('��ӽð���ӽð��� ' + c_datetime);
    }

    console.log('�Ĥ�������������������������������������������������������Ƽ����',c_address, c_datetime);
    return renderMessage(c_address, c_datetime);
  });
  
  //����� ���ȣ�� �̿��� �ش��ϴ� ����� �޽��������� �ҷ��´�.
  
  
});


// ���� �ҷ�����
app.get('/jackchat', (req, res) => {//localhost:3000/jackchat ���� ���ٽ� ����
  client = redis.createClient(6379, "localhost");//localhost6379��Ʈ�� redis��ü�� �����Ѵ�.
    client.get("user", function(err, val) {//���������� ������ redis��ü�� "user"��� Ű�� ���� ã�� �Լ�����
    testdata=val;
    req.session.nickname = val;//������ nickname ������ redis��ü���� �޾ƿ� ���� �־��ش�.
    console.log('���ô� : ' , val) // ä�ü����� ������ ������ nickname�� ����.
    if(val === null) {//���� ���ٸ� ����ϰ� ��
      console.log('>>>>> result : null ');
    }
    else {//���� �ִٸ� ����
      var loglogsql = "select c.room_id, c.buyer_num, c.seller_num, c.pro_num, o.title, (select nickname from member where m_num = c.buyer_num) C_buyer_nickname, (select nickname from member where m_num = c.seller_num) C_seller_nickname  from chatroom c, production o where o.pro_num = c.pro_num and (      seller_num = (select m_num from member where nickname = '"+val+"') or      buyer_num = (select m_num from member where nickname = '"+val+"')) order by room_id asc";
      //�г������� ������ ȸ����ȣ �˾Ƴ��� �ش� ��ȣ�� ������ �Ǵ� �Ǹ��ڷ� �����ϴ� ä�ù��� �˻��Ѵ�.
      conn.execute(loglogsql,function(err, result){ // �� �������� �����Ѵ�.
        if(result == 'undefined'){
          console.log('������� undefined�Դϴ�. ������ ���������� �ʽ��ϴ�.');
        }
        else if(err){
          console.log("/jackchat : ������ �߻��߾��!! ", err);
        }else if(!result.rows.length){// 0�� false��� �Ǵ��ϴ°��� �̿�, row�� 0�� �ƴ϶�� �ٽø��� rows�� 1�̻��̶��.
          console.log("result.rows: ��������Ʈ�ο�",result.rows); //����� Ȯ�ο� ����.
          res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname}); 
        }else{  
              res.render('roomlist',{result:JSON.stringify(result),nickname:req.session.nickname});        
        }//DB������- if else 
      });//if else- redis�� ��
      }//client.get �Լ�
    });//redis create �Լ�
});//app.get�Լ�

io.on('connection', (socket) => {//socketIO������ �Ǹ� ���Ͽ� ���۵Ǵ� ���ڿ��� ��ġ�ϴ� �޼ҵ带 �����Ѵ�.

  socket.on('disconnect', () => {//socket�� disconnect��� �޽����� ���۵Ǹ� ����
    console.log('user disconnected');// ���� �̰� �ϴ°� ���� ����
  });

  //���� ���� ã�ƺ����� �κ��̶� �������� ����. ���Ǿ����� �ʴ´�.
  socket.on('leaveRoom', (num, name) => {
    socket.leave(num, () => {
      console.log(name + ' leave a ' + room[num]);
      io.to(num).emit('leaveRoom', num, name);
    });
  });

  //roomchat2.ejs���� �泪���� ��ư Ŭ���� ����ȴ�.
  socket.on('room_out', (num,name) => {
      console.log(name+'ȸ���� No.'+num+'���� �����̽��ϴ�.' ); //�����ֿܼ� ���� ȸ���� ����.
          //    select seller_num, buyer_num from chatroom where room_id = 442;     
      var m_num;
      var buyer;
      // �Լ� ����� funtion A() { ~~~ } - ������ ����� ȣ�̽��ÿ� ���� ������� ����÷�����. -��ġ�� ���ֹ��� �ʰ� �Լ� ��� ����.
      // �Լ� ǥ���� var A = function(){ ~~~ } - ��ġ�� ���ֹ޴´�, �ݹ����� ���(�Լ��� ���ڷ� ���)
      // �Լ� ǥ����- Ŭ���� : return �Լ��� �ξ� �Լ��������� ���� �Լ��� ����Ǵ½�
      // �Լ� ǥ����- �ݹ� : �Լ��� ���ڷ� �Լ��� �޴°�
       
      //callbackM()�ݹ��Լ��� �̿��� �����Ѵ�. 
      function callbackM(callback,name,num){
        console.log('start log :',name,num)
        return callback(name,num);
      }
      var firstCall = function(name,num){
        conn.execute("select m_num from member where nickname = '"+name+"'", function(err, result){
          m_num = result.rows[0][0]; 
          console.log('�泪��first',m_num,buyer,name,num);
          return secondCall(m_num,num);//���ǰ���� ���ڷ� �����ϸ� Ŭ���� �Լ� ���
        });        
      }
      var secondCall = function(m_num,num){
        conn.execute("select buyer_num from chatroom where room_id = "+num+"",function(err,result){
          buyer = result.rows[0][0];
          console.log('�泪��second',m_num,buyer,num);
          return thirdCall(m_num,buyer,num);
        });
      }
      var thirdCall = function(m_num,buyer,num){
        if(m_num==buyer){//���� ȸ���� ��ȣ�� �������� ��ȣ�� ����. ������ ��������� ������. �ƴ϶�� ��������� �Ǹ���.
          console.log('�泪��third-buyer',m_num,buyer,' Room',num);
          upnull = "update chatroom set buyer_num = null where room_id = "+num;
          conn.execute(upnull,function(err,result){
            console.log('Buyer Logout  // his Meber-number is '+buyer);
          });
        } else {
          //���� �������� ��� �Ǹ��ڴ� Jack�̴�. 
          upnull = "update chatroom set seller_num = null where room_id = "+num;
          console.log('third-seller',m_num,buyer,' Room',num);
          conn.execute(upnull,function(err,result){
            console.log('Seller Logout // his Meber-number is '+buyer );
          });
        }  
      }
      callbackM(firstCall,name,num); //�ݹ��Լ��� �̿��� �����Ѵ�. ���� ������ ��� �Լ����� Ŭ������ ���� ������� ����ȴ�.  
    var change_countSql = "update production set chat_room_count = chat_room_count -1  where pro_num = (select pro_num from chatroom where room_id = "+num+")";
    //��ǰ���̺��� ä�ù� ������ ���δ�. - (���ȣ�� �̿��� ���� ��ǰ��ȣ�� �˾Ƴ���.) - �˾Ƴ� ��ǰ��ȣ�� ä�ù氹���� �ϳ� ���δ�.
    conn.execute(change_countSql,function(err,result){//������Ʈ�� ����
      if(err){
        console.log("change_countSql ���� :",err);
      } else {  
      console.log('��ǰ ���̺��� ä�ù氹�� ���̱�', result); // ����� row �� ��ȯ
      }
    });

    //�ý��۸޽����� �����Ѵ�.
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, 0, "+num+", '������ ä�ù��� �������ϴ�.')",function(err,result){
      if(err){
          console.log("����� ������ �߻��߾��!! �޽��� �Է¿���", err);
      }else{
          console.log("result : ",result);
      }
    });


    // �� ȸ���� �����⸦ �����ߴٴ� ����� ���� ȸ������ �˷��ֱ� ���� ��ê���� room_out��ȣ�� ������
    io.to(num).emit('room_out', num, name);
  });//�� �ƿ� �Ϸ�

  //�濡 �����Ѵٸ� ����
  socket.on('joinRoom', (num, name) => {
    socket.join(num, () => {//socket�� �� �迭 �� num��° �濡 �����Ѵ�.
      console.log(name + ' join a ' + num);
      io.to(num).emit('joinRoom', num, name);//������ �濡 �����ȣ�� ������.
    });
  });


// Address ����ó�� Start
var func_messageNum_a = function (num, address, name){
  var sSql = "select message_seq.NEXTVAL-1 from dual";
  conn.execute(sSql,function(err,result){
    if(err){
        console.log("������ �޽������̵� ����Ʈ", err);
    }else{
        var message_id = result.rows[0][0];
        console.log("������ �޽������̵� ����Ʈ: ",result, sSql);
        console.log("������ �޽������̵� ����Ʈ: ",message_id);
        io.to(num).emit('socket_address', num, address, name, message_id);
      }
  });
}



socket.on('socket_address', (num, address, name) => {//�������� ��ȣ�� ������ ���ö� ����.
    var buttonSet = "<button class=''Ayes''>����</button><button class=''Ano'' value='''||TO_CHAR(message_seq.NEXTVAL)||'''>����</button>";
    var insertDate = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '������� - "+name+"�Կ� ���� �����Ұ� �����Ǿ����ϴ� :<br><i class=''addressP''>"+address+"</i><br>"+buttonSet+"')";
    conn.execute(insertDate,function(err,result){
      if(err){
          console.log("���Ͼ���Ͻ� insert ����", err);
      }else{
          console.log("������ �μ�Ʈ : ",result, insertDate);
        return func_messageNum_a(num, address, name);
        }
    });
});

socket.on('addressNo', (addressP,num, message_id)=> {//������ư�� �����ٸ�
  message_id = Number(message_id);
  var noSql = "update message set content = '<i>�����ϼ̽��ϴ�</i><br>"+addressP+"' where message_num = "+message_id;
  conn.execute(noSql,function(err,result){
    if(err){
      console.log("���� ����", err);
  }else{
      console.log(noSql);
      console.log("���� ������Ʈ ����! : ",result);
      io.to(num).emit('ref');
  }
  });
});


socket.on('addressYes', (addressP,num)=> {//�������� ��ȣ�� �´ٸ�
  var updateDate = "update chatroom set c_address = '"+addressP+"' where room_id="+num+"";
  conn.execute(updateDate,function(err,result){
    if(err){
      console.log("���Ͼ���Ͻ� update ����", err);
  }else{
      console.log("������Ʈ ����! : ",result);
  }
  });

  console.log(addressP);
  console.log('��������');
  var yesSql = "update message set content = '<i>�����ϼ̽��ϴ�.</i><br>"+addressP+"' where content like '�������%' and room_id = "+num;
  conn.execute(yesSql,function(err,result){
    if(err){
      console.log("�������������� ��������", err);
  }else{
      console.log("���ƤƤƤƤƤƤƾ�������Ʈ ����! : ",result);
      io.to(num).emit('ref');
  }
  });
  
});
// Address ����ó�� End
// Date ����ó�� Start
  var func_messageNum = function (num, date, name){
    var sSql = "select message_seq.NEXTVAL-1 from dual";
    conn.execute(sSql,function(err,result){
      if(err){
          console.log("������ �޽������̵� ����Ʈ", err);
      }else{
          var message_id = result.rows[0][0];
          console.log("������ �޽������̵� ����Ʈ: ",result, sSql);
          console.log("������ �޽������̵� ����Ʈ: ",message_id);
          io.to(num).emit('socket_date', num, date, name, message_id);
        }
    });
  }
  
  //conn.execute(change_countSql,function(err,result){
  //�������� ��ȣ�� ������ ���ö� ����.
  socket.on('socket_date', (num, date, name) => {
      var buttonSet = "<button class=''yes''>����</button><button class=''no'' value='''||TO_CHAR(message_seq.NEXTVAL)||'''>����</button>";
      var insertDate = "INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '�ð����� - "+name+"�Կ� ���� ��������� �����Ǿ����ϴ� :<i class=''dateP''>"+date+"</i><br>"+buttonSet+"')";
      conn.execute(insertDate,function(err,result){
        if(err){
            console.log("���Ͼ���Ͻ� insert ����", err);
        }else{
            console.log("������ �μ�Ʈ : ",result, insertDate);
          return func_messageNum(num, date, name);
          }
      });
  });

  socket.on('dateNo', (dateP,num, message_id)=> {//������ư�� �����ٸ�
    message_id = Number(message_id);
    var noSql = "update message set content = '<i>�����ϼ̽��ϴ�</i><br>"+dateP+"' where message_num = "+message_id;
    conn.execute(noSql,function(err,result){
      if(err){
        console.log("���� ����", err);
    }else{
        console.log(noSql);
        console.log("���� ������Ʈ ����! : ",result);
        io.to(num).emit('ref');
    }
    });
  });


  socket.on('dateYes', (dateP,num)=> {//�������� ��ȣ�� �´ٸ�
    var updateDate = "update chatroom set c_datetime = '"+dateP+"' where room_id="+num+"";
    conn.execute(updateDate,function(err,result){
      if(err){
        console.log("���Ͼ���Ͻ� update ����", err);
    }else{
        console.log("������Ʈ ����! : ",result);
    }
    });

    console.log(dateP);
    console.log('��������');
    var yesSql = "update message set content = '<i>�����ϼ̽��ϴ�.</i><br>"+dateP+"' where content like '�ð�����%' and room_id = "+num;
    conn.execute(yesSql,function(err,result){
      if(err){
        console.log("�������������� ��������", err);
    }else{
        console.log("���ƤƤƤƤƤƤƾ�������Ʈ ����! : ",result);
        io.to(num).emit('ref');
    }
    });
    
  });
// Date ����ó�� End

  socket.on('chat message', (num, name, msg) => {//ä�� ��ȣ�� �´ٸ�
    a = num; //������ �̰�

    console.log('ȸ�� '+name+'�� �޽������� : num :', num, msg);//���������� ����
    
    //insert ����
    conn.execute("INSERT INTO MESSAGE (MESSAGE_num, SENDER_num, ROOM_ID, CONTENT) VALUES (message_seq.NEXTVAL, (select m_num from member where nickname = '"+name+"'), "+num+", '"+msg+"')",function(err,result){
      if(err){
          console.log("����� ������ �߻��߾��!! �޽��� �Է¿���", err);
      }else{
          console.log("result : ",result);
      }
    });
    io.to(num).emit('chat message', name, msg);//�ش� �濡 �̸��� �޽����� ����
  });
});




http.listen(3000, () => { // ������ �����Ų��.
  console.log('Connect at 3000');
});
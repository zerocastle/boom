$('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
console.log('chat.js 호출성공');
//새로고침을 위한 함수.
var ref = function () {
  road_and_QR()
  $('.messages').scrollTop(99999999);
  window.location.reload();
  $('.messages').scrollTop(99999999);
  road_and_QR()
}
//새로고침을 위한 함수.

//채팅방 로딩할 때마다 QR코드를 만들어준다. 
var road_and_QR = function () {

  var seller = $('#seller').text();
  var buyer = $('#buyer').text();
  var pro_num = $('#pro_num').text();
  for (var i = 0; i < document.getElementsByClassName("qrcode").length; i++) {
    //var muid = $('.qrcode').text();
    var muid = $(".qrcode")[i].innerHTML;
    console.log(muid);
    var qrcode = new QRCode(document.getElementsByClassName("qrcode")[i], {
      text: "http://39.127.7.47:3000/testQR?muid=" + muid + "&Tname=" + Tname, ///주의!! 직플파트너의 닉네임이 노드서버에서 쿼리스트링의 변수 'nickname'에 더해진다.
      width: 170,
      height: 170,
      colorDark: "#000000",
      colorLight: "#ffffff",
      correctLevel: QRCode.CorrectLevel.H
    });
  }
}
//채팅방 로딩할 때마다 QR코드를 만들어준다. 





//토큰을 이용해 푸시알림을 보내는 함수. 종종쓰입니다.
var sendToken = function (msg, title, sender) {
  var otherToken = $('#otherToken').text();
  console.log('otherToken is ready for ' + otherToken);
  if (otherToken != null) {
    console.log("other's Token is not null");
    $.ajax({
      url: "http://39.127.7.47:3000/api/push",
      dataType: 'json',
      type: 'POST',
      data: {
        data: $('#otherToken').text(),//상대방토큰 
        message: msg, //전송메시지
        title: title, //전송메시지 제목
        sender: sender
      }, //발신자
      success: function () {
        console.log("토큰전송ok");
      }
    });
  } else {
    console.log("other's token is null");
  }
}
//토큰을 이용해 푸시알림을 보내는 함수. 종종쓰입니다.
$.urlParam = function (name) {
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  if (results == null) {
    return null;
  }
  else {
    return results[1] || 0;
  }
}
var temp = {}//세션에 저장된 member JSONObject를 가져온다.
temp = JSON.parse(sessionStorage.getItem('member'));
let Tname = temp.nickname;
const num = $.urlParam('room_id');;
let socket;
let pro_num;
var Tseller = $.urlParam('seller');
var Tbuyer = $.urlParam('buyer');
var other = '';

$('#set_date').bootstrapMaterialDatePicker({ format: 'YYYY/MM/DD HH:mm', minDate: new Date() });//캘린더 - datePicker를 달아준다.
$(document).ready(function () {
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
  $.ajax({
    url : 'http://39.127.7.47:3000/otherImage',
    type:'post',
    data : {
              room_id : num,
              nickname : Tname
            },
    dataType:'json',
    success:function(data){
      console.log(data);
      $('.contact-profile img').attr('src', 'http://39.127.7.47:8080/resources/'  + data.img);
      $('.contact-profile p').prepend(data.nickname);
      $('.contact-profile p span').append(data.title);
    },error : function(err){

    }
  });
  $.ajax({
    url : 'http://39.127.7.47:3000/whatZicple',
    type : 'post',
    data : {room_id : num },
    success : function(data){
      var place_pick = data.place_pick;
      if(place_pick+''!=''){//선정된 직플이 있다면
        place_pick = place_pick+'';
        var zicpleSum = [];
        zicpleSum = place_pick.split('-');
        var part_name = zicpleSum[0];
        var road = zicpleSum[1];
        var jibun = zicpleSum[2];
        var menu = "직플레이스 : <b>"+part_name+"</b><br><addr>"+road+"<br>"+jibun+"</addr><br><button id='updateZicpleB' class='send menu send_addr plus_send' style='margin-left:7px; font-weight:bold;'>다시 선정하기</button>"
        $('#updateZicpleA').append(menu);  
      }else {
          var menu = "<b>직플레이스가 없습니다.</b><br><addr><br></addr><br><button id='updateZicpleB' class='send menu send_addr plus_send' style='margin-left:7px; font-weight:bold;'>선정하기</button>"
          $('#updateZicpleA').append(menu);  
      }
       
    }, error : function(err){
      console.log(err);
    }
  })
  $(document).on("click",'.jumsu',  function () {
    
    var sender = $(this).parent().parent().find('p').text();
    var score = parseInt($(this).siblings().first().val());
    var room_id = parseInt($('#room_id').text());
    var message_id = parseInt($(this).parent().parent().parent().find('.jumsuNum').text());
    window.alert('발신자 : ' + sender + '|| 발생점수 :  ' + score + '|| 메시지번호 : ' + message_id);

    var data = {
      seller : $('#seller').text(),
      buyer : $('#buyer').text(),
      sender: sender,
      score: score,
      room_id : room_id,
      message_id : message_id
    };
    $.ajax({
      type: 'POST',
      url: 'http://39.127.7.47:3000/jumsu',
      data: data,
      success: function (data) {
        alert('success');
        ref();
      },
      error: function (err) {
        alert(err);
      }
    });


  });






  var talkerState = $.urlParam('talker');
  /**** 상대방이 채팅방을 나간 상황이라면 */
  if (talkerState == 'out') {
    $('.nullmenu').css('display', 'none');//.nullmenu는 채팅입력input 및 추가메뉴 대부분 그리고 채팅send버튼
  }
  /**** 상대방이 채팅방을 나간 상황이라면 */

  /**** 판매자만이 결제명세서 전송을 할 수 있다. */
  if (Tname != Tseller) {
    $('#buy').css('display', 'none');//내가 판매자가 아니라면 명세서 전송을 할수없다
  }

  /**** 판매자만이 결제명세서 전송을 할 수 있다. */



  //상대방 토큰 정보 불러오기
  if (Tseller == Tname) {
    other = Tbuyer;
  } else if (Tbuyer == Tname) {
    other = Tseller;
  }
  console.log("other's nickname is : " + other);
  $.ajax({
    type: 'post',
    url: 'http://39.127.7.47:3000/api/push/getToken',
    data: { nickname: other },
    success: function (result) {
      console.log(result);
      $('#otherToken').text(result);
    },
    error: function (err) {
      console.log(err);
    }
  });
  //상대방 토큰 정보 불러오기





  /* $('body').click(function(e){
    if($('iframe')!=e.target && $('iframe').attr("style")=='display: block;'){
      console.log('려차');
      $('#myModal').bPopup().close(); 
      $('#daumIframe').css('display','none'); 
    }  
  }) */

  /// 주소지정
  $('#set_address').click(function () {
    document.getElementById('daumIframe').src += '';

    $('#myModal').bPopup({
      modalClose: true,
      positionStyle: 'fixed',
      position: [10, 100]
    }, function () {
      $('#daumIframe').css('display', 'block');
      var setInter = setInterval(function () {
        $.ajax({
          url: 'http://39.127.7.47:3000/api/daumJuso/mobile',
          type: 'get',
          success: function (data) {

            if (data) {
              $('#myModal').bPopup().close();
              $('#set_address').val(data.fullAddr);
              console.log(data.fullAddr);
              $('#daumIframe').css('display', 'none');
              clearInterval(setInter);

            } else {
              console.log(data + 'ㅎㅎ 안찍혔지?');

            }
          }, error: function (err) {

            console.log(err);
          }
        });
      }, 1000);
    });
  });
  //주소지정 
  var room_id = $.urlParam('room_id');
  var talker = $.urlParam('talker');
  var seller = $.urlParam('seller');
  var buyer = $.urlParam('buyer');
  var pro_num = $.urlParam('pro_num');
  var mobile = $.urlParam('mobile');
  var reqUrl = 'http://39.127.7.47:3000/roomchat?room_id=' + room_id + '&talker=' + talker + '&seller=' + seller + '&buyer=' + buyer + '&pro_num=' + pro_num + '&mobile=' + mobile + '';
  var Pdata = '서버응답이되는지보기위한변수입니다.'
  $.ajax({
    //방번호, 구매자판매자중 하나라도 null이라면 talker=out,판매자,구매자,상품번호,모바일여부(모바일은 서버단에서 메시지목록을 던져주고 PC는 페이지를 넘겨준다.)

    url: reqUrl,
    dataType: 'json',
    type: 'get',
    data: { data: Pdata },
    success: function (result) {
      console.log($.urlParam('room_id') + '번 방에 입장한다.');
      console.log(result);
      console.log('성공!');
      $('#pro_num').text(result.pro_num);
      $('#buyer').text(result.buyer);
      $('#seller').text(result.seller);
      $('#nickname').text(result.nickname);
      $('#room_id').text(result.roomid);
      $('#status').text(result.rstatus);
      var jprod = JSON.parse(result.pro_data);
      $('#bseller').text(jprod.seller);
      $('#bbuyer').text(jprod.buyer);
      $('#bpro_num').text(jprod.pro_num);
      $('#btitle').text(jprod.title);
      $('#bcate_name').text(jprod.cate_name);
      $('#bcontent').text(jprod.content);
      $('#bprice').text(jprod.price);
      $('#b_quality').text(jprod.p_quality);
      $('#bplace_pick').text(jprod.place_pick);
      var subDate;
      var jsonoobj = {};
      var result2 = JSON.parse(result.result);
      console.log(result2);
      for (var i = 0; i < result2.rows.length; i++) {
        jsonoobj = {
          tnickname: result2.rows[i][2],
          tmessage: result2.rows[i][4]
        }
        if (jsonoobj.tnickname == Tname) {//메시지의 발신자와 입장한 사용자가 동일인이라면
          if (jsonoobj.tmessage.indexOf('시간협의') == 0) {
            var end = jsonoobj.tmessage.indexOf('</i><br>');
            var start = jsonoobj.tmessage.indexOf("P'>");
            start = start + 3;
            subDate = jsonoobj.tmessage.substring(start, end);
            jsonoobj.tmessage = '<i>상대방에게 시간협의를 제안하셨습니다</i><br><i>' + subDate + '</i>';
          } else if (jsonoobj.tmessage.indexOf('장소협의') == 0) {
            var end = jsonoobj.tmessage.indexOf('</i><br>');
            var start = jsonoobj.tmessage.indexOf("P'>");
            start = start + 3;
            subDate = jsonoobj.tmessage.substring(start, end);
            console.log(subDate);
            console.log(jsonoobj.tmessage.length);
            jsonoobj.tmessage = '<i>상대방에게 장소협의를 제안하셨습니다</i><br><i>' + subDate + '</i>';
          } else if(jsonoobj.tmessage.indexOf('직플레이스제안') == 0){
            var end = jsonoobj.tmessage.indexOf('</i><br>');
            var start = jsonoobj.tmessage.indexOf(":");
            start++;
            subDate = jsonoobj.tmessage.substring(start,end);
            console.log(subDate);
            console.log(jsonoobj.tmessage.length);
            jsonoobj.tmessage = '<i>상대방에게 직플레이스를 제안하셨습니다</i><br><i>'+subDate+'</i>';
          }
        }//if(이름비교)
        console.log('jsonoobj : ', jsonoobj.tnickname)
        console.log('nickname : ', Tname);
        if (jsonoobj.tnickname == Tname) {
          //내메시지
          $('#messages').append($('<li class="even replies">').html('<div>'+jsonoobj.tnickname + '</div><div><p class="tmsg">'+ jsonoobj.tmessage + '</p></div>'));//버튼은 상대방에게만 보인다.  
        } else { //메시지발신자와 세션의 닉네임이 같지 않다면 --> 상대방메시지
          if (jsonoobj.tnickname == 'System') {
            $('#messages').append($('<li class="system sent">').html('<div>'+jsonoobj.tnickname + '</div><div><p class="tmsg">'+ jsonoobj.tmessage + '</p></div>'));//버튼은 상대방에게만 보인다.  
          } else {
            $('#messages').append($('<li class="odd sent">').html('<div>'+jsonoobj.tnickname + '</div><div><p class="tmsg">'+ jsonoobj.tmessage + '</p></div>'));//버튼은 상대방에게만 보인다.  
          }
        }
        $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림

      }//for()
      road_and_QR();

      /////평가메시지 상대방과 나의 구분
      var me = document.getElementsByClassName('meme')[0].innerHTML;
      var other = document.getElementsByClassName('otherother')[0].innerHTML;
      $('.other').hide();
      $('.me').hide();
      var memberjson = JSON.parse(sessionStorage.getItem('member'));
      console.log(me);
      console.log(other);
      console.log(memberjson.nickname);
      if (memberjson.nickname == me) {
        $('.other').show();
      } else {
        $('.me').show();
      }
      if (memberjson.nickname == other) {
        $('.me').show();
      } else {
        $('.other').show();
      }
      /////평가메시지 상대방과 나의 구분

      $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
      
    },
    error: function (err) {
      alert('에러야')
      console.log(err);
      console.log('에러야');
    }



    ///채점

    ////채점





  });




});//document.ready
$('#plusbtn').on('click', function () {
  $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
});
var a = function (socket2) {
  socket2 = io.connect('http://39.127.7.47:3000');
  return func_socket(socket2);
}
var func_socket = function (socket2) {
  socket2.emit('phoneIn', num, Tname);
  socket2.emit('joinRoom', num, Tname);
  console.log('방금w 에밋을 하셨어요! 숫자' + num + ' 이름' + Tname);
  return socket2;
}
socket = a(socket);
console.log('io after');

//         socket.emit('phoneIn', num, Tname);
socket.on('phoneIn', (num, name) => {
  console.log('emit 서버로부터 폰인!');
  console.log(name + '입장!');
});
socket.emit('joinRoom', num, Tname);

// 일딴 세로 고침
socket.on('ref', () => {
  window.location.reload();
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});



$('form').submit(() => {// Enter칠때마다 Send 할때마다 실행
  if ($('#m').val() == "") {
    return false;
  } else {
    socket.emit('chat message', num, Tname, $('#m').val());// 서버로  작성자, 방번호, 메시지를 전달한다.
    //socket.emit('chat message phone', num, Tname, $('#m').val());// 서버로  작성자, 방번호, 메시지를 전달한다.
    sendToken($('#m').val(), $('#btitle').text(), Tname);
    $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림

    $('#m').val('');//입력창 비워주기
  }
  return false;
  //원하는 작업만 마친 후 submit의 동작을 멈춘다. 퉤 시바
});



/****서버에게 전달하는 emit 모음 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
//결제모듈
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp57701295");
$(document).on('click', '.payment', function () {
  var buyer2 = $.urlParam('buyer');
  if (Tname + '' != buyer2) {
    alert('구매자만 결제가 가능합니다.');
    return false;
  }
  // IMP.request_pay(param, callback) 호출
  // 결제 코드 uuid 생성
  var merchant_uid = guid();
  function guid() {
    function s4() {
      return Math.floor((1 + Math.random()) * 0x10000)
        .toString(16)
        .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
      s4() + '-' + s4() + s4() + s4();
  }
  IMP.request_pay({ // param
    pay_method: "card",
    escrow: true,
    merchant_uid: merchant_uid,
    name: $('#btitle').html(), // title
    amount: $('#bprice').html(),
    buyer_name: buyer2,
  }, function (rsp) { // callback
    console.log(rsp);
    if (rsp.success) {

      var msg = '결제 정보 확인 루틴';
      var today = new Date();
      var dd = today.getDate();
      var mm = today.getMonth() + 1; //January is 0!
      var yyyy = today.getFullYear();

      if (dd < 10) {
        dd = '0' + dd
      }

      if (mm < 10) {
        mm = '0' + mm
      }

      today = yyyy + '/' + mm + '/' + dd;
      console.log("투데이 : " + today);


      var buyer_name = rsp.buyer_name;

      var tag2 = "<ol><div class=''qrcode''>" + rsp.merchant_uid + "</div></ol>"
        + "<ol><div class=''receipt_title''>========== 영 수 증 ==========</div></ol>"
        + "<ol><div class=''imp_uid''>가맹점 코드 : " + rsp.imp_uid + "  </div></ol>"
        + "<ol><div class=''merchant_uid''>결제코드 : " + rsp.merchant_uid + " </div></ol>"
        + "<ol><div class=''pro_num''>상품번호 : " + $('#bpro_num').html() + " </div></ol>"
        + "<ol><div class=''cate_code''>상품 분류 : " + $('#bcate_name').html() + " </div></ol>"
        + "<ol><div class=''quality''>상품 품질 : " + $('#b_quality').html() + " </div></ol>"
        + "<ol><div class=''title''>상품이름 : " + rsp.name + " </div></ol>"
        + "<ol><div class=''price''>상품가격 : " + rsp.paid_amount + " </div></ol>"
        + "<ol><div class=''card_name''>카드사 : " + rsp.card_name + " </div></ol>"
        + "<ol><div class=''pg_tid''>카드결제 코드: " + rsp.pg_tid + " </div></ol>"
        + "<ol><div class=''buyer_name''>구매자 : " + rsp.buyer_name + " </div></ol>"
        + "<ol><div class=''seller_name''>판매자 : " + $('#bseller').html() + " </div></ol>"
        + "<ol><div class=''place_pick''>직플레이스 : " + $('#bplace_pick').html() + " </div></ol>"
        + "<ol><div class=''seller_name''>결제날짜 : " + today + " </div></ol>";

      console.log(room_id + '' + buyer_name + '' + tag2);

      //결제 완료후 핑
      socket.emit('receipt', room_id, rsp.buyer_name, tag2);

      jQuery.ajax({
        url: "/payment", //cross-domain error가 발생하지 않도록 주의해주세요
        type: 'POST',
        data: {

          imp_uid: rsp.imp_uid, // 상점 번호
          merchant_uid: rsp.merchant_uid, // 결제 번호
          //기타 필요한 데이터가 있으면 추가 전달
          addr: $('#bplace').html(), //주소
          cate_code: $('#bcate').html(), //카테고리
          quality: $('#b_quality').html(), // 상품질
          ascrow: rsp.ascrow, // 에스크로우 여부
          buyer_name: rsp.buyer_name,
          card_name: rsp.card_name,
          pg_tid: rsp.pg_tid,
          pg_type: rsp.payment,
          title: rsp.name,
          seller: $('#bseller').html(),
          price: $('#bprice').html(),
          pro_num: $('#bpro_num').html(),
          room_id: $('#room_id').html()

        }

      }).done(function (data) {
        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        console.log(data + '...............................................');
        sendToken('결제를 완료하였습니다.', $('#btitle').text(), '구매자');
        road_and_QR()

        if (everythings_fine) {
          road_and_QR()


        } else {
          //[3] 아직 제대로 결제가 되지 않았습니다.
          //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        }
      });
    } else {
      alert("실패");
      // 결제 실패 시 로직,

    }
  });
})
/**결제모듈 끝*/
$(window).bind("beforeunload", function (e) {
  socket.emit('leaveRoom', num, Tname);
});

//결제 명세서 전송버튼을 클릭의 시작
$('#buy').click(function () {
  //Nodejs 서버에 ajax요청을 한다.
  $.ajax({
    type: 'post',
    url: 'http://39.127.7.47:3000/payCheck',
    data: {
      pro_num: $('#bpro_num').text()//상품번호를 전달.
    },
    success: function (result) {
      var tag = $('#pro_data_div').html(); // 체팅방에 박혀있는 상품 정보 테그들    
      //결과 콘솔 출력
      console.log('status( ' + result + ' )');
      //결제가 완료되었다면 결제명세서 전송과정을 중단하고 안내문구 alert
      if (result == 'done') {
        alert('status( ' + result + ') : 결제가 완료되어 결제를 진행 할 수 없습니다.');
        //결제가 아직 진행중이라면 결제명세서 전송과정을 마저 진행한다.  
      } else {
        $('#messages').append($('<li class="even replies">').html('<div style="text-align:right">'+name +'</div><p class="tmsg>'+ tag+'</p>'));//명세서를 채팅방에 뿌려준다.
        $('.messages').scrollTop(99999999);//스크롤 최하단.
        socket.emit('socket_sendAcc', num, Tname, tag);//서버를 통한 결제명세서 메시지를 상대방에게 전송한다.
      }
    }
  })
});
//결제 명세서 전송버튼을 클릭의 끝


// 약속 장소 선정과 관련된 emit 작업들입니다. ↓↓↓↓ 
// 약속장소 잡기 버튼
$('#send_address').click(function () {
  if ($('#set_address').val() == '약속장소 선정') {
    alert('장소를 지정해 주시기 바랍니다.');
    return false;
  }
  alert($('#set_address').val()); // 고른 장소 한번 알려주고
  var address = $('#set_address').val();
  socket.emit('socket_address', num, address, Tname); //서버로 전송한다.
});
// 약속장소 잡기 버튼 끝
// 약속장소 수락
$(document).on("click", ".Ayes", function (event) {
  alert($(event.target).siblings('.addressP').text());
  var addressP = $(event.target).siblings('.addressP').text();
  alert('약속 :' + addressP + '으로 지정되었습니다.');
  $('#set_address').val(addressP);//제안들중 선택 
  socket.emit('addressYes', addressP, num); //서버로 전송한다.
});
// 약속장소 수락 끝
// 약속장소 거절
$(document).on("click", ".Ano", function (event) {// 거절버튼 클릭시
  var addressP = $(event.target).siblings('.addressP').text();
  message_id = $(event.target).val();
  alert('클릭된 거절버튼의 메시지 아이디' + message_id + '입니다');
  alert('약속제안 (' + $(event.target).siblings('.addressP').text() + ')을 거절하셨습니다.');
  socket.emit('addressNo', addressP, num, message_id); //서버로 전송한다.
});
// 약속장소 거절 끝
// 약속 장소 선정과 관련된 emit 작업들입니다. ↑↑↑↑

// 약속 시간 선정과 관련된 emit 작업들입니다. ↓↓↓↓
//약속시간제안메시지 전송
$('#send_date').click(function () {
  if ($('#set_date').val() == '약속시간 선정') {
    alert('날짜를 지정해 주시기 바랍니다.');
    return false;
  }
  alert($('#set_date').val()); // 고른 시간 한번 알려주고
  var date = $('#set_date').val();
  socket.emit('socket_date', num, date, Tname); //서버로 전송한다.
});
//약속시간제안메시지 전송
//약속시간제안메시지 수락
$(document).on("click", ".yes", function (event) {
  alert($(event.target).siblings('.dateP').text());
  var dateP = $(event.target).siblings('.dateP').text();
  alert('약속 :' + dateP + '으로 지정되었습니다.');
  $('#set_date').val(dateP);//제안들중 선택 
  socket.emit('dateYes', dateP, num); //서버로 전송한다.
});
//약속시간제안메시지 수락
//약속시간제안메시지 거절
$(document).on("click", ".no", function (event) {// 거절버튼 클릭시
  var dateP = $(event.target).siblings('.dateP').text();
  message_id = $(event.target).val();
  alert('클릭된 거절버튼의 메시지 아이디' + message_id + '입니다');
  alert('약속일시 제안 (' + $(event.target).siblings('.dateP').text() + ')을 거절하셨습니다.');
  socket.emit('dateNo', dateP, num, message_id); //서버로 전송한다.
});
//약속시간제안메시지 거절
// 약속 시간 선정과 관련된 emit 작업들입니다. ↑↑↑↑

//채팅방 나가기--DB에서 삭제됨.
$('#room_out').click(function () {
  console.log('Room Out // no.' + num + ' room //left user name : ', Tname);
  if (confirm("채팅내역도 함께 삭제됩니다. 정말 나가시겠습니까?")) {
    socket.emit('room_out', num, Tname);
    console.log('회원 ' + Tname + '님이 방나가기 실행을 수락하셨습니다.');
    window.close();
  } else {   //취소
    console.log('회원 ' + Tname + '님이 탈주 취소하셨습니다!');
    return false;
  }
});
//채팅방 나가기--DB에서 삭제됨.

//직플수정 로직.
$(document).on("click", ".Zyes", function (event) {
  var beUpdatePlace = $(event.target).siblings('.beUpdatePlace').text();
  alert('직플레이스 제안 "' + beUpdatePlace + '"를 수락하셨습니다.');
  //$('addr').text(data.addr); 
  //$('#updateZicpleA b').text(data.part_name)
  var road = $($(event.target).siblings('.beUpdatePlace')).data('road');
  var part_name = $($(event.target).siblings('.beUpdatePlace')).data('part_name');
  var jibun = $($(event.target).siblings('.beUpdatePlace')).data('jibun');
  var addressP = part_name + '-' + road + '-' + jibun;
  alert(addressP);
  var message_id = $(event.target).val();
  socket.emit('zicpleYes', addressP, num, message_id); //서버로 전송한다.
});
$(document).on("click", ".Zno", function (event) {// 거절버튼 클릭시
  var beUpdatePlace = $(event.target).siblings('.beUpdatePlace');
  var road = $(beUpdatePlace).data('road');
  var part_name = $(beUpdatePlace).data('part_name');
  var jibun = $(beUpdatePlace).data('jibun');
  var addressP = part_name + '-' + road + '-' + jibun;
  var message_id = $(event.target).val();
  socket.emit('zicpleNo', addressP, num, message_id); //서버로 전송한다.
});
window.addEventListener('message', function(e) {
      
    console.log(e.data); // 
      var data = e.data;
      if(data.map != 'map'){
        return false
      } else{

      
      console.log(data.fullString);
      console.log(data.part_name);
      console.log(data.road);
      console.log(data.jibun);
      alert('roomChat2.ejs Clicked : ' + data.fullString);
      //$('addr').text(data.road); 수락하면 바뀌어야해
      //$('#updateZicpleA b').text(data.part_name)  수락하면 바뀌어야해
      socket.emit('messageZicple', num, name, data)
      $('#myModal').bPopup().close();
    }
});
$('#updateZicpleB').click(function(){
  console.log('직플 업데이트 시작.')
  $('#myModal2').bPopup({
  modalClose: true,
  positionStyle: 'fixed',
  position: [10, 100]
  }, function () {
    $('#zicpleIframe').css('display', 'block');
  });
  
});

/****서버에게 전달하는 emit 모음 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/









//socket 메시지 도착모음
// 결제 완료시 영수증 ========================================================
socket.on('receipt', function (room_id, buyer_name, tag) {
  window.location.reload();
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});
// ========================================================

//서버로부터 채팅메시지가 온다면
socket.on('chat message', (name, msg) => {// 소켓에 신호가 오면 chat message 기능 실행.
  if (name == Tname) {//날아온 메시지의 이름이 세션의 닉네임과 같다면
    //$('#messages').append($('<li class="even">').text(name + '  :  ' + msg));//우측에 위치한다. 내가쓴메시지
    $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
    window.location.reload();
    $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
  }
  else {//아니라면 좌측에 위치한다. 남이쓴메시지
    //$('#messages').append($('<li class="odd">').text(name + '  :  ' + msg));
    $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
    window.location.reload();
    $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
  }
  console.log('chat message' + name + msg);
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});
//서버로부터 채팅메시지가 온다면

//서버로부터 명세서(또는 영수증)이 온다면
socket.on('socket_sendAcc', (num, name, tag) => {
  if (name == $('#nickname').text()) {
    
  } else {
    $('#messages').append($('<li class="odd sent">').html('<div style="text-align:left">'+name +'</div><p class="tmsg>'+ tag+'</p>'));//버튼은 상대방에게만 보인다.
      }
  ref(); // 스크롤 가장아래로 내림(영수증전송시 QR코드 이미지출력을 위해)
});
//서버로부터 명세서(또는 영수증)이 온다면

//서버로부터 주소선정제안 메시지가 온다면
socket.on('socket_address', (num, address, name, message_id) => {// 상대방으로부터 채팅방에 소켓데이트 신호가 온다면 실행.
  var buttonSet = "<button class='Ayes'>수락</button><button class='Ano' value=" + message_id + ">거절</button>";
  if (name == Tname) {
   // $('#messages').append($('<li class="even">').html(name + ' : ' + '<i>상대방에게 장소협의를 제안하셨습니다</i><br><i >' + address + '</i>'));//버튼은 상대방에게만 보인다.
   window.location.reload();
  } else {
   // $('#messages').append($('<li class="odd">').html(name + ' : ' + '장소협의 - ' + name + '님에 의해 약속장소가 선정되었습니다 :<br><i class="addressP">' + address + "</i><br>" + buttonSet));//시스템메시지 약속지정정보를 보낸다.
   window.location.reload();
  }
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});
//서버로부터 주소선정제안 메시지가 온다면

//서버로부터 약속일시제안 메시지가 온다면
socket.on('socket_date', (num, date, name, message_id) => {
  var buttonSet = "<button class='yes'>수락</button><button class='no' value=" + message_id + ">거절</button>";
  if (name == Tname) {
    window.location.reload();
    //$('#messages').append($('<li class="even">').html(name + ' : ' + '<i>상대방에게 시간협의를 제안하셨습니다</i><br><i >' + date + '</i>'));//버튼은 상대방에게만 보인다.
  } else {
    window.location.reload();
    //$('#messages').append($('<li class="odd">').html(name + ' : ' + '시간협의 - ' + name + '님에 의해 약속일정이 선정되었습니다 :<i class="dateP">' + date + "</i><br>" + buttonSet));//시스템메시지 약속지정정보를 보낸다.
  }
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});
//서버로부터 약속일시제안 메시지가 온다면


//서버로부터 새로고침 지시
socket.on('ref', () => {
  window.location.reload();
  $('.messages').scrollTop(99999999); // 스크롤 가장아래로 내림
});
//서버로부터 새로고침 지시

//상대방으로부터 QR코드 전송...? 흠
socket.on('QRsend', (num1, name1, tag1) => {
  alert('이게 alert 된다면 사진찍어서 나한테 카톡메시지 전송 ㄱㄱ');
  if (name1 == name) {
    $('#messages').append($('<li class="even"><div class="qrcode"></div>'));
  } else {
    $('#messages').append($('<li class="odd"><div class="qrcode"></div>'));
  }
  return ref();
});
//이게 올일이 있나

//서버로부터 '상대방이 채팅방DB에서 나감'메시지가 온다면
socket.on('room_out', (num, name) => {// 소켓에 room_out신호가 온다면
  $('.nullmenu').css("display", "none");//상대방이 없다면 사용불가의 메뉴:입력태그, send버튼, 채팅방나가기를 제외한 추가기능들을 안보이게한다.
  $('#messages').append($('<li class="system">').text('System : ' + name + ' 회원님이 방을 탈주하셨습니다.  '));//시스템메시지 상대방이 나갔다고 알려준다.
  $('#status').text = 'out';//방의 상태를 out으로 지정
  window.location.search = '?room_id=' + num + '&talker=out';//url의 queryString도 나갔다고 바꿔준다. 새로고침이 되어도 out값을 가지기에 .nullMenu들이 여전히 안보여진다.
  
});
//서버로부터 '상대방이 채팅방DB에서 나감'메시지가 온다면

//이거 뭐하는건지 모르겠음
//안건드릴거임 ㅎㅎ
am4core.ready(function () {

  // Themes begin
  am4core.useTheme(am4themes_dataviz);
  // Themes end
  // create chart
  var chart = am4core.create("chartdiv", am4charts.GaugeChart);
  chart.innerRadius = am4core.percent(82);

  /**
   * Normal axis
   */

  var axis = chart.xAxes.push(new am4charts.ValueAxis());
  axis.min = 0;
  axis.max = 100;
  axis.strictMinMax = true;
  axis.renderer.radius = am4core.percent(80);
  axis.renderer.inside = true;
  axis.renderer.line.strokeOpacity = 1;
  axis.renderer.ticks.template.strokeOpacity = 1;
  axis.renderer.ticks.template.length = 10;
  axis.renderer.grid.template.disabled = true;
  axis.renderer.labels.template.radius = 40;
  axis.renderer.labels.template.adapter.add("text", function (text) {
    return text + "%";
  })

  /**
   * Axis for ranges
   */

  var colorSet = new am4core.ColorSet();

  var axis2 = chart.xAxes.push(new am4charts.ValueAxis());
  axis2.min = 0;
  axis2.max = 100;
  axis2.renderer.innerRadius = 10
  axis2.strictMinMax = true;
  axis2.renderer.labels.template.disabled = true;
  axis2.renderer.ticks.template.disabled = true;
  axis2.renderer.grid.template.disabled = true;

  var range0 = axis2.axisRanges.create();
  range0.value = 0;
  range0.endValue = 50;
  range0.axisFill.fillOpacity = 1;
  range0.axisFill.fill = colorSet.getIndex(0);

  var range1 = axis2.axisRanges.create();
  range1.value = 50;
  range1.endValue = 100;
  range1.axisFill.fillOpacity = 1;
  range1.axisFill.fill = colorSet.getIndex(2);

  /**
   * Label
   */

  var label = chart.radarContainer.createChild(am4core.Label);
  label.isMeasured = false;
  label.fontSize = 32;
  label.x = am4core.percent(50);
  label.y = am4core.percent(100);
  label.horizontalCenter = "middle";
  label.verticalCenter = "bottom";
  label.text = "50%";


  /**
   * Hand
   */

  var hand = chart.hands.push(new am4charts.ClockHand());
  hand.axis = axis2;
  hand.innerRadius = am4core.percent(20); hand.innerRadius = am4core.percent(20);
  hand.startWidth = 10;
  hand.pin.disabled = true;
  hand.value = 50;

  hand.events.on("propertychanged", function (ev) {
    range0.endValue = ev.target.value;
    range1.value = ev.target.value;
    axis2.invalidate();
  });

  setInterval(() => {
    var value = Math.round(Math.random() * 100);
    label.text = value + "%";
    var animation = new am4core.Animation(hand, {
      property: "value",
      to: value
    }, 1000, am4core.ease.cubicOut).start();
  }, 2000);

}); // end am4core.ready()

$(document).ready(function () {
  
  var me = document.getElementsByClassName('meme')[0].innerHTML;
  var other = document.getElementsByClassName('otherother')[0].innerHTML;

  $('.other').hide();
  $('.me').hide();


  var memberjson = JSON.parse(sessionStorage.getItem('member'));
  console.log(me);
  console.log(other);
  console.log(memberjson.nickname);
  if (memberjson.nickname == me) {
    $('.other').show();
  } else {
    $('.me').show();
  }
  if (memberjson.nickname == other) {
    $('.me').show();
  } else {
    $('.other').show();
  }
});







alert('chat.js 호출성공');
var temp =  {}//세션에 저장된 member JSONObject를 가져온다.
    temp = JSON.parse(sessionStorage.getItem('member'));
let Tname = temp.nickname;
const num= 777;
let socket;
let pro_num;

$.urlParam = function(name){
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  if (results==null){
     return null;
  }
  else{
     return results[1] || 0;
  }
}

$(document).ready(function(){
  //구매자 토큰 정보 불러오기
  var Tseller = $.urlParam('seller');
  var Tbuyer = $.urlParam('buyer');
  var other = '';
  if(Tseller == Tname){
    other = Tbuyer;
  }else if(Tbuyer == Tname){
    other = Tseller;
  }
  console.log("other's Token : " + other);
  $.ajax({
    type : 'post',
    url : 'http://39.127.7.47:3000/api/push/getToken',
    data : { nickname : other  },
    success : function(result){
                console.log(result);
                $('#otherToken').text(result);
    },
    error : function(err){
                console.log(err);
  }
});



  /* $('body').click(function(e){
    if($('iframe')!=e.target && $('iframe').attr("style")=='display: block;'){
      console.log('려차');
      $('#myModal').bPopup().close(); 
      $('#daumIframe').css('display','none'); 
    }  
  }) */
 
  
  $('#set_address').click(function(){
    document.getElementById('daumIframe').src += '';
    
    $('#myModal').bPopup({
      modalClose: true,
      positionStyle:'fixed',
      position: [10, 100]
    },function(){

    
      $('#daumIframe').css('display','block');
      var setInter = setInterval(function() {
          $.ajax({
              url: 'http://39.127.7.47:3000/api/daumJuso/mobile',
              type : 'get',
              success : function(data){
                
                if(data){
                    $('#myModal').bPopup().close();    
                    $('#set_address').val(data);
                    $('#daumIframe').css('display','none');                        
                      
                      clearInterval(setInter);
                    
                  }else {
                      console.log(data + 'ㅎㅎ 안찍혔지?');

                  }
              }, error : function(err){
                  
                  console.log(err);
              }
          });
      },1000);
    });
  });

  var room_id = $.urlParam('room_id');
  var talker = $.urlParam('talker');
  var seller = $.urlParam('seller');
  var buyer = $.urlParam('buyer');
  var pro_num = $.urlParam('pro_num');
  var mobile = $.urlParam('mobile');
  var reqUrl = 'http://39.127.7.47:3000/roomchat?room_id='+room_id+'&talker='+talker+'&seller='+seller+'&buyer='+buyer+'&pro_num='+pro_num+'&mobile='+mobile+'';
  var Pdata = '서버응답이되는지보기위한변수입니다.'
  $.ajax({
    //방번호, 구매자판매자중 하나라도 null이라면 talker=out,판매자,구매자,상품번호,모바일여부(모바일은 서버단에서 메시지목록을 던져주고 PC는 페이지를 넘겨준다.)
    
    url : reqUrl,
    dataType : 'json',
    type : 'get',
    data : {data : Pdata},
    success : function(result) {
      console.log($.urlParam('room_id') + '번 방에 입장한다.');
      console.log(result);
      alert('성공!');
      $('#pro_num').text(result.pro_num);
      $('#buyer').text(result.buyer);
      $('#seller').text(result.seller);
      $('#nickname').text(result.nickname);
      $('#room_id').text(result.roomid);
      $('#status').text(result.rstatus);
      var jprod =  JSON.parse(result.pro_data);
      $('#bseller').text(jprod.seller);
      $('#bbuyer').text(jprod.buyer);
      $('#bpro_num').text(jprod.pro_num);
      $('#btitle').text(jprod.title);
      $('#bcate_name').text(jprod.cate_name);
      $('#bcontent').text(jprod.content);
      $('#bprice').text(jprod.price);
      $('#bp_quality').text(jprod.p_quality);
      $('#bplace_pick').text(jprod.place_pick);
      var subDate;
      var jsonoobj = {};
      var result2 = JSON.parse(result.result);
      console.log(result2);
      for(var i = 0; i < result2.rows.length; i++){
        jsonoobj = {
            tnickname : result2.rows[i][2],
            tmessage : result2.rows[i][4]
        }
        if(jsonoobj.tnickname == Tname){//메시지의 발신자와 입장한 사용자가 동일인이라면
          if(jsonoobj.tmessage.indexOf('시간협의') == 0){
            var end = jsonoobj.tmessage.indexOf('</i><br>');
            var start = jsonoobj.tmessage.indexOf("P'>");
            start = start +3;
            subDate = jsonoobj.tmessage.substring(start,end);
            jsonoobj.tmessage = '<i>상대방에게 시간협의를 제안하셨습니다</i><br><i>'+subDate+'</i>';
          } else if(jsonoobj.tmessage.indexOf('장소협의') == 0){
            var end = jsonoobj.tmessage.indexOf('</i><br>');
            var start = jsonoobj.tmessage.indexOf("P'>");
            start = start +3;
            subDate = jsonoobj.tmessage.substring(start,end);
            console.log(subDate);
            console.log(jsonoobj.tmessage.length);
            jsonoobj.tmessage = '<i>상대방에게 장소협의를 제안하셨습니다</i><br><i>'+subDate+'</i>';
          }
            

          
        }//if(이름비교)
        console.log('jsonoobj : ', jsonoobj.tnickname)
        console.log('nickname : ' , Tname);
        if(jsonoobj.tnickname == Tname){
          //내메시지
          $('#messages').append($('<li class="even">').html(jsonoobj.tnickname +' : '+jsonoobj.tmessage));//버튼은 상대방에게만 보인다.  
          }else { //메시지발신자와 세션의 닉네임이 같지 않다면 --> 상대방메시지
            $('#messages').append($('<li class="odd">').html(jsonoobj.tnickname +' : '+jsonoobj.tmessage));//시스템메시지 약속지정정보를 보낸다.
          }

      }//for()
      $(document).scrollTop($(document).height()); // 스크롤 가장아래로 내림
    },
    error : function(err){
      alert('에러야')
      console.log(err);
      console.log('에러야');
    }
  });

});
$('#plusbtn').on('click', function(){
      $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
 });
var a = function (socket2) {
  socket2 = io.connect('http://39.127.7.47:3000');
  return func_socket(socket2);
}
var func_socket = function(socket2) {
  socket2.emit('phoneIn', num, Tname);
  socket2.emit('joinRoom', num, Tname);
  alert('방금w 에밋을 하셨어요! 숫자'+ num +' 이름'+ Tname);
  return socket2;
}
socket = a(socket);
alert('io after');

//         socket.emit('phoneIn', num, Tname);
socket.on('phoneIn', (num, name) => {
  alert('emit 서버로부터 폰인!');
  console.log(name+'입장!');
});
$('form').submit(() => {// Enter칠때마다 Send 할때마다 실행
    if($('#m').val()==""){
        return false;
    }else{
    socket.emit('chat message', num, Tname, $('#m').val());// 서버로  작성자, 방번호, 메시지를 전달한다.
    //socket.emit('chat message phone', num, Tname, $('#m').val());// 서버로  작성자, 방번호, 메시지를 전달한다.
    $(document).scrollTop($(document).height()); // 스크롤 가장아래로 내림
    var otherToken = $('#otherToken').text();
    if(otherToken != null){
      $.ajax({
        url: "http://39.127.7.47:3000/api/push",
        dataType: 'json',
        type: 'POST',
        data : {data:otherToken, message : $('#m').val()+'', title : $('#btitle').text()+'', sender : Tname},
        success: function () {
            console.log("토큰전송ok");
        }
      });
    }
    $('#m').val('');//입력창 비워주기
    }
    return false;
 //원하는 작업만 마친 후 submit의 동작을 멈춘다. 퉤 시바
});

socket.on('chat message', (name, msg) => {// 소켓에 신호가 오면 chat message 기능 실행.
  if(name == Tname){//날아온 메시지의 이름이 세션의 닉네임과 같다면
    $('#messages').append($('<li class="even">').text(name + '  :  ' +        msg));//우측에 위치한다. 내가쓴메시지
  }
  else{//아니라면 좌측에 위치한다. 남이쓴메시지
    $('#messages').append($('<li class="odd">').text(name + '  :  ' +  msg));
  }
    console.log('chat message' + name + msg);
    $(document).scrollTop($(document).height()); // 스크롤 가장아래로 내림
});
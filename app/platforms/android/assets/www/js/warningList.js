$.urlParam = function (name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  //var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results == null) {
      return null;
    }
    else {
      return results[1] || 0;
    }
  }
 
  console.log($.urlParam('data'));
$(document).ready(function(){
  var sibal = $.urlParam('data');
  
  console.log(sibal);
    $.ajax({
        url: "http://39.127.7.48:8080/app/myPageList/WarningList",
        type: "post",
        data: sibal,
        success: function(data) {
            console.log("123");
            console.log(data.wa_num);
            console.log(data.update_date);
            var str = ('<label id = "wa_num">작성일자 : ' + data.updt_date + '</label>'
            + '<label id = "title" style = "margin-left: 29px;">제목 : ' + data.title + '</label>'
            + '<label id = "content">회원번호 : ' + data.m_num + '</label><br>'
            + '<label id = "create_date">신고내용 : ' + data.content + '</label><br>'
            + '<br>'
            + '<hr>'
            + '<br>'
            + '<br>'
            + '<br>'             
            );
            $('.warning2').append(str);
        
        },
        error: function(err) {
            console.log(err);
            console.log("123");
        }
    });

    $('#replybtn').click(function(){
    var session = JSON.parse(sessionStorage.getItem('member'));
    console.log("session");
    if(!(session.nickname)){
      alert("로그인 해주시기 바랍니다.");
    }else if(session.nickname != 'admin'){
      alert('답변댓글은 관리자만 작성할 수 있습니다.');
    }else if(session.nickname =='admin'){
      var reply = $('#reply').val();
      var wa_num = $('#wa_num').text();
      var replyer = session.nickname;
      var senddata = {reply : reply, replyer : replyer, wa_num : wa_num};
      console.log(senddata);
      $.ajax({
        url: "http://39.127.7.48:8080/app/myPageList/InputReply",
        type: "post",
        data: senddata,
        contentType : "application/json; charset=UTF-8",
        success: function(data){
          console.log(senddata);
        },
        error: function(err){
          console.log(err);
        }
      });
    }
    
  });
});
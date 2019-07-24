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
        url: "http://39.127.7.48:8080/app/myPageList/NoticeList",
        type: "post",
        data: sibal,
        success: function(data) {
            console.log("123");
            console.log(data.no_num);
            var str = ('<label class = "sibal">작성일자 : ' + data.updt_date + '</label>'
            + '<label style = "margin-left: 29px;">제목 : ' + data.title + '</label>'
            + '<label style = "margin-left: 15px;">작성자 : ' + data.admin_id + '</label><br>'
            + '<label>공지내용 : ' + data.content + '</label><br>'
            + '<br>'
            + '<hr>'
            );
            $('.list2').append(str);
        
        },
        error: function(err) {
            console.log(err);
            console.log("123");
        }
    });
});
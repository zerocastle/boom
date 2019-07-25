$(document).ready(function(){
    $.ajax({
        url: "http://39.127.7.47:8080/app/myPageList/NoticeBoard",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        success: function(data) {
            for(var i  = 0; i < data.length; i++) {
            var str = ('<table class = "sibal"><tr><th><a href = "noticelist.html?data='+data[i].no_num+'">' + data[i].title + '</a></th><br>'
            + '</tr>'
            + '</table>'
            + '<hr>'
            );
            $('.list').append(str);
        }
        },
        error: function(err) {
            console.log(err);
        }
    });
});
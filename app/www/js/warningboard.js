$(document).ready(function(){
    $.ajax({
        url: "http://39.127.7.47:8080/app/myPageList/WarningBoard",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        success: function(data) {
            for(var i  = 0; i < data.length; i++) {
                var str = ('<table class = "warning"><tr><th><a href = "warninglist.html?data=' + data[i].wa_num +'">' + data[i].title + '</a></th><br>'
                // + '<th>' + data[i].title + '</th>'
                + '</tr>'
                + '</table>'
                + '<hr>'
                );
                $('.warningboard').append(str);
            }
        },
        error: function(err) {
            console.log(err);
        }
    });
});

$(document).ready(function(){
    $('#inputbtn').click(function(){
        window.location.href = "inputwarning.html";
    })
});
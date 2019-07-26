$(document).ready(function(){
    var session = JSON.parse(sessionStorage.getItem('member'));
    console.log(session);
    $('#m_num').val(session.m_num);
    $('#inpbtn').click(function(e) {
        // var data = {
        //     warning : $('#warning').val(),
        //     title : $('#title').val(),
        //     content : $('#content').val(),
        //     }
        // $.ajax({
        //     url: "http://15.164.188.135:8080/app/myPageList/InputWarning",
        //     type: "post",
        //     data: data,
        //     contentType: "application/json; charset=UTF-8",
        //     success: function(data){
        //         window.location.href = "warninglist.html"
        //     },
        //     error: function(err){
        //         console.log(err);
        //     }
        // });

    //     var form = $('#warningform').serialize();
    //     console.log(form);
    //     $.ajax({
    //             url: "http://15.164.188.135:8080//warningBoard/register2",
    //             type: "post",
    //             data: form,
    //             success: function(){
    //                 window.location.href = "warninglist.html"
    //             },
    //             error: function(err){
    //                 console.log(err);
    //             }
    //         });

    // action= "http://15.164.188.135:8080//warningBoard/register2"
document.getElementById('warningform').action = "http://15.164.188.135:8080//warningBoard/register2";
    $('#warningform').submit();

        
        window.location.href = "warningboard.html";
     });

});
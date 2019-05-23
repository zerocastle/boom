$(document).ready(function() {
    $('#logout').click(function(){
        sessionStorage.removeItem("member");
        window.location.href="index.html";
    });
});
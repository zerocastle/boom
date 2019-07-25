// $('.back').click(function() {
//     window.location.href="login.html";
// });
$(document).ready(function(){
    $('.my-user').on('click',function(){
        if(sessionStorage.member){
            window.location.href="mypage.html";
        }else{
            window.location.href="login.html";
        }
    });
});
$(document).ready(function(){
    $('.pro-category').on('click',function(){
        window.location.href="kategorie.html";
    });
});
$(document).ready(function(){
    $('.pro-home').on('click',function(){
        window.location.href="index.html";
    })
})
$(document).ready(function(){
    $('.pro-plus').on('click',function(){
        window.location.href="index3.html";
    })
})
$(document).ready(function(){
    $('.pro-chat').on('click',function(){
        window.location.href="chatList.html";
    })
})
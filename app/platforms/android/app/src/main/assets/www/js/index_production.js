/*ys 인덱스 상품 뿌리기 작업*/
$(document).ready(function () {
    $('.my-user').on('click', function () {
        if (sessionStorage.member) {
            window.location.href = "mypage.html";
        } else {
            window.location.href = "login.html";
        }
    });
    var order = "desc"; var cate_code = "man";

    function getProduction(callbackFun) {

        $.get('http://39.127.7.50:8080/app/production/list/' + order + '/' + cate_code, function (response) {
            callbackFun(response);
        });
    }

    // 작업 들어가기
    getProduction(function (data) {
        console.log(data);
        for(var i = 0; i < data.length; i++){
            $('.pro').append('<div class="content-wrap"><div class="imgess">'
            +'<img class="pro-img" src="http://39.127.7.50:8080/resources/'+data[i].uploadPath+'/s_'+data[i].uuid+'_'+data[i].fileName+' " width="90px;" height="85px;"/>'
            +'</div>'
            //다른 개행
            +'<div class="img-name">'
            +'<p>'+data[i].title+'</p>'
            +'<p class="addr-name">'+data[i].addr+'</p>'
            +'<p class="pro-price">'+data[i].price+ '</p>'
            +'<input class="pro_num" type="hidden" value="'+data[i].pro_num+'" />'
            +'</div></div>'
            );
        }   
        $(".content-wrap").on("click",function(e){
            var pro_num = $(this).children('.img-name').children('.pro_num').val();
                window.location.href="productview.html?value="+pro_num;
        });
    })
});









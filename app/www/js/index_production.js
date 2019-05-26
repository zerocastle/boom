/*ys 인덱스 상품 뿌리기 작업*/
$(document).ready(function () {
    $('.my-user').on('click', function () {
        if (sessionStorage.member) {
            window.location.href = "mypage.html";
        } else {
            window.location.href = "login.html";
        }
    });
    // var order = "desc"; var cate_code = "man";

    var cate_code = $('.category').val();
    var order = $('.order').val();

    // 기본 전체보기 가격순 불러오기
    function getProduction(callbackFun) {
        $.get('http://39.127.7.51:8080/app/production/list/' + order + '/' + cate_code, function (response) {
            callbackFun(response);
        });
    }
    // 상품정보 콜백 들고오기
    getProduction(function (data) {
        console.log(data);
        for (var i = 0; i < data.length; i++) {
            $('.pro').append('<div class="content-wrap"><div class="imgess">'
                + '<img class="pro-img" src="http://39.127.7.51:8080/resources/' + data[i].uploadPath + '/s_' + data[i].uuid + '_' + data[i].fileName + ' " width="90px;" height="85px;"/>'
                + '</div>'
                //다른 개행
                + '<div class="img-name">'
                + '<p>' + data[i].title + '</p>'
                + '<p class="addr-name">' + data[i].addr + '</p>'
                + '<p class="pro-price">' + data[i].price + '</p>'
                + '<input class="pro_num" type="hidden" value="' + data[i].pro_num + '" />'
                + '</div></div>'
            );
        }
        $(".content-wrap").on("click", function (e) {
            var pro_num = $(this).children('.img-name').children('.pro_num').val();
            window.location.href = "productview.html?value=" + pro_num;
        });
    })


    // 상품 카테고리 변경
    $('.category').change(function () {
        // 상품을 들고오기 위한 ajax
        $('.pro').empty();
        var cate_code = $('.category').val();
        var order = $('.order').val();
        function getProduction(callbackFun) {
            $.get('http://39.127.7.51:8080/app/production/list/' + order + '/' + cate_code, function (response) {
                callbackFun(response);
            });
        }
        // 상품정보 콜백 들고오기
        getProduction(function (data) {
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                $('.pro').append('<div class="content-wrap"><div class="imgess">'
                    + '<img class="pro-img" src="http://39.127.7.51:8080/resources/' + data[i].uploadPath + '/s_' + data[i].uuid + '_' + data[i].fileName + ' " width="90px;" height="85px;"/>'
                    + '</div>'
                    //다른 개행
                    + '<div class="img-name">'
                    + '<p>' + data[i].title + '</p>'
                    + '<p class="addr-name">' + data[i].addr + '</p>'
                    + '<p class="pro-price">' + data[i].price + '</p>'
                    + '<input class="pro_num" type="hidden" value="' + data[i].pro_num + '" />'
                    + '</div></div>'
                );
            }
            $(".content-wrap").on("click", function (e) {
                var pro_num = $(this).children('.img-name').children('.pro_num').val();
                window.location.href = "productview.html?value=" + pro_num;
            });
        })
    })

    // 상품 가격순
    $('#filed2').change(function () {
        $('#pro').empty();
        var cate_code = $('.category').val();
        var order = $('#filed2').val();
        console.log(order + '순');
        function getProduction(callbackFun) {
            $.get('http://39.127.7.51:8080/app/production/list/' + order + '/' + cate_code, function (response) {
                callbackFun(response);
            });
        }
        // 상품정보 콜백 들고오기
        getProduction(function (data) {
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                $('.pro').append('<div class="content-wrap"><div class="imgess">'
                    + '<img class="pro-img" src="http://39.127.7.51:8080/resources/' + data[i].uploadPath + '/s_' + data[i].uuid + '_' + data[i].fileName + ' " width="90px;" height="85px;"/>'
                    + '</div>'
                    //다른 개행
                    + '<div class="img-name">'
                    + '<p>' + data[i].title + '</p>'
                    + '<p class="addr-name">' + data[i].addr + '</p>'
                    + '<p class="pro-price">' + data[i].price + '</p>'
                    + '<input class="pro_num" type="hidden" value="' + data[i].pro_num + '" />'
                    + '</div></div>'
                );
            }
            $(".content-wrap").on("click", function (e) {
                var pro_num = $(this).children('.img-name').children('.pro_num').val();
                window.location.href = "productview.html?value=" + pro_num;
            });
        })
    })


    // 상품 보기
    $('.imgess').click(function (e) {
        alert("눌러지니?");
        var pro_num = $('.content-wrap input').val();
        console.log(pro_num);

        $.ajax({
            type: 'get',
            url: 'http://39.127.7.51:8080/app/view/' + pro_num,
            success: function (data) {
                console.log("상품 넘어와라잇");
            }
        })
    })

    // 검색 기능 
    


});

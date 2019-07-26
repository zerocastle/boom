$(function () {

    var a;

    function getQueryStringObject() {
        var a = window.location.search.substr(1).split('&');
        if (a == "") return {};
        var b = {};
        for (var i = 0; i < a.length; ++i) {
            var p = a[i].split('=', 2);
            if (p.length == 1)
                b[p[0]] = "";
            else
                b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
        }
        return b;
    }

    var qs = getQueryStringObject();
    var value = qs.value;

    //바껴랑
    var change = function (cate_code) {
        var input_cate;
        switch (cate_code) {

            case "man":
                input_cate = "남성의류";
                break;
            case "woman":
                input_cate = "여성의류" ;
                break;
            case "elect":
                input_cate = "전자제품";
                break;
            case "furniture":
                input_cate = "가구/인테리어";
                break;
            case "baby":
                input_cate = "유아용품";
                break;
            case "sport":
                input_cate = "스포츠/레저";
                break;
            case "hobby":
                input_cate = "게임/취미";
                break;
            case "beauty":
                input_cate = "뷰티/미용";
                break;
            case "life":
                input_cate = "생활/가공품";
                break;
            case "animal":
                input_cate = "반려/동물";
                break;
            case "book":
                input_cate = "도서/티켓/음반";
                break;
            case "else":
                input_cate = "기타/잡화";
                break;

        }
        return input_cate;
    }
      
    //   current_datetime = new Date()
    //     formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate() + " " + current_datetime.getHours() + "-" + current_datetime.getMinutes() + "-" + current_datetime.getSeconds() 
      
      
    //    console.log(formatted_date);

   











    

    $.ajax({
        type: 'get',
<<<<<<< Updated upstream
        url: 'http://39.127.7.51:8080/app/production/view/' + value,
=======
        url: 'http://15.164.188.135:8080/app/production/view/' + value,
>>>>>>> Stashed changes
        success: function (data) {
            console.log(data);
            $('.pro_nink').append(data[0].ProMemberJoinDTO.nickname);
            $('.info_addr').append(data[0].ProMemberJoinDTO.addr);
            $('.kind').append(data[0].ProMemberJoinDTO.p_quality);
            $('.cate').append(change(data[0].ProMemberJoinDTO.cate_code));
            $('.fo_price').append(data[0].ProMemberJoinDTO.price + '원');
            $('.htitle').append(data[0].ProMemberJoinDTO.title);
            $('.contents').append(data[0].ProMemberJoinDTO.content);
            $('.foo').append(data[0].ProMemberJoinDTO.manner);
<<<<<<< Updated upstream
            // $(".profile_img").attr('bakcground','http://39.127.7.51:8080/resources/'+data[0].ProMemberJoinDTO.uploadPath.replace(/\\/g, '/')+'/'+data[0].ProMemberJoinDTO.uuid+'_'+data[0].ProMemberJoinDTO.fileName);   
            $(".profile_img").css({"background-image" : "url('http://39.127.7.51:8080/resources/"+data[0].ProMemberJoinDTO.uploadPath.replace(/\\/g,'/')+"/"+data[0].ProMemberJoinDTO.uuid+"_"+data[0].ProMemberJoinDTO.fileName+"')"});
=======
            // $(".profile_img").attr('bakcground','http://15.164.188.135:8080/resources/'+data[0].ProMemberJoinDTO.uploadPath.replace(/\\/g, '/')+'/'+data[0].ProMemberJoinDTO.uuid+'_'+data[0].ProMemberJoinDTO.fileName);   
            $(".profile_img").css({"background-image" : "url('http://15.164.188.135:8080/resources/"+data[0].ProMemberJoinDTO.uploadPath.replace(/\\/g,'/')+"/"+data[0].ProMemberJoinDTO.uuid+"_"+data[0].ProMemberJoinDTO.fileName+"')"});
>>>>>>> Stashed changes
            $(".profile_img").css({"background-position" : "center center"});
            $(".profile_img").css({"object-fit" : "cover"});
            $(".profile_img").css({"object-position" : "top"});
            $(".profile_img").css({"background-size" : "100% 100%"});
            if (data[0].Production_uploadVO[0]) {
<<<<<<< Updated upstream
                $('.img1').attr("src", "http://39.127.7.51:8080/resources/" + data[0].Production_uploadVO[0].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[0].uuid + '_' + data[0].Production_uploadVO[0].fileName);
            }

            if (data[0].Production_uploadVO[1]) {
                $('.img2').attr("src", "http://39.127.7.51:8080/resources/" + data[0].Production_uploadVO[1].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[1].uuid + '_' + data[0].Production_uploadVO[1].fileName);
=======
                $('.img1').attr("src", "http://15.164.188.135:8080/resources/" + data[0].Production_uploadVO[0].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[0].uuid + '_' + data[0].Production_uploadVO[0].fileName);
            }

            if (data[0].Production_uploadVO[1]) {
                $('.img2').attr("src", "http://15.164.188.135:8080/resources/" + data[0].Production_uploadVO[1].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[1].uuid + '_' + data[0].Production_uploadVO[1].fileName);
>>>>>>> Stashed changes
            } else {
                $('.img2').attr("src", "img/noimg.png")
            }

            if (data[0].Production_uploadVO[2]) {
<<<<<<< Updated upstream
                $('.img3').attr("src", "http://39.127.7.51:8080/resources/" + data[0].Production_uploadVO[2].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[2].uuid + '_' + data[0].Production_uploadVO[2].fileName);
=======
                $('.img3').attr("src", "http://15.164.188.135:8080/resources/" + data[0].Production_uploadVO[2].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[2].uuid + '_' + data[0].Production_uploadVO[2].fileName);
>>>>>>> Stashed changes
            } else {
                $('.img3').attr("src", "img/noimg.png")
            }

            if (data[0].Production_uploadVO[3]) {
<<<<<<< Updated upstream
                $('.img4').attr("src", "http://39.127.7.51:8080/resources/" + data[0].Production_uploadVO[3].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[3].uuid + '_' + data[0].Production_uploadVO[3].fileName);
=======
                $('.img4').attr("src", "http://15.164.188.135:8080/resources/" + data[0].Production_uploadVO[3].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[3].uuid + '_' + data[0].Production_uploadVO[3].fileName);
>>>>>>> Stashed changes
            } else {
                $('.img4').attr("src", "img/noimg.png")
            }

            if (data[0].Production_uploadVO[4]) {
<<<<<<< Updated upstream
                $('.img5').attr("src", "http://39.127.7.51:8080/resources/" + data[0].Production_uploadVO[4].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[4].uuid + '_' + data[0].Production_uploadVO[4].fileName);
=======
                $('.img5').attr("src", "http://15.164.188.135:8080/resources/" + data[0].Production_uploadVO[4].uploadPath.replace(/\\/g, '/') + '/' + data[0].Production_uploadVO[4].uuid + '_' + data[0].Production_uploadVO[4].fileName);
>>>>>>> Stashed changes
            } else {
                $('.img5').attr("src", "img/noimg.png")
            }

 

            $('.jik_na').append(data[0].ProMemberJoinDTO.place_pick);


            $('.pro_time').append(prettyDate(data[0].ProMemberJoinDTO.create_date));
            
            $('#hidePnum').append(data[0].ProMemberJoinDTO.pro_num);
            $('#hideMnum').append(data[0].ProMemberJoinDTO.m_num);
            
            if (data[0].ProMemberJoinDTO.place_pick == "") {
              $('.pro_deal > div').append("직거래");
            } else
            $('.pro_deal > div').append("직플거래");





            $('.pro_nink').click(function (e) {
                e.preventDefault();
                var name = data[0].ProMemberJoinDTO.nickname;
                window.location.href = "other.html?name=" + name;
            });
            // session get 
            var member = JSON.parse(sessionStorage.getItem('member'));

            var like = {
                m_num: member.m_num,
                pro_num: data[0].ProMemberJoinDTO.pro_num
            };

            $.ajax({
                type: 'post',
<<<<<<< Updated upstream
                url: 'http://39.127.7.51:8080/app/myPageList/getPickCount',
=======
                url: 'http://15.164.188.135:8080/app/myPageList/getPickCount',
>>>>>>> Stashed changes
                data: JSON.stringify(like),
                contentType: "application/json; charset=UTF-8",
                success: function (data) {
                    console.log(data);
                    // count 0 일때 빈하트 , 1 일때 꽉찬 하트
                    if (data == 0) {
                        $('.fa-heart').attr('class', 'far fa-heart');
                    } else {
                        $('.fa-heart').attr('class', 'fas fa-heart');
                    }

                    $('.fa-heart').click(function () {
                        if (sessionStorage.length == 0) {
                            alert('로그인이 필요합니다.');
                        } else if (member.m_num == $('#hideMnum').text()) {
                            alert('해당상품은 해당이용자의 상품으로 찜목록에 등록이 불가능합니다.');
                        } else {

                            $(this).toggleClass('far fas');
                            console.log($(this).hasClass('far'));
                            console.log($(this).hasClass('fas'));

                            if ($(this).hasClass('far') == true) {
                                $.ajax({
                                    type: 'post',
<<<<<<< Updated upstream
                                    url: "http://39.127.7.51:8080/app/myPageList/deletePick",
=======
                                    url: "http://15.164.188.135:8080/app/myPageList/deletePick",
>>>>>>> Stashed changes
                                    data: JSON.stringify(like),
                                    contentType: "application/json; charset=UTF-8",
                                    success: function (data) {
                                        if (member.m_num == $('#hideMnum').text()) {
                                            alert('해당상품은 해당이용자의 상품으로 찜목록에 등록이 불가능합니다.');
                                        } else {
                                            alert('해당상품을 찜목록에서 제외하셨습니다.');
                                        }
                                    },
                                    error: function (error) {
                                        alert(error);
                                    }
                                });
                            }

                            if ($(this).hasClass('fas') == true) {
                                $.ajax({
                                    type: 'post',
<<<<<<< Updated upstream
                                    url: "http://39.127.7.51:8080/app/myPageList/insertPick",
=======
                                    url: "http://15.164.188.135:8080/app/myPageList/insertPick",
>>>>>>> Stashed changes
                                    data: JSON.stringify(like),
                                    contentType: "application/json; charset=UTF-8",
                                    success: function (data) {
                                        if (member.m_num == $('#hideMnum').text()) {
                                            alert('해당상품은 해당이용자의 상품으로 찜목록에 등록이 불가능합니다.');
                                        } else {
                                            alert('해당상품을 찜목록에 추가했습니다.');
                                        }
                                    },
                                    error: function (error) {
                                        alert(error);
                                    }
                                });
                            }
                        }
                    });
                },
                error: function (error) {

                }
            });

        }
    });

})


 var prettyDate =  function(create_date){
        
    var date = create_date.split('-');
    var year = date[0];
    var month = date[1]-1;
    var day = date[2];
    var hour = date[3];
    var minute = date[4];
    var d = new Date(year, month, day, hour, minute);
    
    console.log(date);
    console.log(year);
    console.log(month);
    console.log(day);
    console.log(hour);
    console.log(minute);
    console.log(d);

    var now = new Date();
    var mTime = d.getTime();

    console.log(now);

    var diff = ((now.getTime()- mTime ) / 1000);
    console.log(diff);

    // diff = diff - 33000;
  
        if(diff < 0) diff = 0;
      
        day_diff = Math.floor(diff / 86400);
      
        
      
        if ( isNaN(day_diff) || day_diff < 0 )
      
         return;
      
         console.log(day_diff);
         console.log(diff);
      
        return day_diff == 0 && (
      
          diff < 60 && "방금전" ||
      
          diff < 120 && "1분전" ||
      
          diff < 3600 && Math.floor( diff / 60 ) + "분전" ||
      
          diff < 7200 && "1 시간전" ||
      
          diff < 86400 && Math.floor( diff / 3600 ) + "시간전") ||
      
         day_diff == 1 && "어제" ||
      
         day_diff < 7 && day_diff + "일전" ||
      
         day_diff < 31 && Math.floor( day_diff / 7 ) + " 주전" ||
      
         day_diff < 360 && Math.floor( day_diff / 30 ) + " 개월 전" ||
      
         day_diff >= 360 && (Math.floor( day_diff / 360 )==0?1:Math.floor( day_diff / 360 )) + " 년전"
      

}



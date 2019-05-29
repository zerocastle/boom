var a;

function getQueryStringObject() {
          var a = window.location.search.substr(1).split('&');
                if (a == "") return { };
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
         
         $.ajax({
            type: 'get',
            url: 'http://39.127.7.50:8080/app/production/view/'+ value, 
            success: function (data) {
                console.log(data);
                $('.pro_nink').append(data[0].ProMemberJoinDTO.nickname);
                $('.info_addr').append(data[0].ProMemberJoinDTO.addr);
                $('.kind').append(data[0].ProMemberJoinDTO.p_quality);
                $('.cate').append(data[0].ProMemberJoinDTO.cate_code);
                $('.fo_price').append(data[0].ProMemberJoinDTO.price+'원');
                $('.htitle').append(data[0].ProMemberJoinDTO.title);
                $('.contents').append(data[0].ProMemberJoinDTO.content);
                $('.foo').append(data[0].ProMemberJoinDTO.manner);
                $('.img1').attr("src","http://39.127.7.50:8080/resources/"+data[0].Production_uploadVO[0].uploadPath.replace(/\\/g,'/') + '/s_' +data[0].Production_uploadVO[0].uuid + '_' + data[0].Production_uploadVO[0].fileName);
                $('.jik_na').append(data[0].ProMemberJoinDTO.place_pick);
                $('#hidePnum').append(data[0].ProMemberJoinDTO.pro_num);

                // session get 
                var member = JSON.parse(sessionStorage.getItem('member'));
                console.log(member.m_num);
                console.log(data[0].ProMemberJoinDTO.pro_num);
                var like = {
                    m_num : member.m_num,
                    pro_num : data[0].ProMemberJoinDTO.pro_num
                };
        
                $.ajax({
                    type : 'post',
                    url : 'http://39.127.7.50:8080/app/myPageList/getPickCount',
                    data : JSON.stringify(like),
                    contentType : "application/json; charset=UTF-8",
                    success : function(data){
                        console.log(data);
                        // count 0 일때 빈하트 , 1 일때 꽉찬 하트
                        if(data == 0){
                            $('.fa-heart').attr('class','far fa-heart');
                        }else{
                            $('.fa-heart').attr('class','fas fa-heart');
                        }
        
                        $('.fa-heart').click(function(){
                            if(sessionStorage.length == 0){
                                alert('로그인이 필요합니다.');
                            }else{
            
                            $(this).toggleClass('far fas');
                            console.log($(this).hasClass('far'));
                            console.log($(this).hasClass('fas'));
            
                                 if($(this).hasClass('far') == true){
                                     $.ajax({
                                         type : 'post',
                                         url : "http://39.127.7.50:8080/app/myPageList/deletePick",
                                         data : JSON.stringify(like),
                                         contentType : "application/json; charset=UTF-8",
                                         success : function(data){
                                            alert('해당상품을 찜목록에서 제외하셨습니다.');
                                         },
                                         error : function(error){
                                            alert(error);
                                         }
                                     });
                                 }
            
                                 if($(this).hasClass('fas') == true){
                                    $.ajax({
                                         type : 'post',
                                         url : "http://39.127.7.50:8080/app/myPageList/insertPick",
                                         data : JSON.stringify(like),
                                         contentType : "application/json; charset=UTF-8",
                                         success : function(data){
                                            alert('해당상품을 찜목록에 추가했습니다.');
                                         },
                                         error : function(error){
                                            alert(error);
                                         }
                                     });
                                 }
                            }
                        });
                    },
                    error : function(error){
        
                    }
                });
        
            }
        });
        
       
       
     
      
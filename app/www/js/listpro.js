$.urlParam = function (name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results == null) {
      return null;
    }
    else {
      return results[1] || 0;
    }
}

$(document).ready(function () {
    // 작업 들어가기
   /* getProduction(function (data) {
     console.log(data);
     for(var i = 0; i < data.length; i++){
         $('.pro').append('<div class="imgess">'
         +'<img class="pro-img" src="http://15.164.188.135:8080/resources/'+data[i].uploadPath+'/s_'+data[i].uuid+'_'+data[i].fileName+' " width="90px;" height="85px;"/>'
         +'</div>'
         //다른 개행
         +'<div class="img-name">'
         +'<p>'+data[i].title+'</p>'
         +'<p class="addr-name">'+data[i].addr+'</p>'
         +'<p class="pro-price">'+data[i].price+ '</p>'
         +'<input class="pro_num" type="hidden" value="'+data[i].pro_num+'" />'
         +'</div>'
         );
     }
     
 })*/
 
   var url = $.urlParam('cate');
   var place_signal;
   console.log(url);
   $.ajax({
     url: "http://15.164.188.135/app/production/list/asc/" + url,
     type: "GET",
     contentType: "application/json; charset=UTF-8",
     success: function (result) {
      
       console.log(result);
      
       for(var i = 0; i < result.length; i++){
        if (result[i].place_signal == 1) {
          place_signal =  "<div class='badge badge-success'>직플거래</div>";
      } else {
          place_signal =  "<div class='badge badge-warning'>직거래</div>";
      }
         /*'<img class="pro-img" src="http://15.164.188.135:8080/resources/'+data[i].uploadPath+'/s_'+data[i].uuid+'_'+data[i].fileName+' " width="90px;" height="85px;"/>'*/
  
         $('.pro').append('<div class="content-wrap"><div class="imgess">'
         +'<img  class="pro-img" src="http://15.164.188.135/resources/'+result[i].uploadPath+'/s_'+result[i].uuid+'_'+result[i].fileName+' " width="90px;" height="85px;"></div>'
         //다른 개행
         + '<div class="img-name">'
         + '<p>' +  result[i].title+ + '</p>'
         + '<p class="addr-name">' +  result[i].addr+ '</p>'
         + '<div class="p-price"><p class="pro-price">' +   comma(result[i].price) +  '원</p></div>'
         +  place_signal 
         + '<input class="pro_num" type="hidden" value="' +  result[i].pro_num + '" />'
         +'<div class="chat-numbering">'+
         '<i class="far fa-comments"></i>'+
         '<span style = "font-size:17px;">1</span>'+
         '</div>'+
         '<div class="heart-numbering">'+
         '<i class="far fa-heart"></i>'+
         '<span style = "font-size:17px;">1</span>'+
          '</div>'
         + '</div>'
     );
 }
 $(".content-wrap").on("click", function (e) {
     var pro_num = $(this).children('.img-name').children('.badge').next().val();
     window.location.href = "productview.html?value=" + pro_num;
 });
     }
});

  

  //        var tag = 
  //        '<div class="pro2" > <div class="imgess"><img  class="pro-img" src="http://15.164.188.135/resources/'+result[i].uploadPath+'/s_'+result[i].uuid+'_'+result[i].fileName+' " width="90px;" height="85px;"></div>'+
  //        '<div class="img-name" >'+
  //            '<p class="pro-title">'+
  //            result[i].title+
  //            '</p>'+
  //            '<p class="addr-name">'+
  //                result[i].addr+
  //            '</p>'+
  //            '<p class="pro-price">'+
  //                comma(result[i].price) + 
  //            '</p>'+
  //            '<input class="pro_num" type="hidden" value="' + result[i].pro_num +'" />' +
  //             +
  //             '</div><img class="pick" src="' + place_signal + '" /></div>' +
  //        '</div>'+    
  //    '</div></div>';
  //    $('#list').append('<div class="items">' + tag);
  //      }
  //      $('.pro2').on("click", function (e){
  //         var pro_num = $(this).children('.img-name').children('.pro_num').val();
  //         window.location.href = "productview.html?value=" + pro_num;
  //      });
  //    }
  //  });



//    $('.pro2').click(function(){
//      var pro_num = $(this).children('.img-name').children('.pro_num').val();
//      window.location.href = "productview.html?value=" + pro_num;
//   });
 



 function comma(num) {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
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
   });
 });
 $(document).ready(function(){
   $('.pro-plus').on('click',function(){
       window.location.href="index2.html";
   });
 });
 $(document).ready(function(){
    $('.pro-chat').on('click',function(){
        window.location.href="chatList.html";
    });
});
});

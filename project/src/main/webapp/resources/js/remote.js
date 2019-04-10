 $(document).ready(function() {
  
  // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
  var floatPosition = parseInt($("#floatMenu").css('top'));
  // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
  
  $(window).scroll(function() {
    // 현재 스크롤 위치를 가져온다.
    var scrollTop = $(window).scrollTop();
    var newPosition = scrollTop + floatPosition + "px";
  
     $("#floatMenu").css('top', newPosition);
     
  
    $("#floatMenu").stop().animate({
      "top" : newPosition
    }, 500);
  
  }).scroll();
  
  });


//색깔변경
$(function(){
  $("#jimclick").click(function(){$(".fa-heart").css("color","red")})
  $("#jimclick").click(function(){$(".num").css("color","red")})

})


//숫자올라감
  $(function(){ 
  $('#jimclick').click(function(){ 
    var n = $('#jimclick').index(this);
    var num = $(".num:eq("+n+")").val();
    num = $(".num:eq("+n+")").val(num*1+1); 
  });
});


function goTop(){
	$('html').scrollTop(0);
	
}

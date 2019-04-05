window.onload=function() {
 document.getElementById("h").onclick=processText;
}

function processText() {
 var txtBox = document.getElementById("c");
 var lines = txtBox.value.split("\n");

 // generate HTML version of text
 var resultString  = "<p>";
 for (var i = 0; i < lines.length; i++) {
   resultString += lines[i] + "<br />";
 }
 resultString += "</p>";

 // print out to page
 var   blk   = document.getElementById("n");
 blk.innerHTML  =  resultString; 
}


// 숨기는
$('#bb').click(function () {
   $('.mm').show(400);
   $('.Show').hide(0);
   $('.hi').show(0);
});
$('.hi').click(function () {
   $('.mm').hide(400);
   $('.bsu').show(0);
   $('.hi').hide(0);
});

$(function () {
    $('#content').keyup(function (e) {
       var content = $(this).val();
       // $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
       $('#counter').html(content.length + '/100');
    });
    $('#content').keyup();
 });

$(function () {
    var jack = 2525;
    function startFoo() {
       var opts = {
          angle: 0.15, // The span of the gauge arc
          lineWidth: 0.44, // The line thickness
          radiusScale: 1, // Relative radius
          pointer: {
             length: 0.51, // // Relative to gauge radius
             strokeWidth: 0.077, // The thickness
             color: '#000000' // Fill color
          },
          limitMax: false,     // If false, max value increases automatically if value > maxValue
          limitMin: false,     // If true, the min value of the gauge will be fixed
          colorStart: '#f70000',   // Colors
          colorStop: '#f70000',    // just experiment with them
          strokeColor: '#E0E0E0',  // to see which ones work best for you
          generateGradient: true,
          highDpiSupport: true,     // High resolution support

       };
       var target = document.getElementById('foo'); // your canvas element
       var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
       gauge.maxValue = 3000; // set max gauge value
       gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
       gauge.animationSpeed = 49; // set animation speed (32 is default value)
       gauge.set(jack); // set actual value
    }
    startFoo();


    $('#zero').click(function () {
       startFoo();

    });


 });

//별점주기
$( ".star_rating a" ).click(function() {
   $(this).parent().children("a").removeClass("on");
   $(this).addClass("on").prevAll("a").addClass("on");
   return false;
});

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
$('.bsu').click(function () {
   $('.mm').show(400);
   $('.Show').hide(0);
   $('.hi').show(0);
});
$('.hi').click(function () {
   $('.mm').hide(400);
   $('.bsu').show(0);
   $('.hi').hide(0);
});

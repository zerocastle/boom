function setCookiePlus(cName, cValue, imgUrl, cDay){
    cookieMaker(cName, cookieValueBaker("recentView", cValue, ";", 5), cDay);
}

// 머리가 안굴러 갑니다..... 아아..
function slider(step) {
    previewBlinder(numberSetter(step));
}

// ------------------------------------------------------------------------------------------------------- *
// -------------------------------------- JAVASCRIPT FACTORY LAND ---------------------------------------- *
// ------------------------------------------------------------------------------------------------------- *
/*
 * 작업 함수
 */

//쿠키를 파싱하여, 쿠키에 새로 설장할 값(cValue)과 비교하여 유니크 배열을 만든후 쿠키에 설정할 값으로 재작성한다.
function cookieValueBaker(cookieName, cValue, delimiter, maxCount) {
    console.log(cValue);
	var cookieValue  = getCookiePlus(cookieName);
    //유니크 배열을 만든다.
    if (cookieValue) {
        var cookieArray = cookieValue.split(delimiter);
        let uniqCookieArray = [];
        
        while(cookieArray.length != 0) {
            var obj = cookieArray.shift(); //앞에서 부터 가져온다.
            if (obj != cValue) uniqCookieArray.push(obj); //중복이 아니면 유니크배열에 담는다.
        }
        
        uniqCookieArray.unshift(cValue); //맨 앞에 이번 값을 담는다.
        uniqCookieArray.splice(maxCount, uniqCookieArray.length); //쿠키에 설정할 갯수를 maxCount로.
        cValue = uniqCookieArray.join(delimiter);
    }
    return cValue;
}

//쿠키를 생성한다.
function cookieMaker(cName, cValue, cDay) {
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

// 쿠키 가져오기
function getCookiePlus(cName) {
    cName = cName + '=';        
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1) end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}





// 미리보기 표시숫자 제어
function numberSetter(step) {
    var now = document.getElementById("now").innerHTML;
    var total = document.getElementById("total").innerHTML;
    if ((now == 1 && step == -1) || (now == total && step == 1)) {return;}
    var resultNumber = now*1 + step;
    document.getElementById("now").innerHTML = resultNumber;
    return resultNumber;
}

//미리보기 조건에 맞춰 슬라이드를 숨긴다.
function previewBlinder(resultNumber) {
    var recentViews = document.querySelectorAll("#recentView div");
    
/*    for (var i = 0; i < resultNumber; i++) { //3,6,9
        recentViews[i].style.display = 'none';
    }*/
    
    //i = 0,3,6
    for (var i = 0; i < (resultNumber); i++) {
        recentViews[i].style.display = 'block';
    }
}

//미리보기용 HTML을 만든다.
function makePreviewHTML(cookieValue) {
    //쿠키를 배열로 만든다.
    var cookieArray = cookieValue.split(";");
    
    var cnt = cookieArray.length;
    
    //미리보기 HTML을 만든다.
    var newPreviewHTML = "";
    
    for (var i=0; i < cnt ; i++) {
        var obj = cookieArray[i]; //앞에서 부터 가져온다.
        var IdAndUrl = obj.split(",");
        
        newPreviewHTML = newPreviewHTML + 
                        '<a href="#"><div class="recentDiv"><img src="'+ IdAndUrl[1] +'" width="70px;" height="70px;" class="recentImg" alt="'+ IdAndUrl[0] +'"></div></a>';
    }
    
    // 3개가 안되면 빈자리를 채울 HTML을 붙인다.
//         if ((cnt%3) != 0) {
//         var emptyPreviewHTML  = '<div class="emptyPreView"><img src="http://via.placeholder.com/50x50"></div>';
//         for (var i = (cnt%3); i < 3; i++) {
//             newPreviewHTML = newPreviewHTML + emptyPreviewHTML;
//         }
//     }
    return newPreviewHTML;
}

//페이지 로딩될때 마다 쿠키 값을 파싱한다. 보고있는 당시에 해당 화면에서 붙여줘도 큰 효과는 없고 공수는 많다.
function loadPreview() {
    
    //쿠키 가져온다.
    var cookieValue = getCookiePlus("recentView");
    var cookieArray = cookieValue.split(";");
    var cnt = cookieArray.length;
    
    //쿠키가 없으면 나간다.
    if (!cookieValue) return;

    //HTML을 만들어 붙인다.
  document.querySelector("#recentView").innerHTML = makePreviewHTML(cookieValue);
    
/*    //미리보기 갯수를 써준다.
    document.getElementById("total").innerHTML = (cnt < 6) ? 1 : (cnt < 12) ? 2 : 3;
    console.log(cnt);*/
}

loadPreview();


$(document).ready(function(){
	$('.recentDiv .recentImg').on('click',function(e){
		e.preventDefault();
		window.location.href = "/production/index_productView?pro_num="+$(this).attr('alt');
	});
});
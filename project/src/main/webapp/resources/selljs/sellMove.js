/**
 * sellpage 옮기기 
 */

$(function(){
	
	// 판매상품 관리
	$('#sellProductManager').click(function(e){
		e.preventDefault();
		window.location.href="sell_productManage";
	})
	//채팅목록
	$('#chatList').click(function(e){
		e.preventDefault();
		window.location.href="chatList"
	})
	
	//구매내역
	$('#purchaseList').click(function(e){
		e.preventDefault();
		window.location.href="purchaseList";
	})
	
	//판매내역
	$('#sellList').click(function(e){
		e.preventDefault();
		window.location.href="sellList";
	})
	
	//나의 직플레이스 정보 회원이 직플레이스가 아니라면 가입 하게 만드는 스크립트 작성
	/*
	 * 작업하기
	 *
	 */
	
	//탈퇴하기
	
	$('#memberOut').click(function(e){
		e.preventDefault();
		window.location.href="memberOut";
	})
	
	
	
	
})
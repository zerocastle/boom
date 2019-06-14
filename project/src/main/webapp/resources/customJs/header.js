$(function() {

		var msg = '${requestScope.msg}';
		var loginDO = '${requestScope.loginDo}';
		if (msg == 'SUCCESS') {
			alert("회원 가입을 성공적으로 하였습니다.");
			self.close();
		}
		if (msg == 'SUCCESSPARTNER') {
			alert("직플레이드 등록이 완료되었습니다.");
			history.replaceState({}, null, null);
			window.close();
		}
		if (loginDO == '1') {
			alert("잘못된 접근 입니다. 로그인부터 하세요");
		}

		//마지막 스크롤 값을 저장할 lastScroll 변수
		var lastScroll = 0;
		$(window).scroll(function(event) { //스크롤이 움직일때 마다 이벤트 실행
			//현재 스크롤의 위치를 저장할 st 변수
			var st = $(this).scrollTop();
			//스크롤 상하에 따른 반응 정의
			if (st > lastScroll) {
				if ($(window).scrollTop() >= 10) { //스크롤이 아래로 200px 이상 내려갔을때 실행되는 이벤트 정의
					$('#btnTop').css('display', 'none');
					$('#btnTop').css('top', '-30px');
				}
			} else {
				//스크롤이 위로 올라갔을때 실행되는 이벤트 정의
				$('#btnTop').css('display', 'block');
			}
		});
		// 회원 
		$('#register').click(
				function() {
					window.open('/member/memberRegister', 'register',
							'width=1920,height=1080');
				})
		//로그아웃
		$('#logout').click(function(e) {
			e.preventDefault();
			window.location.href = "/member/logout"
		})
		
		$('.logout').click(function(e) {
			e.preventDefault();
			window.location.href = "/member/logout"
		})
		
		//마이페이지 제어
		var temp = null;
		$('#myPage').click(function(e) {
			temp = '<c:out value="${sessionScope.loginSession}"/>'
			if (temp) {
				e.preventDefault();
				window.location.href = "/member/myPage/" + $(".sessionNick").text();
			} else {
				alert("로그인 부터 하셔야 합니다.");
				window.open('/member/login', 'login', 'width=600,height=600');
			}
		})
		// 판매하기 제어
		$("#sell").click(function(e) {
			temp = '<c:out value="${sessionScope.loginSession}"/>';
			if (temp) {
				e.preventDefault();
				window.location.href = "/selling/selling";
			} else {
				alert("로그인 부터 하셔야 합니다.");
				window.open('/member/login', 'login', 'width=600,height=600');
			}
		})

		// 체팅 목록 제어
		$('#chat').click(
				function(e) {
					temp = '<c:out value="${sessionScope.loginSession}"/>';
					if (temp) {
						e.preventDefault();
						window.open('/chatting/chatting', 'chatList',
								'width=400,height=600,scrollbars=no');
					} else {
						alert("로그인 부터 하셔야 합니다.");
						window.open('/member/login', 'login',
								'width=600,height=600');
					}
				})

		$('#productList').click(function(e) {
			e.preventDefault();
			window.location.href = "/index_productList";
		});
		
		/*공지사항*/
		$('#noticeBoard').click(function(e) {
			e.preventDefault();
			window.location.href = "/admin/noticeBoard";

		})

		//직플레이스 검색
		$('#placeSearch').click(function(e) {
			e.preventDefault();
			window.location.href = "/partner/placeSearch"
		})
		
		$('#placeSearch2').click(function(e) {
			e.preventDefault();
			window.location.href = "/partner/placeSearch"
		})

		$('#warningBoard').click(function(e) {
			e.preventDefault();
			window.location.href = "/warningBoard/warningBoard"
		})
		
		// 검색 누르기
		$(".input-group-text").click(function(){
			
			var choose = $('.choose').val();
			var keyword = $('.form-control').val();
			window.location.href="/search?type="+choose+"&keyword="+keyword;
		})

	});
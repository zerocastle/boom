<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Footer -->
<div class="footer">
	<div style="text-align: center;">
		<h6 class="bold">Download The App</h6>
		<a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img
					src="https://mimity-fashion56.netlify.com/img/app/google-play.svg"
					alt="Google Play Logo" height="30">
				<div class="media-body">
					<small>Get it on</small>
					<h5>Google Play</h5>
				</div>
			</div>
		</a> <a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img src="https://mimity-fashion56.netlify.com/img/app/apple.svg"
					alt="Apple Logo" height="30">
				<div class="media-body">
					<small>Download on the</small>
					<h5>App Store</h5>
				</div>
			</div>
		</a> <a href="javascript:void(0)" class="download-app">
			<div class="media">
				<img src="https://mimity-fashion56.netlify.com/img/app/windows.svg"
					alt="Windows Logo" height="30">
				<div class="media-body">
					<small>Get it from</small>
					<h5>Microsoft Store</h5>
				</div>
			</div>
		</a>
	</div>
</div>
<div class="copyright">Copyright © 2019 직거래 플러스</div>
<!-- /Footer -->

<!--Menu Modal -->
<div class="modal modal-left modal-menu" id="menuModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header shadow">
				<a class="h5 mb-0 d-flex align-items-center" href="#"> <img
					src="https://mimity-fashion56.netlify.com/img/logo.svg"  alt="Mimity" class="mr-3"> <strong>직거래PLUS</strong>
				</a>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body shadow">
				<ul class="menu" id="menu">
					<li class="no-sub mm-active"><a href="/"><i data-feather="home"></i> Home</a></li>
					<li><a href="#" class="has-arrow"><i data-feather="shopping-bag"></i>카테고리</a>
						<ul>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=man&order=asc">남성의류</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=woman&order=asc">여성의류</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=elect&order=asc">전자제품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=furniture&order=asc">가구/인테리어</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=baby&order=asc">유아용품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=sport&order=asc">스포츠/레저</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=hobby&order=asc">게임/취미</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=beauty&order=asc">뷰티/미용</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=life&order=asc">생활/가공품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=animal&order=asc">반려동물용품</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=book&order=asc">도서/티켓/음반</a></li>
							<li><a class="dropdown-item" href="/production/index_productList?cate_code=else&order=asc">기타/잡화</a></li>
						</ul>
					</li>
					<li><a href="#" class="has-arrow"><i data-feather="rss"></i>직플레이스</a>
						<ul>
							<c:if test="${not empty sessionScope.loginSession }">
				             <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalPartnerRegister">직플파트너 등록</a><li>
				            </c:if> 
							<li><a id="placeSearch2" class="dropdown-item" href="#">직플레이스 찾기</a></li>
							<li><a class="dropdown-item" href="#">함께하는 직플파트너</a></li>
						</ul></li>
					<li class="no-sub"><a href="/admin/noticeBoard" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12" y2="16"></line></svg>공지사항</a></li>
					<li class="no-sub"><a href="/warningBoard/warningBoard" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12" y2="17"></line></svg>신고게시판</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- /Menu Modal -->

<script src="/resources/plugins/swiper.min.js"></script>
<script src="/resources/plugins/bootstrap.bundle.min.js"></script>
<script src="/resources/plugins/jquery.countdown.min.js"></script>
<script src="/resources/plugins/metisMenu.min.js"></script>
<script src="/resources/plugins/feather.min.js"></script>
<script src="/resources/plugins/noty.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar.min.js"></script>
<script src="/resources/js/script.min.js"></script>
<!-- <script src="/resources/customJs/recentProduct.js"></script> -->

<script>
	$(function() {

		App.atcDemo() // Add to Cart Demo
		App.atwDemo() // Add to Wishlist Demo
		App.homeSlider('#home-slider')
		App.dealsSlider('#deals-slider')
		App.colorOption()

		// example countdown, 6 hours from now for flash deals
		var countdown = new Date()
		countdown.setHours(countdown.getHours() + 6)
		$('#flash-deals-countdown').countdown(countdown, function(event) {
			$(this).text(event.strftime('%H:%M:%S'))
		})

	})
</script>


<!-- Modal -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Login Form -->
				<div class="col-md-6 col-login">
					<form id="login-form" >
						<div class="form-group text-center mb-2">
							<h2 class="bold mb-0 login-title">로그인</h2>
						</div>

						<div class="form-group">
							<span class="input-icon"> <i data-feather="mail"></i> <input
								id="nickname" name="nickname" type="text" class="form-control"
								placeholder="닉네임 입력" required />
							</span>
						</div>
						<div class="form-group">
							<span class="input-icon"> <i data-feather="lock"></i> <input
								id="m_password" name="m_password" type="password"
								class="form-control" placeholder="비밀번호 입력" required />
							</span>
						</div>
						<div class="form-group d-flex justify-content-between">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="loginRemember"> <label class="custom-control-label"
									for="loginRemember">Remember me</label>
							</div>
							<u><a href="#" class="text-primary small reset">Forgot
									password ?</a></u>
						</div>
						<button type="submit" id="login-btn"
							class="btn btn-primary btn-block" value="login">로그인</button>
						<button type="button" class="btn btn-primary btn-block"
							data-dismiss="modal" data-toggle="modal"
							data-target="#modalRegister">회원가입</button>
					</form>
				</div>
				<!-- /Login Form -->
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalRegister" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Login Form -->
				<div class="col-md-6 col-login">
				
					<form id="form2" class="form-style-1" action="/member/memberRegister" method="post" enctype="multipart/form-data">
						<div class="form-group text-center mb-2">
							<h2 class="bold mb-0 login-title">회원가입</h2>
						</div>
						<div class="form-group">
								<!-- 이미지 업로드=========================================== -->
								<input type='file' id="imgInp2" name="uploadFile"
									class="form-control" style="width: 200px; margin: auto;" /> <img
									id="foo2" class="form-control"
									src="/resources/image/no_image.png" alt="사진을 선택"
									style="width: 200px; height: 200px; margin: auto;" />
								<!-- 이미지 업로드=========================================== -->
							</div>
						<div class="form-group">
							<span class="input-icon">
								<div class="nickLine" style="display: inline-block;">
									<input type="text" id="reg-nick" name="nickname"
										class="form-control" placeholder="닉네임 입력"
										style="width: 317.4px; padding-left: 1.75rem">
								</div>
								<div class="checkLine" style="display: inline-block;">
									<button class="myButton form-control" id="reg-nickCkeck"
										style="width: 100px;">중복확인</button>
								</div>
							</span>
							<div class="hideRegNick">닉네임을 입력해주세요</div>
							<div class="hideRegNickCheck">이미 존재하는 닉네임입니다.</div>
						</div>
						<div class="form-group">
							<span class="input-icon"> <input type="number"
								id="reg-phone" name="phone" class="form-control"
								placeholder="휴대폰번호 입력">
							</span>
							<div class="hideRegPhone">휴대폰 번호를 입력해주세요</div>
						</div>
						<div class="form-group">
							<span class="input-icon"> <i data-feather="lock"></i> <input
								type="password" id="reg-pwd" name="m_password" class="form-control"
								placeholder="비밀번호 입력">
							</span>
						</div>
						<div class="form-group">
							<span class="input-icon"> <i data-feather="lock"></i> <input
								type="password" id="reg-pwd_ck" name="m_password_ck"
								class="form-control" placeholder="비밀번호 재 입력">
							</span>
						</div>
						<div class="alert alert-success" id="alert-success">비밀번호가
							일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다.</div>
						<div class="form-group">
							<span class="input-icon"> <input type="email"
								id="reg-email" name="email" class="form-control"
								placeholder="이메일 입력">
							</span>
							<div class="hideRegEmail">이메일을 입력해주세요</div>
						</div>
						<div class="form-group">
							<span class="input-icon ">
								<div class="select">
									<select class="form-control dropdown__select"
										style="width: 150px;" id="reg-acc_name" name="acc_name">
										<option value="" selected>은행 선택</option>
										<option value="NH농협">NH농협</option>
										<option value="KB국민">KB국민은행</option>
										<option value="신한">신한은행</option>
										<option value="우리">우리은행</option>
										<option value="하나">KEB하나은행</option>
										<option value="IBK기업">IBK기업은행</option>
										<option value="외환">외환은행</option>
										<option value="SC제일">SC제일은행</option>
										<option value="씨티">씨티은행</option>
										<option value="KDB산업">KDB산업은행</option>
										<option value="새마을">새마을금고</option>
										<option value="대구">대구은행</option>
										<option value="광주">광주은행</option>
										<option value="우체국">우체국</option>
										<option value="신협">신협중앙회</option>
										<option value="전북">전북은행</option>
										<option value="경남">경남은행</option>
										<option value="부산">부산은행</option>
										<option value="수협">수협중앙회</option>
										<option value="제주">제주은행</option>
										<option value="저축은행">상호저축은행</option>
										<option value="산림조합">산림조합중앙회</option>
										<option value="케이뱅크">케이뱅크</option>
										<option value="카카오뱅크">카카오뱅크</option>
									</select>
								</div>
								<div class="reg-acc">
									<input style="width: 267px;" type="number" id="reg-acc_num"
										name="acc_num" class="form-control" placeholder="계좌번호 입력">
								</div>

							</span>
							<div class="hideRegAcc">은행 , 계좌번호를 입력해주세요</div>
						</div>
						<input type="submit" id="reg-submit"
							class="btn btn-primary btn-block" value="가입하기">
					</form>
				</div>
				<!-- /Login Form -->
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalPartnerRegister" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Login Form -->
				<form role="form" id="form" action="/partner/partnerRegister"
					method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="col-md-6 col-login">
							<div class="form-group text-center mb-2">
								<h2 class="bold mb-0 login-title">직플레이스 등록</h2>
							</div>
							<div class="form-group">
								<!-- 이미지 업로드=========================================== -->
								<input type='file' id="imgInp" name="uploadFile"
									class="form-control" style="width: 200px; margin: auto;" /> <img
									id="foo" class="form-control"
									src="/resources/image/no_image.png" alt="사진을 선택"
									style="width: 200px; height: 200px; margin: auto;" />
								<!-- 이미지 업로드=========================================== -->
							</div>
							<div class="form-group">
								<span class="input-icon"> <input type="text"
									id="part_name" name="part_name" class="form-control"
									placeholder="점포명을 정확히 입력해주세요" required
									style="padding-left: 1.75rem">
								</span>
								<div class="hideRegPartName">직플레이스 점포명을 입력하세요</div>
							</div>
							<div class="form-group">
								<span class="input-icon"> <input type="number"
									id="company_number" name="company_number" class="form-control"
									placeholder="사업자등록번호-10자리의 숫자" maxlength="10" required>
								</span>
								<div class="hideCompany_number">사업자 등록번호를 입력하세요</div>
							</div>
							<div class="form-group">
								<span class="input-icon"> <i data-feather="lock"></i> <input
									type="text" id="boss_name" name="boss_name"
									class="form-control" placeholder="대표자 성명을 입력해주세요" required>
								</span>
								<div class="hidePartBoss">대표자명을 입력하세요</div>
							</div>
							<div class="form-group">
								<span class="input-icon"> <i data-feather="lock"></i> <input
									type="number" id="part_phone" name="part_phone"
									class="form-control" maxlength="11"
									placeholder="휴대폰번호를 입력해주세요(숫자만 허용)">
								</span>
								<div class="hidePartPhone">가게 번호를 입력하세요</div>
							</div>

							<div class="form-group">
								<div style="display: inline-block; vertical-align: middle;">
									<span class="input-icon"> <input type="text"
										id="zip_code" name="zip_code" class="form-control"
										placeholder="우편번호를 입력해주세요" required style="width: 300px;">
									</span>
									<div class="hidePartZip">주소를 선택하세요</div>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<input type="button" class="adrs form-control"
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
										style="width: 117px;">
								</div>
								<div class="form-group">
									<span class="input-icon"> <input type="text"
										id="road_name" name="road_name" class="form-control"
										placeholder="도로명주소를 선택해주세요" required> <input
										type="text" id="addr" name="addr" class="form-control"
										placeholder="지번주소" required> <input type="text"
										id="detail_addr" name="detail_addr" class="form-control"
										placeholder="상세주소">
									</span> <input type="hidden" id="lag" name="lag" /> <input
										type="hidden" id="lng" name="lng" />
								</div>
								<input type="submit" class="btn btn-primary btn-block"
									id="partner" value="등록하기" />
							</div>
							<!-- /Login Form -->
						</div>
					</fieldset>
				</form>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {

			function readURL(input) {
				if (input.files && input.files[0]) {
					// 파일이면서 파일에 영번지
					var reader = new FileReader(); // 파일 읽어 들이는 reader 변수선언
					reader.onload = function(e) {
						console.log(e.target.result);
						$('#foo').attr('src', e.target.result); //파일에 대한 변수가 
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#imgInp").change(function() {
				readURL(this); // 변화될떄 현제 url 정보를 들고옴  
				console.log(this);
			});

			$('#partner').click(function(e) {
				e.preventDefault();
				/* $('#form')[0].on('submit', function() {
					window.alert('보내줌??');
				}) */
				alert('파트너 등록하셨습니다.');
				$('#form')[0].submit(function(callback){
					window.alert(callback);
				})

			})

		})
	</script>
	
	<script type="text/javascript">
		$(function() {

			function readURL(input) {
				if (input.files && input.files[0]) {
					// 파일이면서 파일에 영번지
					var reader = new FileReader(); // 파일 읽어 들이는 reader 변수선언
					reader.onload = function(e) {
						console.log(e.target.result);
						$('#foo2').attr('src', e.target.result); //파일에 대한 변수가 
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#imgInp2").change(function() {
				readURL(this); // 변화될떄 현제 url 정보를 들고옴  
				console.log(this);
			});

			$('#reg-nickCkeck').click(function(){
				var data = {
					nickname : $('#reg-nick').val()
				};
				
				if ($('#reg-nick').val() == '') {
					alert('공백은 허용 되지 않습니다.');
					$('#reg-nick').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/member/nickNameCheck',
					data : JSON.stringify(data),
					contentType : "application/json;charset=UTF-8",
					success : function(data){
						console.log(data);
						if (data == 0) {
							$('#reg-nickCkeck').html('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>확인완료');
						} else {
							$('#reg-nickCkeck').html("중복확인");
							$('.hideRegNickCheck').css('display','block');
						}
					},
					error : function(error){
						console.log(error);
					}
				});
			});
			
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#reg-pwd").val();
				var pwd2 = $("#reg-pwd_ck").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
						passwordComfirm = true;
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
						passwordComfirm = false;
					}
				}
			});
			
			$('#reg-submit').click(function(e) {
				e.preventDefault();
				/* $('#form')[0].on('submit', function() {
					window.alert('보내줌??');
				}) */
				if($('#reg-nick').val() == ""){
					$('.hideRegNick').css('display','block');
					
					return false;
				}
				
				if($('#reg-phone').val() == ""){
					$('.hideRegPhone').css('display','block');
					
					return false;
				}
				
				if($('#reg-pwd').val() == ""){
					return false;
				}
				
				if($('#reg-email').val() == ""){
					$('.hideRegEmail').css('display','block');
					
					return false;
				}
				
				if($("#reg-acc_num").val() == "" || $("#reg-acc_name").val() == ""){
					$('hideRegAcc').css('display','block');
					
					return false;
				}
				
				alert('회원가입 성공');
				$('#form2')[0].submit(function(callback){
					window.alert(callback);
				})

			})

		})
	</script>
	<script src="/resources/customJs/partner.js"></script>
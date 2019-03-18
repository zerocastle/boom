<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 다빈 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/da.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/solid.css"
	integrity="sha384-r/k8YTFqmlOaqRkZuSiE9trsrDXkh07mRaoGBMoDcmA58OHILZPsk29i2BsFng1B"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/regular.css"
	integrity="sha384-IG162Tfx2WTn//TRUi9ahZHsz47lNKzYOp0b6Vv8qltVlPkub2yj9TVwzNck6GEF"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/brands.css"
	integrity="sha384-BKw0P+CQz9xmby+uplDwp82Py8x1xtYPK3ORn/ZSoe6Dk3ETP59WCDnX+fI1XCKK"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/fontawesome.css"
	integrity="sha384-4aon80D8rXCGx9ayDt85LbyUHeMWd3UiBaWliBlJ53yzm9hqN21A+o1pqoyK04h+"
	crossorigin="anonymous">

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>

<body>
	<div class="main-product container">

		<div class="main">
			<h4>회원가입</h4>
			<div>
				<form action="#">
					<fieldset>
						<!-- <button class="myButton">인증번호 요청</button> -->


						<div>
							<label for="phone"></label><input type="text" id="phone"
								name="firstname" placeholder="휴대폰번호*숫자만허용"> <span
								id="Msgph" class="none">aa</span> <span class="mobile"> <i
								class="fas fa-mobile-alt"></i>
							</span>


						</div>


						<div>
							<label for="phone1"></label> <input type="text" id="phone1"
								name="firstname" placeholder="인증번호 확인"> <span
								id="Msgph1" class="none">aa</span> <span class="mobile2">
								<i class="fas fa-mobile-alt"></i>
							</span>
						</div>



						<div>
							<label for="pwd"></label> <input type="password" id="pwd"
								name="lastname" placeholder="8~16자의 영문,숫자,특수문자 사용"
								onblur="ck_pwd()"> <span class="lock"> <i
								class="fas fa-lock"></i>
							</span>

						</div>
						<div>
							<label for="pwd_ck"></label> <input type="password" id="pwd_ck"
								name="lastname" placeholder="비밀번호 확인" onblur="ck_pwd2()">
							<span class="lock2"> <i class="fas fa-lock"></i>
							</span>
						</div>

						<div>
							<label for="email"></label> <input type="email" id="email"
								name="firstname" placeholder="이메일 (비밀번호 분실시 사용)"
								onblur="ck_email()"> <span class="email"> <i
								class="fas fa-envelope"></i>
							</span>
						</div>



						<div>
							<label for="name"></label> <input type="text" id="name"
								name="lastname" placeholder="닉네임" onblur="ck_name()"> <span
								class="user"> <i class="fas fa-user"></i>
							</span>


							<div class="num">
								<input type="text" class="form-control" id="bankAccountNo"
									name="bankAccountNo" placeholder="계좌번호 입력" required="required">
								<span class="num1"> <i class="fas fa-money-check"></i>
								</span>
							</div>
						</div>
						<div class="select">
							<select class="dropdown__select" id="bankName" name="bankName">
								<option value="" hidden selected>은행 선택</option>
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
					</fieldset>
				</form>
			</div>
			<div class="alert alert-success" id="alert-success">비밀번호가
				일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
				않습니다.</div>
		</div>
	</div>



	<form id="form1">
		<div class="all_agree">
			<p>
				<label> <input type="checkbox" id="all" name="all" />
					전체약관동의<br />
				</label>
			</p>

			<p>
				<label> &nbsp;&nbsp;<input type="checkbox" id="c1" name="c1" />
					직거래플러스 이용약관 동의 (필수)<br />
				</label>
			</p>
			<p>
				<label> &nbsp;&nbsp;<input type="checkbox" id="c2" name="c2" />
					개인정보 처리방침 동의 (필수)<br />
				</label>
			</p>
			<p>
				<label> &nbsp;&nbsp;<input type="checkbox" id="c3" name="c3" />
					위치기반 서비스 동의 (선택)<br />
				</label>
			</p>
			<p>
				<label> &nbsp;&nbsp;<input type="checkbox" id="c4" name="c4" />
					이메일, SMS광고 수신 동의 (선택)<br />
				</label>
			</p>
		</div>
	</form>
	<input type="submit" value="가입하기">

	<script>
		//이용약관 동의
		var doc = document;
		var form1 = doc.getElementById('form1');
		var inputs = form1.getElementsByTagName('INPUT');
		var form1_data = {
			"c1" : false,
			"c2" : false,
			"c3" : false
		};
		var c1 = doc.getElementById('c1');
		var c2 = doc.getElementById('c2');
		var c3 = doc.getElementById('c3');
		function checkboxListener() {
			form1_data[this.name] = this.checked;
			if (this.checked) {
				// submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분. 
				this.parentNode.style.color = "#000";
			}
		}
		c1.onclick = c2.onclick = c3.onclick = checkboxListener;
		var all = doc.getElementById('all');
		all.onclick = function() {
			if (this.checked) {
				setCheckbox(form1_data, true);
			} else {
				setCheckbox(form1_data, false);
			}
		};
		function setCheckbox(obj, state) {
			for ( var x in obj) {
				obj[x] = state;
				for (var i = 0; i < inputs.length; i++) {
					if (inputs[i].type == "checkbox") {
						inputs[i].checked = state;
					}
				}
			}
		}
		//비밀번호 체크
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pwd").val();
				var pwd2 = $("#pwd_ck").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});
		});
	</script>

</body>
</html>
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
	<div class="container">

		<div class="main">
			<h4>회원가입</h4>
			<div>
				<form role="form" method="post">
					<fieldset>
						<!-- <button class="myButton">인증번호 요청</button> -->

						<button class="myButton" id="nicknameCkeck">중복확인</button>

						<div>
							<label for="name"></label> <input type="text" id="nickname"
								name="nickname" placeholder="닉네임"> <span class="user">
								<i class="fas fa-user"></i>
							</span>




							<div>
								<label for="phone"></label><input type="text" id="phone"
									name="phone" placeholder="휴대폰번호*숫자만허용"> <span
									id="Msgph" class="none">aa</span> <span class="mobile">
									<i class="fas fa-mobile-alt"></i>
								</span>


							</div>

							<div>
								<label for="pwd"></label> <input type="password" id="pwd"
									name="m_password" placeholder="비밀번호"> <span
									class="lock"> <i class="fas fa-lock"></i>
								</span>

							</div>
							<div>
								<label for="pwd_ck"></label> <input type="password" id="pwd_ck"
									placeholder="비밀번호 확인"> <span class="lock2"> <i
									class="fas fa-lock"></i>
								</span>
							</div>

							<div>
								<label for="email"></label> <input type="email" id="email"
									name="email" placeholder="이메일 ( ex@codepen.com)"> <span
									class="email"> <i class="fas fa-envelope"></i>
								</span>
							</div>
							<div class="num">
								<input type="text" class="form-control" id="bankAccountNo"
									name="acc_num" placeholder="계좌번호 입력" required="required">
								<span class="num1"> <i class="fas fa-money-check"></i>
								</span>
							</div>
						</div>
						<div class="select">
							<select class="dropdown__select" id="bankName" name="acc_name">
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

	<!--  약관동의-->
	<form id="form1">
		<div class="all_agree">
			<p>
				<label></label> <input type="checkbox" id="all" name="all" />
				전체약관동의<br />
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
	<input type="submit" value="가입하기" id="submit" />
	
	<!-- 회원 가입에 대한 스크립트 제어 및 submit 정의한 js -->
	<script src="/resources/js/memberRegister.js"></script>

</body>
</html>
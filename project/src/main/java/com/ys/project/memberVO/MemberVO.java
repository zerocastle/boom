package com.ys.project.memberVO;

public class MemberVO {

	private String nickname;
	private String phone;
	private String m_password;
	private String email;
	private int manner;
	private String intro;
	private int warning;
	private String img_path;
	private int partner_signal;
	private String acc_num;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getManner() {
		return manner;
	}

	public void setManner(int manner) {
		this.manner = manner;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getWarning() {
		return warning;
	}

	public void setWarning(int warning) {
		this.warning = warning;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public int getPartner_signal() {
		return partner_signal;
	}

	public void setPartner_signal(int partner_signal) {
		this.partner_signal = partner_signal;
	}

	public String getAcc_num() {
		return acc_num;
	}

	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}

	@Override
	public String toString() {
		return "MemberVO [nickname=" + nickname + ", phone=" + phone + ", m_password=" + m_password + ", email=" + email
				+ ", manner=" + manner + ", intro=" + intro + ", warning=" + warning + ", img_path=" + img_path
				+ ", partner_signal=" + partner_signal + ", acc_num=" + acc_num + "]";
	}

}

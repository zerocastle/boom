package com.ys.project.memberVO;

import lombok.Data;

@Data
public class Partner {

	private String company_number;
	private String part_name;
	private String boss_name;
	private String part_phone;
	private String img_path; // 썸네일
	private String img_path2;
	private String img_path3;
	private String img_path4;
	private String zip_code; // 우편번호
	private String road_name; // 도로명 주소
	private String addr; // 지번 주소
	private String detail_addr; // 상세 주소
	private java.util.Date reg_date;
	private String lag; // 위도
	private String lng; // 경도
	private int m_num; // 포린키
}

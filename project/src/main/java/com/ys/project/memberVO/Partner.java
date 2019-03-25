package com.ys.project.memberVO;

import java.sql.Date;

import lombok.Data;

@Data
public class Partner {

	private String company_number;
	private String part_name;
	private String boss_name;
	private String part_phone;
	private String address;
	private String img_path; // 썸네일 사진
	private String img_path2;
	private String img_path3;
	private String img_path4;
	private Date p_start;
	private Date p_end;
	private int mNum; // 포린키 

}

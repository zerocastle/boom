package com.ys.project.projectDTO;


import lombok.Data;
import oracle.sql.TIMESTAMP;

@Data
public class ProMemberJoinDTO {

	private int pro_num;
	private String title;
	private int price;
	private String content;
	private String create_date;
	private String addr;
	private String place_pick;
	private String p_quality;
	private String state_msg;
	private String cate_code;
	private int m_num; 
	private String nickname;
	private String phone;
	private int manner;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String intro;

}

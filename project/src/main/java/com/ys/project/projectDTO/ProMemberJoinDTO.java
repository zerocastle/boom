package com.ys.project.projectDTO;

import com.sun.jmx.snmp.Timestamp;

import lombok.Data;

@Data
public class ProMemberJoinDTO {

	private int pro_num;
	private String title;
	private int price;
	private String content;
	private Timestamp create_date;
	private String addr;
	private String place_pick;
	private String p_qality;
	private String state_msg;
	private String cate_code;
	private int m_num;
	private String nickname;
	private String phone;
	private int manner;
	private String img_path;
	private String filename;

}

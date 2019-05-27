package com.ys.project.projectVO;

import java.util.Date;

import lombok.Data;

@Data
public class joinReviewVO {
	private int pr_num;
	private int m_num;
	private int starpoint;
	private String reply;
	private String replyer;
	private Date create_date;
	private String nickname;
	private String email;
	private int manner;
	private String img_path;
	
}

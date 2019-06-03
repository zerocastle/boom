package com.ys.project.projectVO;

import java.util.Date;

import lombok.Data;

@Data
public class joinPickVO extends Page2VO {
	private String nickname;
	private int m_num;
	private int pro_num;
	private String title;
	private int price;
	private String addr;
	private String uuid;
	private String uploadpath;
	private String filename;
	private Date create_date;
	private String content;
	private int rep;
}

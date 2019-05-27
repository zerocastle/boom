package com.ys.project.projectVO;

import java.util.Date;

import lombok.Data;

@Data
public class joinProductVO {
	private int m_num;
	private int pro_num;
	private String title;
	private int price;
	private String content;
	private String place_pick;
	private int chat_room_count;
	private String p_quality;
	private int place_signal;
	private String state_msg;
	private String cate_code;
	private String addr;
	private String uuid;
	private String uploadpath;
	private String filename;
	private Date create_date;
	private int rep;
}

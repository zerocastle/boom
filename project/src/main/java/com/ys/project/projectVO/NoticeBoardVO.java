package com.ys.project.projectVO;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {

	private long no_num;
	private String title;
	private String content;
	private String admin_id; // 관리자 포린키
	private Date create_date;
	private Date update_date;

}

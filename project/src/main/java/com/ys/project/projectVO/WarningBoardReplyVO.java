package com.ys.project.projectVO;

import java.util.Date;

import lombok.Data;

@Data
public class WarningBoardReplyVO {

	private int reply_num;
	private String replyer;
	private String reply;
	private Date create_date;
	private Date update_date;

	private int wa_num; // 신고게시판 포린키

}

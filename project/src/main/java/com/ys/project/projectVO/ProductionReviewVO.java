package com.ys.project.projectVO;

import lombok.Data;

@Data

public class ProductionReviewVO extends PageVO{
	private int pr_num;
	private	int starpoint;
	private	String reply;
	private	String replyer;
	private	java.util.Date create_date;
	private	int m_num;
}

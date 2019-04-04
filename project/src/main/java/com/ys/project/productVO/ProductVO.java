package com.ys.project.productVO;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pro_num;
	private String title;
	private int price;
	private Date create_date;
	private String zip_code;
	private String road_name;
	private String addr;
	private String img_path;
	
	

}

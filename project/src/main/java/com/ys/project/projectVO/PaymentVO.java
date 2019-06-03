package com.ys.project.projectVO;

import lombok.Data;

@Data
public class PaymentVO {
	private String merchant_uid;
	private String imp_uid;
	private String place_pick;
	private String cate_code;
	private String quality;
	private String card_name;
	private String pg_tid;
	private String title;
	private String ascrow;
	private String pay_method;
	private String buyer_name;
	private String seller_name;
	private String create_date;
	private int price;
	private int pro_num;

}
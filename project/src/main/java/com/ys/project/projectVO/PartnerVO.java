package com.ys.project.projectVO;

import lombok.Data;

@Data
public class PartnerVO {

	private String company_number;
	private String part_name;
	private String boss_name;
	private String part_phone;
	private String zip_code; // ?°í?¸ë???
	private String road_name; // ??ë¡?ëª? ì£¼ì??
	private String addr; // ì§?ë²? ì£¼ì??
	private String detail_addr; // ???? ì£¼ì??
	private java.util.Date reg_date;
	private String lag; // ????
	private String lng; // ê²½ë??
	private int m_num; // ?¬ë¦°??
}

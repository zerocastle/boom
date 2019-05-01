package com.ys.project.projectDTO;

import java.sql.Timestamp;

import lombok.Data;

//인덱스에 값 데이터 값을 뿌려주기 위해 사용

@Data
public class IndexProductionDTO {

	private int pro_num;
	private String title;
	private int price;
	private String cate_code;
	private int place_signal; // 직플 사용 유무
	private String state_msg; // 상태 메시지
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int rep;
	
	private Timestamp create_date; //상품 리스트에서 추가한 내용
	
	private String addr;
	private String place_pick;

}

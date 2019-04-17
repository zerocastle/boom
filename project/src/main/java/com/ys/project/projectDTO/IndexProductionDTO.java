package com.ys.project.projectDTO;

import lombok.Data;

//인덱스에 값 데이터 값을 뿌려주기 위해 사용

@Data
public class IndexProductionDTO {

	private int pro_num;
	private String title;
	private int price;
	private String cate_code;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int rep;

}

package com.ys.project.productionVO;

import lombok.Data;

@Data
public class Production_uploadVO {

	private int upl_num; // pk
	private String path; // 경로
	private String original; // 원본 파일 이름
	private String thumnail; // 썸네일 사진 이름
	private int pro_num; // 상품번호 포린키

}
